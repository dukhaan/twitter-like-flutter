import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:twitter_like/core/color_values.dart';
import 'package:twitter_like/core/styles.dart';
import 'package:twitter_like/routes/router.dart';

@RoutePage()
class KirimFestPage extends StatelessWidget {
  const KirimFestPage({super.key});

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
              const SizedBox(height: Styles.defaultSpacing),
              _buildRePost(context),
            ],
          ),
        ),
      )),
    );
  }
}

Widget _buildTopBar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(Styles.defaultSpacing),
    color: Colors.white,
    child: Row(
      children: [
        _buildButtonBack(context),
        const Spacer(),
        _buildTextLogoWidget(context),
        const Spacer(),
        _buildProfileWidget(context),
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

Widget _buildTextLogoWidget(BuildContext context) {
  return Row(
    children: [
      Text('//',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorValues.grey30,
                fontWeight: FontWeight.bold,
              )),
      const SizedBox(width: 4),
      Text('Kirim Fess',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 18,
              )),
    ],
  );
}

Widget _buildProfileWidget(BuildContext context) {
  return GestureDetector(
    onTap: () {
      AutoRouter.of(context).push(const ProfileRoute());
    },
    child: Container(
        margin: const EdgeInsets.only(right: Styles.defaultSpacing),
        width: 45,
        height: 45,
        decoration: const BoxDecoration(
          color: ColorValues.background,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Styles.defaultBorder),
          child: Image.asset(
            'assets/home/profile.png',
            fit: BoxFit.cover,
          ),
        )),
  );
}

Widget _buildRePost(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(
        horizontal: Styles.biggerBorder, vertical: Styles.defaultSpacing),
    color: Colors.white,
    child: Column(
      children: [
        _buildRePostHeader(Iconsax.microphone, 'Mic Anonim', Color(0xFFFBD7D4),
            const Color(0xFFEA3829)),
        const SizedBox(height: Styles.defaultSpacing),
        _buildRePostContent(
            '[EC-Fess!] cara tau jumlah mahasiswa per jurusan itu gimana ya kalau di web kampus gak ada? sender lagi cuti juga jadi gak bisa nanya nge-akses ke jurusan \n\nIya tau sender lagi cuti, tapi sender juga pengen ngerjain revisi:(('),
        const SizedBox(height: Styles.defaultSpacing),
        _buildRePostFooter(),
      ],
    ),
  );
}

Widget _buildRePostHeader(
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

Widget _buildRePostContent(String? isi) {
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

Widget _buildRePostFooter() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        margin: const EdgeInsets.only(top: Styles.smallerBorder),
        width: 72,
        padding: const EdgeInsets.all(Styles.smallerBorder),
        decoration: BoxDecoration(
          color: ColorValues.primary50,
          borderRadius: BorderRadius.circular(Styles.defaultBorder),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 4),
            Text(
              'Kirim',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
