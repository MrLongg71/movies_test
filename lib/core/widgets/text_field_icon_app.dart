import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/app_colors.dart';
import '../themes/typography.dart';

class TextFieldIconApp extends StatefulWidget {
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final VoidCallback? onFocus;
  final TextEditingController? controller;
  final String? text;
  final String? errText;
  final String? counterText;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool enable;
  final bool autoFocus;
  final bool showPrefixSearchIcon;
  final bool showActionBack;
  final bool enableInteractiveSelection;
  final Color inputColor;
  final String placeholder;
  final Widget? prefixIcon;
  final List<Widget>? suffixIcon;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onClearText;
  final void Function()? onBackPress;
  final TextInputType? inputType;
  final double? height;
  final Color borderColor;
  final double paddingHeight;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final String obscuringCharacter;
  final Color cursorColor;
  final String? labelText;
  final bool isRequired;
  final double radius;
  final TextStyle? styleContent;
  final TextCapitalization? textCapitalization;

  const TextFieldIconApp({
    super.key,
    this.focusNode,
    this.controller,
    this.onTap,
    this.onFocus,
    this.text,
    this.errText,
    this.counterText,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.readOnly = false,
    this.enable = true,
    this.autoFocus = false,
    this.showPrefixSearchIcon = false,
    this.showActionBack = false,
    this.enableInteractiveSelection = true,
    this.inputColor = AppColors.borderColor,
    this.borderColor = AppColors.neutralCaptionColor,
    this.placeholder = '',
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.onClearText,
    this.onBackPress,
    this.inputType,
    this.paddingHeight = 12,
    this.textAlign = TextAlign.left,
    this.height,
    this.inputFormatters,
    this.cursorColor = AppColors.primaryColor,
    this.labelText,
    this.isRequired = false,
    this.radius = 8,
    this.styleContent,
    this.textCapitalization,
  });

  @override
  TextFieldIconAppState createState() => TextFieldIconAppState();
}

class TextFieldIconAppState extends State<TextFieldIconApp> {
  late Widget _clearIcon;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _clearIcon = InkWell(
      onTap: () {
        setState(() {
          _controller.clear();
          if (widget.onClearText != null) {
            widget.onClearText!();
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 8,
          top: 8,
          bottom: 8,
        ),
        child: Icon(
          Icons.close,
          color: widget.readOnly
              ? AppColors.primaryColor
              : AppColors.neutralCaptionColor,
          size: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onTap: widget.onTap,
      onChanged: (text) {
        setState(() {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
        });
      },
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      textAlign: widget.textAlign,
      inputFormatters: widget.inputFormatters,
      onSubmitted: widget.onSubmitted,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      textAlignVertical: TextAlignVertical.center,
      focusNode: widget.focusNode,
      autofocus: widget.autoFocus,
      readOnly: widget.readOnly,
      enabled: widget.enable,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      keyboardType: widget.inputType,
      style: widget.styleContent ?? const Para2(),
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        counterText: widget.counterText,
        counterStyle: const Para2(),
        filled: true,
        fillColor:
            widget.enable ? widget.inputColor : AppColors.neutralCaptionColor,
        contentPadding: EdgeInsets.symmetric(vertical: widget.paddingHeight),
        errorText: widget.errText,
        errorStyle: const Para2(
          color: AppColors.redColor,
        ),
        hintText: widget.placeholder,
        hintStyle: const Para2(
          color: AppColors.neutralCaptionColor,
        ),
        prefixIconConstraints: const BoxConstraints(),
        suffixIconConstraints: const BoxConstraints(),
        prefixIcon: widget.showPrefixSearchIcon || widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 8,
                ),
                child: widget.prefixIcon ??
                    const Icon(
                      Icons.search,
                      color: AppColors.blackColor,
                      size: 24,
                    ),
              )
            : const SizedBox(
                width: 16,
              ),
        suffixIcon: widget.suffixIcon != null
            ? Container(
                padding: const EdgeInsets.only(
                  left: 4,
                  right: 16,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: widget.suffixIcon!
                      .map((e) => e
                          // Padding(
                          //     padding: const EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8),
                          //     child: e)
                          )
                      .toList(),
                ),
              )
            : (widget.onClearText != null && _controller.text.isNotEmpty
                ? _clearIcon
                : const SizedBox(width: 16)),
        isCollapsed: true,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            width: 0,
            color: widget.borderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            width: 0,
            color: widget.borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.redColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            width: 0,
            color: widget.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          borderSide: BorderSide(
            width: 0,
            color: widget.borderColor,
            // style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
