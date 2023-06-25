import 'package:flutter/material.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  List<AddressData> addresses = [
    AddressData(name: 'Selena Gomez', address: 'Jl. Asia No 123'),
    AddressData(name: 'Justin Bieber', address: 'Jl. Thamrin No 456'),
    AddressData(name: 'Shawn Mendes', address: 'Jl. Sutomo No 789'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Address',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saved Addresses',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return AddressCard(
                    address: address,
                    onEdit: () {
                      _editAddress(context, address);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editAddress(BuildContext context, AddressData address) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAddressScreen(address: address),
      ),
    ).then((editedAddress) {
      if (editedAddress != null) {
        setState(() {
          address.name = editedAddress.name;
          address.address = editedAddress.address;
        });
      }
    });
  }
}

class AddressData {
  String name;
  String address;

  AddressData({required this.name, required this.address});
}

class AddressCard extends StatelessWidget {
  final AddressData address;
  final VoidCallback onEdit;

  const AddressCard({
    required this.address,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: ListTile(
        title: Text(
          address.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          address.address,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[600],
          ),
        ),
        trailing: IconButton(
          onPressed: onEdit,
          icon: Icon(
            Icons.edit,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class EditAddressScreen extends StatefulWidget {
  final AddressData address;

  const EditAddressScreen({required this.address});

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.address.name);
    _addressController = TextEditingController(text: widget.address.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Address',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Address',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String editedName = _nameController.text;
                String editedAddress = _addressController.text;

                AddressData editedData = AddressData(
                  name: editedName,
                  address: editedAddress,
                );

                Navigator.pop(context, editedData);
              },
              child: Text('Save Address'),
            ),
          ],
        ),
      ),
    );
  }
}
