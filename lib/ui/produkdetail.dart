import 'package:flutter/material.dart';
import 'package:tokoumb/model/produkmodel.dart';
import 'package:tokoumb/ui/produkview.dart';

// ignore: must_be_immutable
class ProdukDetailView extends StatefulWidget {
  ProdukModel? produk;

  ProdukDetailView({Key? key, this.produk}) : super(key: key);
  @override
  _ProdukDetailViewState createState() => _ProdukDetailViewState();
}

class _ProdukDetailViewState extends State<ProdukDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.produk!.kodeproduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk!.namaproduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Harga : ${widget.produk!.hargaproduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProdukView(produk: widget.produk!)));
            },
            child: const Text('Edit')),
        OutlinedButton(
            onPressed: () {
              AlertDialog alertDialog = AlertDialog(
                content: const Text("Yakin ingin hapus?"),
                actions: [
                  OutlinedButton(onPressed: () {}, child: const Text("Ya")),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Tidak")),
                ],
              );
              showDialog(context: context, builder: (context) => alertDialog);
            },
            child: const Text("Delete")),
      ],
    );
  }
}
