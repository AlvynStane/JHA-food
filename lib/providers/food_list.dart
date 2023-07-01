import "dart:math";

List list = <Food>[];
double total = 0;
List<HistoryList> allHistory = [];
int randomInvoice = random(1000, 2000);

class Food {
  String? heroTag;
  String? foodName;
  double? foodPrice;
  int? number;

  Food({this.heroTag, this.foodName, this.foodPrice, this.number});

  @override
  bool operator ==(Object other) {
    return other is Food && foodName == other.foodName;
  }
}

class HistoryList {
  List<Food>? listHistory;
  double? totalHistory;
  int? invoiceHistory;

  HistoryList(this.listHistory, this.totalHistory, this.invoiceHistory);
}

void addToHistory() {
  HistoryList newHistory = HistoryList(List.from(list), total, randomInvoice);
  randomInvoice = random(1000, 2000);

  while (allHistory.any((history) => history.invoiceHistory == randomInvoice)) {
    randomInvoice = random(1000, 2000);
  }

  bool isDuplicate = allHistory
      .any((history) => history.invoiceHistory == newHistory.invoiceHistory);

  if (!isDuplicate) {
    allHistory.add(newHistory);
    list.clear();
    total = 0;
    print('History saved successfully.');
  } else {
    print('Duplicate history found. Skipping...');
  }
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}
