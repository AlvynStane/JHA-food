import 'package:flutter/material.dart';
import '../main_menu_page.dart';
import 'food_list.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PaymentType pt = PaymentType.Cash;
  bool show = false;

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
          title: const Text('INVOICE',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Colors.white)),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          const SizedBox(height: 20.0),
          Container(
              height: MediaQuery.of(context).size.height - 100.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 16),
                          const Text(
                            'Delivery Information',
                            style: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 18.0),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your Name',
                                    labelText: 'Name',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your Phone Number',
                                    labelText: 'Phone Number',
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 8) {
                                      return 'Please enter a valid Phone';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your Province',
                                    labelText: 'Province',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid province';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your City',
                                    labelText: "City",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the city you live in';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            width: MediaQuery.of(context).size.width - 20,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter your Delivery address',
                                  labelText: 'Delivery Address'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the delivery address';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: const Center(
                                child: Text("Payment Type",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18.0))),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 70),
                                width: (MediaQuery.of(context).size.width / 2) -
                                    30,
                                child: ListTile(
                                  title: const Text('Cash'),
                                  leading: Radio(
                                    value: PaymentType.Cash,
                                    groupValue: pt,
                                    onChanged: (PaymentType? value) {
                                      setState(() {
                                        pt = value!;
                                        show = false;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    60,
                                child: ListTile(
                                  title: const Text('Visa'),
                                  leading: Radio(
                                    value: PaymentType.Visa,
                                    groupValue: pt,
                                    onChanged: (PaymentType? value) {
                                      setState(() {
                                        pt = value!;
                                        show = true;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              20,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter Credit Card No.',
                                            labelText: 'Credit Card Number'),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length <= 16) {
                                            return 'Please enter Correct Credit Card number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width /
                                                  2) -
                                              20,
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'On the back of the card',
                                            labelText: 'CCV'),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length == 2) {
                                            return 'Please enter correct CCV';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 65.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: InkWell(
                                child: const Center(
                                  child: Text(' Confirm\nPurchase',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0)),
                                ),
                                onTap: () {
                                  if (!(_formKey.currentState!.validate())) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please fill the required info!")));
                                  } else {
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
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: Colors.green,
                                              size: 50,
                                            ),
                                            content: const Text(
                                                'Thank you for your purchase\n Tracking ID: #2352452',
                                                textAlign: TextAlign.center),
                                            actions: <Widget>[
                                              TextButton(
                                                  onPressed: () {
                                                    // history.addToHistory(list, total);
                                                    list.clear();
                                                    total = 0;
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const HomePages()),
                                                            (route) => false);
                                                  },
                                                  child: const Text('OK',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors
                                                              .lightGreen))),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              )),
                        ],
                      ),
                    ),
                  )
                ]),
              ))
        ]));
  }
}

enum PaymentType { Cash, Visa }
