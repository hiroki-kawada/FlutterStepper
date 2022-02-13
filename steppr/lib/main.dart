import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index <=  5) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          controlsBuilder: (BuildContext context,
              {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
            return Row(
              children: <Widget>[
                TextButton(
                  onPressed: onStepContinue,
                  child: const Text('進む'),
                ),
                TextButton(
                  onPressed: onStepCancel,
                  child: const Text('戻る'),
                ),
              ],
            );
          },
          steps: <Step>[
            Step(
              title: const Text('材料(2~3人前分)'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: const <Widget>[
                      Text('合挽き肉：250g'),
                      Text('玉ねぎ：1/2個'),
                      Text('パン粉：大さじ5（約カップ1/3)'),
                      Text('牛乳：40ml'),
                      Text('卵：1個'),
                      Text('塩：小さじ1/3'),
                      Text('胡椒：少々'),
                      Text('ソースの材料'),
                      Text('水：50ml'),
                      Text('ケチャップ：大さじ３'),
                      Text('ウスターソース：大さじ１'),
                    ],
                  )),
            ),
            const Step(
              title: Text('手順１'),
              content: Text('玉ねぎをみじん切りにし、レンジで4~5分加熱するか、フライパンで炒める。'),
            ),
            const Step(
              title: Text('手順２'),
              content: Text('ひき肉に塩を加え粘りがでるまでよく混ぜ、ハンバーグの材料すべてを入れて手早く混ぜる。'),
            ),
            const Step(
              title: Text('手順３'),
              content: Text('２〜３個にわけて叩きながら空気を抜き、楕円形にまとめる。真ん中をくぼませる。'),
            ),
            const Step(
              title: Text('手順４'),
              content: Text('フライパンで両面軽く焦げ目がつくまで焼き、水50mlを加えフタをして蒸し焼きにする。'),
            ),
            const Step(
              title: Text('手順５'),
              content: Text('竹串などを刺して肉汁が透明になっていれば、フタを外して水分を飛ばす。ハンバーグを取り出す。'),
            ),
            const Step(
              title: Text('手順６'),
              content: Text('空いたフライパンにそのままソースの材料を入れて煮る。ソースがあたたまったらハンバーグにかけ、完成。'),
            ),
          ],
        ),
      ),
    );
  }
}
