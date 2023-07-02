import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/providers/saved_account.dart';
import 'package:testing/providers/saved_address.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool removeBut = true;
  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Address'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewAdress(),
                  ));
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  removeBut = !removeBut;
                });
              },
              icon: Icon(Icons.remove))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addressProvider.addresses.length,
                itemBuilder: (context, index) {
                  final address = addressProvider.addresses[index];
                  return Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                        title: Text(
                          address.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        subtitle: Text(
                          "${address.address}, ${address.city} - ${address.country}",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        trailing: removeBut
                            ? IconButton(
                                onPressed: () {
                                  _editAddress(address);
                                },
                                icon: Icon(
                                  Icons.edit,
                                ),
                              )
                            : IconButton(
                                onPressed: () {
                                  addressProvider.removeAddress(address);
                                },
                                icon: Icon(Icons.remove_circle))),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editAddress(AddressData address) {
    showDialog(
      context: context,
      builder: (context) {
        final addressProvider = Provider.of<AddressProvider>(context);
        String newName = address.name;
        String newAddress = address.address;
        String newPhone = address.phone;
        String newCity = address.city;
        String newCountry = address.country;
        return AlertDialog(
          title: Text('Edit Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newName = value;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newAddress = value;
                },
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newPhone = value;
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newCity = value;
                },
                decoration: InputDecoration(
                  labelText: 'City',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newCountry = value;
                },
                decoration: InputDecoration(
                  labelText: 'Country',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  addressProvider.editAddress(address, newName, newAddress,
                      newPhone, newCity, newCountry);
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class AddNewAdress extends StatefulWidget {
  const AddNewAdress({super.key});

  @override
  State<AddNewAdress> createState() => _AddNewAdressState();
}

class _AddNewAdressState extends State<AddNewAdress> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accountProvider =
        Provider.of<AccountProvider>(context, listen: false);
    final addressProvider = Provider.of<AddressProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Row(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Address Information',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 20,
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
                        width: (MediaQuery.of(context).size.width / 2) - 20,
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
                    padding: const EdgeInsets.only(right: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextFormField(
                      controller: _addressController,
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
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 20,
                        child: TextFormField(
                          controller: _cityController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your City',
                            labelText: 'City',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid city';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 20,
                        child: TextFormField(
                          controller: _countryController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your Country',
                            labelText: "Country",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid country';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if ((_formKey.currentState!.validate())) {
                            addressProvider.addAddress(
                                _nameController.text,
                                _addressController.text,
                                _phoneController.text,
                                _cityController.text,
                                _countryController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Save'),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
