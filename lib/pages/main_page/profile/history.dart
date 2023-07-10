import 'package:flutter/material.dart';
import 'package:testing/pages/main_page/profile/profile.dart';
import 'package:testing/providers/food_list.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order History',
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
      body: SingleChildScrollView(
        child: allHistory != null
            ? Padding(
                padding: EdgeInsets.only(top: 300, left: 105),
                child: Text('There is no history yet'),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: allHistory.length,
                itemBuilder: (context, index) {
                  HistoryList history = allHistory[index];
                  return ExpansionTile(
                      title: Text('Tracking ID: #${history.invoiceHistory}'),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: history.listHistory?.length,
                          itemBuilder: (context, foodIndex) {
                            Food food = history.listHistory![foodIndex];
                            return ListTile(
                              title: Text(food.foodName!),
                              subtitle: Text(
                                  'Price: \$${food.foodPrice!.toStringAsFixed(2)}'),
                              trailing: Text('Quantity: ${food.number}'),
                            );
                          },
                        )
                      ]);
                },
              ),
      ),
    );
  }
}
