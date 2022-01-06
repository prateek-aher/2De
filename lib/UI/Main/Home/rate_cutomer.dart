import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/CommonWidget/custom_appbar.dart';
import 'package:delivery/UI/Main/Homepage.dart';
import 'package:flutter/material.dart';

class RateCustomer extends StatefulWidget {
  RateCustomer({Key? key}) : super(key: key);

  @override
  State<RateCustomer> createState() => _RateCustomerState();
}

class _RateCustomerState extends State<RateCustomer> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          24.h,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Text(
              'You successfully delivered a product.',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rate Customer',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Stars(
                  rating: rating,
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -8),
              blurRadius: 20,
              spreadRadius: 0)
        ]),
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ElevatedButton(
          onPressed: rating == 0
              ? null
              : () {
                  //TODO:  upload customer rating
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Homepage()),
                      (route) => false);
                },
          child: Text(
            'Finish',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({
    Key? key,
    required this.rating,
    this.onChanged,
  }) : super(key: key);
  final int rating;
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5,
          (index) => IconButton(
              onPressed: () {
                if (onChanged != null) {
                  onChanged!(index + 1);
                }
              },
              color: index + 1 <= rating ? Colors.amber : Colors.black,
              icon: Icon(
                index + 1 <= rating ? Icons.star : Icons.star_border,
                size: 32,
              ))),
    );
  }
}
