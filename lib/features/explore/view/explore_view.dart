import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreVIew extends ConsumerStatefulWidget {
  const ExploreVIew({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExploreVIewState();
}

class _ExploreVIewState extends ConsumerState<ExploreVIew> {
  final SearchController = Text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizeBox(height: 50,
        child: TextField(
        controller: ,
        )
      ),
    );
  }
}
