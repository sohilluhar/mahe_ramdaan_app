import 'package:intl/intl.dart';

class Timing_Data_Month{
  List<String> saheri;
  List<String> iftar;
  List<String> zohar;
  List<String> fajar;
  List<String> asr;
  List<String> maghrib;
  List<String> isha;
  List<String> hizri_date;
  List<String> normal_date;
  List<dynamic> saherihr;
  List<dynamic> maghribhr;
  List<dynamic> ishahr;


  factory Timing_Data_Month.fromJSON(List<dynamic> jsonDataAll){
//    print(jsonData);
//print("inside json");
    List< dynamic> allmnthno=[
      0,1,2,3,4,5,6,7,8,9,10,
      11,12,13,14,15,16,17,18,19,20,
      21,22,23,24,25,26,27,28,29,30
    ];

    List<String> listsaheri;
    List<String> listiftar;
    List<String> listzohar;
    List<String> listfajar;
    List<String> listasr;
    List<String> listmaghrib;
    List<String> listisha;
    List<String> listhizriDate;
    List<String> listnormal_date;
   List<dynamic> listsaherihr;
   List<dynamic> listmaghribhr;
   List<dynamic> listishahr;

    for(var i in allmnthno) {


      print("Adding "+i.toString()+" day to list");

      Map<dynamic, dynamic> jsonData=jsonDataAll[i];
      var saheritmp = jsonData["timings"]["Imsak"].toString().replaceAll(
          "(IST)", "");
      var saheri = DateFormat.jm().format(
          DateTime.parse("20210101 " + saheritmp.trim() + ":00"));


      var iftartmp = jsonData["timings"]["Maghrib"].toString().replaceAll(
          "(IST)", "");
      var iftar = DateFormat.jm().format(
          DateTime.parse("20210101 " + iftartmp.trim() + ":00"));

      var fajartmp = jsonData["timings"]["Fajr"].toString().replaceAll(
          "(IST)", "");
      var fajar = DateFormat.jm().format(
          DateTime.parse("20210101 " + fajartmp.trim() + ":00"));

      var zohartmp = jsonData["timings"]["Dhuhr"].toString().replaceAll(
          "(IST)", "");
      var zohar = DateFormat.jm().format(
          DateTime.parse("20210101 " + zohartmp.trim() + ":00"));

      var asrtmp = jsonData["timings"]["Asr"].toString().replaceAll(
          "(IST)", "");
      var asr = DateFormat.jm().format(
          DateTime.parse("20210101 " + asrtmp.trim() + ":00"));

      var maghribtmp = jsonData["timings"]["Maghrib"].toString().replaceAll(
          "(IST)", "");
      var maghrib = DateFormat.jm().format(
          DateTime.parse("20210101 " + maghribtmp.trim() + ":00"));


      var ishatmp = jsonData["timings"]["Isha"].toString().replaceAll(
          "(IST)", "");
      var isha = DateFormat.jm().format(
          DateTime.parse("20210101 " + ishatmp.trim() + ":00"));


      var hizriDate = jsonData["date"]['hijri']['day'] + ' ' +
          jsonData["date"]['hijri']['month']['en'] + ' ' +
          jsonData["date"]['hijri']['year'];
      var normal_date = jsonData["date"]['readable'];

      var saherihr = int.parse(saheritmp.split(":")[0]);

      var strtmp = int.parse(maghribtmp.split(":")[0]);
      var strtmp1 = int.parse(maghribtmp.split(":")[1]) / 60;
      var maghribhr = strtmp + strtmp1;

//    print(maghribhr.toString()+"is maghrib ");

      var strtmp2 = int.parse(ishatmp.split(":")[0]);
      var strtmp3 = int.parse(ishatmp.split(":")[1]) / 60;

      var ishahr = strtmp2 + strtmp3;
//    print(ishahr.toString()+"is isha ");

//    print("all set");
            listsaheri.add(saheri);
            listiftar.add(iftar);
            listfajar.add(fajar);
            listzohar.add(zohar);
            listasr.add(asr);
            listmaghrib.add(maghrib);
            listisha.add(isha);
            listhizriDate.add(hizriDate);
            listnormal_date.add(normal_date);
            listsaherihr.add(saherihr);
            listmaghribhr.add(maghribhr);
            listishahr.add(ishahr);


    }

    print("outside loop");
    return Timing_Data_Month(
        listsaheri,
        listiftar,
        listfajar,
        listzohar,
        listasr,
        listmaghrib,
        listisha,
        listhizriDate,
        listnormal_date,
        listsaherihr,
        listmaghribhr,
        listishahr
    );

  }

  Timing_Data_Month(this.saheri, this.iftar, this.fajar, this.zohar, this.asr,
      this.maghrib, this.isha, this.hizri_date,this.normal_date,this.saherihr,this.maghribhr,this.ishahr);
}