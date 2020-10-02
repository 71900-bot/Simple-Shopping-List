import 'package:flutter/material.dart';
import 'db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initilizaeDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'My Shopping list'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = ''; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: TextFormField(
                onChanged: (String mytitle) {
                  setState(() {
                    title = mytitle;
                  });
                },
                decoration:
                    InputDecoration(hintText: 'Title', labelText: 'Title'),
                style: TextStyle(fontSize: 14),
              ),
              trailing: RaisedButton(
                onPressed: () {
                 
                },
                child: const Text('add', style: TextStyle(fontSize: 12)),
              ),
            ),
           DataTable(
                      columns: [
                        DataColumn(
                          label: Text("Select"),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text("Title"),
                          numeric: false,
                        ),
                        DataColumn(
                          label: Text("Delete"),
                          numeric: false,
                        )
                      ],
                      rows: []
                          .map<DataRow>((item) => DataRow(cells: [
                                DataCell(
                                    Checkbox(
                                        value:
                                            item['BOUGHT'] == 1 ? true : false,
                                        onChanged: (newValue) {
                                        
                                        }),
                                    onTap: () {}),
                                DataCell(Text(item['TITLE'], style: TextStyle(decoration:  item['BOUGHT'] == 1 ? TextDecoration.lineThrough : TextDecoration.none, ),), onTap: () {}),
                                DataCell(
                                    Icon(Icons.delete,
                                        color: Color(0xffDB4437),
                                        size: 20), onTap: () async {
                                 
                                }),
                              ]))
                          .toList(),
                   
               )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
