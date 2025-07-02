class Brandmodels {
  final String brandname;
  final String id;
  Brandmodels({required this.brandname, required this.id});
  Map<String, dynamic> tojson() {
    return ({"id": id, "brand": brandname});
  }

  factory Brandmodels.frommap(Map<String, dynamic> items, String id) {
    return Brandmodels(brandname: items["brand"], id: id);
  }
}
