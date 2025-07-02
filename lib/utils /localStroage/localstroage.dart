// import 'package:get_storage/get_storage.dart';

// class Localstroage {
//   late GetStorage
//   _storage; // this type declaration reason is ith can create a userbucketname for the favorute store in spefic userid

//   static Localstroage? _instance; // singleton instance
//   factory Localstroage.instance() {
//     _instance ??= Localstroage.internal();
//     return _instance!;
//   }
//   static Future<void> initUserId(String bucketname) async {
//     await GetStorage.init(bucketname);
//     _instance = Localstroage.internal();
//     _instance?._storage = GetStorage(bucketname);
//   }

//   Localstroage.internal();
//   // Genrtiv method to savethedata
//   Future<void> savethedata<T>(String key, T value) async {
//     await _storage.write(key, value);
//   }

//   // gentric method to readthedata
//   T? readthedata<T>(String key) {
//     return _storage.read(key);
//   }

//   // Gentric method to Remove data
//   Future<void> removedata(String key) async {
//     await _storage.remove(key);
//   }

//   // Clear all the data from localstroge
//   Future<void> clearall() async {
//     await _storage.erase();
//   }
// }
