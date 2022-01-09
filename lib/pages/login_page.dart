import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mywaiter_design/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  static String route = '/login';

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top /* -kToolbarHeight */;

  //* to do:
  //* text styles
  //* spacers
  //* facebook / google
  //* clean

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
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.centerLeft,
                          child: Text('Forgot your password?'),
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, HomePage.route),
                          child: Text('Login'),
                        ),
                        SizedBox(height: 24),
                        Text('or login with'),
                        SizedBox(height: 16),
                        // Row(
                        //   children: [
                        //     ElevatedButton(
                        //       onPressed: () {},
                        //       child: Text('G'),
                        //     ),
                        //     ElevatedButton(
                        //       onPressed: () {},
                        //       child: Text('F'),
                        //     )
                        //   ],
                        // ),
                        SizedBox(height: 24),
                        Text('Don\'t have an account? Register'),
                        // register
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
