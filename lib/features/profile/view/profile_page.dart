import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:twitter_like/core/color_values.dart';
import 'package:twitter_like/core/styles.dart';
import 'package:twitter_like/routes/router.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTopBar(context),
              const SizedBox(height: 2),
              _buildFess(context),
              const SizedBox(height: 2),
              _buildPost(context),
              const SizedBox(height: 2),
              _buildPost(context),
              const SizedBox(height: 2),
              _buildPost(context),
            ],
          ),
        ),
      )),
    );
  }
}

Widget _buildTopBar(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Stack(
      children: [
        Image.asset(
          'assets/timeline.jpg',
          fit: BoxFit.fitWidth,
          width: 400,
          height: 138,
        ),
        Container(
          padding: const EdgeInsets.all(Styles.biggerBorder),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildButtonBack(context),
                  const Spacer(),
                  _buildButtonLogout(context),
                ],
              ),
              _buildPhotoProfile(),
              _buildName(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildButtonBack(BuildContext context) {
  return Container(
    width: 52,
    height: 52,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(Styles.defaultPadding),
    ),
    child: GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(const HomeRoute());
      },
      child: IconButton(
        icon: const Icon(
          Iconsax.arrow_left,
          color: Color.fromARGB(255, 80, 80, 80),
        ),
        onPressed: () {
          AutoRouter.of(context).pop();
        },
      ),
    ),
  );
}

Widget _buildButtonLogout(BuildContext context) {
  return Container(
    width: 52,
    height: 52,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 196, 196),
      borderRadius: BorderRadius.circular(Styles.defaultPadding),
    ),
    child: IconButton(
      icon: const Icon(
        Iconsax.logout_15,
        color: Colors.red,
      ),
      onPressed: () {
        AutoRouter.of(context).push(const LoginRoute());
      },
    ),
  );
}

Widget _buildPhotoProfile() {
  return const Padding(
    padding: EdgeInsets.only(top: 15.0),
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 50,
      child: CircleAvatar(
        radius: 42,
        backgroundImage: AssetImage(
          'assets/home/profile.png',
        ),
      ),
    ),
  );
}

Widget _buildName() {
  return const Padding(
    padding: EdgeInsets.only(top: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-Code Fess',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        Text(
          '@ecodefess',
          style: TextStyle(
            fontSize: 14,
            color: ColorValues.text20,
          ),
        ),
      ],
    ),
  );
}

Widget _buildFess(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: Styles.biggerBorder, vertical: Styles.defaultSpacing),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildFessItem(),
      ],
    ),
  );
}

Widget _buildFessItem() {
  return Container(
    child: const Text('Fess yang kamu kirim',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )),
  );
}

Widget _buildPost(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(Styles.biggerBorder),
    color: Colors.white,
    child: Column(
      children: [
        _buildPostHeader(Iconsax.microphone, 'Mic Anonim', Color(0xFFFBD7D4),
            const Color(0xFFEA3829)),
        const SizedBox(height: Styles.defaultSpacing),
        _buildPostContent(
            '[EC-Fess!] cara tau jumlah mahasiswa per jurusan itu gimana ya kalau di web kampus gak ada? sender lagi cuti juga jadi gak bisa nanya nge-akses ke jurusan \n\nIya tau sender lagi cuti, tapi sender juga pengen ngerjain revisi:(('),
        const SizedBox(height: Styles.defaultSpacing),
        _buildPostFooter(),
      ],
    ),
  );
}

Widget _buildPostHeader(
    IconData? icon, String? judul, Color? bgColor, Color? color) {
  //i want a row with an icon and Username
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      _buildIconWidget(icon, bgColor, color),
      const SizedBox(width: Styles.smallBorder),
      Text(
        judul!,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      Spacer(),
      Text(
        '2 jan',
        style: const TextStyle(
          color: ColorValues.text20,
        ),
      ),
      IconButton(
        icon: const Icon(Iconsax.more5,
            color: Color.fromARGB(255, 117, 117, 117)),
        onPressed: () {},
      ),
    ],
  );
}

Widget _buildIconWidget(IconData? icon, Color? bgColor, Color? color) {
  return Container(
    margin: const EdgeInsets.only(right: Styles.defaultSpacing),
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius:
          BorderRadius.circular(Styles.defaultBorder), // Perbaikan di sini
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(Styles.defaultBorder),
      child: Icon(
        icon!,
        size: 20,
        color: color!,
      ),
    ),
  );
}

Widget _buildPostContent(String? isi) {
  return Row(
    children: [
      Expanded(
        child: Text(
          isi!,
          style: const TextStyle(
            fontWeight: FontWeight.w100,
            color: ColorValues.grey50,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}

Widget _buildPostFooter() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: Styles.smallerSpacing),
    child: Row(
      children: [
        _buildIcon(Iconsax.heart, '12'),
        const SizedBox(width: Styles.defaultSpacing / 2),
        _buildIcon(Iconsax.message, '3'),
        const SizedBox(width: Styles.defaultSpacing / 2),
        _buildIcon(Iconsax.share, '2'),
        const SizedBox(width: Styles.defaultSpacing / 2),
      ],
    ),
  );
}

Widget _buildIcon(IconData icon, String text) {
  return Row(
    children: [
      Icon(icon, size: 20, color: ColorValues.text50),
      const SizedBox(width: Styles.defaultSpacing / 2),
      Text(text, style: const TextStyle(color: ColorValues.text50)),
    ],
  );
}
