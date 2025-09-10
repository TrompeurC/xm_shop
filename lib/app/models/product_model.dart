class ProductModel {
  List<ProductItemModel>? result;

  ProductModel({
    this.result,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ProductItemModel>[];
      json['result'].forEach((v) {
        result?.add(ProductItemModel.fromJson(v));
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

class ProductItemModel {
  String? sId;
  String? title;
  String? cid;
  num? price;
  String? pic;
  String? subTitle;
  String? sPic;

  ProductItemModel({
    this.sId,
    this.title,
    this.cid,
    this.price,
    this.pic,
    this.subTitle,
    this.sPic,
  });

  ProductItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'] as num?;
    pic = json['pic'];
    subTitle = json['sub_title'];
    sPic = json['s_pic'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['cid'] = cid;
    data['price'] = price;
    data['pic'] = pic;
    data['sub_title'] = subTitle;
    data['s_pic'] = sPic;
    return data;
  }
}
