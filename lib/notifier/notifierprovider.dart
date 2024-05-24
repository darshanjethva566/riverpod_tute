
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/model/model.dart';
import 'package:riverpod_demo/service/apiservice.dart';
part 'notifierprovider.g.dart';

@riverpod
  class NotifierPro extends _$NotifierPro{
    final ApiService apiServic = ApiService();
    @override


   Future<List<UserDataModel>> build() async {
      return  await ref.read(apiProserviceProvider).userData();
    }


    Future<void> refreshData() async {
      print(apiProserviceProvider.hashCode);
      print(apiServic.hashCode);
      state = const AsyncValue.loading();
      try {
        List<UserDataModel> data = await  ref.read(apiProserviceProvider).userData();
        state = AsyncData(data);
      }
     on DioException catch (e) {
        state = AsyncError(e.type.name,e.stackTrace);
      }
    }

    void updateModel (String name,int index){
      AsyncValue<List<UserDataModel>> list = state;
      list.value![index].title =  name;
      state = list;

    }


  }