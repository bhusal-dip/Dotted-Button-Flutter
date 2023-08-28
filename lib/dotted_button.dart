library dotted_button;

import 'package:dotted_button/dash_path.dart';
import 'package:flutter/material.dart';

part "box_decoration.dart";
part "border_painter.dart";

class DottedButton extends StatelessWidget {
  /// Called when the user taps this part of the [material]
  final VoidCallback? onTap;

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// The height of the button default to 48 px.
  final double? height;

  /// The width of the button default to double.maxFinite.
  final double? width;

  /// Align the [child] within the container.
  ///
  /// If non-null, the container will expand to fill its parent and position its
  /// child within itself according to the given value. If the incoming
  /// constraints are unbounded, then the child will be shrink-wrapped instead.
  ///
  /// Ignored if [child] is null.
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final Alignment? alignment;

  /// Empty space to inscribe inside the [button]. Affecting the [child], if any, is
  /// placed inside this padding.
  final EdgeInsets? padding;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsets? margin;

  /// The color to paint behind the [child].
  ///
  /// This property should be preferred when the background is not a default blue.
  final Color? color;

  /// The color to paint for the [dashBorder].
  ///
  /// This property should be preferred for the border dash not related to the button border property.
  final Color? dashColor;

  /// This property should be preferred when the borderColor is not a default blue.
  final Color? borderColor;

  /// If null, the corners of this button are rounded by 10px.
  ///
  /// This is applicable for the material that are defined as [BorderType.Circle], [BorderType.Oval], [BorderType.RRect].
  final double? borderRadius;

  /// A list of shadows cast by this box behind the box.
  ///
  /// The shadow follows the [shape] of the box.
  ///
  /// See also:
  ///
  ///  * [kElevationToShadow], for some predefined shadows used in Material
  ///    Design.
  ///  * [PhysicalModel], a widget for showing shadows.
  final List<BoxShadow>? boxShadow;

  /// The dotted border width.
  final double strokeWidth;

  /// List of pattern value to be drawn for the dotted border which is in the format of [dash], [space].
  final List<double> dashPattern;

  /// Type of the border for the given button.
  final BorderType borderType;

  /// Creates a custom button.
  ///
  /// Has default
  /// [dimension] : 48x390
  /// with Center alignment
  /// with borderRadius: 10px
  ///
  /// Add a dotted border around any [child] widget. The [strokeWidth] property
  /// defines the width of the dashed border and [dashColor] determines the stroke
  /// paint color. [CircularIntervalList] is populated with the [dashPattern] to
  /// render the appropriate pattern. The [borderRadius] property is taken into account
  /// only if the [borderType] is [BorderType.RRect].
  const DottedButton({
    super.key,
    this.onTap,
    required this.child,
    this.dashPattern = const <double>[3, 1],
    this.strokeWidth = 1,
    this.height = 48,
    this.width,
    this.alignment,
    this.padding,
    this.margin,
    this.color,
    this.dashColor,
    this.borderColor,
    this.borderRadius = 10,
    this.boxShadow,
    this.borderType = BorderType.Rect,
  });

  @override
  Widget build(BuildContext context) {
    return customButton();
  }

  Widget customButton() {
    double? changedWidth = width;
    double? changedHeight = height;
    dynamic changedBorderRadius = borderRadius;

    switch (borderType) {
      case BorderType.Oval:
        if (width != null) {
          if (changedWidth! < 1.3 * height!) {
            changedWidth = 1.3 * height!;
          }
        } else {
          changedWidth = 1.5 * height!;
        }
        changedBorderRadius = Radius.elliptical(changedWidth, height!);

        break;
      case BorderType.Rect:
        changedBorderRadius = null;
        break;
      case BorderType.RRect:
        changedBorderRadius = borderRadius;
        break;
      case BorderType.Circle:
        if (height! > width!) {
          changedHeight = width;
        } else {
          changedWidth = height;
        }
        break;
      default:
        changedBorderRadius = null;
    }
    return InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: _BorderPainter(
                  strokeWidth: strokeWidth,
                  color: dashColor ?? Colors.black,
                  borderType: borderType,
                  radius: borderType == BorderType.RRect
                      ? Radius.circular(borderRadius!)
                      : null,
                  dashPattern: dashPattern,
                ),
              ),
            ),
            Container(
              alignment: alignment ?? Alignment.center,
              height: changedHeight,
              width: changedWidth,
              padding: padding,
              margin: margin,
              decoration: _decoration(
                borderType: borderType,
                borderColor: borderColor,
                borderRadius: changedBorderRadius,
                color: color,
                boxShadow: boxShadow,
              ).decoration(),
              child: child,
            ),
          ],
        ));
  }

  /// Compute if [dashPattern] is valid. The following conditions need to be met
  /// * Cannot be null or empty
  /// * If [dashPattern] has only 1 element, it cannot be 0
  bool _isValidDashPattern(List<double>? dashPattern) {
    Set<double>? _dashSet = dashPattern?.toSet();
    if (_dashSet == null) return false;
    if (_dashSet.length == 1 && _dashSet.elementAt(0) == 0.0) return false;
    if (_dashSet.length == 0) return false;
    return true;
  }
}

//Types of the border
enum BorderType { Circle, RRect, Rect, Oval }
