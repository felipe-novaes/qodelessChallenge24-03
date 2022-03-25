import 'dart:convert';

class SessionDevice {
  String? image;
  int? value;

  SessionDevice({this.image, this.value});

  SessionDevice.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['value'] = this.value;
    return data;
  }

  factory SessionDevice.fromMap(Map<String, dynamic> map) {
    return SessionDevice(
      image: map['image'],
      value: map['value'],
    );
  }
}
