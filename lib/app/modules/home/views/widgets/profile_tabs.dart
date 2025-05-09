import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  final TabController tabController;

  const ProfileTabs({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: Color(0xFFFF5A60),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: const [
        Tab(icon: Icon(Icons.grid_on)),
        Tab(icon: Icon(Icons.video_library)),
        Tab(icon: Icon(Icons.bookmark_border)),
      ],
    );
  }
}
