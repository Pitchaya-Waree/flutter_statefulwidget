import 'dart:async';    
import 'package:flutter/material.dart';    
import 'package:flutter_statefulwidget/tab_menu.dart';    

class SplashScreen extends StatefulWidget {      
  const SplashScreen({super.key});      
  @override      
  State<StatefulWidget> createState() {        
    return SplashScreenState();      
  }    
}    

class SplashScreenState extends State<SplashScreen> {      
  @override      
  void initState() {        
    super.initState();        
    Timer(const Duration(seconds: 3), () {          
      Navigator.of(context).pushReplacement(              
          MaterialPageRoute(builder: (_) => const TabMenu()));
    });      
  }      
  
  @override      
  Widget build(BuildContext context) {        
    return const Scaffold(            
      body: Center(          
        child: Text(            
          'Thannob 5790065',            
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),          
        ),        
      ));      
  }    
} 