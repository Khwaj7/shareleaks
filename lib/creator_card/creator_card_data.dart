import 'package:firebase_database/firebase_database.dart';

class CreatorCardData {
  final String creatorName;
  final int nbSets;
  final List<String> origins = [];

  late Object sets;
  late DateTime lastUpdated;
  late String avatar;

  // never used
  CreatorCardData({required this.creatorName, required this.nbSets}) {
    lastUpdated = DateTime.now();
    avatar = 'assets/card-sample-image-2.jpg';
  }

  // always used
  CreatorCardData.creatorCardDataWithAvatar(
      {required this.creatorName, required this.nbSets, required this.avatar}) {
    lastUpdated = DateTime.now();
    sets = [];

    // TODO : alimenter origins avec les sources de chaque set du créateur en cours
    DatabaseReference ref = FirebaseDatabase.instance.ref("creators/");
  }

  CreatorCardData.creatorCardDataComplete({
    required this.creatorName, required this.nbSets, required this.avatar, required this.lastUpdated, required this.sets
  })
}
