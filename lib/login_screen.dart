import 'package:flutter/material.dart';    

class LoginScreen extends StatefulWidget {      
  const LoginScreen({super.key});      
  @override      
  State<StatefulWidget> createState() {        
    return LoginScreenState();      
  }    
}    

class LoginScreenState extends State<LoginScreen> {      
  final _formKey = GlobalKey<FormState>();      
  final TextEditingController _emailController = TextEditingController();      
  final TextEditingController _passwordController = TextEditingController();      
  
  @override      
  Widget build(BuildContext context) {        
    return Scaffold(          
      appBar: AppBar(            
        title: const Text('Login'),          
      ),          
      body: Padding(            
        padding: const EdgeInsets.all(16),            
        child: Form(              
          key: _formKey,              
          child: Column(children: [                
            TextFormField(                  
              controller: _emailController,                  
              decoration: const InputDecoration(labelText: 'Email'),                  
              keyboardType: TextInputType.emailAddress,                  
              validator: (value) {                    
                if (value == null || value.isEmpty) {                      
                  return 'Please enter your email';                    
                } else if (!value.contains('@')) {                      
                  return 'Please enter valid email';                    
                } else {                      
                  return null;                    
                }                  
              },                
            ),                
            TextFormField(                  
              controller: _passwordController,                  
              decoration: const InputDecoration(labelText: 'Password'),                  
              obscureText: true,                  
              validator: (value) {                    
                if (value == null || value.isEmpty) {                      
                  return 'Please enter your password';                    
                } else if (value.length < 6) {                      
                  return 'Password must be at least 6 characters';                    
                } else {                      
                  return null;                    
                }                  
              },                
            ),                
            const SizedBox(                  
              height: 20,                
            ),                
            SizedBox(                    
              width: double.infinity,                    
              child: ElevatedButton(                        
                onPressed: () {                          
                  if (_formKey.currentState!.validate()) {                            
                    final email = _emailController.text;                            
                    final password = _passwordController.text;                            
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(                                
                      content:                                    
                          Text('Email: $email\\nPassword: $password')));                          
                  }                        
                },                        
                child: const Text('Login')))              
          ]),            
        ),          
      ),        
    );      
  }    
} 