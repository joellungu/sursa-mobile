import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

final dio = d.Dio();

class Requete extends GetConnect {
  //static String url = "https://www.sky-workspace.com/sursa";
  //static String url = "http://192.168.1.185/www/sursa/api";
  //static String url = "http://192.168.1.185/skytech/sursa/api.sursa.cd"; //8080
  static String url = "https://www.sursa.cd/api";
  static String urlImage = "https://www.sursa.cd";
  //static String ws = "ws://10.0.2.2:8080";
  //
  Future<d.Response> getEE() async {
    //print("$url/$path");
    //192.168.1.185/www/sursa
    //https://sursa.cd/beta/sursa/
    return dio.get(
      "https://sursa.cd/beta/sursa/engine/check/scan?api=1&token=r0i2kkvobtntmiqp4tr48pt4s01713612344",
      options: d.Options(),
    );
  }

  Future<d.Response> getE(String path) async {
    print("$url/$path");
    return dio.get("$url/$path", options: d.Options());
  }

  Future<d.Response> postE(String path, var e) async {
    return dio.post("$url/$path", data: e);
  }

  Future<d.Response> putE(String path, var e) async {
    return dio.put("$url/$path", data: e);
  }

  Future<d.Response> deleteE(String path) async {
    return dio.delete("$url/$path");
  }
}
