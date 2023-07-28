class RegisterResponse {
  int? code;
  String? status;
  Message? message;
  Data? data;

  RegisterResponse({this.code, this.status, this.message, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Message {
  List<String>? success;

  Message({this.success});

  Message.fromJson(Map<String, dynamic> json) {
    success = json['success'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? accessToken;
  User? user;
  String? tokenType;

  Data({this.accessToken, this.user, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token_type'] = this.tokenType;
    return data;
  }
}

class User {
  String? firstname;
  String? lastname;
  String? email;
  String? username;
  int? refBy;
  String? countryCode;
  String? mobile;
  Address? address;
  int? status;
  int? ev;
  int? sv;
  int? ts;
  int? tv;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.firstname,
        this.lastname,
        this.email,
        this.username,
        this.refBy,
        this.countryCode,
        this.mobile,
        this.address,
        this.status,
        this.ev,
        this.sv,
        this.ts,
        this.tv,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    username = json['username'];
    refBy = json['ref_by'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    status = json['status'];
    ev = json['ev'];
    sv = json['sv'];
    ts = json['ts'];
    tv = json['tv'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['username'] = this.username;
    data['ref_by'] = this.refBy;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['status'] = this.status;
    data['ev'] = this.ev;
    data['sv'] = this.sv;
    data['ts'] = this.ts;
    data['tv'] = this.tv;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}
