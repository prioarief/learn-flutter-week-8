import 'package:flutter/material.dart';

class RegistrasiView extends StatefulWidget {
  const RegistrasiView({Key? key}) : super(key: key);

  @override
  _RegistrasiViewState createState() => _RegistrasiViewState();
}

class _RegistrasiViewState extends State<RegistrasiView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _namaTextbboxControoller = TextEditingController();
  final _emailTextbboxControoller = TextEditingController();
  final _passwordTextbboxControoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(
                labelText: "Nama",
                keyboardType: TextInputType.text,
                controller: _namaTextbboxControoller,
                validator: (value) {
                  if (value!.length < 3) {
                    return 'Nama harus diisi dan minimal 3 karakter';
                  }
                  return null;
                },
              ),
              _buildTextField(
                labelText: "Email",
                keyboardType: TextInputType.text,
                controller: _emailTextbboxControoller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email harus diisi';
                  }

                  RegExp emailRegex =
                      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

                  if (!emailRegex.hasMatch(value)) {
                    return 'Email tidak valid';
                  }
                  return null;
                },
              ),
              _buildTextField(
                labelText: "Password",
                keyboardType: TextInputType.text,
                controller: _passwordTextbboxControoller,
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Password harus diisi dan minimal 6 karakter';
                  }
                  return null;
                },
              ),
              _buildTextField(
                labelText: "Konfirmasi Password",
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value != _passwordTextbboxControoller.text) {
                    return 'Konfirmasi Password Tidak Sama';
                  }
                  return null;
                },
              ),
              _buildRegistrasiButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextInputType keyboardType,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
    );
  }

  Widget _buildRegistrasiButton() {
    return ElevatedButton(
      onPressed: () {
        var validate = _formKey.currentState!.validate();
      },
      child: const Text("Registrasi"),
    );
  }
}
