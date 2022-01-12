import 'dart:convert';

String addressToDirectionURL(String address) =>
    'https://www.google.com/maps/dir/?api=1&destination=' +
    jsonEncode(address + '&output=classic');
