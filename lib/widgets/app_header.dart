import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imagePath;

  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(size);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: responsive.hp(2), // 2% tinggi layar
        horizontal: responsive.wp(5), // 5% lebar layar
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imagePath != null)
            Container(
              width: responsive.wp(12),
              height: responsive.wp(12),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          SizedBox(width: responsive.wp(4)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: responsive.sp(20), // ukuran teks responsif
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent.shade700,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: responsive.sp(14),
                      color: Colors.grey.shade700,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
