import 'package:flutter/material.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
//const kPrimaryColor = Colors.blue;
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

const lang_opt="Guj";

const duroodAll =<String, String>{
  'Durood e Shafa':'اَللّٰھُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی حَبِیْبِکَ شَفِیْعِ الْمُذْنِبِیْنَ وَ عَلٰٓی اٰلِہٖ وَ اَصْحَابِہٖ اَجْمَعِیْنَ',
  'Durood e Mustafa':'اَللّٰھُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی حَبِیْبِکَ الْمُصْطَفٰی وَ عَلٰٓی اٰلِہٖ؁',
  'Durood e Hazarah':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَ عَلٰی اٰلِ سَیِّدِنَا مُحَمَّدٍ بِعَدَدِ کُلِّ ذَرَّۃٍ مِّائَۃَ اَلْفِ اَلْفِ مَرَّۃٍ وَّ بَارِکْ وَ سَلِّمْ؁',
  'Durood e Habib':'اَلصَّلٰوۃُ وَالسَّلَامُ عَلَیْکَ یَارَسُوْلَ اللّٰہِ وَ عَلٰی اٰلِکَ وَ اَصْحَابِکَ یَا حَبِیْبَ اللّٰہِ',
  'Durood e Shifa':'اَللّٰہُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَاوَ مَوْلَانَا مُحَمَّدٍ طِبِّ الْقُلُوْبِ وَ دَوَآءِھَا وَ عَافِیَۃِ الْاَبْدَانِ وَ شِفَاءِھَا وَ نُوْرِ الْاَبْصَارِ وَ ضِیَآءِھَا وَ اٰلِہٖ وَ صَحْبِہٖ دَآئِمًا اَبَدًا',
  'Durood e Khamsa':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ بِعَدَدِ مَنْ صَلّٰی عَلَیْہِ وَ صَلِّ عَلٰی مُحَمَّدٍ کَمَا تُحِبُّ وَ تَرْضٰی بِاَنْ تُصَلِّیَ عَلَیْہِ وَ صَلِّ عَلٰی مُحَمَّدٍ کَمَا اَمَرْتَنَا بِالصَّلٰوۃِ عَلَیْہِ وَ صَلِّ عَلٰی مُحَمَّدٍ کَمَا تَنْبَغِی الصَّلوٰۃُ عَلَیْہِ؁',
  'Durood e Sa\'adat':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ عَدَدَ مَا فِیْ عِلْمِ اللہِ صَلٰوۃً دَآئِمَۃً بِدَوَامِ مُلْکِ اللہِ',
  'Durood e Maahi':'o یَا قَدِیْمُ یَا دَآئِمُ یَا حَیُّ یَا قَیُّوْمُ یَا وِتْرُ یَا اَحَدُ یَا صَمَدُ یَا مَنْ لَّمْ یَلِدْ وَ لَمْ یُوْلَدْ وَ لَمْ یَکُنْ لَّہٗ کُفُوًااَحَدٌ بِرَحْمَتِکَ یَا اَرْحَمَ الرَّاحِمِیْنَo',
  'Durood e Batin':'صَلَّی اللہُ عَلَی النَّبِیِّ الاُمِّیِّ وَ اٰلِہٖ وَ سَلَّمَ صَلٰوۃً وَّ سَلاَمًا عَلَیْکَ یَا رَسُوْلَ اللہِ؁',
  'Durood e Ghausia':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا وَ مَوْلَانَا مُحَمَّدٍ مَّعْدِنِ الْجُوْدِ وَ الْکَرَمِ وَ اٰلِہٖ وَ بَارِکْ وَ سَلِّمْ۔',
  'Durood e Jummah':'اَللّٰہُمَّ صَلِّ عَلٰی مُحَمَّدِ نِ النَّبِیِّ الْاُمِّیِ وَ عَلٰٓی اٰلِہٖ وَ سَلِّمْ تَسْلِیْمًا',
  'Durood e Mustajab ul Da\'awat':'صَلَّی اللہُ عَلَی النَّبِیِّ الاُمِّیِّ الْکَرِیْمِ وَ عَلٰی اٰلِہٖ وَ اَصْحَابِہٖ وَ سَلَّمَ؁',
  'Durood e Awwal o Akhir':'صَلَّی اللّٰہُ عَلٰی حَبِیْبِہٖ اَکْرَمِ الْاَوَّلِیْنَ وَ الْاٰخِرِیْنَ وَ عَلٰی اٰلِہٖ وَ اَصْحَابِہٖ وَ بَارِکْ وَ سَلِّمْ؁',
  'Durood e Shab e Jummah':'اَللّٰہُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَا مُحَمَّدِ نِ النَّبِیِّ الْاُمِّیِّ الْحَبِیْبِ الْعَالِی الْقَدْرِ الْعَظِیْمِ الْجَاہِ وَ عَلٰٓی اٰلِہٖ وَ صَحْبِہٖ اَجْمَعِیْنَ',
  'Durood e Shab e Khizra':'صَلَّی اللّٰہُ عَلٰی حَبِیْبِہٖ مُحَمَّدٍ وَّ اٰلِہٖ وَ اَصْحَابِہٖ وَ سَلَّمَ؁',
  'Durood e Tunajjaena':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَّ عَلٰٓی اٰلِ سَیِّدِنَا مُحَمَّدٍ صَلٰوۃً تُنَجِّیْنَا بِھَا مِنْ جَمِیْعِ الْاَھْوَالِ وَ الْاٰفَاتِ وَ تَقْضِیْ لَنَا بِھَا جَمِیْعَ الْحَاجَاتِ وَ تُطَھِّرُنَا بِھَا مِنْ جَمِیْعِ السَّیِّئَاتِ وَ تَرْفَعُنَا بِھَا عِنْدَکَ اَعْلَی الدَّرَجَاتِ وَ تُبَلِّغُنَا بِھَا اَقْصَی الْغَایَاتِ مِنْ جَمِیْعِ الْخَیْرَاتِ فِی الْحَیَاتِ وَ بَعْدَ الْمَمَاتِ اِنَّکَ مُجِیْبُ الدَّعَوَاتِ وَ رَافِعُ الدَّرَجَاتِ وَ یَا قَاضِیَ الْحَاجَاتِ وَ یَا کَافِیَ الْمُھِمَّاتِ وَ یَا دَافِعَ الْبَلِیَّاتِ وَ یَا حَلَّ الْمُشْکِلَاتِ اَغِثْنِیْ اَغِثْنِیْ اَغِثْنِیْ یَا اِلٰھِیْ اِنَّکَ عَلٰی کُلِّ شَیْءٍ قَدِیْرٌo',
  'Durood e Boseri':'مَوْلَایَ صَلِّ وَ سَلِّمْ دَائِمًا اَبَدًا عَلٰی حَبِیْبِکَ خَیْرِ الْخَلْقِ کُلِّھِمٖ \10 یَارَبِّ صَلِّ وَ سَلِّمْ دَائِمًا اَبَدًا \10 عَلٰی حَبِیْبِکَ خَیْرِ الْخَلْقِ کُلِّھِم',
  'Durood e Nijat e Waba':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَ عَلٰی اٰلِ سَیِّدِنَا مُحَمَّدٍ بِعَدَدِ کُلِّ دَآءٍ وَّ دَوَآءٍ وَّ بِعَدَدِ کُلِّ عِلَّۃٍ وَّشِفَآءٍ؁',
  'Durood e Na\'emat e Uzma':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَ عَلٰی اٰلِ سَیِّدِنَا مُحَمَّدٍ وَّ اَصْحَابِ سَیِّدِنَا مُحَمَّدٍ وَّ بَارِکْ وَ سَلِّمْ؁',
  'Durood e Kashf':'صَلَّی اللہُ عَلَی نَبِیِّ الرَّحْمَۃِ شَفِیْعِ الْاُمَّۃِ کَاشِفِ الْغُمَّۃِ وَ عَلٰی اٰلِہٖ وَ اَصْحَابِہٖ وَ بَارَکَ وَ سَلَّمَ؁',
  'Durood e Duwami':'اَللّٰہُمَّ صَلِّ عَلَیْھِمْ صَلوٰۃً دَائِمَۃً مُّسْتَمِرَّۃَ الدَّوَامِ عَلٰی مَرِّ اللَّیَالِیْ وَ الْاَیَّامِ مَتَّصِلَۃَ الدَّوَامِ لَا انْقِضَآءَ لَھَا وَ لَا انْصِرَامَ عَلٰی مَرِّ اللَّیَالِیْ وَ الْاَیَّامِ عَدَدَ کُلِّ وَابِلٍ وَّطَلٍّ',
  'Durood e Kamaliya':'اَللّٰھُمَّ صَلِّ وَ سَلِّمْ وَ بَارِکْ عَلٰی سَیِّدِنَا مُحَمَّدِ نِ النَّبِیِّ الْکَامِلِ وَ عَلٰی اٰلِہٖ کَمَا لَانِھَایَۃَ لِکَمَالِہٖ وَ عَدَدَ کَمَالِہٖ؁',
  'Durood e Mohammadi':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَ عَلٰی اٰلِ سَیِّدِنَا مُحَمَّدٍ عَبْدِکَ وَ رَسُوْلِکَ النَّبِیِّ الْاُمِیِّ بَعَدَدِ اَنْفَاسِ الْخَلَائِقِ صَلوٰۃً دَائِمَۃً بِدَوَامِ خَلْقِ اللّٰہِ؁',
  'Durood e Kausar':'اَللّٰہُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ فِی الْاَوَّلِیْنَ وَ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ فِی الْاٰخِرِیْنَ وَ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ فِی النَّبِیِّیْنَ وَ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ فِی الْمُرْسَلِیْنَ وَ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ فِی الْمَلَاِ الْاَعْلٰی اِلٰی یَوْمِ الدِّیْنِ؁',
  'Durood e Husool e Rahmat':'اَللّٰہُمَّ صَلِّ صَلوٰۃً دَائِمَۃً وَ سَلِّمْ سَلَامًا اَبَدًا عَلٰی حَبِیْبِکَ وَ نَبِیِّکَ وَ اٰلِہٖ وَ اَصْحَابِہٖ اَجْمَعِیْنَ فَالْحَمْدُ لِلّٰہِ رَبِّ الْعَالَمِیْنَ',
  'Durood e Naqshbandiya':'اَللّٰہُمَّ اِنَّا نَسْئَلُکَ اَنْ تُصَلِّیَ عَلٰی سَیِّدِنَا مُحَمَّدٍ نِّبْرَاسِ الْاَنْبِیَاءِ وَ نَیِّرِ الْاَوْلِیَآءِ وَ زَبْرِقَانِ الْاَصْفِیَآءِ وَنُوْرِ الثَّقَلَیْنِ وَ ضِیَآءِ الْخَافِقَیْنِ؁',
  'Durood e Khutub':'اَللّٰہُمَّ صَلِّ عَلٰی نُوْرِ الْاَنْوَارِ وَ سِرِّالْاَسْرَارِ وَ تِرْیَاقِ الْاَغْیَارِ سَیِّدِنَا مُحَمَّدِنِ الْمُخْتَارِ وَ اٰلِہِ الْاَطْھَارِ وَ اَصْحَابِہِ الْاَخْیَارِ عَدَدَ نِعَمِ اللّٰہِ وَ اَفْضَالِہٖ؁',
  'Durood e Shazli':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ نِ النُّوْرِ الذَّاتِیِّ السَّارِیْ فِیْ جَمِیْعِ الْاٰثَارِ وَ الْاَسْمَآءِ وَ الصِّفَاتِ وَ عَلٰی اٰلِہٖ وَ صَحْبِہٖ وَ سَلِّمْ',
  'Durood e Deedar':'اَللّٰھُمَّ صَلِّ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَ عَلٰی اٰلِ سَیِّدِنَا مُحَمَّدٍ کَمَا تُحِبُّ وَ تَرْضَیٰ لَہٗ؁',
  'Durood e Razvia':'صَلَّی اللہُ عَلَی النَّبِیِّ الاُمِّیِّ وَ اٰلِہٖ صَلَّی اللہُ عَلَیْہِ وَ سَلَّمَ صَلٰوۃً وَّ سَلاَمًا عَلَیْکَ یَا رَسُوْلَ اللہِ۔'

};


