//new SingleChildScrollView(
//child: new Container(
//// Center is a layout widget. It takes a single child and positions it
//// in the middle of the parent.
//child: new Column(children: <Widget>[
//new CoreForm(
//form: form,
//onChanged: (dynamic response) {
//this.response = response;
//},
//),
//new RaisedButton(
//child: new Text('Send'),
//onPressed: () {
//print(this.response.toString());
//})
//]),
//),
//)



//AlertDialog(
////title: Text('Enter Title/Question for Form Field'),
//title: Image.network("https://miro.medium.com/max/3675/1*PrOpoN6DYcyTZ6uYIQGoLg.gif",fit: BoxFit.cover,),
//content: TextField(
//controller: temp,
//decoration: InputDecoration(hintText: "how many litres petrol?"),
//),
//actions: <Widget>[
//new FlatButton(
//child: new Text('Add Field'),
//onPressed: () {
//template.add({
//'type': 'Input',
//'title': temp.text,
//'placeholder': "how many litres petrol?"
//});
//setState(() {
//display.insert(
//0,
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Card(elevation: 8.0,
//child: Padding(
//padding: const EdgeInsets.all(20.0),
//child: TextField(
//decoration: new InputDecoration(
//labelText: temp.text,
//fillColor: Colors.white,
//border: new OutlineInputBorder(
//borderRadius: new BorderRadius.circular(25.0),
//borderSide: new BorderSide(
//),
//),
////fillColor: Colors.green
//),
//),
//),
//),
//));
//});
//
//Navigator.of(context).pop();
//},
//)
//],
//);

//for switch:

//
//AlertDialog(
//title: Text('Enter Question'),
//content: TextField(
//controller: temp,
//decoration: InputDecoration(hintText: "is car working?"),
//),
//actions: <Widget>[
//new FlatButton(
//child: new Text('Add Field'),
//onPressed: () {
//template.add({
//'type': 'Switch',
//'title': temp.text,
//'switchValue': false,
//});
//setState(() {
//display.insert(
//0,
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Card( elevation: 8.0,
//child: Row(mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Text(temp.text + " : "),
//Switch(
//value: false,
//)
//],
//)),
//));
//});
//Navigator.of(context).pop();
//},
//)
//],
//);



//showDialog(
//context: context,
//builder: (context) {
//return NetworkGiffyDialog(
//title: Text('use to add textual info, numeric values',
//style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400)),
//
//onOkButtonPressed: () {
//
//
//Navigator.pop(context, 'Yep!');
//},
//);
//});

//Navigator.push(context, MaterialPageRoute(builder: (context){
//return MyHomePage(title: "Add Template Page",tname: tname.text,);
//}));