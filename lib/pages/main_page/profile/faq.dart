import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Welcome to our Online Food Ordering Application!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  'We are an innovative platform that makes it easy for you to order your favorite meals online. With our extensive experience in the food and technology industry, we aim to provide practical, efficient, and enjoyable solutions for our users.'),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Our Vision and Mission : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  'Our vision is to deliver a seamless and satisfying food ordering experience for everyone. We strive to become a reliable partner for customers and restaurants in facilitating fast, secure, and convenient online food transactions. Our mission is to continuously develop innovative technology, provide diverse food options, and deliver excellent customer service.'),
              SizedBox(height: 10.0),
              Text(
                  'We take pride in being part of the online food revolution and are committed to continually improving our services. We invite you to join us in the Online Food Ordering Application and enjoy a convenient and delightful culinary experience.'),
              SizedBox(
                height: 20.0,
              ),
              Divider(),
              Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              FAQItem(
                question: 'How to change phone number?',
                answer:
                    'Select the "Account" tab > Choose the pencil icon > Enter your new phone number > Press the "Save" button',
              ),
              SizedBox(height: 16.0),
              FAQItem(
                question: 'What payment methods can I use to pay my order?',
                answer:
                    'There are two payment methods available: "Cash" and "Balance". If you choose "Cash", you can pay the driver directly when they arrive with your order. If you choose "Balance", the total cost of your order will be deducted from your account balance.',
              ),
              SizedBox(height: 16.0),
              FAQItem(
                question:
                    'What should I do if there is an issue with the order I received?',
                answer:
                    'Go to the "Account" page > Select the "Contact Us" page > Send your feedback > Press "Send"',
              ),
              SizedBox(height: 16.0),
              FAQItem(
                question:
                    'How can I give a review and rating for the restaurant I ordered from?',
                answer:
                    'Go to the "Contact Us" page in the "Account" section. You can submit your review and rating there.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({
    required this.question,
    required this.answer,
    Key? key,
  }) : super(key: key);

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ExpansionPanelList(
        elevation: 0,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            this.isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  widget.question,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              );
            },
            body: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: Text(
                widget.answer,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            isExpanded: isExpanded,
          ),
        ],
      ),
    );
  }
}
