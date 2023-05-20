class ProdukModel {
  int? id;
  String? kodeproduk;
  String? namaproduk;
  int? hargaproduk;

  ProdukModel({this.kodeproduk, this.namaproduk, this.hargaproduk, this.id});

  factory ProdukModel.fromJson(Map<String, dynamic> obj) {
    return ProdukModel(
      id: obj['id'],
      namaproduk: obj['namaproduk'],
      kodeproduk: obj['kodeproduk'],
      hargaproduk: obj['hargaproduk'],
    );
  }
}
