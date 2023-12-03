import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:praktikum_pertemuan_9/auth/auth_service.dart';
import 'package:praktikum_pertemuan_9/screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Gap(20),
            Text(
              "Welcome!",
              style: TextStyle(fontSize: 28),
            ),
            Text("Create your account!"),
            Gap(20),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.red,
              ),
              child: TextButton(
                onPressed: () async {
                  final message = await AuthService().register(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  if (message == 'Registration Success') {
                    print('Registration Success');
                    // Navigasi ke halaman setelah registrasi berhasil
                    Navigator.of(context)
                        .pop(); // Kembali ke halaman login setelah registrasi berhasil
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message ?? 'An error occurred'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Gap(10),
            Container(
              width: 150,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
