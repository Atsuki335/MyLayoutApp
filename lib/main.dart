import 'package:flutter/material.dart';

void main() {
  runApp(MyLayoutApp());
}

class MyLayoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleText = Container(
      //1 strawberry
      height: 20,
      width: 150,
      child: const Text(
        'Strawberry Pvlova',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
        ),
      ),
    );
    final subTitle = Container(
        padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
        //2 pavlova
        height: 100,
        width: 200,
        child: const Text(
          //改行\n
          'Pavlova is a meringue-based dessert \n named after the Russian \n ballerine Anna Pavlova. Pavlova \n featues a crisp crust and soft, \n light inside,topped with fruit and \n whipped cream.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            fontFamily: 'Roboto',
          ),
        ));

    var stars = Row(
        //見やすくするためにスターのまとまりを変数にする
        mainAxisSize: MainAxisSize.min,
        //子要素間をぎゅうぎゅうに
        //枠中１　★
        children: [
          const Icon(Icons.star, color: Colors.black, size: 10),
          const Icon(Icons.star, color: Colors.black, size: 10),
          const Icon(Icons.star, color: Colors.black, size: 10),
          const Icon(Icons.star, color: Colors.black, size: 10),
          const Icon(Icons.star, color: Colors.black, size: 10)
        ]);

    final ratings = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                fontSize: 10),
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
      fontSize: 8,
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
      padding: const EdgeInsets.fromLTRB(10, 30, 20, 20),
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
              title: const Text('Flutter layout demo'),
            ),
            body: Center(
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 200, 0, 250),
                    height: 600,
                    child: Card(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          SizedBox(width: 230, child: leftColumn),
                          Expanded(
                            child: Image.asset('images/pavlova.jpeg'),
                          )
                        ]))))));
  }
}
