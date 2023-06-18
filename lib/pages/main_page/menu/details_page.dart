import 'package:flutter/material.dart';
import 'food_list.dart';
import 'package:collection/collection.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final double? foodPrice;
  final weight;
  final cal;
  final vit;
  final pro;

  const DetailsPage(
      {super.key,
      this.heroTag,
      this.foodName,
      this.foodPrice,
      this.weight,
      this.cal,
      this.vit,
      this.pro});

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
        backgroundColor: Colors.cyan,
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
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top,
            child: ListView(children: [
              Stack(children: [
                Container(
                    height: MediaQuery.of(context).size.height - 82.0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent),
                Positioned(
                    top: 75.0,
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0),
                            ),
                            color: Colors.white),
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
                                fontFamily: 'Montserrat',
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('\$${widget.foodPrice}',
                                style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20.0,
                                    color: Colors.grey)),
                            Container(
                                height: 25.0, color: Colors.grey, width: 1.0),
                            Container(
                              width: 125.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.0),
                                  color: Colors.cyan),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                          color: Colors.cyan),
                                      child: const Center(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('$num',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
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
                                          color: Colors.white),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.cyan,
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
                        const SizedBox(height: 20.0),
                        SizedBox(
                            height: 100.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                _buildInfoCard('WEIGHT', widget.weight, 'G'),
                                const SizedBox(width: 10.0),
                                _buildInfoCard('CALORIES', widget.cal, 'CAL'),
                                const SizedBox(width: 10.0),
                                _buildInfoCard('VITAMINS', widget.vit, 'VIT'),
                                const SizedBox(width: 10.0),
                                _buildInfoCard('Protein', widget.pro, 'G')
                              ],
                            )),
                        const SizedBox(height: 15.0),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0)),
                                  color: Colors.black),
                              height: 40.0,
                              child: Center(
                                child: Text('ADD \n$price \$',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                          ),
                          onTap: () {
                            Food? fo = list.firstWhereOrNull((listWidget) =>
                                listWidget.foodName == widget.foodName);
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
                        )
                      ],
                    ))
              ])
            ]),
          ),
        ));
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cardTitle == selectedCard ? Colors.cyan : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 50.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
