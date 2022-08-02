import 'package:flutter/material.dart';
import 'package:getx/pages/login/repository/userRepostitory.dart';
import 'package:getx/pages/login/model/userModel.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:getx/style/style.dart';
import 'package:flutter/gestures.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();
  final double spacing = 20;

  _registerUser(User user) async {
    bool isLogin = await UserRepository().resgisterUser(user);
    if (isLogin) {
      _displayMessage(true);
    } else {
      _displayMessage(false);
    }
  }

  _displayMessage(bool isLogin) {
    if (isLogin) {
      MotionToast.success(
        description: const Text("Register Success"),
      ).show(context);
    } else {
      MotionToast.error(
        description: const Text("ERROR"),
      ).show(context);
    }
  }

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
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: mainColor),
                ),
                const SizedBox(height: 10),
                Text(
                  "Add your details to Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: secondaryFontColor),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                // TextFormField(
                //   controller: _phoneNumberController,
                //   decoration: InputDecoration(
                //     labelText: 'Phone No',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(50),
                //     ),
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter phone no';
                //     }
                //     return null;
                //   },
                // ),
                // const SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter confirm password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      User user = User(
                        email: _emailController.text,
                        name: _nameController.text,
                        password: _passwordController.text,
                        cPassword: _confirmPasswordController.text,
                      );
                      _registerUser(user);
                    }
                    // Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 50),
                // const Expanded(child: SizedBox.shrink()),
                Text.rich(TextSpan(
                    text: 'Already have an Account?',
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                          text: '  Login',
                          style: const TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(context, '/login');
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
