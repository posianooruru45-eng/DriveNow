import 'package:flutter/material.dart';

/// A reusable section heading used above lists/grids on multiple screens.
///
/// Renders a bold title with an optional subtitle underneath.
class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.title,
    this.subtitle,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final String? subtitle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
          textAlign: textAlign,
        ),
        if (subtitle != null && subtitle!.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            subtitle!,
            style: textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF6C757D),
            ),
            textAlign: textAlign,
          ),
        ],
      ],
    );
  }
}