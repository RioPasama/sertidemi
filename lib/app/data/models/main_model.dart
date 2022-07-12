///class MainModel is model for all respons at first APIs
///and the [data] will be passed to the corresponding model
///[code] function to see the `status code` when getting a response
///[message] function to see the `message` when getting a response
class MainModel {
  int? code;
  String? message;
  dynamic data;

  ///[code] and [message]
  ///to avoid null data from APIs
  MainModel({this.code, this.message, this.data});

  MainModel.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? '';
    message = json['message'] ?? '';
    data = json['data'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}
