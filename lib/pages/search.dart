import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rappappnew/pages/profile.dart';
import 'package:rappappnew/variables.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<QuerySnapshot> searchresult;

  searchuser(String typeduser) {
    var users = usercollection
        .where('username', isGreaterThanOrEqualTo: typeduser)
        .get();

    setState(() {
      searchresult = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECE5DA),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: TextFormField(
          decoration: InputDecoration(
            filled: true,
            hintText: "Search for RAPPers",
            hintStyle: myStyle(18),
          ),
          onFieldSubmitted: searchuser,
        ),
      ),
      body: searchresult == null ? Center(
        child: Text("Search for RAPPers...", style: myStyle(25),
        ),
      )
      : FutureBuilder(builder: (BuildContext context, snapshot){
        if (!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: snapshot.data.docs.length,
          itemBuilder: (BuildContext context, int index){
            DocumentSnapshot user = snapshot.data.docs[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(user.data()['uid'])));
              },
              child: ListTile(
                leading: Icon(Icons.search),
                trailing: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(user.data()['profilepic']),
                  ),
                  title: Text(user.data()['username'],
                  style: myStyle(25),
                  ),
                  ),
            );

          },
        );
      }),
    );
  }
}
