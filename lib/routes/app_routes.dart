import 'package:flutter/material.dart';
// import '../presentation/aksi_input_screening_screen/aksi_input_screening_screen.dart';
// import '../presentation/aksi_lupa_kata_sandi_screen/aksi_lupa_kata_sandi_screen.dart';
// import '../presentation/aksi_pengisian_masuk_screen/aksi_pengisian_masuk_screen.dart';
// import '../presentation/aksi_pengisian_saran_screen/aksi_pengisian_saran_screen.dart';
// import '../presentation/aksi_periksa_kode_verifikasi_screen/aksi_periksa_kode_verifikasi_screen.dart';
// import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/input_cek_mandiri_three_screen/input_cek_mandiri_three_screen.dart';
import '../presentation/home_page_admin/home_page_admin.dart';
import '../presentation/artikel_screen/artike_screen.dart';
import '../presentation/daftar_screen/daftar_screen.dart';
import '../presentation/forum_screen/forum_screen.dart';
import '../presentation/hasil_input_one_screen/hasil_input_one_screen.dart';
import '../presentation/hasil_input_screen/hasil_input_screen.dart';
import '../presentation/hasil_input_two_screen/hasil_input_two_screen.dart';
import '../presentation/home_page/home_page.dart';
import '../presentation/input_cek_mandiri_one_bottomsheet/input_cek_mandiri_one_bottomsheet.dart';
import '../presentation/input_cek_mandiri_four_screen/input_cek_mandiri_four_screen.dart';
import '../presentation/input_cek_mandiri_two_screen/input_cek_mandiri_two_screen.dart';
import '../presentation/input_screening_screen/input_screening_screen.dart';
import '../presentation/kelas_bumil_screen/kelas_bumil_screen.dart';
import '../presentation/lengkapi_data_screen/lengkapi_data_screen.dart';
import '../presentation/lupa_kata_sandi_screen/lupa_kata_sandi_screen.dart';
import '../presentation/masuk_screen/masuk_screen.dart';
import '../presentation/masukkan_data_screen/masukkan_data_screen.dart';
// import '../presentation/masukkan_sandi_baru_screen/masukkan_sandi_baru_screen.dart';
import '../presentation/monitor_daftar_pendamping_screen/monitor_daftar_pendamping_screen.dart';
import '../presentation/monitor_rekap_screen/monitor_rekap_screen.dart';
import '../presentation/monitor_riwayat_screen/monitor_riwayat_screen.dart';
// import '../presentation/pengisian_screen/pengisian_screen.dart';
import '../presentation/profil_screen/profil_screen.dart';
import '../presentation/pustaka_screen/pustaka_screen.dart';
import '../presentation/selamat_datang_screen/selamat_datang_screen.dart';
// import '../presentation/tampilan_keluhan_screen/tampilan_keluhan_screen.dart';
// import '../presentation/tentang_screen/tentang_screen.dart';
import '../presentation/ubah_kata_sandi_screen/ubah_kata_sandi_screen.dart';
import '../presentation/video_pustaka_screen/video_pustaka_screen.dart';

