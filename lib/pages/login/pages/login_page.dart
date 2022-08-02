import 'package:flutter/material.dart';
import 'package:getx/pages/login/repository/userRepostitory.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:getx/pages/login/repository/userRepostitory.dart';
import 'package:getx/style/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final double spacing = 20;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');

  _login() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.login(
          _emailController.text, _passwordController.text);

      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(
        description: Text("Error : ${e.toString()}"),
      ).show(context);
    }
  }

  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      Navigator.pushNamed(context, '/dashboard');
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: counter,
          channelKey: 'basic_channel',
          title: 'Guitar Shop',
          body: "Thank you joing us <3",
        ),
      );
      setState(() {
        counter++;
      });
    } else {
      MotionToast.error(
        description: const Text("Either username or password is incorrect"),
      ).show(context);
    }
  }

  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
  }

  @override
  void initState() {
    _checkNotificationEnabled();
    super.initState();
  }

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  "Login",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: primaryFontColor),
                ),
                const SizedBox(height: 30),
                Text(
                  "Add your details to login",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: secondaryFontColor),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 17),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 17),
                SizedBox(height: spacing),
                Text(
                  "Forget your password?",
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: mainColor),
                ),

                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.pushReplacementNamed(context, '/');
                    _login();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text('Login'),
                ),

                SizedBox(height: spacing),
                Text(
                  "--Or login With--",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: primaryFontColor),
                ),
                SizedBox(height: spacing),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/fingerprint');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0XFF3b5998),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.all(16),
                  ),
                  icon: const Icon(FontAwesomeIcons.fingerprint),
                  label: const Text('Login with Fingerprint'),
                ),
                SizedBox(height: spacing),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/fingerprint');
                    },
                    icon: const Icon(FontAwesomeIcons.googlePlusG),
                    label: const Text('  Login with Google'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0XFFdb4a39),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                      padding: const EdgeInsets.all(16),
                    )),
                const SizedBox(height: 50),
                // const Expanded(child: SizedBox.shrink()),
                Text.rich(TextSpan(
                    text: 'Don\'t have an Account?',
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                          text: ' Sign Up',
                          style: const TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                  context, '/register');
                            })
                    ])),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
