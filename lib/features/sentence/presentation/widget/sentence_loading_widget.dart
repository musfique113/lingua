import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SentenceLoadingWidget extends StatelessWidget {
  const SentenceLoadingWidget({super.key});

  Widget _buildTagPlaceholder({double width = 60}) {
    return Container(
      width: width,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildTranslationPlaceholder() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 66, width: 200, color: Colors.white),
          const SizedBox(height: 8),
          Container(height: 16, width: 120, color: Colors.white),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 88,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildTagPlaceholder(width: 50),
                const SizedBox(width: 8),
                _buildTagPlaceholder(width: 80),
                const SizedBox(width: 8),
                _buildTagPlaceholder(width: 60),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => _buildTranslationPlaceholder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
