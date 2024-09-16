import 'package:expensor/pages/dashboard_page.dart';
import 'package:expensor/pages/register_page.dart';
import 'package:expensor/widgets/text_field.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.deepPurple,
              Colors.lightBlue,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(width: screenWidth * 0.7),
                  _buildLoginCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo({required double width}) {
    return Image.asset(
      'assets/images/logo.png',
      width: width,
    );
  }

  Widget _buildLoginCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
            ),
            const SizedBox(height: 20),
            buildTextField(
              icon: const Icon(Icons.email),
              obscure: false,
              labelText: 'Email',
            ),
            const SizedBox(height: 20),
            buildTextField(
              icon: const Icon(Icons.lock),
              obscure: true,
              labelText: 'Password',
            ),
            const SizedBox(height: 30),
            _buildButtonRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
            },
            child: const Text('Iniciar sesión'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: FilledButton.tonal(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
            child: const Text('Registrarse'),
          ),
        ),
      ],
    );
  }
}
