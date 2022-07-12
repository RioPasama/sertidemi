class EventTiketModel {
  String? idassessment;
  String? idevent;
  String? namaEvent;
  String? eventMulai;
  String? eventSelesai;
  String? urlImagePanjang;
  String? deskripsi;
  String? materiCount;
  String? linkStatus;
  String? linkMeeting;
  EventTiketModel({
    required this.idassessment,
    required this.idevent,
    required this.namaEvent,
    required this.eventMulai,
    required this.eventSelesai,
    required this.deskripsi,
    required this.linkStatus,
    required this.materiCount,
    required this.linkMeeting,
    required this.urlImagePanjang,
  });

  EventTiketModel.fromJson(Map<String, dynamic> json) {
    idassessment=json['idassessment']??'';
    idevent = json['idevent'] ?? '';
    namaEvent = json['nama_event'] ?? '';
    eventMulai = json['event_mulai'] ?? '';
    eventSelesai = json['event_selesai'] ?? '';
    urlImagePanjang = json['url_image_panjang'] ?? '';
    deskripsi = json['deskripsi_event'] ?? '';
    materiCount = json['materi_count'] ?? '';
    linkStatus = json['link_status'] ?? '';
    linkMeeting = json['link_meeting'] ?? '';
  }
}
