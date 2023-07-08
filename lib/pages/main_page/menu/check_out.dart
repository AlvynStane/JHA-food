import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/saved_account.dart';
import '../main_menu_page.dart';
import 'package:testing/providers/food_list.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PaymentType pt = PaymentType.Cash;
  bool show = false;

  void showErrorSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ButtonBarTheme(
        data: const ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
        ),
        child: AlertDialog(
          title: const Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.green,
            size: 50,
          ),
          content: Text(
            'Thank you for your purchase\n Tracking ID: #$randomInvoice',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                addToHistory();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const HomePages(),
                  ),
                  (route) => false,
                );
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.lightGreen,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final accountProvider =
        Provider.of<AccountProvider>(context, listen: false);
    double balance = accountProvider.loggedInAccount?.balance ?? 0;
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
              style: TextStyle(fontSize: 18.0, color: Colors.white)),
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
                            style: TextStyle(fontSize: 18.0),
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
                                  initialValue:
                                      accountProvider.loggedInAccount != null
                                          ? accountProvider
                                              .loggedInAccount!.phonenum
                                          : '',
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
                                    style: TextStyle(fontSize: 18.0))),
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
                                  title: const Text('Balance'),
                                  leading: Radio(
                                    value: PaymentType.Balance,
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
                              ? Text('Balance : \$ $balance')
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
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.0)),
                                  ),
                                  onTap: () {
                                    if (!(_formKey.currentState!.validate())) {
                                      showErrorSnackBar("Please fill the required info!");
                                    } else if (pt == PaymentType.Balance) {
                                      if (balance <= total) {
                                        showErrorSnackBar("Insufficient balance!");
                                      } else {
                                        accountProvider.editBalance(total);
                                        showSuccessDialog(context);
                                      }
                                    } else {
                                      showSuccessDialog(context);
                                    }
                                  })),
                        ],
                      ),
                    ),
                  )
                ]),
              ))
        ],
        ),
        );
  }
}

enum PaymentType { Cash, Balance }
