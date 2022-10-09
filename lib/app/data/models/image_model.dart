// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter_example_test/app/utils/utils.dart';

ImageGiphy imageFromJson(String str) => ImageGiphy.fromJson(json.decode(str) as Map<String,dynamic>);

String imageToJson(ImageGiphy data) => json.encode(data.toJson());

class ImageGiphy {
    ImageGiphy({
        required this.url,
        required this.height,
        required this.widght,
    });
    
    factory ImageGiphy.fromJson(dynamic json) => ImageGiphy(
        url: Utils.getArguments(json['images']['original']['url']),
        height:  double.parse(Utils.getArguments(json['images']['original']['height'])),
        widght:  double.parse(Utils.getArguments(json['images']['original']['width'])),
    );


    final String url;
    final double height;
    final double widght;

    ImageGiphy copyWith({
        String? url,
        double? height,
        double? widght,
    }) => 
        ImageGiphy(
            url: url ?? this.url,
            height: height ?? this.height,
            widght: widght ?? this.widght,
        );

    Map<String, dynamic> toJson() => {
        'url': url,
        'height': height,
        'widght':widght,
    };
}
