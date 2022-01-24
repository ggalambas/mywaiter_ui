import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mywaiter_design/config/constants.dart';
import 'package:mywaiter_design/pages/home_page.dart';
import 'package:mywaiter_design/widgets/suffix_icon.dart';
import 'package:mywaiter_design/widgets/tap_to.dart';

class LoginPage extends StatefulWidget {
  static String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscurePassword = true;

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TapTo.unfocus(
      child: Scaffold(
        body: SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight(context),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                          height: 100,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Column(
                        children: [
                          TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(hintText: 'Email'),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            obscureText: obscurePassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: SuffixIcon(
                                obscurePassword
                                    ? LucideIcons.eye
                                    : LucideIcons.eyeOff,
                                onTap: () => setState(() {
                                  obscurePassword = !obscurePassword;
                                }),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: kScreenPadding,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text.rich(
                              TextSpan(
                                text: 'Forgot your password?',
                                style: theme.textTheme.caption!.copyWith(
                                  color: theme.colorScheme.onBackground,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, HomePage.route),
                            child: Text('Login'),
                          ),
                          SizedBox(height: 24),
                          Text('or login with', style: theme.textTheme.caption),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _SocialButton('assets/google.svg'),
                              SizedBox(width: 12),
                              _SocialButton('assets/facebook.svg'),
                            ],
                          ),
                          SizedBox(height: 24),
                          Text.rich(
                            TextSpan(
                              text: 'Don\'t have an account? ',
                              style: theme.textTheme.caption,
                              children: [
                                TextSpan(
                                  text: 'Register',
                                  style: TextStyle(
                                    color: theme.colorScheme.onBackground,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                )
                              ],
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
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String assetName;
  const _SocialButton(this.assetName);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.square(kButtonHeight),
        primary: theme.brightness == Brightness.light
            ? theme.backgroundColor
            : theme.colorScheme.surface,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {},
      child: SvgPicture.asset(assetName, height: 24),
    );
  }
}
