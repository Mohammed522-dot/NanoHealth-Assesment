class Rating {
  final double rate;
  final int count;

  Rating( {required this.rate ,required this.count,});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'] as double,
      count: json['title'] as int,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "rate": rate,
        "count": count,

      };
  @override
  String toString() {
    return '{ rate: $rate, count: $count,}';
  }
}