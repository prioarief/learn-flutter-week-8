import 'package:flutter/material.dart';
import 'package:tokoumb/ui/registrasiview.dart';
// Import the RegistrasiView

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  // bool _isLoading = false;

  final _emailTextbboxControoller = TextEditingController();
  final _passwordTextbboxControoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextField(
                    labelText: "Email",
                    isSecure: false,
                    keyboardType: TextInputType.text,
                    controller: _emailTextbboxControoller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email harus diisi';
                      }

                      RegExp emailRegex = RegExp(
                          r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

                      if (!emailRegex.hasMatch(value)) {
                        return 'Email tidak valid';
                      }
                      return null;
                    },
                  ),
                  _buildTextField(
                    labelText: "Password",
                    isSecure: true,
                    keyboardType: TextInputType.text,
                    controller: _passwordTextbboxControoller,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Password harus diisi dan minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: _buildLoginButton(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child:
                        _buildRegistrasiLink(), // Add the link to RegistrasiView
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextInputType keyboardType,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    required bool isSecure,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: isSecure,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          // Perform login logic here
        }
      },
      child: const Text("Login"),
    );
  }

  Widget _buildRegistrasiLink() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrasiView()),
        );
      },
      child: const Text("Belum punya akun? Registrasi disini"),
    );
  }
}
