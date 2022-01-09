import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  static String route = '/login';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 45,
            child: Center(
              child: SvgPicture.asset(
                'assets/logo.svg',
                height: 100,
                color: theme.primaryColor,
              ),
            ),
          ),
          Expanded(
              flex: 55,
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  const Text('Forgot your password?'),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, HomePage.route),
                    child: const Text('Login'),
                  ),
                  const Center(
                    child: Text('or login with'),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('G'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('F'),
                      )
                    ],
                  ),
                  const Center(
                    child: Text('Don\'t have an account? Register'),
                  ),
                  // register
                ],
              )),
        ],
      ),
    );
  }
}