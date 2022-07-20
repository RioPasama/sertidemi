class ProductModel {
  String? idProduct;
  String? namaProduct;
  String? tanggalMulaiProduct;
  String? tanggalBatasProduct;
  String? urlImageCoverKotak;
  String? urlImageCoverPanjang;
  dynamic harga;
  dynamic hargaDiskon;
  dynamic diskon;
  String? status;

  ProductModel(
      {this.idProduct,
      this.namaProduct,
      this.tanggalMulaiProduct,
      this.tanggalBatasProduct,
      this.urlImageCoverKotak,
      this.urlImageCoverPanjang,
      this.harga,
      this.hargaDiskon,
      this.diskon,
      this.status});

  ProductModel.fromJson(Map<String, dynamic> json) {
    idProduct = json['id'] ?? '';
    namaProduct = json['nama'] ?? '';
    tanggalMulaiProduct = json['mulai'] ?? json['tgl_mulai'] ?? '';
    tanggalBatasProduct = json['selesai'] ?? json['tgl_selesai'] ?? '';
    urlImageCoverKotak = json['url_image_kotak'];
    urlImageCoverPanjang = json['url_image_panjang'];
    harga = json['harga'] ?? '';
    hargaDiskon = json['harga_diskon'] ?? '';
    diskon = json['diskon'] ?? '0';
    status = json['status'] ?? '';
  }
}
