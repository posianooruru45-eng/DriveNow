import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// A selectable category filter chip used on Home and Cars screens.
class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: selected,
      onSelected: (_) => onTap?.call(),
      label: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFF444444),
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
      backgroundColor: const Color(0xFFF0F4F8),
      selectedColor: AppTheme.primary,
      checkmarkColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: selected ? AppTheme.primary : const Color(0xFFDEE2E6),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    );
  }
}