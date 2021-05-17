// ignore: non_constant_identifier_names
var Mechs = {
  "eqtype": eqtps(),
  "brand": [
    "CADC",
    "PACD",
    "LTAT",
    "MOND",
    "FATO",
    "CADC",
    "PACD",
    "LTAT",
    "MOND",
    "FATO",
    "CADC",
    "PACD",
    "LTAT",
    "MOND",
    "FATO",
    "CADC",
    "PACD",
    "LTAT",
    "MOND",
    "FATO"
  ],
  "model": models(),
  "sno": serials(),
  "doi": dates("2016"),
  "uid": [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],
  "tname": temps(),
};

var templates = {
  "tname" : tps,
  "form" : ["A","B","C","D","E"],
};

var services = {
  "sno": [1,2,3,4,5,6,7,8,9,10],
  "dos": dates("2019"),
  "worker_id": [196,202,998,423,695,791,643,80,44,1],
  "record" : ["A","B","C","D","E","F","G","H","I","J"],
  "cleared" : [true,false,true,false,true,false,true,false,true,false],
};

var workers = {
  "uname" : ["A","B","C","D","E","F","G","H","I","J"],
  "psswd" : [196,202,998,423,695,791,643,80,44,1],
};

var admins = {
  "uname" : ["K","L","M","N","O","P","Q","R","S","T"],
  "psswd" : [196,202,998,423,695,791,643,80,44,1],
};

Map<String, String> equipments = {
  "conv": "conveyor_belt",
  "cthy": "cutting_hydraulics",
  "pckg": "packaging_section",
  "grnd": "grinding_tube",
  "kln1": "heating_kiln_1"
};

List<String> brands = ["CADC", "PACD", "LTAT", "MOND", "FATO"];
List<String> tps = ["alpha","beta","gamma","delta","omega"];

List<String> eqtps() {
  List<String> eqs = [];
  var i, j;
  for (j = 0; j < 4; j++) {
    for (i in equipments.keys) {
      eqs.add(i);
    }
  }
  return eqs;
}

List<String> models(){
  List<String> mds =[];
  var i,j;
  for(j=0;j<4;j++){
    for (i in brands){
      mds.add(i+(j.toString()));
    }
  }
  return mds;
}

List<int> serials(){
  List<int> s = [];
  // ignore: unused_local_variable
  var i,j;
  for (i=0;i<4;i++){
    for(j in brands){
      s.add(i*57);
    }
  }
  return s;
}

List<String> dates(String s){
  List<String> d = [];
  var c = 1;
  for(var i=0;i<4;i++){
    for (var j=0;j<5;j++){
      d.add((c.toString())+"-12-"+s);
      c = c+1;
    }
  }
  return d;
}

List<String> temps(){
  List<String> t = [];
  for (var i = 0;i<4;i++){
    for (var j in tps)
    t.add(j);
  }
  return t;
}