import 'package:flutter/material.dart';
import 'package:responsi/network/resource.dart';
import 'package:responsi/network/detail_matches_model.dart';

class DetailPertandingan extends StatefulWidget {
  final String id;
  const DetailPertandingan({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPertandingan> createState() => _DetailPertandinganState();
}

class _DetailPertandinganState extends State<DetailPertandingan> {
  @override
  bool toggle = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 127, 203, 151),
          title: Text("Match Id : ${widget.id}")),
      body: ListView(
        children: [
          Column(
            children: [
              FutureBuilder(
                future: DetailDataSource.instance.loadDetail(widget.id),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return _buildErrorSection();
                  }
                  if (snapshot.hasData) {
                    DetailMatchesModel detailModels =
                        DetailMatchesModel.fromJson(snapshot.data);
                    return _buildSuccessSection(detailModels);
                  }
                  return _buildLoadingSection();
                },
              )
            ],
          )
        ],
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
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(DetailMatchesModel data) {
    // var passakurasi;
    // int passes;
    // int passeskomplit;

    //   passes = {data.homeTeam!.statistics!.passes} as int;
    //   passeskomplit = {data.homeTeam!.statistics!.passesCompleted} as int;

    //   passakurasi = passes / passeskomplit;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 1030,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    height: 200,
                    width: 200,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://countryflagsapi.com/png/${data.homeTeam?.name}"))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("${data.homeTeam?.goals}"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("-"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("${data.awayTeam?.goals}"),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://countryflagsapi.com/png/${data.awayTeam?.name}"))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                  Text("${data.homeTeam?.name}"),
                  SizedBox(
                    width: 200,
                  ),
                  Text("${data.awayTeam?.name}")
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text("Stadium : ${data.venue}"),
              SizedBox(
                height: 20,
              ),
              Text("Stadium : ${data.location}"),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: [
                          Text(
                            "Statistic",
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Ball Possession"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 45)),
                              Text(
                                  "${data.homeTeam?.statistics?.ballPossession}"),
                              SizedBox(
                                width: 91,
                              ),
                              Text("-"),
                              SizedBox(
                                width: 90,
                              ),
                              Text(
                                  "${data.awayTeam?.statistics?.ballPossession}")
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Shot"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 60)),
                              Text(
                                  "${data.homeTeam?.statistics?.attemptsOnGoal}"),
                              SizedBox(
                                width: 118,
                              ),
                              Text("-"),
                              SizedBox(
                                width: 110,
                              ),
                              Text(
                                  "${data.awayTeam?.statistics?.attemptsOnGoal}")
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Shot on Goal"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 60)),
                              Text(
                                  "${data.homeTeam?.statistics?.kicksOnTarget}"),
                              SizedBox(
                                width: 118,
                              ),
                              Text("-"),
                              SizedBox(
                                width: 110,
                              ),
                              Text(
                                  "${data.awayTeam?.statistics?.kicksOnTarget}")
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Corners"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 60)),
                              Text("${data.homeTeam?.statistics?.corners}"),
                              SizedBox(
                                width: 118,
                              ),
                              Text("-"),
                              SizedBox(
                                width: 110,
                              ),
                              Text("${data.awayTeam?.statistics?.corners}")
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Offside"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 60)),
                              Text("${data.homeTeam?.statistics?.offsides}"),
                              SizedBox(
                                width: 118,
                              ),
                              Text("-"),
                              SizedBox(
                                width: 110,
                              ),
                              Text("${data.awayTeam?.statistics?.offsides}")
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Fouls"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 60)),
                              Text(
                                  "${data.homeTeam?.statistics?.foulsCommited}"),
                              SizedBox(
                                width: 110,
                              ),
                              Text("-"),
                              SizedBox(
                                width: 105,
                              ),
                              Text(
                                  "${data.awayTeam?.statistics?.foulsCommited}")
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Pass Accuracy"),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 58)),
                              Text("${data.homeTeam?.statistics?.passes}"),
                              SizedBox(
                                width: 108,
                              ),
                              Text("-"),
                              SizedBox(
                                width: 100,
                              ),
                              Text("${data.awayTeam?.statistics?.passes}")
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Referees :",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: 1000,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.officials!.length,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(border: Border.all()),
                        height: 200,
                        width: 200,
                        child: Center(
                            child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://upload.wikimedia.org/wikipedia/id/thumb/e/e3/2022_FIFA_World_Cup.svg/1200px-2022_FIFA_World_Cup.svg.png"))),
                              ),
                              Column(
                                children: [
                                  Text("${data.officials![index].name}"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("${data.officials![index].role}")
                                ],
                              ),
                            ],
                          ),
                        )));
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
