///class CheckoutEventDetailModel is model for API
class CheckoutEventDetailModel {
  String? idEvent;
  String? namaEvent;
  String? deskripsiEvent;
  String? linkMeeting;
  String? eventMulai;
  String? urlImagePanjang;
  String? namaVoucher;
  String? potonganVoucher;
  String? hargaAkhir;
  dynamic harga;
  dynamic diskon;
  dynamic diskonStatus;

  CheckoutEventDetailModel({
    this.idEvent,
    this.namaEvent,
    this.deskripsiEvent,
    this.linkMeeting,
    this.urlImagePanjang,
    this.eventMulai,
    this.diskon,
    this.harga,
    this.diskonStatus,
    this.hargaAkhir,
    this.namaVoucher,
    this.potonganVoucher,
  });

  CheckoutEventDetailModel.fromJson(Map<String, dynamic> json) {
    idEvent = json['idevent'] ?? '';
    namaEvent = json['nama_event'] ?? '';
    deskripsiEvent = json['deskripsi_event'] ?? '';
    linkMeeting = json['link_meeting'] ?? '';
    eventMulai = json['event_mulai'] ?? '';
    urlImagePanjang = json['url_image_panjang'] ?? '';
    harga = json['harga'] ?? '';
    diskon = json['diskon'] ?? '';
    diskonStatus = json['diskon_status'] ?? '';
  }
}
