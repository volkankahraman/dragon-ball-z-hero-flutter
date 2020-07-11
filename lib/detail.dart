import 'package:flutter/material.dart';

import 'main.dart';

class Detail extends StatelessWidget {
  Detail(this._myHero);
  final MyHero _myHero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // Provide a standard title.
            title: Text(_myHero.name),
            floating: true,
            backgroundColor: Theme.of(context).primaryColorDark,
            // backgroundColor: Colors.purple.shade700,
            expandedHeight: 50,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 350.0),
                            child: Card(
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.elliptical(85, 75)),
                                ),
                                child: Center(
                                    child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 160),
                                    Padding(
                                      padding: const EdgeInsets.all(35.0),
                                      child: Text(
                                        _myHero.description,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                  ],
                                ))),
                          ),
                        ),
                        Center(
                          child: Hero(
                            tag: _myHero,
                            child: SizedBox(
                              height: 500,
                              child: Image.asset(
                                _myHero.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                color: Theme.of(context).primaryColorDark,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
