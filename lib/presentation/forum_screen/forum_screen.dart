import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edetik/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'widgets/forumlist_item_widget.dart';
import 'package:intl/intl.dart';

class ForumScreen extends StatelessWidget {
  ForumScreen({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final TextEditingController newPostController = TextEditingController();

  // Fungsi untuk mengirim pesan
  Future<void> postMessage(BuildContext context) async {
    final message = newPostController.text.trim();
    if (message.isEmpty) return;

    // Ambil user yang sedang login
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal mengirim pesan: Pengguna tidak ditemukan'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    try {
      // Ambil data pengguna dari Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.email)
          .get();

      if (!userDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Gagal mengirim pesan: Profil pengguna tidak ditemukan'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
        return;
      }

      final username = userDoc['username'] ?? 'Unknown User';

      // Tambahkan pesan ke koleksi `forumMessages`
      await FirebaseFirestore.instance.collection('forumMessages').add({
        'username': username.trim(),
        'message': message,
        'date': DateTime.now().toIso8601String(),
      });

      // Tampilkan notifikasi sukses
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pesan berhasil dikirim!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );

      // Kosongkan text field
      newPostController.clear();
    } catch (error) {
      // Tampilkan notifikasi jika ada error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal mengirim pesan: ${error.toString()}'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum"),
        leadingWidth: 56.h,
        backgroundColor: appTheme.red300,
        leading: Padding(
          padding: EdgeInsets.only(left: 27.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24.0),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                    child: MyTextfield(
                        hinText: "Katakan Sesuatu",
                        obsecureText: false,
                        controller: newPostController)),
                GestureDetector(
                  onTap: () =>
                      postMessage(context), // Mengirim konteks ke fungsi
                  child: Container(
                    decoration: BoxDecoration(
                        color: appTheme.red300,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Icon(
                        Icons.done,
                        color: appTheme.gray100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                _buildForumList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Fungsi untuk menampilkan daftar pesan
  Widget _buildForumList(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('forumMessages')
            .orderBy('date', descending: true) // Urutkan berdasarkan date
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("Belum ada pesan."));
          }

          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 18),
            separatorBuilder: (context, index) {
              return Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey.withOpacity(0.3),
              );
            },
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              final data = doc.data() as Map<String, dynamic>;

              // Format tanggal
              final dateStr = data['date'] ?? '';
              final formattedDate = formatDate(dateStr);

              return ForumlistItemWidget(
                username: data['username'] ?? 'Anonymous',
                date: formattedDate,
                message: data['message'] ?? '',
              );
            },
          );
        },
      ),
    );
  }

  /// Fungsi untuk memformat tanggal
  String formatDate(String isoDate) {
    try {
      final DateTime parsedDate = DateTime.parse(isoDate);
      return DateFormat('yyyy-MM-dd | HH:mm').format(parsedDate);
    } catch (e) {
      return 'Tanggal tidak valid';
    }
  }
}
