import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  static String route = '/login';
  const LoginPage({Key? key}) : super(key: key);

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      kToolbarHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight(context),
            child: Column(
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
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Email',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        Text('Forgot your password?'),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, HomePage.route),
                          child: Text('Login'),
                        ),
                        Center(
                          child: Text('or login with'),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('G'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('F'),
                            )
                          ],
                        ),
                        Center(
                          child: Text('Don\'t have an account? Register'),
                        ),
                        // register
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
