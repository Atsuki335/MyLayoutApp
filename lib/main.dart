import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // //向き指定
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp, //縦固定
  // ]);
  runApp(MyLayoutApp());
}

class MyLayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleText = Padding(
      //1 strawberry
      padding: EdgeInsets.all(20),
      child: const Text(
        'Strawberry Pvlova',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5),
      ),
    );
    final subTitle = Text(
      //2 pavlova
      //改行\n
      'Pavlova is a meringue-based dessert named after the Russian ballerine \n Anna Pavlova. Pavlova  featues a crisp crust and soft, light inside, \n topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        fontFamily: 'Georgia',
      ),
    );

    var stars = Row(
        //見やすくするためにスターのまとまりを変数にする
        mainAxisSize: MainAxisSize.min,
        //子要素間をぎゅうぎゅうに
        //枠中１　★
        children: [
          Icon(Icons.star, color: Colors.green[500]),
          Icon(Icons.star, color: Colors.green[500]),
          Icon(Icons.star, color: Colors.green[500]),
          const Icon(Icons.star, color: Colors.black),
          const Icon(Icons.star, color: Colors.black)
        ]);

    final ratings = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '170 Reviews',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20),
          )
        ],
      ),
    );

    const descTextStyle = TextStyle(
      //iconListのテキストスタイルを統一
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              //枠中２
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  //枠小１
                  children: [
                    Icon(
                      Icons.kitchen_outlined, //アイコン中色抜き
                      color: Colors.green[500],
                    ),
                    Text('PREP:'),
                    Text('25 min')
                  ],
                ),
                Column(//枠小２
                    children: [
                  Icon(
                    Icons.timer_outlined,
                    color: Colors.green[500],
                  ),
                  Text('COOK:'),
                  Text('1 hr')
                ]),
                Column(
                  //枠小３
                  children: [
                    Icon(
                      Icons.restaurant,
                      color: Colors.green[500],
                    ),
                    Text('FEEDS:'),
                    Text('4-6')
                  ],
                )
              ],
            )));

    final leftColumn = Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ],
      ),
    );

    return MaterialApp(
        title: 'Flutter layout demo',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Strawberry Pavlova Recipe'),
            ),
            body: Center(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
                    height: 600,
                    child: Card(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          SizedBox(width: 440, child: leftColumn),
                          Expanded(
                            child: Image.asset('images/pavlova.jpeg'),
                          )
                        ]))))));
  }
}
