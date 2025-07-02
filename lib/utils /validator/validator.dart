class Validator {
  static checkemprytext(String? filedname, dynamic value) {
    if (value?.trim() == null || value!.trim().isEmpty) {
      return "$filedname is a Required";
    }
  }

  static checkdropdownemptytext(String? filedname, dynamic value) {
    if (value == null) {
      return "$filedname is a Required";
    }
  }

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
