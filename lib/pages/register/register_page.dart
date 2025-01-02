import 'package:expensor/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expensor/widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      body: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(width: screenWidth * 0.7, brightness: brightness),
              const SizedBox(height: 20),
              _buildLoginCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo({required double width, required Brightness brightness}) {
    return brightness == Brightness.dark
        ? Image.asset(
            'assets/images/logo_black.png',
            width: width,
          )
        : Image.asset(
            'assets/images/logo_without_name_white.png',
            width: width,
          );
  }

  Widget _buildLoginCard() {
    return Card(
      child: Container(
        width: 360,
        height: 450,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Registro",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: CupertinoColors.black),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCupertinoTextField(
                  icon: const Icon(Icons.person),
                  obscure: false,
                  labelText: 'Nombre y apellidos',
                ),
                buildCupertinoTextField(
                    icon: const Icon(Icons.mail),
                    obscure: false,
                    labelText: 'Correo electronico'),
                buildCupertinoTextField(
                    icon: const Icon(Icons.lock),
                    obscure: true,
                    labelText: 'Nombre y apellidos'),
                _buildButtonRow()
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Volver'),
        ),
        CupertinoButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: const Text('Registrarse'),
        ),
      ],
    );
  }
}
