import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class WithDrawMoney extends StatelessWidget {
  WithDrawMoney({Key? key}) : super(key: key);
  final int balance = 570;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final margin = const EdgeInsets.symmetric(horizontal: 16);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Withdraw Money"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              // color: Colors.white,
              padding: margin.add(EdgeInsets.symmetric(vertical: 24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("How much money do you want to Withdraw?",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w600)),
                  16.h,
                  Text("Available balance: \u20b9$balance",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w600)),
                  Form(
                    key: _key,
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.phone,
                      onFieldSubmitted: (v) {},
                      validator: (value) {
                        if ((int.tryParse(value!) ?? 0) > balance ||
                            (int.tryParse(value) ?? 0) == 0)
                          return 'Please enter a valid amount';
                        if (value.isEmpty)
                          return 'Empty';
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[300]!)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          hintText: 'Enter Amount',
                          hintStyle:
                              TextStyle(color: Colors.grey[400], fontSize: 20)),
                    ),
                  ),
                  22.h,
                  SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            // _key.currentState!.validate();
                          },
                          child: Text('Next'))),
                  16.h,
                  Text(
                    'Please note: Amount withdrawn will be transferred to your account on next working wednesday',
                    style: TextStyle(fontSize: 14, color: GREY5),
                  ),
                ],
              ),
            ),
            Container(
              padding: margin.add(EdgeInsets.symmetric(vertical: 24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Past Withdrawals",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.w600)),
                  16.h,
                  FilterWithdrawal(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_back_ios,
                              color: Theme.of(context).primaryColor)),
                      Text(
                        DateFormat('d MMMM y').format(DateTime.now()),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).primaryColor,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            ...List.generate(
                5,
                (index) => Container(
                      height: 140,
                      padding:
                          margin.add(const EdgeInsets.symmetric(vertical: 14)),
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '26 Jan 2020',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'WorkSans',
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/withdrawal.png',
                                height: 35,
                              ),
                              12.w,
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Withdrawn from wallet',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      )),
                                  14.h,
                                  Text('11:00 AM',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: GREY5)),
                                ],
                              ),
                              Spacer(),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('-\u20b9500',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.red)),
                                  14.h,
                                  Text('Closing balance: ₹ 0',
                                      style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: GREY5)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

class FilterWithdrawal extends StatelessWidget {
  const FilterWithdrawal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          OutlinedButton(
            child: Text('All'),
            onPressed: () {},
            style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
          ),
          6.w,
          OutlinedButton(
            child: Text('Today'),
            onPressed: () {},
            style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
          ),
          6.w,
          OutlinedButton(
            child: Text('This Week'),
            onPressed: () {},
            style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
          ),
          6.w,
          OutlinedButton(
            child: Text('This Month'),
            onPressed: () {},
            style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
          ),
          6.w,
          OutlinedButton(
            child: Text('This Year'),
            onPressed: () {},
            style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
