import 'package:flutter/material.dart';
import 'package:flutter_projects_screen/widget/auth_button_circle.dart';

import '../widget/button.dart';
import '../widget/line_divider.dart' show lineDivider;
import '../widget/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRememberMe = false;

  bool _isPasswordObscured = true;
  @override
  void dispose() {
    // Always dispose controllers when the widget is removed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.center, child: _imageLogin()),
              SizedBox(
                height: 100,
                // The place for Text
              ),
              Text(
                "Email",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
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
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              // Password Field Example
              MyTextField(
                controller: _passwordController,
                hintText: "Enter your password",
                obscureText: _isPasswordObscured, // Links to the toggle state
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
                      _isPasswordObscured = !_isPasswordObscured;
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

              Row(
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    checkColor: Colors.white,
                    activeColor: Colors.greenAccent,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    value: _isRememberMe,
                    onChanged: (bool? value) {
                        setState(() {
                          _isRememberMe = value!;
                        });
                    },
                  ),
                  Text(
                    "Remember Me",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.secondary,),
                  ),
                  Spacer(),
                  Text(
                    "Forgot Password?",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Button(title: "Login", route: '/',),
              const SizedBox(height: 50),
              lineDivider(),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthButtonCircle(image: 'https://img.icons8.com/?size=96&id=17949&format=png',),
                  SizedBox(width: 16,),
                  AuthButtonCircle(image: "https://img.icons8.com/?size=100&id=30840&format=png&color=000000",),
                  SizedBox(width: 16,),
                  AuthButtonCircle(image: "https://img.icons8.com/?size=100&id=13912&format=png&color=000000",),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.grey[400],
                  ),),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text("Sign In", style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),),
                  ),
                ],
              )
            ],
          ),
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
