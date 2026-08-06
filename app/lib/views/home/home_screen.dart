import 'package:flutter/material.dart';
import '../../widgets/martola_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
       const Text('MARTOLA')
      ),
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const MartolaLogo(),
                    const SizedBox(
                      height: 24.0,
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: Text("Entrar"),
                    )
                ]            
             
              )
            )
          )
        )
    );
  }
}