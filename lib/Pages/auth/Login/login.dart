import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/Home/home_page.dart';
import 'package:flutter_application_2/Pages/Services/Cache/sheredPrafrences.dart';
import 'package:flutter_application_2/Pages/Services/api.dart';
import 'package:flutter_application_2/Pages/auth/Register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _PasswordController = TextEditingController();
    final _UserNameController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF4A92E6),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGUFJzNIaWcWl0TIG6nRpKRcNpxfx0sMsy9g&s',
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _UserNameController,
                        decoration: const InputDecoration(
                          labelText: 'User Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _PasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () async {
                          await login({
                            'UserName': _UserNameController.text,
                            'Password': _PasswordController.text
                          }, context);
                        },
                        child: const Text(
                          'Login',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignUpScreen()));
                        },
                        child: const Text(
                          'Don\'t have an account? Sign Up',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(Map<String, dynamic> userData, context) async {
    if ((await CacheData.getData(key: 'UserName') == userData['UserName'] &&
            await CacheData.getData(key: 'Password') == userData['Password']) ||
        await Api2.loginUser(userData)) {
      print('nooooooo');
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      print('yessssss');
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
    }
  }
}
