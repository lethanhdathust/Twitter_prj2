import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/theme/pallete.dart';

class ExploreVIew extends ConsumerStatefulWidget {
  const ExploreVIew({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreVIewState();
}

class _ExploreVIewState extends ConsumerState<ExploreVIew> {
  final SearchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    SearchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarTextFieldBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Pallete.searchBarColor,
        ));

    return Scaffold(
      appBar: AppBar(
// ở đây cta tạo vùng tìm kiếm cho chức năng tìm kiếm của appbar
//

        title: SizeBox(
          height: 50,
          child: TextField(
            controller: SearchController,
            decoration: InputDecoration(
                 contentPadding: const EdgeInsets.all(10).copyWith(
                  left: 20,
                ),
                fillColor: Pallete.searchBarColor,
                filled: true,
                enabledBorder: appBarTextFieldBorder,
                focusedBorder: appBarTextFieldBorder,
                hintText: "Search Twitter",
          ),
        ),
      ),
      ),
    );
  }
}
