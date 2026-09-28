import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatefulWidget {
  const AuthButton({super.key, this.image, this.title});
  final String? image;
  final String? title;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: (){
        
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 1
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(widget.image!, scale: 3,),
          SizedBox(width: 10,),
          Text(widget.title!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            )
          ),
        ],
      )
    );
  }
}
