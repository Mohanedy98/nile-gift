import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:gift_of_the_nile/component/show_up_animation.dart';
import 'package:gift_of_the_nile/constants.dart';
import 'package:gift_of_the_nile/models/ancient_gods_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTab extends StatefulWidget {
  final AncientGodCharacter _character;

  AboutTab(this._character);

  @override
  _AboutTabState createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  AncientGodCharacter _character;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _character = widget._character;
  }

  int delay = 500;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            topRow(),
            SizedBox(
              height: 20,
            ),
            buildGodList(),
            SizedBox(
              height: 20,
            ),
            aboutRow(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    if (await canLaunch('http://www.egypt.travel/')) {
                      await launch('http://www.egypt.travel/');
                    } else {
                      throw 'Could not launch ${'http://www.egypt.travel/'}';
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Text(
                    'Visit Egypt',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.teal,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (await canLaunch(_character.knowMore)) {
                      await launch(_character.knowMore);
                    } else {
                      throw 'Could not launch ${_character.knowMore}';
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Text(
                    'Know More',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.lightBlue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget aboutRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ShowUp(
          delay: delay,
          child: Text(
            'Who Is ${_character.name} ?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ShowUp(
          delay: delay + 200,
          child: Text(
            _character.about,
            style: kGreyTextStyle.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ShowUp(
          delay: delay,
          child: Text(
            'Stories About ${_character.name}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ShowUp(
          delay: delay + 200,
          child: Text(
            _character.story,
            style: kGreyTextStyle.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGodList() {
    return Center(
      child: CircleList(
        innerCircleRotateWithChildren: true,
        onDragStart: (c) {
          print(c);
        },
        outerRadius: 130,
        origin: Offset(0, 0),
        showInitialAnimation: true,
        children: _character.godOf.map((v) {
          return TextWithAsset(
            txt: v.value,
            asset: 'resources/${v.asset}',
            color: Colors.white,
          );
        }).toList(),
        outerCircleColor: Colors.lightBlue,
        innerRadius: 36,
        isChildrenVertical: true,
        onDragUpdate: (v) {
          print(v.angle);
        },
        centerWidget: Text(
          'God of',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

//  Widget buildBelievedInList() {
//    return Center(
//      child: CircleList(
//        outerCircleRotateWithChildren: true,
//        innerCircleRotateWithChildren: true,
//        onDragStart: (c) {
//          print(c);
//        },
//        outerRadius: 130,
//        origin: Offset(0, 0),
//        showInitialAnimation: true,
//        children: _character.believedIn.map((v) {
//          return Text(
//            v,
//            style: TextStyle(
//              fontSize: 18,
//              color: Colors.white,
//            ),
//          );
//        }).toList(),
//        outerCircleColor: Colors.lightBlue,
//        innerRadius: 50,
//        onDragUpdate: (v) {
//          print(v.angle);
//        },
//        centerWidget: Text(
//          'Kings Believed In',
//          textAlign: TextAlign.center,
//          style: TextStyle(
//            fontWeight: FontWeight.normal,
//            fontSize: 18,
//            color: Colors.grey,
//          ),
//        ),
//      ),
//    );
//  }

  Widget topRow() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceEvenly,
      runAlignment: WrapAlignment.spaceEvenly,
      spacing: 20,
      runSpacing: 10,
      children: <Widget>[
        infoColumn('When', _character.since),
        infoColumn('Symbol', _character.symbol),
        infoColumn(
            'Parents',
            _character.parents
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '')),
        infoColumn(
            'Consort',
            _character.consort
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '')),
        infoColumn(
            'Siblings',
            _character.siblings
                .toString()
                .replaceAll('[', '')
                .replaceAll(']', '')),
      ],
    );
  }

  Column infoColumn(String label, String val) {
    return Column(
      children: <Widget>[
        ShowUp(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
          ),
          delay: 500,
        ),
        ShowUp(
          delay: 500 + 200,
          child: Text(
            val,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        )
      ],
    );
  }
}

class TextWithAsset extends StatelessWidget {
  final String txt;
  final String asset;
  final Color color;

  TextWithAsset({this.txt, this.asset, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: AutoSizeText(
            txt,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              fontSize: 15,
              color: color,
            ),
          ),
        ),
        SizedBox(
          width: 0,
        ),
        Image.asset(
          asset,
          width: 25,
          height: 25,
        )
      ],
    );
  }
}
