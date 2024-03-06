class LoginResponse {
  String? message;
  Data? data;
  bool? status;

  LoginResponse({this.message, this.data, this.status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? userOtpId;

  Data({this.userOtpId});

  Data.fromJson(Map<String, dynamic> json) {
    userOtpId = json['user_otp_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_otp_id'] = this.userOtpId;
    return data;
  }
}
