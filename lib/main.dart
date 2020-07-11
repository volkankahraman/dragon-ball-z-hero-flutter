import 'package:flutter/material.dart';

import 'detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dragon Ball Z',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Dragon Ball Z Characters'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyHero {
  String image;
  String name;
  String description;

  MyHero(String image, String name, String description) {
    this.image = image;
    this.name = name;
    this.description = description;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyHero> myHeros = new List();

  _MyHomePageState() {
    myHeros.add(new MyHero('assets/goku.png', 'Goku',
        "Son Goku, Akira Toriyama tarafından yaratılan Dragon Ball manga serisinin kurgusal bir karakteri ve ana kahramanıdır. Klasik Çin romanı Batıya Yolculuk'un ana karakteri Sun Wukong'a dayanıyor."));
    myHeros.add(new MyHero('assets/vegeta.png', 'Vegeta',
        "Prens Vegeta veya Vegeta IV olarak da bilinen Vegeta, Akira Toriyama tarafından oluşturulan Dragon Ball serisinde kurgusal bir karakterdir. Vegeta ilk olarak 7 Kasım 1988'de Weekly Shōnen Jump dergisinde yayınlanan Sayonara, Son Goku, ölümsüzlük kazanmak için dilek veren Dragon Balls arayışında yer almaktadır."));
    myHeros.add(new MyHero('assets/majin-buu.png', 'Majin Buu',
        "Majin Boo'yu genellikle Japon anime altyazılarında heceleyen ve Viz Media mangasında Djinn-Boo olarak gösterilen Majin Buu, Dragon Ball manga serisinin Ejderha'nın piyasaya sürülmesinden önce yarattığı kurgusal bir karakter ve son rakip. Top Süper. 460. bölüm Majin Boo Ortaya Çıktı."));
    myHeros.add(new MyHero('assets/gohan.png', 'Gohan',
        "Son Gohan, Akira Toriyama tarafından yaratılan Dragon Ball manga serisinde bir karakter. Gohan, ilk olarak 8 Ekim 1988'de Weekly Shōnen Jump dergisinde yayınlanan # 196 Kakarrot, kahramanı Goku'nun ve karısı Chi-Chi'nin ilk oğlu olarak tanıtıldı."));
    myHeros.add(new MyHero('assets/frieza.png', 'Frieza',
        "Japon mallarında Freeza, Funimation'un İngilizce altyazıları ve Viz Media'nın manga serbest bırakılmasıyla romantize edilen Frieza, Akira Toriyama tarafından oluşturulan Dragon Ball manga serisinde kurgusal bir karakter ve kötü adam."));
    myHeros.add(new MyHero('assets/bulma.png', 'Bulma',
        "Bulma, Akira Toriyama tarafından yaratılan Dragon Ball manga serisinde bir karakter. 19 Haziran 1984'te Weekly Shōnen Jump dergisinde yayınlanan ilk bölümü Bulma ve Son Goku'da çıkış yaptı, Goku ile tanıştı ve dilek veren Dragon Balls'u bulmak ve bulmak için onu koruma olarak işe aldı."));
  }
  Widget listCell(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detail(myHeros[index])));
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                child: Hero(
                  tag: myHeros[index],
                  child: Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      myHeros[index].image,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                myHeros[index].name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark.withGreen(59),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/dragonballz.png'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListView.builder(
                      itemCount: myHeros.length,
                      itemBuilder: (context, index) => listCell(context, index),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
