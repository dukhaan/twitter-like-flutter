import 'package:auto_route/annotations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:twitter_like/core/color_values.dart';
import 'package:twitter_like/core/styles.dart';
import 'package:twitter_like/routes/router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  _buildPostWidget(context),
                  const SizedBox(height: Styles.defaultSpacing),
                  _buildRePostWidget(context),
                  const SizedBox(height: 2),
                  _buildRePostWidget(context),
                  const SizedBox(height: 2),
                  _buildRePostWidget(context),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).push(const KirimFestRoute());
          },
          child: const Icon(Iconsax.message_edit5, color: Colors.white),
          backgroundColor: ColorValues.primary50,
          elevation: 0,
        ));
  }
}

Widget _buildTopBar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(Styles.defaultSpacing),
    color: Colors.white,
    child: Row(
      children: [
        _buildLogoWidget(),
        _buildTextLogoWidget(context),
        const Spacer(),
        Expanded(
          child: _buildSearch(context),
        ),
        const SizedBox(width: Styles.defaultSpacing),
        _buildProfileWidget(context),
      ],
    ),
  );
}

Widget _buildLogoWidget() {
  return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: Styles.defaultSpacing / 3),
      child: Image.asset('assets/home/logo.png', width: 64));
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
      Text('E-Code Fess',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 18,
              )),
    ],
  );
}

Widget _buildTextLogoPanel(BuildContext context) {
  return Row(
    children: [
      Text('//',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorValues.grey30,
                fontWeight: FontWeight.bold,
              )),
      const SizedBox(width: 4),
      Text('Mau cari apa?',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 18,
              )),
    ],
  );
}

Widget _buildSearch(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) => _buildSlidingUpPanel(context),
      );
    },
    child: Container(
      height: 45,
      padding: const EdgeInsets.all(Styles.mediumSpacing),
      decoration: BoxDecoration(
        color: ColorValues.background,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Styles.defaultBorder),
      ),
      child: const Icon(
        Iconsax.search_normal,
        size: 32,
        color: ColorValues.text50,
      ),
    ),
  );
}

Widget _buildSlidingUpPanel(BuildContext context) {
  return SlidingUpPanel(
    maxHeight: MediaQuery.of(context).size.height / 2,
    panelBuilder: (scrollController) => Container(
      margin: const EdgeInsets.only(top: Styles.defaultSpacing),
      padding: const EdgeInsets.symmetric(horizontal: Styles.biggerBorder),
      child: Column(
        children: [
          _buildTopBarPanel(context),
          const SizedBox(height: Styles.biggerSpacing),
          _buildButtonPanel(context),
          const SizedBox(height: Styles.biggerSpacing),
          _buildSearchPanel(),
          const SizedBox(height: Styles.biggerSpacing),
          _buildTemanPanel(context),
        ],
      ),
    ),
  );
}

Widget _buildTopBarPanel(BuildContext context) {
  return Container(
    color: Colors.white,
    child: Row(
      children: [
        _buildButtonBack(context),
        const SizedBox(width: Styles.biggerBorder),
        _buildTextLogoPanel(context),
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

Widget _buildButtonPanel(BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.transparent,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 48),
              side: const BorderSide(color: Colors.blue, width: 1),
              backgroundColor: Colors.white,
              elevation: 0, // Menghilangkan elevasi
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            child: const Text(
              'Fess',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 50),
              side: const BorderSide(color: Colors.white, width: 1),
              backgroundColor: Colors.blue,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
            child: const Text(
              'Stalk Teman',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSearchPanel() {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Stalk akun teman',
      prefixIcon: const Icon(Iconsax.search_normal),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Styles.defaultBorder),
      ),
    ),
  );
}

Widget _buildListTemanPanel(BuildContext context) {
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          _buildTemanItem(context),
          _buildTemanItem(context),
          _buildTemanItem(context),
          _buildTemanItem(context),
          _buildTemanItem(context),
        ],
      ),
    ),
  );
}

Widget _buildTemanItem(BuildContext context) {
  return GestureDetector(
    onTap: () {
      AutoRouter.of(context).push(const ProfileRoute());
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _buildProfilePhoto(),
          const SizedBox(width: 8.0),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'E-Code Fess',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(
                  '@ecodefess',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildProfilePhoto() {
  return Container(
    width: 46,
    height: 46,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      image: const DecorationImage(
        image: AssetImage('assets/home/profile.png'),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _buildTemanPanel(BuildContext context) {
  return Expanded(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ini yang kamu cari?'),
          const SizedBox(height: Styles.mediumSpacing),
          _buildListTemanPanel(context),
        ],
      ),
    ),
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

Widget _buildPostWidget(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(Styles.biggerBorder),
    color: Colors.white,
    child: Column(
      children: [
        _buildPostHeader(Iconsax.car, 'Mobil Anonim', const Color(0xFFFDE7D3),
            const Color(0xFFE85D04)),
        const SizedBox(height: Styles.defaultSpacing),
        _buildPostContent(TextEditingController(), context),
        const SizedBox(height: Styles.defaultSpacing),
        _buildPostButton(),
      ],
    ),
  );
}

Widget _buildPostHeader(
    IconData? icon, String? judul, Color? bgColor, Color? color) {
  //i want a row with an icon and Username
  return Row(
    children: [
      _buildIconWidget(icon, bgColor, color),
      const SizedBox(width: Styles.smallBorder),
      Text(
        judul!,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      )
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

Widget _buildPostContent(
    TextEditingController controller, BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Kirim menfess anonim-mu',
            border: InputBorder.none,
            hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: ColorValues.text20,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildPostButton() {
  //floating button with text
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

Widget _buildRePostWidget(BuildContext context) {
  return GestureDetector(
    onTap: () {
      AutoRouter.of(context).push(const BalasanRoute());
    },
    child: Container(
      padding: const EdgeInsets.all(Styles.biggerBorder),
      color: Colors.white,
      child: Column(
        children: [
          _buildPostHeader(Iconsax.microphone, 'Mic Anonim',
              const Color(0xFFFBD7D4), const Color(0xFFEA3829)),
          const SizedBox(height: Styles.defaultSpacing),
          _buildRePostContent(
              '[EC-Fess!] cara tau jumlah mahasiswa per jurusan itu gimana ya kalau di web kampus gak ada? sender lagi cuti juga jadi gak bisa nanya nge-akses ke jurusan \n\nIya tau sender lagi cuti, tapi sender juga pengen ngerjain revisi:(('),
          const SizedBox(height: Styles.defaultSpacing),
          _buildRePostFooter(),
        ],
      ),
    ),
  );
}

Widget _buildRePostFooter() {
  return Row(
    children: [
      _buildIcon(Iconsax.heart, '12'),
      const SizedBox(width: Styles.defaultSpacing / 2),
      _buildIcon(Iconsax.message, '3'),
      const SizedBox(width: Styles.defaultSpacing / 2),
      _buildIcon(Iconsax.share, '2'),
      const SizedBox(width: Styles.defaultSpacing / 2),
      const Spacer(),
      _buildIcon(Iconsax.bookmark, ''),
    ],
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
