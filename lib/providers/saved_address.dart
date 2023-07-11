import 'package:flutter/material.dart';

class AddressData {
  String name;
  String address;
  String phone;
  String city;
  String province;

  AddressData(
      {required this.name,
      required this.address,
      required this.phone,
      required this.city,
      required this.province});
}

List<String> provinceList = [
  'Aceh',
  'Bali',
  'Bangka Belitung',
  'Banten',
  'Bengkulu',
  'Central Java',
  'Central Kalimantan',
  'Central Sulawesi',
  'DKI Jakarta',
  'East Java',
  'East Kalimantan',
  'East Nusa Tenggara',
  'Gorontalo',
  'Jambi',
  'Lampung',
  'Maluku',
  'North Kalimantan',
  'North Maluku',
  'North Sulawesi',
  'North Sumatra',
  'Papua',
  'Riau',
  'Riau Islands',
  'South Kalimantan',
  'South Sulawesi',
  'South Sumatra',
  'Southeast Sulawesi',
  'West Java',
  'West Kalimantan',
  'West Nusa Tenggara',
  'West Papua',
  'West Sulawesi',
  'West Sumatra',
  'Yogyakarta Special Region'
];

Future<String?> showProvinceDialog(BuildContext context) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: ListView.builder(
          itemCount: provinceList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(provinceList[index]),
              onTap: () {
                Navigator.pop(context, provinceList[index]);
              },
            );
          },
        ),
      );
    },
  );
}

class AddressProvider extends ChangeNotifier {
  List<AddressData> addresses = [
    AddressData(
        name: 'Asep',
        address: 'Jl. Asia No 123',
        phone: '08123759126',
        city: 'Medan',
        province: 'North Sumatra'),
    AddressData(
        name: 'Udin',
        address: 'Jl. Thamrin No 456',
        phone: '081288635188',
        city: 'Medan',
        province: 'North Sumatra'),
    AddressData(
        name: 'Budi',
        address: 'Jl. Sutomo No 789',
        phone: '085388271441',
        city: 'Medan',
        province: 'North Sumatra'),
  ];

  void addAddress(
      String name, String address, String phone, String city, String county) {
    addresses.add(AddressData(
        name: name,
        address: address,
        phone: phone,
        city: city,
        province: county));
    notifyListeners();
  }

  void editAddress(AddressData address, String newName, String newAddress,
      String newPhone, String newCity, String newprovince) {
    address.name = newName;
    address.address = newAddress;
    address.phone = newPhone;
    address.city = newCity;
    address.province = newprovince;
    notifyListeners();
  }

  void removeAddress(AddressData address) {
    addresses.remove(address);
    notifyListeners();
  }
}
