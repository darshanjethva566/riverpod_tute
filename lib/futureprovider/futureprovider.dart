import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/futureprovider/model.dart';


//final provider = FutureProvider<List<DemoModel>>((ref) async{
//without autodispose and with
final provider = FutureProvider.autoDispose<List<DemoModel>>((ref) async{
 return await Future.delayed(Duration(seconds: 3),() {
    return list;
  },);
});
class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});
//Note :  Provider doing also caching like akvar data aai gayo pachhi jyare aapde page mathi move thaiye tyare te data tyane tya rese javani jugya a
  // like Getr.Put atle aapde autodispose mukvu pdse
  // varm var api server par nai jay inshort jo auto dispose na use kariye toj
  //jo kariye to every time jase
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return ref.watch(provider).when(data: (data) {
              return ListView.builder(itemCount: data.length,itemBuilder: (context, index) {
                return ListTile(title: Text(data[index].name),subtitle: Text(data[index].mail),);
              },);
            }, error: (error, stackTrace) {
              return Center(child: Text("Something went wrong"),);
            }, loading: () {
              return Center(child: CircularProgressIndicator(),);
            },);
          },
        ),
      ),
    );
  }
}
