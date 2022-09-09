class ContentCardData {
  final String creatorName;
  final String origin;
  final String originUrl;
  final double nbElements;
  final DateTime uploadDate;

  late String avatar;

  ContentCardData(
      {required this.creatorName,
      required this.origin,
      required this.originUrl,
      required this.nbElements,
      required this.uploadDate});
}
