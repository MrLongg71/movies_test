

// class LocalDataSourceImpl implements LocalDataSource {
//   final SPrefUtil sPrefUtil;
//
//   LocalDataSourceImpl(this.sPrefUtil);
//
//   @override
//   Future<List<MoviesModel>> getLastCachedData() async {
//     final jsonString = await sPrefUtil.getString('CACHED_DATA');
//     if (jsonString != null) {
//       return MoviesModel.fromJson(jsonDecode(jsonString));
//     } else {
//       return [];  // Không có dữ liệu cache
//     }
//   }
//
//   @override
//   Future<void> cacheData(List<MoviesModel> data) async {
//     final jsonString = jsonEncode(data.toJson());
//     sharedPreferences.setString('CACHED_DATA', jsonString);
//   }
// }