const dua_key=['Saheri','Iftaar','Taraweeh'];
const ashra_key=['Rehamat Ashra','Maghfirat Ashra','Jahannam Najaat'];


const dua_small=<String,String>{
  'Moon Sigth':'اللَّهُمَّ أَهْلِلْهُ عَلَيْنَا بِالْيُمْنِ وَالإِيمَانِ وَالسَّلاَمَةِ وَالإِسْلاَمِ رَبِّي وَرَبُّكَ اللَّهُ',
  'Saheri':'وَبِصَوْمِ غَدٍ نَّوَيْتُ مِنْ شَهْرِ رَمَضَانَ',
  'Iftaar':'اَللّٰهُمَّ اِنَّی لَکَ صُمْتُ وَبِکَ اٰمَنْتُ وَعَلَيْکَ تَوَکَّلْتُ وَعَلٰی رِزْقِکَ اَفْطَرْتُ',
  'Taraweeh':'سُبْحَانَ ذِی الْمُلْکِ وَالْمَلَکُوْتِ ط سُبْحَانَ ذِی الْعِزَّةِ وَالْعَظَمَةِ وَالْهَيْبَةِ وَالْقُدْرَةِ وَالْکِبْرِيَآئِ وَالْجَبَرُوْتِ ط سُبْحَانَ الْمَلِکِ الْحَيِ الَّذِی لَا يَنَامُ وَلَا يَمُوْتُ سُبُّوحٌ قُدُّوْسٌ رَبُّنَا وَرَبُّ الْمَلَائِکَةِ وَالرُّوْحِ ط اَللّٰهُمَّ اَجِرْنَا مِنَ النَّارِ يَا مُجِيْرُ يَا مُجِيْرُ يَا مُجِيْر',
  'Rehamat Ashra':'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغيثُ',
  'Maghfirat Ashra':'اَسْتَغْفِرُ اللہَ رَبِّی مِنْ کُلِّ زَنْبٍ وَّ اَتُوْبُ اِلَیْہِ',
  'Jahannam Najaat':'اَللَّهُمَّ أَجِرْنِي مِنَ النَّارِ',
  'Sab E Qadr':'اَللّٰہُمَّ اِنَّکَ عَفُوّتُحِبُّ الْعَفْوَفَاعْفُ عَنِّ',
  'Ramadaan Dua':
  """● Ae Allah hamri jaban par kalmae tayybah hamesha jari rakh
  
● Ae Allah hame kamil iman naseeb farma aur puri hidayat ataa farma

● Ae Allah hame pure ramadaan neamate ,anvaa va barkat se malamal farma

● Ae Allah ham par apni rehmat najil farma,karam ki barish farma aur rizke halat ataa farma

● Ae Allah hame deene islam ke ehkam par mukammal taur par amal karne vala bana de

● Ae Allah tu hame apna mohataj rakh kisi gair ka mohataj na bana

● Ae Allah hame lailatul qadr naseeb farma

● Ae Allah haje maqbool va mabroor naseeb farma

● Ae Allah hame joth,bughaz va keenah,buraia jagade, fasad se door rakh

● Ae Allah hamse tangdasti khauf ghabhrahat aur karj ke boj ko door farma

● Ae Allah hamare sgeerah aur kabeerah gunaaho ko maaf farma

● Ae Allah humko dajjal ke fitne, shaitan aur nafs ke shar se mafuj rakh

● Ae Allah aurton ko parde ki poori poori pabandi karne ki toufik ataa farma

● Ae Allah har choti badi bimari se hame aur kul momineen va mominaat ko mahfooj rakh

● Ae Allah hame taqwa aur paherejgari ataa farma

● Ae Allah hame huzur e aqdas ﷺ ke pyare tarike par kaym rakh

● Ae Allah hame huzur e aqram ﷺ ki sunnat par chalne ki toufik ataa farma

● Ae Allah  hame kayaamat ke din huzur ﷺ ke hatho se jame kausar naseeb farma

● Ae Allah hame kayamat kee din huzur ﷺ ki shifaat naseeb farma

● Ae Allah tu apni mohabbat aur hamare aqa ﷺ mohabbat hamre dilo mein dalde

● Ae Allah hame maut ki sakhti aur kabr ke ajaab se bachaa

● Ae Allah munkar nakeer ke sawalat aasan farma

● Ae Allah hame kayamat ke roz apna deedar naseeb farma

● Ae Allah hame jannatul firdos me jagah ataa farma

● Ae Allah hame kayam at ki garmi aur jahannum ki aag se mahfuz farma

● Ae Allah hame tamaam momineen va mominaat ko hashr ki rusvayio se bacha

● Ae Allah naam aamal hamre dahine hath me naseeb farma

● Ae Allah apne arsh ke saye me jagah ataa farma

● Ae Allah pul sirrat par bijli ki tarah gujrne ki toufik ataa frama

● Ae Allah hame dono jaha me rasoole paak ﷺ ka gulam banae rakh"""
};

