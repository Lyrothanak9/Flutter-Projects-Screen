import 'package:flutter/material.dart';
import 'package:flutter_projects_screen/widget/auth_button.dart';
import 'package:flutter_projects_screen/widget/line_divider.dart';

import '../Auth/auth_option.dart';
import '../widget/button.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.02,),
              _buildProfile(),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Center(
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Welcome to Finora",
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Explore a modern experience built for speed and simplicity",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[400],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenSize.height * 0.04,),
              Button(title: "Get Started",route: '/login',),
              SizedBox(height: screenSize.height * 0.04,),
              lineDivider(),
              SizedBox(height: screenSize.height * 0.04,),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: authOptions.length,
                  itemBuilder: (context, index) {
                    final option = authOptions[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: AuthButton(
                        image: option.image,
                        title: option.title,
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: Theme.of(context).textTheme.labelLarge?.copyWith(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildProfile() {
    var screenSize = MediaQuery.of(context).size;
    double imageSize = screenSize.height * 0.18;
    return Container(
      height: imageSize,
      width: imageSize,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: Image.network(
        "https://cdn-icons-png.flaticon.com/512/4837/4837259.png",
      ),
    );
  }
}

