import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHub extends StatelessWidget {
  const MyHub({Key? key}) : super(key: key);

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
            'My Hub',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'To edit this information, contact your hub supervisor.',
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hub',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Pune Zone 6',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hub Contact',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '+91 97656789765',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hub ID',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'PZ6_MH_2020',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hub Address',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            '234, qwerty, baner, Pune, 411045',
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.call),
                          label: Text(
                            'Call',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(16)),
                        ),
                        SizedBox(width: 12),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.navigation),
                          label: Text('Navigate',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                          style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(16)),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    divider(),
                    SizedBox(height: 20),
                    Text(
                      'Hub Manager',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    20.h,
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8)),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.1,
                              backgroundColor: Colors.grey[300]!,
                              child: Image.network(
                                'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mahendra Singh Dhoni',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  '+91 9765886434',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(width: 12),
                            Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey[300]!),
                                    borderRadius: BorderRadius.circular(8)),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.call,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    divider(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hub Pictures',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '5 Pictures',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: List.generate(
                          5,
                          (index) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://www.makemytrip.com/travel-guide/media/dg_image/agra/1_Taj_Mahal.jpg'),
                                        fit: BoxFit.cover)),
                              )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'City Manager',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.1,
                            backgroundColor: Colors.grey[300]!,
                            backgroundImage: NetworkImage(
                              'https://www.pinpng.com/pngs/m/341-3416159_no-avatar-pic-user-profile-image-png-transparent.png',
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Suresh Raina',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '+91 9765886434',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          // SizedBox(width: 12),
                          Spacer(),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]!),
                                  borderRadius: BorderRadius.circular(8)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.call,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
