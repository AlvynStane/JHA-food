import 'package:flutter/material.dart';
import 'food_list.dart';
import 'check_out.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    for (var food in list) {
      total = total + food.number * food.foodPrice;
    }
  }

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
        title: const Text('My Cart',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(children: <Widget>[
        const SizedBox(height: 20.0),
        Container(
            height: MediaQuery.of(context).size.height - 100.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
                primary: false,
                padding: const EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 45.0),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height - 220.0,
                          child: ListView.builder(
                            key: UniqueKey(),
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return BuildFoodItem(
                                imgPath: '${list[index].heroTag}',
                                foodName: '${list[index].foodName}',
                                price: list[index].foodPrice,
                                number: list[index].number,
                                onUpdate: () {
                                  setState(() {});
                                },
                              );
                            },
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CartPage()));
                        },
                        child: Container(
                          height: 65.0,
                          width: 120.0,
                          margin: EdgeInsets.only(
                              left:
                                  (MediaQuery.of(context).size.width / 2) - 83),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: InkWell(
                            child: const Center(
                              child: Text('Checkout',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0)),
                            ),
                            onTap: () {
                              if (list.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // return object of type Dialog
                                    return ButtonBarTheme(
                                        data: const ButtonBarThemeData(
                                            alignment:
                                                MainAxisAlignment.center),
                                        child: AlertDialog(
                                          title: const Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.redAccent,
                                              size: 45),
                                          content: const Text(
                                              'Please Add Some\n Items Before Checkout',
                                              textAlign: TextAlign.center),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: const Text('OK',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                  )),
                                            )
                                          ],
                                        ));
                                  },
                                );
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CheckOutPage()));
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("Total: $total \$",
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0)),
                    ],
                  )
                ])),
      ]),
    );
  }
}

class BuildFoodItem extends StatefulWidget {
  VoidCallback onUpdate;
  final String imgPath;
  final String foodName;
  double price;
  int number;

  BuildFoodItem(
      {super.key,
      required this.imgPath,
      required this.foodName,
      required this.price,
      required this.number,
      required this.onUpdate});

  @override
  _BuildFoodItemState createState() => _BuildFoodItemState();
}

class _BuildFoodItemState extends State<BuildFoodItem> {
  int localNumber = 1;

  @override
  void initState() {
    super.initState();
    localNumber = widget.number;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: [
                Hero(
                    tag: widget.imgPath,
                    child: Image(
                        image: AssetImage(widget.imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0)),
                const SizedBox(width: 10.0),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(widget.foodName,
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                  Text('Total price: \$${widget.price * localNumber}',
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Colors.grey))
                ])
              ]),
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
                          if (widget.number > 0) {
                            localNumber--;
                            if (localNumber == 0) {
                              list.removeWhere((listWidget) =>
                                  listWidget.foodName == widget.foodName);
                              widget.onUpdate();
                              total = total - widget.price;
                            } else {
                              list
                                  .firstWhere((listWidget) =>
                                      listWidget.foodName == widget.foodName)
                                  .number = localNumber;
                              total = total - widget.price;
                              widget.onUpdate();
                            }
                          }
                        });
                      },
                      child: Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
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
                    Text('$localNumber',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 15.0)),
                    InkWell(
                      onTap: () {
                        setState(() {
                          localNumber++;
                          list
                              .firstWhere((listWidget) =>
                                  listWidget.foodName == widget.foodName)
                              .number = localNumber;

                          total = total + widget.price;
                          widget.onUpdate();
                        });
                      },
                      child: Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.white),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Color(0xFF7A9BEE),
                            size: 20.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]));
  }
}
