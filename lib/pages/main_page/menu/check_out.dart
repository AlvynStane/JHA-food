import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/dark_theme.dart';
import 'package:testing/providers/saved_account.dart';
import 'package:testing/providers/saved_address.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _provinceController.dispose();
    super.dispose();
  }

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
    final accountProvider = Provider.of<AccountProvider>(context, listen: false);
    final addressProvider = Provider.of<AddressProvider>(context);
    double balance = accountProvider.loggedInAccount?.balance ?? 0;
    List<AddressData> addressList = addressProvider.addresses;
    AddressData? dropdownvalue;
    return Scaffold(
      backgroundColor: context.watch<DarkThemeProvider>().darkTheme
          ? Colors.grey[800]
          : Colors.cyan,
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
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20.0),
          Container(
              height: MediaQuery.of(context).size.height - 100.0,
              decoration: BoxDecoration(
                color: context.watch<DarkThemeProvider>().darkTheme
                    ? Colors.grey[850]
                    : Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(75.0)),
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
                          DropdownButtonFormField(
                            value: dropdownvalue,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Select saved address',
                            ),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: addressList.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item.name),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                dropdownvalue = value!;
                                _nameController.text = dropdownvalue!.name;
                                _addressController.text = dropdownvalue!.address;
                                _phoneController.text = dropdownvalue!.phone;
                                _cityController.text = dropdownvalue!.city;
                                _provinceController.text = dropdownvalue!.province;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    15,
                                child: TextFormField(
                                  controller: _nameController,
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
                                    15,
                                child: TextFormField(
                                  controller: _phoneController,
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
                          Container(
                            padding: const EdgeInsets.only(right: 0),
                            width: MediaQuery.of(context).size.width - 15,
                            child: TextFormField(
                              controller: _addressController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your Delivery address',
                                labelText: 'Delivery Address',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the delivery address';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    15,
                                child: TextFormField(
                                  controller: _cityController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your City',
                                    labelText: 'City',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid City';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    15,
                                child: TextFormField(
                                  controller: _provinceController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter your Province',
                                    labelText: "Province",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the Province you live in';
                                    }
                                    return null;
                                  },
                                  onTap: () async {
                                    final selectedProvince =
                                        await showProvinceDialog(context);
                                    if (selectedProvince != null) {
                                      setState(() {
                                        _provinceController.text =
                                            selectedProvince;
                                      });
                                    }
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: const Center(
                                child: Text("Payment Type",
                                    style: TextStyle(fontSize: 18.0))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: (MediaQuery.of(context).size.width / 3)+10,
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
                                width: (MediaQuery.of(context).size.width / 3) +
                                    10,
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
                              ? Text('Balance : \$ ${balance.toStringAsFixed(2)}')
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0)),
                              ),
                              onTap: () {
                                if (!(_formKey.currentState!.validate())) {
                                  showErrorSnackBar(
                                      "Please fill the required info!");
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
                              },
                            ),
                          ),
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
