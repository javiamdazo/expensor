import 'package:expensor/pages/dashboard/dashboard_page.dart';
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
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(width: screenWidth * 0.7),
                  SizedBox(height: screenHeight * 0.05),
                  _buildLoginCard(width: screenWidth * 2, height: screenHeight * 0.4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo({required double width}) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo_without_name_white.png',
          width: width,
        ),
        Text("Expensor", style: TextStyle(fontSize: width * 0.2, color: Colors.white, fontFamily: 'Pacifico')),
      ],
    );
  }

  Widget _buildLoginCard({required double width, required double height}) {
    return Card(
      elevation: 20,
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
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
            ),
            SizedBox(height: height * 0.05),
            buildTextField(
              icon: const Icon(Icons.email),
              obscure: false,
              labelText: 'Email',
            ),
            SizedBox(height: height * 0.05),
            buildTextField(
              icon: const Icon(Icons.lock),
              obscure: true,
              labelText: 'Password',
            ),
            Expanded(child: _buildButtonRow(width: width * 0.02)),
          ],
        ),
      ),
      )
    );
  }

  Widget _buildButtonRow({required double width}) {
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
            child: const Text('Iniciar sesión', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ),
        SizedBox(width: width),
        Expanded(
          child: FilledButton.tonal(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
            child: const Text('Registrarse', textAlign: TextAlign.center,),
          ),
        ),
      ],
    );
  }
}
