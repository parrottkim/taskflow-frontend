import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.jpg',
                alignment: Alignment.bottomRight,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff304352),
                    Color(0xffd7d2cc).withValues(alpha: 0.2),
                  ],
                  stops: [0, 1],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 24.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'DAN-Tech',
                            style: textTheme.headlineLarge?.copyWith(
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                              height: 1.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'We make it simple',
                            style: textTheme.titleMedium?.copyWith(
                              fontFamily: 'Archivo',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            'We provide technologies and services that maximize performance and ease of use for vehicle diagnostic and inspection systems.',
                            style: textTheme.bodyLarge?.copyWith(
                              fontFamily: 'Archivo',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.0),
                    SvgPicture.asset(
                      'assets/icons/dantech_ci_dark.svg',
                      width: 64.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