const dua_small_guj=<String,List>{
  'Moon Sigth': ['ચાંદ કો દેખને કી દુઆ', 'ચાંદ કો દેખને કી દુઆ'],
  'Saheri': ['સહેરી', 'નવયતુ અન અસૂમ ગદન લિલ્લાહિ ત્આલા મિન ફર્ઝે રમઝાન હાઝા'],
  'Iftaar': [
    'ઈફ્તાર',
    'અલ્લાહુમ્મા ઈન્ની લક સુમતુ વબિકા આમન્તુ વ અલયક તવક્કલ્તુ વ અલા રિઝકિક અફ્તરતુ ફત કબ્બલ મિન્ની'
  ],
  'Taraweeh': ['તરાવીહ',
    """સુબ્હાનલ મલિકિલ કુદ્દુસ સુબ્હાન ઝિલ્મૂલકી વલ્મલકુત, 
સુબ્હાન ઝીલ્ઈઝઝતી  વલઅઝમતિ વલ્હયબતિ વલ્કુદરતિ વલ્કિબરિયાઈ  વલ્જબરૂત, 
સુબ્હાનલ મલિકીલ હૈય્યીલ્લઝી  લા યનામુ વલા યમુત,
સુબ્બુહુન કુદદુસુન રબ્બુના વરબ્બુલ મલાઈકતિ વરરૂહ, 
અલ્લાહુમ્મા અજીરના મિન્નાર,યા મુજીરુ યા મુજીરુ યા મુજીરુ."""
  ],
  'Rehamat Ashra': ['રેહમત કા અશરાહ', 'રેહમત કા અશરાહ'],
  'Maghfirat Ashra': ['મગફિરત કા અશરાહ', 'મગફિરત કા અશરાહ'],
  'Jahannam Najaat': ['જહન્નમ સે નજાત કા અશરાહ', 'જહન્નમ સે નજાત કા અશરાહ'],
  'Sab E Qadr': [
    'શબેકદ્ર ',
    'અલ્લાહુમ્મા ઇન્ન-ક અફૂવવુન તુહિબ્બુલ અફવ ફઅ-ફૂ અન્ની'
  ],
  'Ramadaan Dua': ['રમઝાન દુઆ'
    , """● અય અલ્લાહ પુરા પુરા ઈમાન અતા ફર્મા

● અય અલ્લાહ જહન્નમ કે અઝાબસે પુરી હિફાઝત ફર્મા

● અય અલ્લાહ જન્નતુલ ફિરદૌસમે જગા અતા ફર્મા

● અય અલ્લાહ તું હમસે રાઝી હોજા

● અય અલ્લાહ તેરે હુકમ પર ચલને વાલા બનાદે

● અય અલ્લાહ પયગમ્બર સલ્લલાહો અલઈહે વ સલ્લમ  કે તરીકે પર ચલના હમેં આસાન ફર્મા

● અય અલ્લાહ ગૈબસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ જૂઠસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ ઇખ્લાસવાલી ઝીંદગી નસીબ ફર્મા

● અય અલ્લાહ મૌત સખ્તીસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ કબ્રકી સખ્તીસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ પુલ-સીરાત પર ચલના આસાન ફર્મા

● અય અલ્લાહ બગર હિસાબ કિતાબ કે જન્નતમેં દાખિલ ફર્મા

● અય અલ્લાહ દુનિયા ઔર આખેરતકી રૂષવાઈસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ દુનિયા ઔર આખેરતકી ભલાઈ નસીબ ફર્મા

● અય અલ્લાહ હલાલ રોઝી અતા ફર્મા

● અય અલ્લાહ તેરે સિવા કિસીકા મોહતાજ ન બના

● અય અલ્લાહ પુરી પુરી પાબંદી નસીબ ફર્મા

● અય અલ્લાહ દજ્જાલકે ફીતનો સે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ દાહને હથમેં આમાલનામાં નસીબ ફર્મા

● અય અલ્લાહ નફ્સકી શરારતસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ હજ્જે બયતુલ્લાહ નસીબ ફર્મા

● અય અલ્લાહ લમ્હા બરાબર ભી દુનિયા કે હવાલે ન કર

● અય અલ્લાહ છોટી બડી બીમારીસે તમામ ઉમ્મતકી હિફાઝત ફર્મા

● અય અલ્લાહ હુઝૂર સલ્લલાહો અલઈહે વ સલ્લમ કે સચ્ચે ઉમ્મતી બના

● અય અલ્લાહ હુઝૂર સલ્લલાહો અલઈહે વ સલ્લમ કે દસ્તે મુબારકસે જામે કૌશર નસીબ ફર્મા

● અય અલ્લાહ હુઝૂર સલ્લલાહો અલઈહે વ સલ્લમ  કી મિન્નત હમારે લિએ કબુલ ફર્મા

● અય અલ્લાહ હમેં તેરી મહોબ્બત વાલી ઝીંદગી નસીબ ફર્મા

● અય અલ્લાહ હસદ સે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ અંબિયા ઔલિયા ઔર મુત્તકી કે સદકે તુફેલ મેં હમારી સારી દુઆએ કબુલ ફર્મા
  """
  ],


};

