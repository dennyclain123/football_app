import 'package:flutter/material.dart';
import 'package:football_app/objects/footballOb.dart';
import 'package:football_app/objects/responseOb.dart';
import 'package:football_app/detail/detail.dart';
import 'package:football_app/widgets/highligh.dart';
import 'package:football_app/pages/home/home_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class FootBallPage extends StatefulWidget {

  @override
  _FootBallPageState createState() => _FootBallPageState();
}

class _FootBallPageState extends State<FootBallPage> {
  final bloc = HomeBloc();
  RefreshController refreshController = RefreshController();
  @override
  void initState() {
    // TODO: implement initState
    bloc.getData();
    bloc.getDataStream().listen((ResponseOb responseOb) {
      if(responseOb.msgState == MsgState.data){
        refreshController.refreshCompleted();
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ResponseOb>(
        stream: bloc.getDataStream(),
        initialData: ResponseOb(msgState: MsgState.loading),
        builder: (BuildContext context, AsyncSnapshot<ResponseOb> snapshot){
          ResponseOb responseOb = snapshot.data;
          if(responseOb.msgState == MsgState.data){
           List<FootballOb> fList = responseOb.data;
            return SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              onRefresh: (){
                bloc.getData();
              },
              header: WaterDropMaterialHeader(
                color: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: GridView.builder(
                itemCount: fList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Detail(fList[index])
                      ));
                    },
                      child: HighPage(fList[index]));
                },
              ),
            );
          }else if(responseOb.msgState == MsgState.error){
            if(responseOb.errState==ErrState.notFoundErr){
              return Center(child: Text("Can't connect to the internet",style: TextStyle(
                fontSize: 30,
                color: Colors.black12,
                fontWeight: FontWeight.bold
              ),),
              );
            }else if(responseOb.errState==ErrState.serverErr){
              return Center(child: Text("Sorry, we're having trouble please wait:(",style: TextStyle(
                  fontSize: 30,
                  color: Colors.black12,
                  fontWeight: FontWeight.bold
              ),),
              );
            }else{
              return Center(child: Text("Something went wrong :(",style: TextStyle(
                  fontSize: 30,
                  color: Colors.black12,
                  fontWeight: FontWeight.bold
              ),),
              );
            }
          }else{
            return Center(
              child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
            );
          }
        },
      )
    );
  }
}