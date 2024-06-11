class RandomStringModel {
  final String randomString;

  RandomStringModel({required this.randomString});

  factory RandomStringModel.fromJson(Map<String, dynamic> json) {
    return RandomStringModel(
      randomString: json['randomString'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'randomString': randomString,
    };
  }
}
