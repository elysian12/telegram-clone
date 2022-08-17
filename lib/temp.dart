import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var pickedFile = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.any,
                  // allowedExtensions: ['pdf'],
                );

                if (pickedFile != null) {
                  file = File(pickedFile.paths.first!);
                  log(file!.path);
                  log(file!.path.split('/').last);
                }
              },
              child: Text('Pick'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  var request = http.MultipartRequest(
                      'POST', Uri.parse('https://devapi.goalfi.app/CDLS'));
                  request.fields.addAll({'password': 'dsf'});
                  request.fields.addAll(
                    {'user_id': 'e32e4c9d-a4ee-414b-a3b7-26512906d059'},
                  );
                  request.files.add(
                    await http.MultipartFile.fromPath(
                      'CDLS',
                      file!.path,
                      contentType: MediaType('application', 'pdf'),
                    ),
                  );

                  http.StreamedResponse response = await request.send();

                  if (response.statusCode == 200) {
                    var temp = await http.Response.fromStream(response);
                    Map res = json.decode(temp.body);
                    log(res.toString());
                  } else {
                    var temp = await http.Response.fromStream(response);
                    log(temp.body);
                  }
                } catch (e) {
                  // log(e.message);
                  // log(e.response!.data.toString());
                  // if(e.type == )
                }
              },
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
