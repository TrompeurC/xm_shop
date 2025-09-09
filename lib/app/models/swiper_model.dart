class SwiperModel {
  List<SwiperItemModel>? result;

  SwiperModel({
    this.result,
  });

  SwiperModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <SwiperItemModel>[];
      json['result'].forEach((v) {
        result?.add(SwiperItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SwiperItemModel {
  String? sId;
  String? title;
  String? status;
  String? pic;
  String? url;
  num? position;

  SwiperItemModel({
    this.sId,
    this.title,
    this.status,
    this.pic,
    this.url,
    this.position,
  });

  SwiperItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
    position = json['position'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    data['position'] = position;
    return data;
  }
}
