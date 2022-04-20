import 'dart:convert';

String addressToDirectionURL({required String latitude, required String longitude}) =>
    'https://www.google.com/maps/dir/?api=1&destination=' +
    jsonEncode('$latitude, $longitude') +
    '&output=classic';
