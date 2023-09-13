
import 'dart:io';

class ReqFile {
  File? file;
  String? name;
  String? url;
  String? data;

  ReqFile({this.name, this.url, this.file, this.data});

  ReqFile.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['data'] = this.data;
    return data;
  }

}