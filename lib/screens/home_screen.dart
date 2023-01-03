import 'package:flutter/material.dart';
import 'package:sqflite_practice/database/database_handler.dart';
import 'package:sqflite_practice/model/notes_model.dart';
import 'package:sqflite_practice/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData () async {
    notesList = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(titile: 'Notes'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 4.0),
        child: FutureBuilder(
          future: notesList,
            builder: (context , AsyncSnapshot<List<NotesModel>> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context , index) {
                    return Dismissible(
                      key: ValueKey<int>(snapshot.data![index].id!),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction){
                        setState(() {
                          dbHelper!.delete(snapshot.data![index].id!);
                          print(snapshot.data![index].id!);
                          notesList = dbHelper!.getNotesList();
                          snapshot.data!.remove(snapshot.data![index].id!);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                      ),
                      child: Card(
                        elevation: 12,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          title: TextWidget(titile: snapshot.data?[index].title,),
                          subtitle: TextWidget(titile: snapshot.data?[index].description,),
                          trailing: TextWidget(titile: snapshot.data?[index].age.toString(),),
                        ),
                      ),
                    );
                  });
            }
            else if(snapshot.hasError){
              print('error while getting data ${snapshot.hasError}');
            }
            return TextWidget(titile: 'return');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper!
              .insert(
            NotesModel(age: 21, email: "Shahab57@gmail.com", description: "descripition", title: "first titile"),
          )
              .then((value) {
            print('data added ');
            setState(() {

            });
            notesList = dbHelper!.getNotesList();
          }).onError((error, stackTrace) {
            print(stackTrace);
            print(error.toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
