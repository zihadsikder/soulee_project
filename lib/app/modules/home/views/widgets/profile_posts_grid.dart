import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ProfilePostsGrid extends StatelessWidget {
  final TabController tabController;

  const ProfilePostsGrid({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: TabBarView(
        controller: tabController,
        children: [
          _buildPostsGrid(),
          _buildVideosGrid(),
          _buildSavedGrid(),
        ],
      ),
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(1),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 15,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.snackbar('Post', 'Viewing post #${index + 1}');
          },
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/500/500?random=$index',
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey.shade300,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey.shade300,
              child: const Icon(Icons.error),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVideosGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(1),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.snackbar('Video', 'Playing video #${index + 1}');
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: 'https://picsum.photos/500/500?random=${index + 100}',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.error),
                ),
              ),
              const Positioned(
                right: 8,
                top: 8,
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSavedGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(1),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.snackbar('Saved', 'Viewing saved item #${index + 1}');
          },
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/500/500?random=${index + 200}',
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey.shade300,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey.shade300,
              child: const Icon(Icons.error),
            ),
          ),
        );
      },
    );
  }
}
