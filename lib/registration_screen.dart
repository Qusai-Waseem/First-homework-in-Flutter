import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  // controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();


  // form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscurePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordController2.dispose();
    super.dispose();
  }

  void register() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration Successful"),
          backgroundColor: Colors.green,
        ),
      );

     
    }
  }
 ///clear button
 
  void clearFields() {
    emailController.clear();
    passwordController.clear();
    passwordController2.clear();
    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                const SizedBox(height: 20),

                const Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                /// Name
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                /// Email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),


                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!value.contains("@")) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                /// Password1
                TextFormField(
                  
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),


                  validator: (value1) {
                    
                    if (value1 == null || value1.isEmpty) {
                      return "Password is required";
                    }
                    if (value1.length < 8) {
                      return "Minimum 8 characters";
                    }
                    return null;
                  },
                ),

                 const SizedBox(height: 15),

                /// Password2
                TextFormField(
                  controller: passwordController2,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: const OutlineInputBorder(),

                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                    ),
                  ),


                  validator: (value2) {
                    if (value2 == null || value2.isEmpty) {
                      return "Password confirmation is required";
                    }
                    if (value2 != passwordController.text) {
                      return "Passwords do not match";
                    }
                    if (value2.length < 8) {
                      return "Minimum 8 characters";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                /// Register Button
                ElevatedButton(
                  onPressed: register,
                  child: const Text("Register"),
                ),

                const SizedBox(height: 10),

                
                ElevatedButton(
                onPressed: clearFields,
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.blueGrey,
                ),
                child: Text("Clear", style: TextStyle(color: Colors.white)),
              ),

                
  
              ],
            ),
          ),
        ),
      ),
    );
  }
}