import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FulanoButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Function? onTap;
  final FulanoButtonStyle style;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double fontSize;
  final double borderWidth;
  final double borderRadius;

  const FulanoButton({
    Key? key,
    this.label = "",
    this.icon,
    this.onTap,
    this.style = FulanoButtonStyle.standard,
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.padding = const EdgeInsets.all(16),
    this.fontSize = 14,
    this.borderWidth = 2,
    this.borderRadius = 4,
  }) : super(key: key);

  FulanoButton copyWith({
    String? label,
    IconData? icon,
    Function? onTap,
    FulanoButtonStyle? style,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? fontSize,
    double? borderWidth,
    double? borderRadius,
  }) =>
      FulanoButton(
        key: key,
        label: label ?? this.label,
        icon: icon ?? this.icon,
        onTap: onTap ?? this.onTap,
        style: style ?? this.style,
        margin: margin ?? this.margin,
        padding: padding ?? this.padding,
        fontSize: fontSize ?? this.fontSize,
        borderWidth: borderWidth ?? this.borderWidth,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          width: borderWidth,
          color: style.borderColor,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: GestureDetector(
          onTap: () {
            if (!(_disableByState(['loading', 'disabled']))) {
              onTap?.call();
            }
          },
          child: Builder(
            builder: (ctxButton) => _buildButtonContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String label) {
    return Text(
      label,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: GoogleFonts.montserrat(
        color: style.labelColor,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildIcon(IconData? icon) {
    return Icon(
      icon,
      size: fontSize + 4,
      color: ColorsTheme.shadesOfLight[100],
    );
  }

  Widget _buildIndicator() {
    return Center(
      child: SizedBox(
        width: fontSize + 3,
        height: fontSize + 3,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            style.labelColor,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    Widget child;
    if (_disableByState(['loading'])) {
      child = _buildIndicator();
    } else {
      child = SizedBox(
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (icon != null) ...{
              Flexible(
                flex: 1,
                child: _buildIcon(icon),
              ),
              const SizedBox(width: 4),
            },
            Flexible(
              flex: 6,
              child: _buildText(label),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: style.backgroundColor,
      ),
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: child,
          ),
        ],
      ),
    );
  }

  bool _disableByState(List<String> disableContains) {
    return disableContains
        .map((e) => style.toString().toLowerCase().contains(e.toLowerCase()))
        .toList()
        .join(',')
        .contains('true');
  }
}

enum FulanoButtonStyle {
  standard(
    borderColor: Colors.transparent,
    labelColor: ColorsTheme.shadesOfLight100,
    backgroundColor: ColorsTheme.primaryColorMain,
  ),
  standardSuccess(
    borderColor: Colors.transparent,
    labelColor: ColorsTheme.shadesOfLight100,
    backgroundColor: ColorsTheme.successColor,
  ),
  standardWarning(
    borderColor: Colors.transparent,
    labelColor: ColorsTheme.shadesOfLight100,
    backgroundColor: ColorsTheme.warningColor,
  ),
  standardDanger(
    borderColor: Colors.transparent,
    labelColor: ColorsTheme.shadesOfLight100,
    backgroundColor: ColorsTheme.dangerColor,
  ),
  standardOutline(
    borderColor: ColorsTheme.primaryColorMain,
    labelColor: ColorsTheme.primaryColorMain,
    backgroundColor: Colors.transparent,
  ),
  successOutline(
    borderColor: ColorsTheme.successColor,
    labelColor: ColorsTheme.successColor,
    backgroundColor: Colors.transparent,
  ),
  warningOutline(
    borderColor: ColorsTheme.warningColor,
    labelColor: ColorsTheme.warningColor,
    backgroundColor: Colors.transparent,
  ),
  dangerOutline(
    borderColor: ColorsTheme.dangerColor,
    labelColor: ColorsTheme.dangerColor,
    backgroundColor: Colors.transparent,
  ),
  loading(
    borderColor: Colors.transparent,
    labelColor: ColorsTheme.shadesOfLight100,
    backgroundColor: ColorsTheme.primaryColorMain,
  ),
  loadingSuccess(
    borderColor: ColorsTheme.successColor,
    labelColor: ColorsTheme.shadesOfLight100,
    backgroundColor: ColorsTheme.successColor,
  ),
  loadingWarning(
    borderColor: ColorsTheme.warningColor,
    labelColor: ColorsTheme.shadesOfLight100,
    backgroundColor: ColorsTheme.warningColor,
  ),
  loadingDanger(
    borderColor: ColorsTheme.dangerColor,
    labelColor: ColorsTheme.shadesOfLight100,
    backgroundColor: ColorsTheme.dangerColor,
  ),
  loadingOutline(
    borderColor: ColorsTheme.primaryColorMain,
    labelColor: ColorsTheme.primaryColorMain,
    backgroundColor: Colors.transparent,
  ),
  loadingOutlineSuccess(
    borderColor: ColorsTheme.successColor,
    labelColor: ColorsTheme.successColor,
    backgroundColor: Colors.transparent,
  ),
  loadingOutlineDanger(
    borderColor: ColorsTheme.dangerColor,
    labelColor: ColorsTheme.dangerColor,
    backgroundColor: Colors.transparent,
  ),
  loadingOutlineWarning(
    borderColor: ColorsTheme.warningColor,
    labelColor: ColorsTheme.warningColor,
    backgroundColor: Colors.transparent,
  ),
  link(
    borderColor: Colors.transparent,
    labelColor: ColorsTheme.primaryColorMain,
    backgroundColor: Colors.transparent,
  ),
  disabled(
    borderColor: ColorsTheme.shadesOfLight500,
    labelColor: ColorsTheme.shadesOfDark200,
    backgroundColor: ColorsTheme.shadesOfLight500,
  );

  final Color borderColor;
  final Color labelColor;
  final Color backgroundColor;

  const FulanoButtonStyle({
    this.borderColor = ColorsTheme.primaryColorMain,
    this.labelColor = ColorsTheme.shadesOfLight100,
    this.backgroundColor = ColorsTheme.primaryColorMain,
  });
}

class ColorsTheme {
  static const Color primaryColor = Color(0xFF0286D1);

  static const Color primaryColorMain = primaryColor;

  static const Color primaryOutlineColor = primaryColor;

  static const Color primaryColorLighter = Color(0xFF02C2EF);

  static const Color primaryColorLight = Color(0xFFE1EEF8);

  static const Color primaryColorDarker = Color(0xFF0047A5);

  static const Color _secondaryColor = Color(0xFFA66DD4);

  static const Color secondaryColor = _secondaryColor;

  static const Color _suffixTextFieldIconColor = Color(0xFF6C6C6F);

  static const Color suffixTextFieldIconColor = _suffixTextFieldIconColor;

  static const Color successColor = Color(0xFF23C653);
  static const Color warningColor = Color(0xFFEFB52D);
  static const Color dangerColor = Color(0xFFFF4539);
  static const CustomColorScheme colorScheme = CustomColorScheme(
    primary: primaryColor,
    secondary: _secondaryColor,
    success: Color(0xFF23C653),
    warning: Color(0xFFEFB52D),
    danger: Color(0xFFFF4539),
  );

  static const Color backgroundColor = Color(0xFFF7F7F7);

  static const ColorSwatch<int> gray = ColorSwatch<int>(50, {
    50: gray50,
    100: gray100,
    200: gray200,
    300: gray300,
    400: gray400,
    800: gray800,
  });
  static const Color gray50 = Color(0xFFD6D6D6);
  static const Color gray100 = Color(0xFFF2F2F5);
  static const Color gray200 = Color(0xFF8E90A6);
  static const Color gray300 = Color(0xFF555770);
  static const Color gray400 = Color(0xFFEBEBF0);
  static const Color gray800 = Color(0xFF555555);

  static const ColorSwatch<int> shadesOfLight = ColorSwatch<int>(100, {
    100: shadesOfLight100,
    200: shadesOfLight200,
    300: shadesOfLight300,
    400: shadesOfLight400,
    500: shadesOfLight500,
  });
  static const Color shadesOfLight100 = Color(0xFFFFFFFF);
  static const Color shadesOfLight200 = Color(0xFFFAFAFC);
  static const Color shadesOfLight300 = Color(0xFFF2F2F5);
  static const Color shadesOfLight400 = Color(0xFFEBEBF0);
  static const Color shadesOfLight500 = Color(0xFFE3E4EB);

  static const ColorSwatch<int> shadesOfDark = ColorSwatch<int>(100, {
    100: shadesOfDark100,
    200: shadesOfDark200,
    300: shadesOfDark300,
    400: shadesOfDark400,
    500: shadesOfDark500,
  });
  static const Color shadesOfDark100 = Color(0xFFC7C8D9);
  static const Color shadesOfDark200 = Color(0xFF8E90A6);
  static const Color shadesOfDark300 = Color(0xFF555770);
  static const Color shadesOfDark400 = Color(0xFF28293D);
  static const Color shadesOfDark500 = Color(0xFF000000);

  static const ColorSwatch<int> shadesOfGray = ColorSwatch<int>(600, {
    100: shadesOfLight100,
    200: shadesOfLight200,
    300: shadesOfLight300,
    400: shadesOfLight400,
    500: shadesOfLight500,
    600: shadesOfDark100,
    700: shadesOfDark200,
    800: shadesOfDark300,
    900: shadesOfDark400,
    1000: shadesOfDark500,
  });
}

class CustomColorScheme with Diagnosticable {
  final Color primary;
  final Color secondary;
  final Color danger;
  final Color warning;
  final Color success;

  const CustomColorScheme({
    required this.primary,
    required this.secondary,
    required this.danger,
    required this.warning,
    required this.success,
  });
}
