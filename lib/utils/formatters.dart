/// Utility formatting helpers used across the DriveNow app.
class Formatters {
  Formatters._();

  /// Format an integer price in UGX with thousands separators.
  ///
  /// Example: `120000` â†’ `"UGX 120,000"`
  static String formatPrice(int amount) {
    final String s = amount.toString();
    final StringBuffer result = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) {
        result.write(',');
      }
      result.write(s[i]);
    }
    return 'UGX ${result.toString()}';
  }

  /// Format a price-per-day string, e.g. `"UGX 120,000 / day"`.
  static String formatPricePerDay(int amount) => '$formatPrice(amount) / day';

  /// Format a [DateTime] as "dd MMM yyyy", e.g. "21 Oct 2026".
  static String formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  /// Format a [DateTime] as a short weekday, e.g. "Wed".
  static String formatWeekday(DateTime date) {
    const weekdays = [
      'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
    ];
    return weekdays[date.weekday - 1];
  }
}