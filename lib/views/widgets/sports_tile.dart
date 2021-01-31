import 'package:flutter/material.dart';
import 'package:flutter_assignment/constants/style.dart';
import 'package:flutter_assignment/models/sports_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SportsTile extends StatelessWidget {
  final SportsModel data;
  const SportsTile({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String days = " ";
    for (int i = 0; i < data.dayOfWeeksOpen.length; i++) {
      days = days + " " + data.dayOfWeeksOpen[i];
    }
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Text(
            "${data.name}",
            style: kHeadingStyle,
          ),
          SizedBox(
            height: 5,
          ),
          (data.images != null && data.images.length > 0)
              ? StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 4,
                  itemCount: data.images.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Image.network(data.images[index]),
                  ),
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                )
              : Text(""),
          CustomText(
            primary: 'Open On : ',
            secondary: days,
          ),
          CustomText(
            primary: 'Open Time : ',
            secondary: data.openTime,
          ),
          CustomText(
            primary: 'Close Time : ',
            secondary: data.closeTime,
          ),
          CustomText(
            primary: 'Slot Time Sze : ',
            secondary: data.slotTimeSize.toString(),
          ),
          CustomText(
            primary: 'Cost Per Slot : ',
            secondary: data.costPerSlot.toString(),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.sports.name,
                  style: kPrimaryText,
                ),
                SizedBox(
                  width: 10,
                ),
                Image.network(
                  data.sports.iconBlackUrl,
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String primary;
  final String secondary;
  const CustomText({Key key, this.primary, this.secondary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: kPrimaryText,
        children: <TextSpan>[
          TextSpan(text: primary),
          TextSpan(
            text: secondary,
            style: kSecondaryText,
          )
        ],
      ),
    );
  }
}
