import 'package:editable/editable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editable example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        // accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Editable example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Create a Key for EditableState
  final _editableKey = GlobalKey<EditableState>();

  List rows = [
    {
      "name": 'James LongName Joe',
      "date": '23/09/2020',
      "month": 'June',
      "status": 'completed'
    },
    {
      "name": 'Daniel Paul',
      "month": 'March',
      "status": 'new',
      "date": '12/4/2020',
    },
    {
      "month": 'May',
      "name": 'Mark Zuckerberg',
      "date": '09/4/1993',
      "status": 'expert'
    },
    {
      "name": 'Jack',
      "status": 'legend',
      "date": '01/7/1820',
      "month": 'December',
    },
  ];
  List cols = [
    {"title": 'Name', 'widthFactor': 0.2, 'key': 'name', 'editable': false},
    {"title": 'Date', 'widthFactor': 0.2, 'key': 'date'},
    {"title": 'Month', 'widthFactor': 0.2, 'key': 'month'},
    {"title": 'Status', 'key': 'status'},
  ];

  /// Function to add a new row
  /// Using the global key assigined to Editable widget
  /// Access the current state of Editable
  void _addNewRow() {
    setState(() {
      _editableKey.currentState?.createRow();
    });
  }

  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState!.editedRows;
    print(editedRows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: TextButton.icon(
            onPressed: () => _addNewRow(),
            icon: Icon(Icons.add),
            label: Text(
              'Add',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => _printEditedRows(),
                child: Text('Print Edited Rows',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: Editable(
        key: _editableKey,
        columns: cols,
        rows: rows,
        zebraStripe: true,
        stripeColor1: Colors.grey[200]!,
        stripeColor2: Colors.green[50]!,
        onRowSaved: (value) {
          print(value);
        },
        onSubmitted: (value) {
          print(value);
        },
        borderColor: Colors.blueGrey,
        tdStyle: TextStyle(fontWeight: FontWeight.bold),
        trHeight: 80,
        thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        thAlignment: TextAlign.center,
        thVertAlignment: CrossAxisAlignment.end,
        thPaddingBottom: 3,
        showSaveIcon: true,
        saveIconColor: Colors.black,
        showCreateButton: true,
        tdAlignment: TextAlign.left,
        tdEditableMaxLines: 100, // don't limit and allow data to wrap
        tdPaddingTop: 0,
        tdPaddingBottom: 14,
        tdPaddingLeft: 10,
        tdPaddingRight: 8,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(0))),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:editable/editable.dart';
// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//    @override
//    Widget build(BuildContext context) {
//      return MaterialApp(
//         title: 'Flutter Editable Table',
//         theme: ThemeData(
//           primarySwatch: Colors.red,
//         ),
//         debugShowCheckedModeBanner: false,
//         home: TablePage(),
//       );
//     }
//  }
//  class TablePage extends StatefulWidget {
//  @override
//  _TablePageState createState() => _TablePageState();
// }
// class _TablePageState extends State<TablePage> {
// @override
//  Widget build(BuildContext context) {
//  return Scaffold(
//     body: Container()
//     );
//   }
// }
// @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Editable(
//        columns: headers,
//        rows: rows,
//        showCreateButton: true,
//        tdStyle: TextStyle(fontSize: 20),
//        showSaveIcon: false,
//        borderColor: Colors.grey.shade300,
//        onSubmitted: (value){ //new line
//             print(value); //you can grab this data to store anywhere
//          },
//          onRowSaved: (value){ //added line
//          print(value); //prints to console
//         },
//       ),
//     );
//  }
//
// //  @override
// //  Widget build(BuildContext context) {
// //    return Scaffold(
// //      body: Editable(
// //        columns: headers,
// //        rows: rows,
// //        showCreateButton: true,
// //        tdStyle: TextStyle(fontSize: 20),
// //        showSaveIcon: false,
// //        borderColor: Colors.grey.shade300,
// //       ),
// //     );
// //  }
//  //row data
// List rows = [
//    {"name": 'James Peter', "date":'01/08/2007',"month":'March',"status":'beginner'},
//    {"name": 'Okon Etim', "date":'09/07/1889',"month":'January',"status":'completed'},
//    {"name": 'Samuel Peter', "date":'11/11/2002',"month":'April',"status":'intermediate'},
//    {"name": 'Udoh Ekong', "date":'06/3/2020',"month":'July',"status":'beginner'},
//    {"name": 'Essien Ikpa', "date":'12/6/1996',"month":'June',"status":'completed'},
//  ];
// //Headers or Columns
// List headers = [
//    {"title":'Name', 'index': 1, 'key':'name'},
//    {"title":'Date', 'index': 2, 'key':'date'},
//    {"title":'Month', 'index': 3, 'key':'month'},
//    {"title":'Status', 'index': 4, 'key':'status'},
//  ];
// // @override
// //  Widget build(BuildContext context) {
// //     return Scaffold(
// //        body: Editable(
// //           columns: headers,
// //           rows: rows,
// //           showCreateButton: true,
// //           tdStyle: TextStyle(fontSize: 20),
// //           showSaveIcon: false,
// //           borderColor: Colors.grey.shade300,
// //           onSubmitted: (value){ //new line
// //             print(value); //you can grab this data to store anywhere
// //          },
// //        ),
// //     );
// //  }
// // @override
// //  Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Editable(
// //         columns: headers,
// //         rows: rows,
// //         showCreateButton: true,
// //         tdStyle: TextStyle(fontSize: 20),
// //         showSaveIcon: true, //set true
// //         borderColor: Colors.grey.shade300,
// //         onSubmitted: (value){
// //          print(value);
// //         },
// //         onRowSaved: (value){ //added line
// //          print(value); //prints to console
// //         },
// //        ),
// //     );
// //  }
//
//
//
// // class MyApp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Table app',
// //       theme: ThemeData(
// //         // This is the theme of your application.
// //         //
// //         // Try running your application with "flutter run". You'll see the
// //         // application has a blue toolbar. Then, without quitting the app, try
// //         // changing the primarySwatch below to Colors.green and then invoke
// //         // "hot reload" (press "r" in the console where you ran "flutter run",
// //         // or simply save your changes to "hot reload" in a Flutter IDE).
// //         // Notice that the counter didn't reset back to zero; the application
// //         // is not restarted.
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(title: 'App Home Page'),
// //     );
// //   }
// // }
//
// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key? key, required this.title}) : super(key: key);
//
// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.
//
// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".
//
// //   final String title;
//
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
//
// // class _MyHomePageState extends State<MyHomePage> {
// //   late List<Employee> _employees;
// //   late EmployeeDataSource _employeeDataSource;
//
// //   @override
// //   void initState() {
// //     super.initState();
// //     _employees = getEmployeeData();
// //     _employeeDataSource = EmployeeDataSource(_employees);
// //   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //         child: Scaffold(
// //       body: SfDataGrid(
// //         allowSorting: true,
// //         allowEditing: true,
// //         // selectionMode: SelectionMode.multiple,
// //         source: _employeeDataSource,
// //         columns: [
// //           GridColumn(
// //               columnName: 'id',
// //               label: Container(
// //                 padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //                 alignment: Alignment.centerRight,
// //                 child: Text(
// //                   'ID',
// //                   // overflow: TextOverflow.ellipsis,
// //                 ),
// //               )),
// //           // onTap: (){
// //           // editFirstName(Employee);
// //           // break;
// //           // }
// //           GridColumn(
// //               columnName: 'name',
// //               label: Container(
// //                   padding:
// //                       EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //                   alignment: Alignment.centerLeft,
// //                   child: Text(
// //                     'Name',
// //                     // overflow: TextOverflow.ellipsis,
// //                   ))),
// //           GridColumn(
// //               columnName: 'product',
// //               label: Container(
// //                   padding:
// //                       EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //                   alignment: Alignment.centerRight,
// //                   child: Text(
// //                     'product',
// //                     // overflow: TextOverflow.ellipsis,
// //                   ))),
// //           GridColumn(
// //               columnName: 'price',
// //               label: Container(
// //                 padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //                 alignment: Alignment.centerRight,
// //                 child: Text(
// //                   'Price',
// //                   // overflow: TextOverflow.ellipsis,
// //                 ),
// //               )),
// //           GridColumn(
// //               columnName: 'paid',
// //               label: Container(
// //                 padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //                 alignment: Alignment.centerRight,
// //                 child: Text(
// //                   'Paid',
// //                   // overflow: TextOverflow.ellipsis,
// //                 ),
// //               )),
// //           GridColumn(
// //               columnName: 'leftover',
// //               label: Container(
// //                 padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //                 alignment: Alignment.centerRight,
// //                 child: Text(
// //                   'Left',
// //                   // overflow: TextOverflow.ellipsis,
// //                 ),
// //               )),
// //           GridColumn(
// //               columnName: 'Address',
// //               label: Container(
// //                   padding:
// //                       EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //                   alignment: Alignment.centerLeft,
// //                   child: Text(
// //                     'Address',
// //                     // overflow: TextOverflow.ellipsis,
// //                   ))),
//
// //           GridColumn(
// //               columnName: 'comments',
// //               label: Container(
// //                   padding:
// //                       EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //                   alignment: Alignment.centerLeft,
// //                   child: Text(
// //                     'Comment',
// //                     // overflow: TextOverflow.ellipsis,
// //                   ))),
// //         ],
// //       ),
// //     ));
// //   }
//
// //   List<Employee> getEmployeeData() {
// //     return [
// //       Employee(1, 'James', 'Wallet', 200, 180, 20, "somewhere", "comment"),
// //       Employee(2, 'Kathryn', 'Manager', 100, 50, 50, "", ""),
// //     ];
// //   }
// // }
//
// // class EmployeeDataSource extends DataGridSource {
// //   EmployeeDataSource(List<Employee> employees) {
// //     dataGridRows = employees
// //         .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
// //               DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
// //               DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
// //               DataGridCell<String>(
// //                   columnName: 'product', value: dataGridRow.product),
// //               DataGridCell<int>(columnName: 'price', value: dataGridRow.price),
// //               DataGridCell<int>(columnName: 'paid', value: dataGridRow.paid),
// //               DataGridCell<int>(
// //                   columnName: 'leftover', value: dataGridRow.leftover),
// //               DataGridCell<String>(
// //                   columnName: 'address', value: dataGridRow.address),
// //               DataGridCell<String>(
// //                   columnName: 'comments', value: dataGridRow.comment),
// //             ]))
// //         .toList();
// //   }
//
// //   late List<DataGridRow> dataGridRows;
// //   @override
// //   List<DataGridRow> get rows => dataGridRows;
// //   @override
// //   DataGridRowAdapter? buildRow(DataGridRow row) {
// //     return DataGridRowAdapter(
// //         cells: row.getCells().map<Widget>((dataGridCell) {
// //       return Container(
// //           padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //           alignment: (dataGridCell.columnName == 'id' ||
// //                   dataGridCell.columnName == 'product')
// //               ? Alignment.centerRight //
// //               : Alignment.centerLeft, //
// //           child: Text(
// //             dataGridCell.value.toString(),
// //             overflow: TextOverflow.ellipsis,
// //           ));
// //     }).toList());
// //   }
// // }
//
// // class Employee {
// //   Employee(this.id, this.name, this.product, this.paid, this.price,
// //       this.leftover, this.address, this.comment);
// //   final int id;
// //   final String name;
// //   final String product;
// //   final int paid;
// //   final int price;
// //   final int leftover;
// //   final String address;
// //   final String comment;
//
// //   // final mksb => price - actual price
// // }
// // // import 'package:flutter/material.dart';
// // // import 'package:firebase_core/firebase_core.dart';
// // // import 'firebase_options.dart';
// // // import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
// // // Future<void> main() async {
// // //   WidgetsFlutterBinding.ensureInitialized();
// // //   await Firebase.initializeApp(
// // //     options: DefaultFirebaseOptions.currentPlatform,
// // //   );
//
// // //   runApp(const MyApp());
// // // }
//
// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});
//
// // //   // This widget is the root of your application.
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter Demo',
// // //       theme: ThemeData(
// // //         // This is the theme of your application.
// // //         //
// // //         // TRY THIS: Try running your application with "flutter run". You'll see
// // //         // the application has a blue toolbar. Then, without quitting the app,
// // //         // try changing the seedColor in the colorScheme below to Colors.green
// // //         // and then invoke "hot reload" (save your changes or press the "hot
// // //         // reload" button in a Flutter-supported IDE, or press "r" if you used
// // //         // the command line to start the app).
// // //         //
// // //         // Notice that the counter didn't reset back to zero; the application
// // //         // state is not lost during the reload. To reset the state, use hot
// // //         // restart instead.
// // //         //
// // //         // This works for code too, not just values: Most code changes can be
// // //         // tested with just a hot reload.
// // //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// // //         useMaterial3: true,
// // //       ),
// // //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// // //     );
// // //   }
// // // }
//
// // // class MyHomePage extends StatefulWidget {
// // //   const MyHomePage({super.key, required this.title});
//
// // //   // This widget is the home page of your application. It is stateful, meaning
// // //   // that it has a State object (defined below) that contains fields that affect
// // //   // how it looks.
//
// // //   // This class is the configuration for the state. It holds the values (in this
// // //   // case the title) provided by the parent (in this case the App widget) and
// // //   // used by the build method of the State. Fields in a Widget subclass are
// // //   // always marked "final".
//
// // //   final String title;
//
// // //   @override
// // //   State<MyHomePage> createState() => _MyHomePageState();
// // // }
//
// // // class _MyHomePageState extends State<MyHomePage> {
// // //   late List<Employee> _employees;
// // //   @override
// // //   void initState() {
// // //     _employees = getEmployeeData();
//
// // //     super.initState();
// // //   }
//
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SafeArea(
// // //         child: Scaffold(
// // //       body: SfDataGrid(),
// // //     ));
// // //   }
//
// // //   List<Employee> getEmployeeData() {
// // //     return [
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //       Employee(1001, "James", "project Lead", 2000),
// // //     ];
// // //   }
// // // }
//
// // // class EmployeeDataSource extends DataGridSource {
// // //   EmployeeDataSource(List<Employee> employees) {
// // //     dataGridRows = employees
// // //         .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
// // //               DataGridCell<int>(columnName: 'id', value: DataGridRow.id),
// // //               DataGridCell<String>(columnName: 'name', value: DataGridRow.name),
// // //               DataGridCell<String>(columnName: "address", value: DataGridRow.address),
// // //               DataGridCell<int>(columnName: "product", value: DataGridRow.product),
// // //             ]))
// // //         .toList();
// // //   }
// // //   late List<DataGridRow> dataGridRows;
// // //   @override
// // //   List<DataGridRow> get rows => dataGridRows;
//
// // //   @override
// // //   DataGridRowAdapter? buildRow(DataGridRow row) {
// // //     return DataGridRowAdapter(cells: row.getCells().map<Widget>((DataGridCell){
// // //       return Container(
// // //         child: Text(DataGridCell.value.toString()),
// // //       );
// // //     }).toList());
// // //   }
// // // }
//
// // // class Employee {
// // //   Employee(this.id, this.name, this.address, this.product);
// // //   final int id;
// // //   final String name;
// // //   final String address;
// // //   final int product;
// // // }
//
// // //   // int _counter = 0;
//
// // //   // void _incrementCounter() {
// // //   //   setState(() {
// // //   //     // This call to setState tells the Flutter framework that something has
// // //   //     // changed in this State, which causes it to rerun the build method below
// // //   //     // so that the display can reflect the updated values. If we changed
// // //   //     // _counter without calling setState(), then the build method would not be
// // //   //     // called again, and so nothing would appear to happen.
// // //   //     _counter++;
// // //   //   });
// // //   // }
//
// // //   // @override
// // //   // Widget build(BuildContext context) {
// // //   //   // This method is rerun every time setState is called, for instance as done
// // //   //   // by the _incrementCounter method above.
// // //   //   //
// // //   //   // The Flutter framework has been optimized to make rerunning build methods
// // //   //   // fast, so that you can just rebuild anything that needs updating rather
// // //   //   // than having to individually change instances of widgets.
// // //   //   return Scaffold(
// // //   //     appBar: AppBar(
// // //   //       // TRY THIS: Try changing the color here to a specific color (to
// // //   //       // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// // //   //       // change color while the other colors stay the same.
// // //   //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// // //   //       // Here we take the value from the MyHomePage object that was created by
// // //   //       // the App.build method, and use it to set our appbar title.
// // //   //       title: Text(widget.title),
// // //   //     ),
// // //   //     body: Center(
// // //   //       // Center is a layout widget. It takes a single child and positions it
// // //   //       // in the middle of the parent.
// // //   //       child: Column(
// // //   //         // Column is also a layout widget. It takes a list of children and
// // //   //         // arranges them vertically. By default, it sizes itself to fit its
// // //   //         // children horizontally, and tries to be as tall as its parent.
// // //   //         //
// // //   //         // Column has various properties to control how it sizes itself and
// // //   //         // how it positions its children. Here we use mainAxisAlignment to
// // //   //         // center the children vertically; the main axis here is the vertical
// // //   //         // axis because Columns are vertical (the cross axis would be
// // //   //         // horizontal).
// // //   //         //
// // //   //         // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// // //   //         // action in the IDE, or press "p" in the console), to see the
// // //   //         // wireframe for each widget.
// // //   //         mainAxisAlignment: MainAxisAlignment.center,
// // //   //         children: <Widget>[
// // //   //           const Text(
// // //   //             'You have pushed the button this many times:',
// // //   //           ),
// // //   //           Text(
// // //   //             '$_counter',
// // //   //             style: Theme.of(context).textTheme.headlineMedium,
// // //   //           ),
// // //   //         ],
// // //   //       ),
// // //   //     ),
// // //   //     floatingActionButton: FloatingActionButton(
// // //   //       onPressed: _incrementCounter,
// // //   //       tooltip: 'Increment',
// // //   //       child: const Icon(Icons.add),
// // //   //     ), // This trailing comma makes auto-formatting nicer for build methods.
// // //   //   );
// // //   // }
