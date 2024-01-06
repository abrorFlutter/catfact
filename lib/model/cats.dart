class CatFacts {
  Status? status;
  String? sId;
  String? user;
  String? text;
  int? iV;
  String? source;
  String? updatedAt;
  String? type;
  String? createdAt;
  bool? deleted;
  bool? used;

  CatFacts(
      {this.status,
        this.sId,
        this.user,
        this.text,
        this.iV,
        this.source,
        this.updatedAt,
        this.type,
        this.createdAt,
        this.deleted,
        this.used});

  CatFacts.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    sId = json['_id'];
    user = json['user'];
    text = json['text'];
    iV = json['__v'];
    source = json['source'];
    updatedAt = json['updatedAt'];
    type = json['type'];
    createdAt = json['createdAt'];
    deleted = json['deleted'];
    used = json['used'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['text'] = this.text;
    data['__v'] = this.iV;
    data['source'] = this.source;
    data['updatedAt'] = this.updatedAt;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['deleted'] = this.deleted;
    data['used'] = this.used;
    return data;
  }
}

class Status {
  bool? verified;
  int? sentCount;

  Status({this.verified, this.sentCount});

  Status.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    sentCount = json['sentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verified'] = this.verified;
    data['sentCount'] = this.sentCount;
    return data;
  }
}
