class GetProfileResponse {
  int? status;
  Data? data;

  GetProfileResponse({this.status = null, this.data = null});

  GetProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  dynamic verCode;
  dynamic verCodeSendAt;
  String? ts;
  String? tv;
  dynamic tsc;
  String? createdAt;
  String? updatedAt;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
