class Validators {
  static String? checkusername(String? value) {
    if (value!.isEmpty) {
      return "Required the Username";
    } else if (value != "admin") {
      return "Wrong the Username";
    } else {
      return null;
    }
  }
}
