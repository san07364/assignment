import 'package:flutter/material.dart';
import 'package:flutter_assignment/controller/sports_api.dart';
import 'package:flutter_assignment/models/sports_model.dart';
import 'package:flutter_assignment/views/widgets/sports_tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SportsApi _sportsApi = SportsApi();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: _sportsApi.getData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<SportsModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var item = snapshot.data[index];
                    return SportsTile(
                      data: item,
                    );
                  });
            }

            // spinner for uncompleted state
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