const mahe_ramadaan_special_dua=
<String,String>{'Ramadaan Dua':"""● Ae Allah hamri jaban par kalmae tayybah hamesha jari rakh
  
● Ae Allah hame kamil iman naseeb farma aur puri hidayat ataa farma

● Ae Allah hame pure ramadaan neamate ,anvaa va barkat se malamal farma

● Ae Allah ham par apni rehmat najil farma,karam ki barish farma aur rizke halat ataa farma

● Ae Allah hame deene islam ke ehkam par mukammal taur par amal karne vala bana de

● Ae Allah tu hame apna mohataj rakh kisi gair ka mohataj na bana

● Ae Allah hame lailatul qadr naseeb farma

● Ae Allah haje maqbool va mabroor naseeb farma

● Ae Allah hame joth,bughaz va keenah,buraia jagade, fasad se door rakh

● Ae Allah hamse tangdasti khauf ghabhrahat aur karj ke boj ko door farma

● Ae Allah hamare sgeerah aur kabeerah gunaaho ko maaf farma

● Ae Allah humko dajjal ke fitne, shaitan aur nafs ke shar se mafuj rakh

● Ae Allah aurton ko parde ki poori poori pabandi karne ki toufik ataa farma

● Ae Allah har choti badi bimari se hame aur kul momineen va mominaat ko mahfooj rakh

● Ae Allah hame taqwa aur paherejgari ataa farma

● Ae Allah hame huzur e aqdas ﷺ ke pyare tarike par kaym rakh

● Ae Allah hame huzur e aqram ﷺ ki sunnat par chalne ki toufik ataa farma

● Ae Allah  hame kayaamat ke din huzur ﷺ ke hatho se jame kausar naseeb farma

● Ae Allah hame kayamat kee din huzur ﷺ ki shifaat naseeb farma

● Ae Allah tu apni mohabbat aur hamare aqa ﷺ mohabbat hamre dilo mein dalde

● Ae Allah hame maut ki sakhti aur kabr ke ajaab se bachaa

● Ae Allah munkar nakeer ke sawalat aasan farma

● Ae Allah hame kayamat ke roz apna deedar naseeb farma

● Ae Allah hame jannatul firdos me jagah ataa farma

● Ae Allah hame kayam at ki garmi aur jahannum ki aag se mahfuz farma

● Ae Allah hame tamaam momineen va mominaat ko hashr ki rusvayio se bacha

● Ae Allah naam aamal hamre dahine hath me naseeb farma

● Ae Allah apne arsh ke saye me jagah ataa farma

● Ae Allah pul sirrat par bijli ki tarah gujrne ki toufik ataa frama

● Ae Allah hame dono jaha me rasoole paak ﷺ ka gulam banae rakh"""};


