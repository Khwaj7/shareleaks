class CreatorCardData {
  final String creatorName;
  final double nbSets;

  late DateTime lastUpdated;

  CreatorCardData({required this.creatorName, required this.nbSets}) {
    lastUpdated = DateTime.now();
  }
}
