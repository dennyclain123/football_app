import 'dart:async';
import 'dart:convert';
import 'package:football_app/constants/app_constants.dart';
import 'package:football_app/objects/footballOb.dart';
import 'package:http/http.dart' as http;
import 'package:football_app/objects/responseOb.dart';

class HomeBloc{
  StreamController<ResponseOb> _controller = StreamController.broadcast();
  Stream<ResponseOb> getDataStream() => _controller.stream;
  getData()async{
    ResponseOb responseOb = ResponseOb(msgState: MsgState.loading);
    // _controller.sink.add(responseOb);
    var response = await http.get(Uri.parse(BASE_URL));
    if(response.statusCode == 200){
      // print(response.body);
      List<FootballOb> fob = [];
      List<dynamic> list = json.decode(response.body);
      list.forEach((data) {
        fob.add(FootballOb.fromJson(data));
      });
      responseOb.msgState = MsgState.data;
      responseOb.data = fob;
      _controller.sink.add(responseOb);
    }
    else if(response.statusCode == 404){
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.notFoundErr;
      _controller.sink.add(responseOb);
    }
    else if(response.statusCode == 500){
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.serverErr;
      _controller.sink.add(responseOb);
    }else{
      responseOb.msgState = MsgState.error;
      responseOb.errState = ErrState.unknownErr;
      _controller.sink.add(responseOb);
    }
  }
  dispose(){
    _controller.close();
  }
}