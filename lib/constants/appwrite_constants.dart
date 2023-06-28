class AppWriteConstants {
  static const String databaseId = '64363053c4701f5c7238';
  static const String projectId = '64362cad980bce03b019';
  static const String usersCollection = '63cb8ae73960973b0635';

  static const String endPoint = 'http://localhost:8001/v1';
  static const String tweetsCollection = '63cbd6781a8ce89dcb95';
  static const String imagesBucket = '63cbdab48cdbccb6b34e';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
  //sửa 3 cái cuối
}
