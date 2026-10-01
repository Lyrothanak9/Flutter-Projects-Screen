import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/auth_button_circle.dart';
import '../widget/button.dart';
import '../widget/line_divider.dart';
import '../widget/my_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isRememberMe = false;

  bool _isPasswordObscured = true;
  @override
  void dispose() {
    // Always dispose controllers when the widget is removed
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, process data (e.g., call API)
      String email = _emailController.text;
      String password = _passwordController.text;
      String comfirmPassword = _confirmPasswordController.text;

      print("Sign Up with: $email / $password");
      print("Confirm Password: $comfirmPassword");

      // Clear fields and reset state after a successful trigger or submission
      setState(() {
        _emailController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        _isRememberMe = false;
        _isPasswordObscured = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text(
                'Sign Up successful! Welcome aboard.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.green, // Vibrant green for success
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              _imageLogin(),
                              Text(
                                "Create Account",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Sign up to get started with your account.",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(color: Colors.grey[400]),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10),
                              MyTextField(
                                controller: _emailController,
                                hintText: "Enter your email",
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  if (!value.contains('@')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 20),
                              Text(
                                "Password",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10),
                              // Password Field Example
                              MyTextField(
                                controller: _passwordController,
                                hintText: "Enter your password",
                                obscureText:
                                _isPasswordObscured, // Links to the toggle state
                                keyboardType: TextInputType.visiblePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey[400],
                                  ),
                                  onPressed: () {
                                    // Toggles the visibility state on tap
                                    setState(() {
                                      _isPasswordObscured =
                                      !_isPasswordObscured;
                                    });
                                  },
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password cannot be empty';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Confirm Password",
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 10),
                              // Password Field Example
                              MyTextField(
                                controller: _confirmPasswordController,
                                hintText: "Confirm Password",
                                obscureText:
                                _isPasswordObscured, // Links to the toggle state
                                keyboardType: TextInputType.visiblePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey[400],
                                  ),
                                  onPressed: () {
                                    // Toggles the visibility state on tap
                                    setState(() {
                                      _isPasswordObscured =
                                      !_isPasswordObscured;
                                    });
                                  },
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password cannot be empty';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              const SizedBox(height: 20),
                              Button(
                                title: "Create Account",
                                route: '/',
                                onPressed: _handleSignUp,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),
                        lineDivider(),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AuthButtonCircle(
                              image:
                              'https://img.icons8.com/?size=96&id=17949&format=png',
                            ),
                            SizedBox(width: 16),
                            AuthButtonCircle(
                              image:
                              "https://img.icons8.com/?size=100&id=30840&format=png&color=000000",
                            ),
                            SizedBox(width: 16),
                            AuthButtonCircle(
                              image:
                              "https://img.icons8.com/?size=100&id=13912&format=png&color=000000",
                            ),
                          ],
                        ),
                        Spacer(),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(color: Colors.grey[400]),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                "Login",
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _imageLogin() {
    var screenSize = MediaQuery.of(context).size;
    double imageSize = screenSize.height * 0.18;
    return SizedBox(
      height: imageSize,
      width: imageSize,
      child: Image.network(
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzOtklLPuBlSGg1rcfJkkbRGsc940bzYAAGJMtVZGmOkoe4jdh",
      ),
    );
  }
}
