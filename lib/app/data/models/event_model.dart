///class EventDetailModel is model for API
class EventDetailModel {
  String? idEvent;
  List<EventDetailBannersModel>? banners;
  String? namaEvent;
  String? deskripsiEvent;
  String? linkMeeting;
  String? eventMulai;
  String? urlImagePanjang;
  String? urlImageKotak;
  String? penulis;
  dynamic harga;
  dynamic diskon;
  dynamic statusDiskon;

  EventDetailModel(
      {this.idEvent,
      this.banners,
      this.namaEvent,
      this.deskripsiEvent,
      this.linkMeeting,
      this.urlImagePanjang,
      this.urlImageKotak,
      this.penulis,
      this.eventMulai,
      this.diskon,
      this.harga,
      this.statusDiskon});

  EventDetailModel.fromJson(Map<String, dynamic> json) {
    idEvent = json['idevent'] ?? '';
    banners = List<EventDetailBannersModel>.from(
        json['banners'].map((e) => EventDetailBannersModel.fromJson(e)));
    namaEvent = json['nama_event'] ?? '';
    penulis = json['penulis'] ?? '';
    deskripsiEvent = json['deskripsi_event'] ?? '';
    linkMeeting = json['link_meeting'] ?? '';
    eventMulai = json['event_mulai'] ?? '';
    urlImagePanjang = json['url_image_panjang'] ?? '';
    urlImageKotak = json['url_image_kotak'] ?? '';
    harga = json['harga'] ?? '';
    diskon = json['diskon'] ?? '';
    statusDiskon = json['status_diskon'] ?? '';
  }
}

///class EventDetailBannersModel is model for API
class EventDetailBannersModel {
  String? ideventbanner;
  String? linkBanner;
  String? statusBanner;

  EventDetailBannersModel({
    this.ideventbanner,
    this.linkBanner,
    this.statusBanner,
  });

  EventDetailBannersModel.fromJson(Map<String, dynamic> json) {
    ideventbanner = json['ideventbanner'] ?? '';
    linkBanner = json['link_banner'] ?? '';
    statusBanner = json['status_banner'] ?? '';
  }
}
