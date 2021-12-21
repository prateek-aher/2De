import 'package:flutter/material.dart';

class MyDocuments extends StatelessWidget {
  const MyDocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF7F9FB),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'My Documents',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            constraints:
                BoxConstraints(minWidth: MediaQuery.of(context).size.width),
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aadhaar Card',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 0,
                  childAspectRatio: 4 / 3,
                  children: List.generate(
                      2,
                      (index) => InkWell(
                            onTap: () {
                              showImageViewSheet(context,
                                  imageUrl:
                                      'https://5.imimg.com/data5/YU/NL/VK/ANDROID-65691403/product-jpeg-500x500.jpeg');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://5.imimg.com/data5/YU/NL/VK/ANDROID-65691403/product-jpeg-500x500.jpeg'),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                ),
                SizedBox(height: 24),
                Text(
                  'Pan Card',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 0,
                  childAspectRatio: 4 / 3,
                  children: List.generate(
                      2,
                      (index) => InkWell(
                            onTap: () {
                              showImageViewSheet(context,
                                  imageUrl:
                                      'https://5.imimg.com/data5/TP/US/MU/SELLER-51778781/pan-card-500x500.jpg');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://5.imimg.com/data5/TP/US/MU/SELLER-51778781/pan-card-500x500.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                ),
                SizedBox(height: 24),
                Text(
                  'Driving License',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 12),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 0,
                  childAspectRatio: 4 / 3,
                  children: List.generate(
                      2,
                      (index) => InkWell(
                            onTap: () {
                              showImageViewSheet(context,
                                  imageUrl:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXQ9vOFrrIYKU0z3uPkwP-7CI51ggaYNDCoLGOse8LbKwcuI5lmt_1o6Q_BTC22SM8L4k&usqp=CAU');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXQ9vOFrrIYKU0z3uPkwP-7CI51ggaYNDCoLGOse8LbKwcuI5lmt_1o6Q_BTC22SM8L4k&usqp=CAU'),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showImageViewSheet(BuildContext context, {required String imageUrl}) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // .withOpacity(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (BuildContext context) {
        return SizedBox.expand(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.close_sharp,
                        color: Colors.black,
                        // size: 30,
                      )),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              Image.network(imageUrl),
            ],
          ),
        );
      },
    );
  }
}
