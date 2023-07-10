import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/dark_theme.dart';
import '../../../providers/food_list.dart';
import 'package:collection/collection.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final double? foodPrice;

  const DetailsPage({
    super.key,
    this.heroTag,
    this.foodName,
    this.foodPrice,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = '';
  var num = 1;
  late double price = widget.foodPrice!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.watch<DarkThemeProvider>().darkTheme ? Colors.grey[800] : Colors.cyan,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text('Details',
              style: TextStyle(fontSize: 18.0, color: Colors.white)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    MediaQuery.of(context).padding.top,
                child: ListView(children: [
                  Stack(children: [
                    Container(
                        height: MediaQuery.of(context).size.height - 82.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent),
                    Positioned(
                        top: 75.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45.0),
                                  topRight: Radius.circular(45.0),
                                ),
                                color: context.watch<DarkThemeProvider>().darkTheme ? Colors.grey[850] : Colors.white,
                            ),
                            height: MediaQuery.of(context).size.height - 100.0,
                            width: MediaQuery.of(context).size.width)),
                    Positioned(
                        top: 30.0,
                        left: (MediaQuery.of(context).size.width / 2) - 100.0,
                        child: Hero(
                            tag: widget.heroTag,
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(widget.heroTag),
                                        fit: BoxFit.cover)),
                                height: 200.0,
                                width: 200.0))),
                    Positioned(
                        top: 250.0,
                        left: 25.0,
                        right: 25.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.foodName,
                                style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('\$${widget.foodPrice}',
                                    style: const TextStyle(
                                        fontSize: 20.0, color: Colors.grey)),
                                Container(
                                    height: 25.0,
                                    color: Colors.grey,
                                    width: 1.0),
                                Container(
                                  width: 125.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(17.0),
                                      color: context.watch<DarkThemeProvider>().darkTheme ? Colors.grey[200 ] : Colors.cyan,
                                      ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (!(num <= 1)) {
                                              num--;
                                              price = widget.foodPrice! * num;
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 25.0,
                                          width: 25.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                              color: context.watch<DarkThemeProvider>().darkTheme ? Colors.grey[200] : Colors.cyan),
                                          child:  Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: context.watch<DarkThemeProvider>().darkTheme ? Colors.black : Colors.white,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),  
                                      Text('$num',
                                          style:  TextStyle(
                                              color: context.watch<DarkThemeProvider>().darkTheme ? Colors.black : Colors.white,
                                              fontSize: 15.0)),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            num++;
                                            price = widget.foodPrice! * num;
                                          });
                                        },
                                        child: Container(
                                          height: 25.0,
                                          width: 25.0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                              color: context.watch<DarkThemeProvider>().darkTheme ? Colors.grey[850] : Colors.white),
                                          child:  Center(
                                            child: Icon(
                                              Icons.add,
                                              color: context.watch<DarkThemeProvider>().darkTheme ? Colors.grey[200] : Colors.cyan,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ))
                  ])
                ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 28),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                        ),
                        color: context.watch<DarkThemeProvider>().darkTheme ? Colors.grey[200] : Colors.black),
                    height: 40.0,
                    width: MediaQuery.of(context).size.width - 50,
                    child: Center(
                      child: Text('ADD \n$price \$',
                          style: TextStyle(
                            color: context.watch<DarkThemeProvider>().darkTheme ? Colors.black : Colors.white,
                          ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Food? fo = list.firstWhereOrNull(
                      (listWidget) => listWidget.foodName == widget.foodName);
                  if (fo != null) {
                    fo.number = fo.number! + num;
                  } else {
                    Food f = Food(
                        heroTag: "${widget.heroTag}",
                        foodName: "${widget.foodName}",
                        foodPrice: widget.foodPrice,
                        number: num);
                    list.add(f);
                  }
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ));
  }
}
