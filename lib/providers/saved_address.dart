import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AddressData {
  String name;
  String address;
  String phone;
  String city;
  String country;

  AddressData(
      {required this.name,
      required this.address,
      required this.phone,
      required this.city,
      required this.country});
}

class AddressProvider extends ChangeNotifier {
  List<AddressData> addresses = [
    AddressData(
        name: 'Asep',
        address: 'Jl. Asia No 123',
        phone: '08123759126',
        city: 'Medan',
        country: 'Indonesia'),
    AddressData(
        name: 'Udin',
        address: 'Jl. Thamrin No 456',
        phone: '081288635188',
        city: 'Medan',
        country: 'Indonesia'),
    AddressData(
        name: 'Kantor',
        address: 'Jl. Sutomo No 789',
        phone: '085388271441',
        city: 'Medan',
        country: 'Indonesia'),
  ];

  void addAddress(
      String name, String address, String phone, String city, String county) {
    addresses.add(AddressData(
        name: name,
        address: address,
        phone: phone,
        city: city,
        country: county));
    notifyListeners();
  }

  void editAddress(AddressData address, String newName, String newAddress,
      String newPhone, String newCity, String newCountry) {
    address.name = newName;
    address.address = newAddress;
    address.phone = newPhone;
    address.city = newCity;
    address.country = newCountry;
    notifyListeners();
  }

  void removeAddress(AddressData address){
    addresses.remove(address);
    notifyListeners();
  }
}
