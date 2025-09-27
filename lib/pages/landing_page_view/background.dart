import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

class GlassmorphismBackground extends StatefulWidget {
  final bool isDarkMode;

  const GlassmorphismBackground({Key? key, required this.isDarkMode})
      : super(key: key);

  @override
  _GlassmorphismBackgroundState createState() =>
      _GlassmorphismBackgroundState();
}

class _GlassmorphismBackgroundState extends State<GlassmorphismBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Blob> _blobs;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();
    _blobs = List.generate(5, (index) => Blob.random());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            CustomPaint(
              size: Size.infinite,
              painter: BlobPainter(
                blobs: _blobs,
                progress: _controller.value,
                isDarkMode: widget.isDarkMode,
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color:
                    Colors.black.withOpacity(0), // required for BackdropFilter
              ),
            ),
          ],
        );
      },
    );
  }
}

class Blob {
  final Offset position;
  final double radius;
  final Color color;

  Blob({required this.position, required this.radius, required this.color});

  factory Blob.random() {
    final random = Random();
    return Blob(
      position:
          Offset(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1),
      radius: random.nextDouble() * 100 + 50,
      color: Color.fromARGB(
        150,
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      ),
    );
  }
}

class BlobPainter extends CustomPainter {
  final List<Blob> blobs;
  final double progress;
  final bool isDarkMode;

  BlobPainter(
      {required this.blobs, required this.progress, required this.isDarkMode});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..blendMode = BlendMode.overlay;
    final center = size.center(Offset.zero);

    for (var blob in blobs) {
      final offset = Offset(
        center.dx + blob.position.dx * size.width / 4 * sin(progress * 2 * pi),
        center.dy + blob.position.dy * size.height / 4 * cos(progress * 2 * pi),
      );

      final gradient = RadialGradient(
        colors: [
          blob.color.withOpacity(0.8),
          blob.color.withOpacity(0.2),
        ],
      );

      paint.shader = gradient
          .createShader(Rect.fromCircle(center: offset, radius: blob.radius));

      canvas.drawCircle(offset, blob.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
