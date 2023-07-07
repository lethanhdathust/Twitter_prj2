class AppWriteConstants {
  static const String databaseId = '648be249952b4dbe93df';
  static const String projectId = '6475c578c282cf7b9e0e';
  static const String usersCollection = '63cb8ae73960973b0635';

  static const String endPoint = 'https://cloud.appwrite.io/v1';
  static const String tweetsCollection = '63cbd6781a8ce89dcb95';
  static const String imagesBucket = '63cbdab48cdbccb6b34e';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
  //sửa 3 cái cuối
}
