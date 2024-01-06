import 'dart:typed_data';

import 'package:catfact/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "https://cataas.com/cat";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppBar"),),
      body: FutureBuilder(
        future: ApiService().getCatFacts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              if(snapshot.hasData) {
                return Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(20)),
                    Text("create fact: ${snapshot.data[index].createdAt}"),
                    const SizedBox(height: 30,),
                    Text(snapshot.data[index].text),
                    const SizedBox(height: 40,),
                    Image.network(url,height: 200,),
                    const SizedBox(height: 60,),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            url = url.split('?r')[0] + '?r=' + DateTime.now().millisecondsSinceEpoch.toString();
                            snapshot.data.shuffle();
                          });
                        },
                        child: const Text("Another fact!",style: TextStyle(fontSize: 20),),
                    )
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}



