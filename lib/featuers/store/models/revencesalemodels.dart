class Revencesalemodels {
  final int totalrevene;
  final int totalorders;
  final String orderid;
  final String id;
  final String date;
  final String year;
  final String month;
  Revencesalemodels({
    required this.orderid,
    required this.totalorders,
    required this.totalrevene,
    required this.id,
    required this.date,
    required this.month,
    required this.year,
  });
  Map<String, dynamic> toJson() {
    return {
      "orderid": orderid,
      "totalorders": totalorders,
      "totalrevene": totalrevene,
      "id": id,
      "date": date,
      "month": month,
      "year": year,
    };
  }
}