const mahe_ramadaan_special_dua_guj=<String,String>{'રમઝાન દુઆ': """● અય અલ્લાહ પુરા પુરા ઈમાન અતા ફર્મા

● અય અલ્લાહ જહન્નમ કે અઝાબસે પુરી હિફાઝત ફર્મા

● અય અલ્લાહ જન્નતુલ ફિરદૌસમે જગા અતા ફર્મા

● અય અલ્લાહ તું હમસે રાઝી હોજા

● અય અલ્લાહ તેરે હુકમ પર ચલને વાલા બનાદે

● અય અલ્લાહ પયગમ્બર સલ્લલાહો અલઈહે વ સલ્લમ  કે તરીકે પર ચલના હમેં આસાન ફર્મા

● અય અલ્લાહ ગૈબસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ જૂઠસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ ઇખ્લાસવાલી ઝીંદગી નસીબ ફર્મા

● અય અલ્લાહ મૌત સખ્તીસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ કબ્રકી સખ્તીસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ પુલ-સીરાત પર ચલના આસાન ફર્મા

● અય અલ્લાહ બગર હિસાબ કિતાબ કે જન્નતમેં દાખિલ ફર્મા

● અય અલ્લાહ દુનિયા ઔર આખેરતકી રૂષવાઈસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ દુનિયા ઔર આખેરતકી ભલાઈ નસીબ ફર્મા

● અય અલ્લાહ હલાલ રોઝી અતા ફર્મા

● અય અલ્લાહ તેરે સિવા કિસીકા મોહતાજ ન બના

● અય અલ્લાહ પુરી પુરી પાબંદી નસીબ ફર્મા

● અય અલ્લાહ દજ્જાલકે ફીતનો સે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ દાહને હથમેં આમાલનામાં નસીબ ફર્મા

● અય અલ્લાહ નફ્સકી શરારતસે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ હજ્જે બયતુલ્લાહ નસીબ ફર્મા

● અય અલ્લાહ લમ્હા બરાબર ભી દુનિયા કે હવાલે ન કર

● અય અલ્લાહ છોટી બડી બીમારીસે તમામ ઉમ્મતકી હિફાઝત ફર્મા

● અય અલ્લાહ હુઝૂર સલ્લલાહો અલઈહે વ સલ્લમ કે સચ્ચે ઉમ્મતી બના

● અય અલ્લાહ હુઝૂર સલ્લલાહો અલઈહે વ સલ્લમ કે દસ્તે મુબારકસે જામે કૌશર નસીબ ફર્મા

● અય અલ્લાહ હુઝૂર સલ્લલાહો અલઈહે વ સલ્લમ  કી મિન્નત હમારે લિએ કબુલ ફર્મા

● અય અલ્લાહ હમેં તેરી મહોબ્બત વાલી ઝીંદગી નસીબ ફર્મા

● અય અલ્લાહ હસદ સે હમારી હિફાઝત ફર્મા

● અય અલ્લાહ અંબિયા ઔલિયા ઔર મુત્તકી કે સદકે તુફેલ મેં હમારી સારી દુઆએ કબુલ ફર્મા
  """};

