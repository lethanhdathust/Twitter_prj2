import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/constants/appwrite_constants.dart';
//This can create a global variable, give us "ref" to use to read other 
// providers and write some logic

final appwriteClientProvider = Provider(
  (ref) {
    Client client = Client();
    return client
        .setEndPointRealtime(AppWriteConstants.endPoint)
        .setProject(AppWriteConstants.projectId)
        .setSelfSigned(status: true);
  },
);
final appwriteAccountProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider); 
  
  return Account(client);
});