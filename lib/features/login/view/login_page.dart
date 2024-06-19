import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:twitter_like/core/color_values.dart';
import 'package:twitter_like/core/styles.dart';
import 'package:twitter_like/routes/router.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                _buildLogo(),
                _buildHeaderWidget(context),
                _buildFormEmail(context),
                const SizedBox(height: Styles.defaultBorder),
                _buildFormPassword(context),
                const SizedBox(height: Styles.biggerBorder),
                _buildButtonLogin(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildLogo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(top: Styles.biggerBorder),
        padding: const EdgeInsets.symmetric(horizontal: Styles.biggerBorder),
        child: Image.asset(
          'assets/logogram.png',
          width: 112,
          height: 112,
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}

Widget _buildHeaderWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(top: Styles.biggerBorder),
        padding: const EdgeInsets.symmetric(horizontal: Styles.biggerBorder),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Let’s sign you in.',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 18,
                    )),
            const SizedBox(height: Styles.defaultSpacing),
            Text('Masukkan akun yang udah kamu daftarin!',
                style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ),
    ],
  );
}

Widget _buildFormEmail(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: Styles.biggerBorder),
    padding: const EdgeInsets.symmetric(horizontal: Styles.biggerBorder),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 14,
                )),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 54),
            prefixIcon: const Icon(
              Iconsax.sms5,
              size: 20,
            ),
            hintText: 'Masukkan email',
            hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: ColorValues.text20,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Styles.defaultBorder),
              borderSide: const BorderSide(
                width: 1,
                color: ColorValues.grey30,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildFormPassword(BuildContext context) {
  bool _obscureText = true;

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: Styles.biggerBorder),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 14,
                )),
        const SizedBox(height: 8),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 54),
            prefixIcon: const Icon(
              Iconsax.key5,
              size: 20,
            ),
            suffixIcon: GestureDetector(
              onTap: () {},
              child: Icon(
                _obscureText ? Iconsax.eye4 : Iconsax.eye,
                size: 20,
              ),
            ),
            hintText: 'Masukkan password',
            hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: ColorValues.text20,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Styles.defaultBorder),
              borderSide: const BorderSide(
                width: 1,
                color: ColorValues.grey30,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildButtonLogin(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: Styles.biggerBorder),
    child: ElevatedButton(
      onPressed: () {
        AutoRouter.of(context).push(const HomeRoute());
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorValues.primary50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Styles.defaultBorder),
        ),
        minimumSize: const Size(double.infinity, 54),
      ),
      child: Text('Login',
          style: Theme.of(context).textTheme.button?.copyWith(
                color: Colors.white,
              )),
    ),
  );
}
