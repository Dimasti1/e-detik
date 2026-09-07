import 'package:edetik/widgets/custom_drop_down.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class MasukkanDataScreen extends StatefulWidget {
  final void Function()? ontap;
  MasukkanDataScreen({Key? key, required this.ontap}) : super(key: key);

  @override
  State<MasukkanDataScreen> createState() => _MasukkanDataScreenState();
}

class _MasukkanDataScreenState extends State<MasukkanDataScreen> {
  TextEditingController usernameInputController = TextEditingController();

  TextEditingController emailInputController = TextEditingController();

  TextEditingController passwordInputController = TextEditingController();

  TextEditingController dateInputController = TextEditingController();

  TextEditingController nikInputController = TextEditingController();

  TextEditingController selectedNumber = TextEditingController();

  DateTime? selectedDate;

  String? selectedKabupaten;
  String? selectedKecamatan;
  String? selectedDesa;
  String? selectedPendamping;
  String? selectedPuskesmas;
  String? selectedNoPendamping;

  // TextEditingController nikInputController = TextEditingController();

  List<String> dropdownItemListkab = ["Surabaya", "Sidoarjo", "Madura"];

  List<String> dropdownItemListkec = ["Wonokromo", "Kenduruan", "Jatirogo"];

  List<String> dropdownItemListPuskesmas = [
    "Ibu Hamil",
    "Puskesmas",
    "Kabupaten",
    "Provinsi",
    "Kader Pendamping"
  ];

  List<String> dropdownItemList = [
    "Ibu Hamil",
    "Kader Pendamping",
    "Bidan",
    "Petugas Puskesmas",
    "Petugas Kabupaten",
    "Petugas Provinsi"
  ];

  List<String> dropdownItemListDesa = [
    "Ibu Hamil",
    "Puskesmas",
    "Kabupaten",
    "Provinsi",
    "Kader Pendamping"
  ];

  List<String> dropdownItemListPendamping = [
    "Ibu Hamil",
    "Puskesmas",
    "Kabupaten",
    "Provinsi",
    "Kader Pendamping"
  ];

  List<String> dropdownItemListNohp = [
    "Ibu Hamil",
    "Puskesmas",
    "Kabupaten",
    "Provinsi",
    "Kader Pendamping"
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedRole;

  bool isPasswordVisible = false;

  

  void registerUser() async {
    if (_formKey.currentState!.validate()) {
      if (selectedRole == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Silakan pilih peran Anda")),
        );
        return;
      }

      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      try {
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailInputController.text.trim(),
          password: passwordInputController.text.trim(),
        );

        // Kirim email verifikasi
        await userCredential.user?.sendEmailVerification();

        // Simpan data pengguna ke Firestore
        await createUserDocument(userCredential);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text("Registrasi berhasil! Verifikasi email telah dikirim.")),
        );

