import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:twitter_like/core/color_values.dart';
import 'package:twitter_like/core/styles.dart';

class CustomPostWidget extends StatelessWidget {
  final IconData? prefixIcon;
  final String? judulPost;
  final String? isiPost;

  const CustomPostWidget(
      {super.key, this.prefixIcon, this.judulPost, this.isiPost});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          buildPostWidget(),
        ],
      ),
    );
  }
}

Widget buildProfileWidget() {
  return Container(
      margin: const EdgeInsets.only(right: Styles.defaultSpacing),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: ColorValues.background,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Styles.defaultBorder),
        child: Image.asset(
          'assets/home/profile.png',
          fit: BoxFit.cover,
        ),
      ));
}

Widget buildPostWidget() {
  return Container(
    padding: const EdgeInsets.all(Styles.defaultSpacing),
    color: Colors.white,
    child: Column(
      children: [
        buildPostHeader(),
        const SizedBox(height: Styles.defaultSpacing),
        buildPostContent(),
        const SizedBox(height: Styles.defaultSpacing),
        buildPostFooter(),
      ],
    ),
  );
}

Widget buildPostHeader() {
  return Row(
    children: [
      buildProfileWidget(),
      const SizedBox(width: Styles.defaultSpacing),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('E-Code Fess',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Text('@ecodefess'),
        ],
      ),
    ],
  );
}

Widget buildPostContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Apa itu E-Code Fess?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: Styles.defaultSpacing),
      Text(
        'E-Code Fess adalah platform untuk berbagi kode, pertanyaan, dan diskusi seputar pemrograman.',
      ),
      const SizedBox(height: Styles.defaultSpacing),
      Image.asset('assets/home/post.png'),
    ],
  );
}

Widget buildPostFooter() {
  return Row(
    children: [
      buildIcon(Iconsax.heart, '12'),
      buildIcon(Iconsax.message, '3'),
      buildIcon(Iconsax.share, '2'),
      const Spacer(),
      buildIcon(Iconsax.bookmark, ''),
    ],
  );
}

Widget buildIcon(IconData icon, String text) {
  return Row(
    children: [
      Icon(icon, size: 20, color: ColorValues.text50),
      const SizedBox(width: Styles.defaultSpacing / 2),
      Text(text, style: TextStyle(color: ColorValues.text50)),
    ],
  );
}
