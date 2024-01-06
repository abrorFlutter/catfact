import 'package:catfact/service/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl = "https://media.istockphoto.com/id/1498838344/photo/grumpy-persian-waiting-on-food.jpg?s=2048x2048&w=is&k=20&c=6e6A_MdkCqg9_eA6xo8ohXrySoFPNGCTeihs_ZBaQVA=";

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
                    SizedBox(height: 30,),
                    Text(snapshot.data[index].text),
                    SizedBox(height: 40,),
                    Image.network(imageUrl,height: 200),
                    SizedBox(height: 60,),
                    TextButton(
                        onPressed: () {
                          imageUrl = "https://cataas.com/cat";
                          setState(() {
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
