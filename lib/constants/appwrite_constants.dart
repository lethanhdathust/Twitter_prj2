class AppWriteConstants {
  static const String databaseId = '648be249952b4dbe93df';
  static const String projectId = '6475c578c282cf7b9e0e';
  static const String usersCollection = '64a92473afc9b31e9ddd';

  static const String endPoint = 'https://cloud.appwrite.io/v1';
  static const String tweetsCollection = '64b381ac697f8125cc05';
  static const String imagesBucket = '64b3bd71999dad0c8d19';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
  //sửa 3 cái cuối
}
// https://cloud.appwrite.io/v1/storage/buckets/64b3bd71999dad0c8d19/files/64b3bf97928e73e50444/view?project=6475c578c282cf7b9e0e&mode=admin