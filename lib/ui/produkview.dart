import 'package:flutter/material.dart';
import 'package:tokoumb/model/produkmodel.dart';

class ProdukView extends StatefulWidget {
  final ProdukModel? produk;

  ProdukView({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukViewState createState() => _ProdukViewState();
}

class _ProdukViewState extends State<ProdukView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  late String judul;
  late String tombolSubmit;

  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  void isUpdate() {
    if (widget.produk != null) {
      judul = "UBAH PRODUK";
      tombolSubmit = "UBAH";
      _kodeProdukTextboxController.text = widget.produk!.kodeproduk!;
      _namaProdukTextboxController.text = widget.produk!.namaproduk!;
      _hargaProdukTextboxController.text =
          widget.produk!.hargaproduk.toString();
    } else {
      judul = "TAMBAH PRODUK";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                  labelText: "Kode Produk",
                  keyboardType: TextInputType.text,
                  controller: _kodeProdukTextboxController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Kode Produk harus diisi";
                    }
                    return null;
                  },
                ),
                _buildTextField(
                  labelText: "Nama Produk",
                  keyboardType: TextInputType.text,
                  controller: _namaProdukTextboxController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama Produk harus diisi";
                    }
                    return null;
                  },
                ),
                _buildTextField(
                  labelText: "Harga Produk",
                  keyboardType: TextInputType.number,
                  controller: _hargaProdukTextboxController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harga Produk harus diisi";
                    }
                    return null;
                  },
                ),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextInputType keyboardType,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
    );
  }

  Widget _buildSubmitButton() {
    return OutlinedButton(
      onPressed: () {
        var validate = _formKey.currentState!.validate();
      },
      child: Text(tombolSubmit),
    );
  }
}
