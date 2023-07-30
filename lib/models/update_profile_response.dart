import 'package:cards_store/models/login_response.dart';

class UpdateProfileResponse {
  int? status;
  String? message;
  User? data;

  UpdateProfileResponse({this.status, this.message, this.data});

  UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
