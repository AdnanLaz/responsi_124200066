import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsi/detail_pertandingan.dart';
import 'package:responsi/network/matches_model.dart';
import 'package:responsi/network/resource.dart';

class listPertandingan extends StatefulWidget {
  const listPertandingan({Key? key}) : super(key: key);
  @override
  _listPertandinganState createState() => _listPertandinganState();
}

class _listPertandinganState extends State<listPertandingan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 127, 203, 151),
        title:Text("Piala Dunia 2022")
      ),
      body: _buildListPertandinganBody(),
    );
  }

  Widget _buildListPertandinganBody() {
    return Container(
      child: FutureBuilder(
        future: DetailDataSource.instance.loadListData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            return _buildSuccessSection(snapshot.data);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(
      ),
    );
  }

  Widget _buildSuccessSection(List<dynamic> data) {
   
    return ListView.builder(
        itemCount: 48,
        itemBuilder: (BuildContext context, int index) {
           MatchesModel matchesModel = MatchesModel.fromJson(data[index]);
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: ((context) {
                    return DetailPertandingan(id: matchesModel.id.toString());
                  })
                )),
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 250,
            width: 100,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://countryflagsapi.com/png/${matchesModel.homeTeam?.name}")
                          )
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("${matchesModel.homeTeam?.goals}"),
                     SizedBox(width: 10,),
                    Text("-"),
                     SizedBox(width: 10,),
                    Text("${matchesModel.awayTeam?.goals}"),
                    SizedBox(width: 10,),
                    Container(
                      height: 200,
                      width: 200,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://countryflagsapi.com/png/${matchesModel.awayTeam?.name}")
                          )
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 75)),
                    Text("${matchesModel.homeTeam?.name}"),
                    SizedBox(width: 80,),
                    Text("${matchesModel.awayTeam?.name}")
                  ],
                )

              ],
            ),
          ),
          );
  }
    );
  }
}