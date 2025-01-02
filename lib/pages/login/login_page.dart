import 'package:expensor/pages/home/home_page.dart';
import 'package:expensor/pages/register/register_page.dart';
import 'package:expensor/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var brightness = MediaQuery.of(context).platformBrightness;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            CupertinoColors.systemPurple,
            CupertinoColors.activeBlue,
          ],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(width: screenWidth * 0.7, brightness: brightness),
                SizedBox(height: screenHeight * 0.05),
                _buildLoginCard(
                    width: screenWidth * 2, height: screenHeight * 0.4, brightness: brightness),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }

  Widget _buildLogo({required double width, required Brightness brightness}) {
    return Column(
      children: [
        brightness == Brightness.dark
            ? Image.asset(
                'assets/images/logo_black.png',
                width: width,
              )
            : Image.asset(
                'assets/images/logo_without_name_white.png',
                width: width,
              ),
        Text("Expensor",
            style: TextStyle(
                fontSize: width * 0.2,
                color: brightness == Brightness.dark
                    ? CupertinoColors.black
                    : CupertinoColors.white,
                fontFamily: 'Pacifico')),
      ],
    );
  }

  Widget _buildLoginCard({required double width, required double height, required Brightness brightness}) {
    return Container(
        decoration: BoxDecoration(
          color: brightness == Brightness.dark
                      ? CupertinoColors.systemGrey6
                      : CupertinoColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32, color:CupertinoColors.black),
                ),
                SizedBox(height: height * 0.05),
                buildCupertinoTextField(
                  icon: const Icon(CupertinoIcons.mail),
                  obscure: false,
                  labelText: 'Email',
                ),
                SizedBox(height: height * 0.05),
                buildCupertinoTextField(
                  icon: const Icon(CupertinoIcons.lock),
                  obscure: true,
                  labelText: 'Password',
                ),
                Expanded(child: _buildButtonRow(width: width * 0.02)),
              ],
            ),
          ),
        ));
  }

  Widget _buildButtonRow({required double width}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text(
              'Iniciar sesión',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(width: width),
        Expanded(
          child: CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const RegisterPage()),
              );
            },
            child: const Text(
              'Registrarse',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
