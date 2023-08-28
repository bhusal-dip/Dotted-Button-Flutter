part of "dotted_button.dart";

class _decoration {
  final BorderType? borderType;
  final dynamic borderRadius;
  final Color? borderColor;
  final Color? color;
  final List<BoxShadow>? boxShadow;

  _decoration({
    this.borderType,
    this.borderRadius,
    this.borderColor,
    this.color,
    this.boxShadow,
  });

  Decoration decoration() {
    switch (borderType) {
      case BorderType.Circle:
        return BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Colors.lightBlue,
          border: Border.all(
            color: borderColor ?? color ?? Colors.lightBlue,
            width: borderColor != null ? 1 : 0,
          ),
          boxShadow: boxShadow,
        );
      case BorderType.RRect:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color ?? Colors.lightBlue,
          border: Border.all(
            color: borderColor ?? color ?? Colors.lightBlue,
            width: borderColor != null ? 1 : 0,
          ),
          boxShadow: boxShadow,
        );
      case BorderType.Oval:
        return BoxDecoration(
          borderRadius: BorderRadius.all(borderRadius),
          color: color ?? Colors.lightBlue,
          border: Border.all(
            color: borderColor ?? color ?? Colors.lightBlue,
            width: borderColor != null ? 1 : 0,
          ),
          boxShadow: boxShadow,
        );
      default:
        return BoxDecoration(
          color: color ?? Colors.lightBlue,
          border: Border.all(
            color: borderColor ?? color ?? Colors.lightBlue,
            width: borderColor != null ? 1 : 0,
          ),
          boxShadow: boxShadow,
        );
    }
  }
}
