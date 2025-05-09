import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ProfilePostsGridNew extends StatelessWidget {
  final TabController tabController;

  const ProfilePostsGridNew({
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
    // List of image URLs for the grid
    final List<String> imageUrls = [
      'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1496440737103-cd596325d314?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1527736947477-2790e28f3443?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1513379733131-47fc74b45fc7?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(1),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.snackbar(
              'Post',
              'Viewing post #${index + 1}',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrls[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFFF5A60),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.error),
                ),
              ),
              // Add a small red dot in the corner for posts with new content
              if (index % 3 == 0)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF5A60),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
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
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.snackbar(
              'Video',
              'Playing video #${index + 1}',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: 'https://images.unsplash.com/photo-1496440737103-cd596325d314?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFFF5A60),
                    ),
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
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.snackbar(
              'Saved',
              'Viewing saved item #${index + 1}',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: CachedNetworkImage(
            imageUrl: 'https://images.unsplash.com/photo-1513379733131-47fc74b45fc7?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: Colors.grey.shade300,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFF5A60),
                ),
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
