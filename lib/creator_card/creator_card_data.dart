import 'package:shareleaks/creator_card/creator_card.dart';

class CreatorCardData {
  final String creatorName;
  final int nbSets;

  late DateTime lastUpdated;
  late String avatar;

  CreatorCardData({required this.creatorName, required this.nbSets}) {
    lastUpdated = DateTime.now();
    avatar = 'assets/card-sample-image-2.jpg';
  }

  CreatorCardData.creatorCardDataWithAvatar({required this.creatorName, required this.nbSets, required this.avatar}) {
    lastUpdated = DateTime.now();
  }
}
