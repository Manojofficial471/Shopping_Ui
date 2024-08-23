class HomeCategory {
  final String dpImgPath;
  final String dpName;

  HomeCategory({
    required this.dpImgPath,
    required this.dpName,
  });

  factory HomeCategory.fromJson(Map<String, dynamic> json) {
    return HomeCategory(
      dpImgPath: json['dp_imgpath'],
      dpName: json['dp_name'],
    );
  }

  static List<HomeCategory> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => HomeCategory.fromJson(json)).toList();
  }
}

class Product {
  final String product;
  final String brandName;
  final String imagePath;

  Product({
    required this.product,
    required this.brandName,
    required this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      product: json['product'],
      brandName: json['brandname'],
      imagePath: json['image_path'],
    );
  }
}
