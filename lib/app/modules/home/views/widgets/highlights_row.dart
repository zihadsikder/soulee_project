import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class HighlightsRow extends StatelessWidget {
  const HighlightsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildHighlightItem('Travel', 'https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          _buildHighlightItem('Food', 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          _buildHighlightItem('Art', 'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          _buildHighlightItem('Music', 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
          _buildHighlightItem('Nature', 'https://images.unsplash.com/photo-1501854140801-50d01698950b?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
        ],
      ),
    );
  }

  Widget _buildHighlightItem(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          Get.snackbar(
            title,
            'Viewing $title highlights',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFFF5A60),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: Color(0xFFFF5A60),
                      strokeWidth: 2,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
