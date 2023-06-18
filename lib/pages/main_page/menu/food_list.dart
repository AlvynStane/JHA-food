List list = <Food>[];
double total = 0;
History history = History();

class Food {
  String? heroTag;
  String? foodName;
  double? foodPrice;
  int? number;

  Food({this.heroTag, this.foodName, this.foodPrice, this.number});

  @override
  bool operator == (Object other) {
    return other is Food && foodName == other.foodName;
  }  
}

class History {
  List<List<Food>> listHistory = [];
  List<double> totalHistory = [];

  void addToHistory(List<Food> list, double total) {
    listHistory.add(list);
    totalHistory.add(total);
  }

  void clearHistory() {
    listHistory.clear();
    totalHistory.clear();
  }
}