class AppRoutes {
  static const String homePageAdmin = '/home_page_admin';
  static const String selamatDatangScreen = '/selamat_datang_screen';
  static const String masukScreen = '/masuk_screen';
  static const String aksiPengisianMasukScreen = '/aksi_pengisian_masuk_screen';
  static const String lupaKataSandiScreen = '/lupa_kata_sandi_screen';
  static const String aksiLupaKataSandiScreen = '/aksi_lupa_kata_sandi_screen';
  static const String periksaKodeVerifikasiScreen =
      '/periksa_kode_verifikasi_screen';
  static const String aksiPeriksaKodeVerifikasiScreen =
      '/aksi_periksa_kode_verifikasi_screen';
  static const String konfirmasiUbahKataSandiScreen =
      '/konfirmasi_ubah_kata_sandi_screen';
  static const String ubahKataSandiScreen = '/ubah_kata_sandi_screen';
  static const String masukkanSandiBaruScreen = '/masukkan_sandi_baru_screen';
  static const String konfirmasiSandiBerhasilDiubahScreen =
      '/konfirmasi_sandi_berhasil_diubah_screen';
  static const String daftarScreen = '/daftar_screen';
  static const String masukkanDataScreen = '/masukkan_data_screen';
  static const String lengkapiDataScreen = '/lengkapi_data_screen';
  static const String pengisianScreen = '/pengisian_screen';
  static const String homePage = '/home_page';
  static const String artikelScreen = '/artikel_screen';
  static const String profilScreen = '/profil_screen';
  static const String tentangScreen = '/tentang_screen';
  static const String forumScreen = '/forum_screen';
  static const String forumInitialPage = '/forum_initial_page';
  static const String tampilanKeluhanScreen = '/tampilan_keluhan_screen';
  static const String inputScreeningScreen = '/input_screening_screen';
  static const String aksiInputScreeningScreen = '/aksi_input_screening_screen';
  static const String hasilInputScreen = '/hasil_input_screen';
  static const String inputCekMandiriThreeScreen =
      '/input_cek_mandiri_three_screen';
  static const String hasilInputOneScreen = '/hasil_input_one_screen';
  static const String inputCekMandiriOne = '/input_cek_mandiri_one_bottomsheet';
  static const String inputCekMandiriTwoScreen =
      '/input_cek_mandiri_two_screen';
  static const String inputCekMandiriFourScreen =
      '/input_cek_mandiri_four_screen';
  static const String aksiPengisianSaranScreen = '/aksi_pengisian_saran_screen';
  static const String monitorRiwayatScreen = '/monitor_riwayat_screen';
  static const String monitorRekapScreen = '/monitor_rekap_screen';
  static const String monitorDaftarPendampingScreen =
      '/monitor_daftar_pendamping_screen';
  static const String pustakaScreen = '/pustaka_screen';
  static const String videoPustakaScreen = '/video_pustaka_screen';
  static const String kelasBumilScreen = '/kelas_bumil_screen';
  static const String hasilInputTwoScreen = '/hasil_input_two_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        homePageAdmin: (context) => HomePageAdmin(),
        homePage: (context) => HomePage(),
        selamatDatangScreen: (context) => SelamatDatangScreen(),
        masukScreen: (context) => MasukScreen(
              ontap: null,
            ),
        // aksiPengisianMasukScreen: (context) => AksiPengisianMasukScreen(),
        lupaKataSandiScreen: (context) => LupaKataSandiScreen(),
        // aksiLupaKataSandiScreen: (context) => AksiLupaKataSandiScreen(),
        // aksiPeriksaKodeVerifikasiScreen: (context) => AksiPeriksaKodeVerifikasiScreen(),
        ubahKataSandiScreen: (context) => UbahKataSandiScreen(),
        // masukkanSandiBaruScreen: (context) => MasukkanSandiBaruScreen(),
        daftarScreen: (context) => DaftarScreen(),
        masukkanDataScreen: (context) => MasukkanDataScreen(
              ontap: null,
            ),
        lengkapiDataScreen: (context) => LengkapiDataScreen(),
        // pengisianScreen: (context) => PengisianScreen(),
        artikelScreen: (context) => ArtikelScreen(),
        profilScreen: (context) => ProfilScreen(),
        // tentangScreen: (context) => TentangScreen(),
        forumScreen: (context) => ForumScreen(),
        // tampilanKeluhanScreen: (context) => TampilanKeluhanScreen(),
        inputScreeningScreen: (context) => InputScreeningScreen(),
        inputCekMandiriOne: (context) => InputCekMandiriBottomsheet(),
        // aksiInputScreeningScreen: (context) => AksiInputScreeningScreen(),
        hasilInputScreen: (context) => HasilInputScreen(),
        inputCekMandiriThreeScreen: (context) => InputCekMandiriThreeScreen(),
        hasilInputOneScreen: (context) => HasilInputOneScreen(),
        inputCekMandiriTwoScreen: (context) => TabelScreen(),
        inputCekMandiriFourScreen: (context) => InputCekMandiriFourScreen(),
        // aksiPengisianSaranScreen: (context) => AksiPengisianSaranScreen(),
        monitorRiwayatScreen: (context) => MonitorRiwayatScreen(),
        monitorRekapScreen: (context) => MonitorRekapScreen(),
        monitorDaftarPendampingScreen: (context) =>
            MonitorDaftarPendampingScreen(),
        pustakaScreen: (context) => PustakaScreen(),
        videoPustakaScreen: (context) => VideoPustakaScreen(),
        kelasBumilScreen: (context) => KelasBumilScreen(),
        hasilInputTwoScreen: (context) => HasilInputTwoScreen(),
        // appNavigationScreen: (context) => AppNavigationScreen(),
        initialRoute: (context) => SelamatDatangScreen(),
      };
}
