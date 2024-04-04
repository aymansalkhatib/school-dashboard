import 'package:flutter/material.dart';
import 'package:sama/core/constants/app_font_style.dart';
import 'package:sama/core/utils/custom_search.dart';
import 'package:sama/core/shared/trailing_header.dart';

class HeaderWithSearch extends StatelessWidget {
  const HeaderWithSearch({
    super.key,
    required this.title,
    this.showSearch = true,
  });
  final String title;
  final bool showSearch;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                alignment: Alignment.topLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: AppFontStyle.styleBold36(context).copyWith(height: 1),
                ),
              ),
              Visibility(
                visible: showSearch,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 350 * getScaleFactor(context),
                    child: const CustomSearch(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 27),
        const Expanded(
            flex: 395,
            child: TrailingHeader(
              colorCircle: Colors.white,
            )),
      ],
    );
  }
}
