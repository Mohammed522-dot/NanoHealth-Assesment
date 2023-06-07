class Rating {
  final double rate;
  final int count;

  Rating( {required this.rate ,required this.count,});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'] == null ? 0.0 : json['rate'].toDouble(),
      count: json['count'] as int,
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