const dua_small_hindi=<String,String>{
  'Moon Sigth':'Allahumma ahlilhu `alainā bil-yumni wal-iman, was-salamati wal-Islam, rabbi wa rabbuk Allah',
  'Saheri':'Wa bisawmi ghadinn nawaiytu min shahri Ramadan',
  'Iftaar':'Allahumma inni laka sumtu wa ala rizq-ika-aftartu',
  'Taraweeh':'Taraweeh in hindi',
  'Rehamat Ashra':'Ya Hayyu Ya Qayyum bi rehmatika astaghees',
  'Maghfirat Ashra' : 'Astagfirullaha rab-bi min kulli zambiyon wa-atoobuilaiyh',
  'Jahannam Najaat':'Allahumma Ajirni minan naar',
  'Sab E Qadr':'Allahumma inna ka afuvvun tuhibbul afava fa fu',

};

var tmp= {"Ramadaan Dua 2": ['રમઝાન દુઆ', """● એ અલ્લાહ હમારી જબન પાર કલમયે તાયબહ હમેશા જરી રાખ
  
એ અલ્લાહ હમે કામિલ ઇમાન નસીબ ફર્મા ઓર પુરી હિદાયત આતા ફર્મા

● એ અલ્લાહ હમે પુરે રામદાન નેમાતે, અનવાર વ બરકત સે મલમલ ફર્મા 

● એ અલ્લાહ હમ પર અપની રેહમત નાજિલ ફર્મા, કરમ કી બરીશ ફર્મા ઓર રિઝકે હલાત આતા ફર્મા

● એ અલ્લાહ હમે દિને ઇસ્લામ કે એહકમ પર મુકમ્મલ તૌર પર અમલ કરને વાલા બના દે

● એ અલ્લાહ તું હમે અપના મોહતાજ રખ કિસી ગૈર કા મોહતાજ ના બનાના

● એ અલ્લાહ હમે લૈલતુલ કદર નસીબ ફર્મા

● એ અલ્લાહ હજે મકબુલ વ મબરૂર નસીબ ફર્મા 

● એ અલ્લાહ હમે જુઢ, બુગઝ વ કીના, બુરાઇ જગડે, ફસાદ સે દૂર રખ

● એ અલ્લાહ હમસે તંગદસ્તિ ખૌફ, ગભરાહત ઓર કરઝ કે બોજ  કો દૂર ફર્મા

● એ અલ્લાહ હમારે શગીર ઓર કબીરહ ગુનાહો કો માફ ફર્મા

● એ અલ્લાહ હમકો દજાલ કે ફીતને,શૈતાન ઔર નફ્સ કે સર સે મહફુજ રખ

● એ અલ્લાહ ઓરતો કો પરદે કી પુરી પુરી  પાબંડી કરને કી તોફીક  અતા ફર્મા

● એ અલ્લાહ હર છોટી બડી બિમારી સે હમે ઓર કુલ મોમિનિન વ મોમીનાત કો મહફૂજ રખ

● એ અલ્લાહ હમે તક્વા ઓર પહેરેજગારી અતા ફાર્મા

● એ અલ્લાહ હમે હઝુર એ અકદાસ ﷺ કે પ્યાર તરીકે પર કાયમ રખ

● એ અલ્લાહ હમે હઝુર એ અકરમ ﷺ કી સુન્નત પર ચલને  કી તૌફીક અતા ફર્મા

● એ અલ્લાહ હમે ક્યામત કે દિન હઝુર ﷺ કે હાથો સે  ઝામ એ  કૌસર નસીબ ફર્મા

● એ અલ્લાહ હમે ક્યામત કી દિન હઝુર ﷺ કી  શફાઅત નસીબ ફર્મા

● એ અલ્લાહ તૂ અપની મોહબ્બત ઓર હમારે આકા ﷺ મોહબ્બત હમારે દિલો મેં દાલ દે

● એ અલ્લાહ હમે ક્યામત કે રોઝ અપના દીદાર નસીબ ફર્મા

● એ અલ્લાહ હમે જન્નતુલ ફિરદૌસ મે જગાહ અતા ફર્મા

● એ અલ્લાહ હમે કયામત કી ગર્મી  ઓર  જહાન્નુમ કી આગ સે મહફુઝ ફર્મા

● એ અલ્લાહ હમે ઓર તમામ  મોમિનિન વ મોમીનાત કો હશ્ર કી રુસવાયીઓ સે બચા

● એ અલ્લાહ નામ એ આમલ હમારે દાહિને હાથ મેં નસીબ ફર્મા

● એ અલ્લાહ અપને અર્શ કે સાએમે જાગહ અતા ફર્મા

● એ અલ્લાહ પુલ સિરાત પર બીજલી કી તરહ ગુર્ઝરને કી તૌફીક અતા ફર્મા

● એ અલ્લાહ હમે દોનો જહામે રસૂલ એ પાક ﷺ કા ગુલામ બના  કે રખ 
  """
]};

