import 'package:flutter/material.dart';

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
                    Icon(Icons.eco, size: 64.0),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text("MARTOLA"),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text("Xestión Intelixente de hortas e xardíns",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
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