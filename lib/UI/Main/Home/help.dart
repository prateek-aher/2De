import 'package:delivery/Animation/avatar_glow.dart';
import 'package:delivery/CommonWidget/CommonWidget.dart';
import 'package:delivery/Providers/SosProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text('Help'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Consumer<SosProvider>(
            builder: (context, sos, _) {
              return sos.responseGoing
                  ? GlowingSOSButton()
                  : SOSButton(mediaQuery: mediaQuery);
            },
          ),
          divider(),
          18.h,
          Text(
            'Hub Manager',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          20.h,
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
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis, fontSize: 16),
                    ),
                    Text(
                      '+91 9765886434',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
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
          20.h,
          divider(),
          18.h,
          Text(
            'City Manager',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          20.h,
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
                  child: Image.network(
                    'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png',
                    fit: BoxFit.cover,
                  ),
                ),
                12.w,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hassan Singh Beiji',
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis, fontSize: 16),
                    ),
                    Text(
                      '+91 9765886434',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
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
    );
  }
}

class GlowingSOSButton extends StatelessWidget {
  const GlowingSOSButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'sos',
      child: InkWell(
        onTap: () {
          context.read<SosProvider>().changeWidget();
        },
        child: AvatarGlow(
          endRadius: 115,
          glowColor: Colors.red,
          child: Container(
            height: 125,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: Center(
              child: Text(
                'SOS',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SOSButton extends StatelessWidget {
  const SOSButton({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "sos",
      child: InkWell(
        onTap: () {
          context.read<SosProvider>().changeWidget();
        },
        child: Container(
          height: 125,
          margin: EdgeInsets.symmetric(vertical: mediaQuery.padding.top * 1.4),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    color: Colors.red.withOpacity(0.6),
                    blurRadius: 5,
                    spreadRadius: 2)
              ]),
          child: Center(
            child: Text(
              'SOS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
