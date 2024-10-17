//
// COPYRIGHT © 2023 Esri
//
// All rights reserved under the copyright laws of the United States
// and applicable international laws, treaties, and conventions.
//
// This material is licensed for use under the Esri Master
// Agreement (MA) and is bound by the terms and conditions
// of that agreement.
//
// You may redistribute and use this code without modification,
// provided you adhere to the terms and conditions of the MA
// and include this copyright notice.
//
// See use restrictions at http://www.esri.com/legal/pdfs/mla_e204_e300/english
//
// For additional information, contact:
// Environmental Systems Research Institute, Inc.
// Attn: Contracts and Legal Department
// 380 New York Street
// Redlands, California 92373
// USA
//
// email: legal@esri.com
//

part of '../arcgis_maps.dart';

class _AttributionBarWidget extends StatelessWidget {
  static final _esriUrl = Uri.parse('https://www.esri.com');
  static const _attributionTextStyle = TextStyle(
    inherit: false,
    fontFamily: 'Avenir Next',
    fontFamilyFallback: ['Arial', 'sans-serif'],
    fontSize: 12,
    color: Color(0xFF323232),
  );
  static const minHeight = 30.0;
  static const maxHeight = 200.0;

  final String attributionText;
  final bool expanded;
  final Function()? onTapAttribution;

  const _AttributionBarWidget({
    required this.attributionText,
    required this.expanded,
    this.onTapAttribution,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      color: Colors.white.withOpacity(0.65),
      child: SafeArea(
        maintainBottomViewPadding: true,
        top: false,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTapAttribution,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                  child: expanded
                      ? SingleChildScrollView(
                          child: Text(
                            _processAttributionText(),
                            style: _attributionTextStyle,
                          ),
                        )
                      : Text(
                          _processAttributionText(),
                          style: _attributionTextStyle.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                ),
              ),
            ),
            GestureDetector(
              onTap: _handleEsriUrlTap,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 5, 20, 5),
                child: RichText(
                  text: TextSpan(
                    style: _attributionTextStyle,
                    children: [
                      const WidgetSpan(
                        child: Padding(padding: EdgeInsets.only(left: 10)),
                      ),
                      const TextSpan(text: 'Powered by '),
                      TextSpan(
                        text: 'Esri',
                        style: _attributionTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _handleEsriUrlTap() async {
    // Launch the URL in an external browser
    if (!await launchUrl(_esriUrl, mode: LaunchMode.externalApplication)) {
      logger.e('Could not launch $_esriUrl');
    }
  }

  String _processAttributionText() {
    if (attributionText.isEmpty) {
      return '';
    }

    // Prepend 'Sources: ' to the attribution string and return
    return 'Sources: $attributionText';
  }
}
