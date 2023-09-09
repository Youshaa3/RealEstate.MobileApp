import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:real_estate/ui/shared/utils.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {


    Map<String, dynamic> decodedToken = JwtDecoder.decode(storage.getTokenInfo()?.access ?? '');

    print(decodedToken);



    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text('${decodedToken['user_id']}'),
            ],
          ),
        )
    );
  }
}
