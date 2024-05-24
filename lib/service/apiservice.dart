
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/model/model.dart';
part 'apiservice.g.dart';

@riverpod
ApiService apiProservice(ApiProserviceRef ref){
return ApiService();
}


class ApiService{
  Dio dio = Dio();
  Future<List<UserDataModel>> userData()async{
    final data  =  await dio.get('https://jsonplaceholder.typicode.com/posts');
    print(data.data.runtimeType);

    final List<dynamic> json = data.data;
    return json.map((post) => UserDataModel.fromJson(post)).toList();
  }
}