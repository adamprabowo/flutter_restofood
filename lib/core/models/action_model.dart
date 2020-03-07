class ActionModel {
  int status;
  String message;
  Data data;

  ActionModel({this.status, this.message, this.data});

  ActionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String username;
  String email;
  String nik;
  String tanggalLahir;
  String alamat;
  String jenisKelamin;
  String kota;
  String pathPhoto;
  String filePhoto;

  Data(
      {this.id,
      this.username,
      this.email,
      this.nik,
      this.tanggalLahir,
      this.alamat,
      this.jenisKelamin,
      this.kota,
      this.pathPhoto,
      this.filePhoto});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    nik = json['nik'];
    tanggalLahir = json['tanggal_lahir'];
    alamat = json['alamat'];
    jenisKelamin = json['jenis_kelamin'];
    kota = json['kota'];
    pathPhoto = json['path_photo'];
    filePhoto = json['file_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['nik'] = this.nik;
    data['tanggal_lahir'] = this.tanggalLahir;
    data['alamat'] = this.alamat;
    data['jenis_kelamin'] = this.jenisKelamin;
    data['kota'] = this.kota;
    data['path_photo'] = this.pathPhoto;
    data['file_photo'] = this.filePhoto;
    return data;
  }
}