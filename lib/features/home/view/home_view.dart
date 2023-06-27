// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:twitter_clone/constants/uiconstants.dart';
// import 'package:twitter_clone/features/tweet/views/create_tweet_view.dart';
// import 'package:twitter_clone/theme/pallete.dart';

// class HomeView extends StatefulWidget {
//   static route() => MaterialPageRoute(
//         builder: (context) => const HomeView(),
//       );
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int _page = 0;
//   final appBar = UIConstants.appBar();

//   void onPageChange(int index) {
//     setState(() {
//       _page = index;
//     });
//   }

//   onCreateTweet() {
//     Navigator.push(context, CreateTweetScreen.route());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _page == 0 ? appBar : null,
//       body: IndexedStack(
//         index: _page,
//         children: UIConstants.bottomTabBarPages,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: onCreateTweet,
//       ),
//       drawer: const SideDrawer(),
//       bottomNavigationBar: CupertinoTabBar(
//         currentIndex: _page,
//         onTap: onPageChange,
//         backgroundColor: Pallete.backgroundColor,
//         items: [
//           BottomNavigationBarItem(),
//           BottomNavigationBarItem(),
//           BottomNavigationBarItem(),
//         ],
//       ),
//     );
//   }
// }
