class AuthResponse {
  int? code;
  String? status;
  Message? message;
  Data? data;

  AuthResponse({this.code, this.status, this.message, this.data});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'] != null ? Message.fromJson(json['message']) : null;
    data = json.containsKey('data') ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Message {
  List<String>? success;
  List<String>? error;

  Message({this.success});

  Message.fromJson(Map<String, dynamic> json) {
    success = json.containsKey('success') ? List<String>.from(json['success']) : null;
    error = json.containsKey('error') ? List<String>.from(json['error'])  : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;
  String? tokenType;

  Data({this.user, this.accessToken, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    return data;
  }
}

class User {
  int? id;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? countryCode;
  String? mobile;
  String? refBy;
  String? balance;
  String? image;
  Address? address;
  String? status;
  String? ev;
  String? sv;
  String? verCode;
  String? verCodeSendAt;
  String? ts;
  int? tv;
  String? tsc;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.firstname,
        this.lastname,
        this.username,
        this.email,
        this.countryCode,
        this.mobile,
        this.refBy,
        this.balance,
        this.image,
        this.address,
        this.status,
        this.ev,
        this.sv,
        this.verCode,
        this.verCodeSendAt,
        this.ts,
        this.tv,
        this.tsc,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    refBy = json['ref_by'];
    balance = json['balance'];
    image = json['image'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    status = json['status'];
    ev = json['ev'];
    sv = json['sv'];
    verCode = json['ver_code'];
    verCodeSendAt = json['ver_code_send_at'];
    ts = json['ts'];
    tv = json['tv'];
    tsc = json['tsc'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['username'] = username;
    data['email'] = email;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['ref_by'] = refBy;
    data['balance'] = balance;
    data['image'] = image;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['status'] = status;
    data['ev'] = ev;
    data['sv'] = sv;
    data['ver_code'] = verCode;
    data['ver_code_send_at'] = verCodeSendAt;
    data['ts'] = ts;
    data['tv'] = tv;
    data['tsc'] = tsc;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Address {
  String? address;
  String? state;
  String? zip;
  String? country;
  String? city;

  Address({this.address, this.state, this.zip, this.country, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['state'] = state;
    data['zip'] = zip;
    data['country'] = country;
    data['city'] = city;
    return data;
  }
}