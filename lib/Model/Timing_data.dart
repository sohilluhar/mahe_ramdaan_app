import 'package:intl/intl.dart';

class Timing_Data{
  String saheri;
  String iftar;
  String fajar;
  String zohar;
  String asr;
  String maghrib;
  String isha;
  String hizri_date;
  var saherihr;
  var maghribhr;
  var ishahr;


  factory Timing_Data.fromJSON(Map<dynamic, dynamic> jsonData){
    print(jsonData);
print("inside json");
    var saheritmp=jsonData["timings"]["Imsak"].toString().replaceAll("(IST)", "");
    var saheri=DateFormat.jm().format(DateTime.parse("20210101 "+saheritmp.trim()+":00"));


    var iftartmp=jsonData["timings"]["Maghrib"].toString().replaceAll("(IST)", "");
    var iftar=DateFormat.jm().format(DateTime.parse("20210101 "+iftartmp.trim()+":00"));

    var fajartmp=jsonData["timings"]["Fajr"].toString().replaceAll("(IST)", "");
    var fajar=DateFormat.jm().format(DateTime.parse("20210101 "+fajartmp.trim()+":00"));

    var zohartmp=jsonData["timings"]["Dhuhr"].toString().replaceAll("(IST)", "");
    var zohar=DateFormat.jm().format(DateTime.parse("20210101 "+zohartmp.trim()+":00"));

    var asrtmp=jsonData["timings"]["Asr"].toString().replaceAll("(IST)", "");
    var asr=DateFormat.jm().format(DateTime.parse("20210101 "+asrtmp.trim()+":00"));

    var maghribtmp=jsonData["timings"]["Maghrib"].toString().replaceAll("(IST)", "");
    var maghrib=DateFormat.jm().format(DateTime.parse("20210101 "+maghribtmp.trim()+":00"));


    var ishatmp=jsonData["timings"]["Isha"].toString().replaceAll("(IST)", "");
    var isha=DateFormat.jm().format(DateTime.parse("20210101 "+ishatmp.trim()+":00"));


    var hizriDate=jsonData["date"]['hijri']['day']+' '+
        jsonData["date"]['hijri']['month']['en']+' '+jsonData["date"]['hijri']['year'];

    var saherihr=int.parse(saheritmp.split(":")[0]);

    var strtmp=int.parse(maghribtmp.split(":")[0]);
    var strtmp1=int.parse(  maghribtmp.split(":")[1])/60;
    var maghribhr=strtmp+strtmp1;

    print(maghribhr.toString()+"is maghrib ");

    var strtmp2=int.parse(ishatmp.split(":")[0]);
    var strtmp3=int.parse(  ishatmp.split(":")[1])/60;

    var ishahr=strtmp2+strtmp3;
    print(ishahr.toString()+"is isha ");

    print("all set");

    return Timing_Data(saheri, iftar, fajar, zohar, asr, maghrib, isha, hizriDate,saherihr,maghribhr,ishahr);

  }

  Timing_Data(this.saheri, this.iftar, this.fajar, this.zohar, this.asr,
      this.maghrib, this.isha, this.hizri_date,this.saherihr,this.maghribhr,this.ishahr);
}