        Navigator.of(context, rootNavigator: true)
            .pop(); // Tutup dialog loading
        Navigator.pop(context); // Kembali ke halaman login
      } on FirebaseAuthException catch (e) {
        Navigator.of(context, rootNavigator: true)
            .pop(); // Tutup dialog loading
        String errorMessage;
        if (e.code == 'email-already-in-use') {
          errorMessage = "Email sudah digunakan";
        } else if (e.code == 'weak-password') {
          errorMessage = "Password terlalu lemah";
        } else {
          errorMessage = "Terjadi kesalahan: ${e.message}";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

Future<void> createUserDocument(UserCredential? userCredential) async {
  if (userCredential != null && userCredential.user != null) {
    try {
      // Mendapatkan email pengguna
      String? email = userCredential.user!.email;

      if (email == null || email.isEmpty) {
        throw Exception("Email pengguna tidak valid.");
      }

      Map<String, dynamic> userData = {
        'email': email,
        'username': usernameInputController.text,
        'role': selectedRole.toString(),
      };

      // Menambahkan data spesifik berdasarkan role
      if (selectedRole == "Ibu Hamil") {
        userData.addAll({
          'tanggal_lahir': dateInputController.text,
          'kabupaten': selectedKabupaten,
          'kecamatan': selectedKecamatan,
          'desa': selectedDesa,
          'puskesmas': selectedPuskesmas,
          'pendamping': selectedPendamping,
          'nomor_pendamping': selectedNumber.text,
        });
      } else if (selectedRole == "Kader Pendamping") {
        userData.addAll({
          'kabupaten': selectedKabupaten,
          'kecamatan': selectedKecamatan,
          'desa': selectedDesa,
          'puskesmas': selectedPuskesmas,
          'nomor_hp': selectedNumber.text,
        });
      } else if (selectedRole == "Bidan") {
        userData.addAll({
          'kabupaten': selectedKabupaten,
          'kecamatan': selectedKecamatan,
          'desa': selectedDesa,
          'puskesmas': selectedPuskesmas,
        });
      } else if (selectedRole == "Petugas Puskesmas") {
        userData.addAll({
          'kabupaten': selectedKabupaten,
          'kecamatan': selectedKecamatan,
          'puskesmas': selectedPuskesmas,
        });
      } else if (selectedRole == "Petugas Kabupaten") {
        userData['kabupaten'] = selectedKabupaten;
      }

      // Menyimpan data ke Firestore menggunakan email sebagai document ID
      await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .set(userData);

      print("Data pengguna berhasil disimpan.");
    } catch (e) {
      // Menangani error dan mencetak pesan error
      print("Terjadi kesalahan saat menyimpan data pengguna: $e");
    }
  } else {
    print("UserCredential tidak valid atau user null.");
  }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.red300,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 42.h,
                    top: 8.h,
                    right: 42.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Registrasi ",
                        style: theme.textTheme.displaySmall,
                      ),
                      SizedBox(height: 42.h),
                      _buildSection(
                        context,
                        "Username",
                        _buildNameInput(context),
                      ),
                      SizedBox(height: 14.h),
                      _buildSection(
                        context,
                        "Email",
                        _buildEmailInput(context),
                      ),
                      SizedBox(height: 12.h),
                      _buildSection(
                        context,
                        "Password",
                        _buildPasswordInput(context),
                      ),
                      // SizedBox(height: 12.h),
                      // _buildSection(
                      //   context,
                      //   "Masukkan NIK",
                      //   _buildNikInput(context),
                      // ),
                      SizedBox(
                        height: 12,
                      ),

                      _buildSection(context, "NIK", _buildNikInput(context)),

                      SizedBox(height: 12.h),
                      _buildInputSection(
                        context,
                        label: "Pilih Role",
                        hintText: "Pilih salah satu",
                        inputWidget: _buildDropDownRole(context),
                      ),
                      if (selectedRole != null)
                        _buildRoleSpecificFields(context),

                      SizedBox(height: 46.h),
                      _buildRegistrationButton(context),
                      SizedBox(height: 46.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleSpecificFields(BuildContext context) {
    switch (selectedRole) {
      case "Ibu Hamil":
        return Column(
          children: [
            _buildSection(
              context,
              "Tanggal Lahir",
              _buildBirthdateInput(context),
            ),
            _buildInputSection(
              context,
              label: "Kabupaten/Kota",
              hintText: "Pilih Kabupaten/Kota",
              inputWidget: _buildDropDownKab(context),
            ),
            _buildInputSection(
              context,
              label: "Kecamatan",
              hintText: "Pilih Kecamatan",
              inputWidget: _buildDropDownKec(context),
            ),
            _buildInputSection(
              context,
              label: "Desa",
              hintText: "Pilih Desa",
              inputWidget: _buildDropDownDes(context),
            ),
            _buildInputSection(
              context,
              label: "Puskesmas",
              hintText: "Pilih Puskesmas",
              inputWidget: _buildDropDownPus(context),
            ),
            _buildInputSection(
              context,
              label: "Pendamping",
              hintText: "Pilih Pendamping",
              inputWidget: _buildDropDownPend(context),
            ),
            _buildSection(
              context,
              "Nomor Pendamping",
              _buildNumber(context),
            ),
          ],
        );
      case "Kader Pendamping":
        return Column(
          children: [
            _buildInputSection(
              context,
              label: "Kabupaten",
              hintText: "Pilih Kabupaten",
              inputWidget: _buildDropDownKab(context),
            ),
            _buildInputSection(
              context,
              label: "Kecamatan",
              hintText: "Pilih Kecamatan",
              inputWidget: _buildDropDownKec(context),
            ),
            _buildInputSection(
              context,
              label: "Puskesmas",
              hintText: "Pilih Puskesmas",
              inputWidget: _buildDropDownPus(context),
            ),
            _buildInputSection(
              context,
              label: "Desa",
              hintText: "Pilih Desa",
              inputWidget: _buildDropDownDes(context),
            ),
            _buildSection(
              context,
              "Nomor HP",
              CustomTextFormField(
                controller: selectedNumber,
                hintText: "Masukkan Nomor HP",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 16.h,
                ),
              ),
            ),
          ],
        );
      case "Bidan":
        return Column(
          children: [
            _buildInputSection(
              context,
              label: "Kabupaten",
              hintText: "Pilih Kabupaten",
              inputWidget: _buildDropDownKab(context),
            ),
            _buildInputSection(
              context,
              label: "Kecamatan",
              hintText: "Pilih Kecamatan",
              inputWidget: _buildDropDownKec(context),
            ),
            _buildInputSection(
              context,
              label: "Puskesmas",
              hintText: "Pilih Puskesmas",
              inputWidget: _buildDropDownPus(context),
            ),
            _buildInputSection(
              context,
              label: "Desa",
              hintText: "Pilih Desa",
              inputWidget: _buildDropDownDes(context),
            ),
          ],
        );
      case "Petugas Puskesmas":
        return Column(
          children: [
            _buildInputSection(
              context,
              label: "Kabupaten",
              hintText: "Pilih Kabupaten",
              inputWidget: _buildDropDownKab(context),
            ),
            _buildInputSection(
              context,
              label: "Kecamatan",
              hintText: "Pilih Kecamatan",
              inputWidget: _buildDropDownKec(context),
            ),
            _buildInputSection(
              context,
              label: "Puskesmas",
              hintText: "Pilih Puskesmas",
              inputWidget: _buildDropDownPus(context),
            ),
          ],
        );
      case "Petugas Kabupaten":
        return _buildInputSection(
          context,
          label: "Kabupaten",
          hintText: "Pilih Kabupaten",
          inputWidget: _buildDropDownKab(context),
        );
      case "Petugas Provinsi":
        return Container();
      default:
        return Container();
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 51.h,
      leading: Padding(
        padding: EdgeInsets.only(left: 27.0, top: 17.h),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: Colors.white, size: 24.0), // Ikon dengan warna putih
          onPressed: () => onTapArrowLeft(context),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, Widget child) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              title,
              style: theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 14.h),
          child,
        ],
      ),
    );
  }

  Widget _buildInputSection(
    BuildContext context, {
    required String label,
    required String hintText,
    required Widget inputWidget,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              label,
              style: theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 14.h),
          inputWidget,
        ],
      ),
    );
  }

  Widget _buildNikInput(BuildContext context) {
    return CustomTextFormField(
      controller: nikInputController,
      hintText: "Masukkan NIK",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
    );
  }

  Widget _buildNumber(BuildContext context) {
    return CustomTextFormField(
      controller: selectedNumber,
      hintText: "",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
      readOnly: true,
    );
  }

  Widget _buildNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: usernameInputController,
      hintText: "Masukkan Username",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return CustomTextFormField(
      controller: emailInputController,
      hintText: "Masukkan Email",
      // textInputType: TextInputType.phone,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email tidak boleh kosong";
        }
        if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+").hasMatch(value)) {
          return "Email tidak valid";
        }
        return null;
      },
    );
  }

  Widget _buildPasswordInput(BuildContext context) {
    return CustomTextFormField(
      obscureText: !isPasswordVisible, // Kontrol visibilitas password
      controller: passwordInputController,
      hintText: "Masukkan Password",
      textInputType: TextInputType.text,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
      validator: (value) => value!.length < 6 || value.isEmpty
          ? "Password minimal 6 karakter"
          : null,
      suffix: GestureDetector(
        onTap: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible; // Ubah status visibilitas
          });
        },
        child: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey, // Sesuaikan warna ikon dengan tema aplikasi Anda
          size: 22.0,
        ),
      ),
    );
  }

  // Widget _buildNikInput(BuildContext context) {
  //   return CustomTextFormField(
  //     controller: nikInputController,
  //     hintText: "NIK",
  //     textInputAction: TextInputAction.done,
  //     contentPadding: EdgeInsets.symmetric(
  //       horizontal: 24.h,
  //       vertical: 16.h,
  //     ),
  //   );
  // }

  Widget _buildRegistrationButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Registrasi",
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      buttonTextStyle: CustomTextStyles.titleLargeRed300Black,
      onPressed: registerUser,
    );
  }

  Widget _buildDropDownRole(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedRole,
      decoration: InputDecoration(
        hintText: "Pilih salah satu",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 16.h,
        ),
      ),
      items: dropdownItemList
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedRole = value;
        });
      },
    );
  }

  Widget _buildBirthdateInput(BuildContext context) {
    return CustomTextFormField(
      controller: dateInputController,
      hintText: "Masukkan Tanggal Lahir",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.h,
      ),
      suffix: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgCalendar,
          height: 20.h,
          width: 20.h,
          fit: BoxFit.contain,
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (pickedDate != null) {
          dateInputController.text =
              "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
        }
      },
    );
  }

  Widget _buildDropDownKab(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedKabupaten,
      decoration: InputDecoration(
        hintText: "Pilih salah satu",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 16.h,
        ),
      ),
      items: dropdownItemListkab
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedKabupaten = value;
        });
      },
    );
  }

  Widget _buildDropDownKec(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedKecamatan,
      decoration: InputDecoration(
        hintText: "Pilih salah satu",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 16.h,
        ),
      ),
      items: dropdownItemListkec
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedKecamatan = value;
        });
      },
    );
  }

  Widget _buildDropDownPus(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedPuskesmas,
      decoration: InputDecoration(
        hintText: "Pilih salah satu",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 16.h,
        ),
      ),
      items: dropdownItemListPuskesmas
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedPuskesmas = value;
        });
      },
    );
  }

  Widget _buildDropDownDes(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedDesa,
      decoration: InputDecoration(
        hintText: "Pilih salah satu",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 16.h,
        ),
      ),
      items: dropdownItemListDesa
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedDesa = value;
        });
      },
    );
  }

  Widget _buildDropDownPend(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedPendamping,
      decoration: InputDecoration(
        hintText: "Pilih salah satu",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 16.h,
        ),
      ),
      items: dropdownItemListPendamping
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedPendamping = value;
        });
      },
    );
  }

  void onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  void masukScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.masukScreen);
  }
}
