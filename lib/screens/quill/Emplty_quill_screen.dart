import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart'
    show FlutterQuillEmbeds, QuillSharedExtensionsConfigurations;
import 'package:google_fonts/google_fonts.dart';
import 'my_quill_editor.dart';


class EmptyQuillScreenExample extends StatefulWidget {
  const EmptyQuillScreenExample({
    super.key,
  });
  static const routeName = '/quill';

  @override
  State<EmptyQuillScreenExample> createState() => _EmptyQuillScreenExampleState();
}

class _EmptyQuillScreenExampleState extends State<EmptyQuillScreenExample> {
  final _controller = QuillController.basic();
  final _editorFocusNode = FocusNode();
  final _editorScrollController = ScrollController();
  var _isReadOnly = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _editorFocusNode.dispose();
    _editorScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.readOnly = _isReadOnly;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quill'),
      ),
      body: Column(
        children: [
          if (!_isReadOnly)
      QuillToolbar.simple(
        configurations: QuillSimpleToolbarConfigurations(
          controller: _controller,
      buttonOptions: const QuillSimpleToolbarButtonOptions(
        base: QuillToolbarBaseButtonOptions(
          iconTheme: QuillIconTheme(
            iconButtonSelectedData: IconButtonData(
              color: Colors.blue
            ),
            iconButtonUnselectedData: IconButtonData(
              color: Colors.yellow
            )
          ),
        ),
        fontFamily: QuillToolbarFontFamilyButtonOptions(
        )
      ),
      showAlignmentButtons: true,
      multiRowsDisplay: true,
      showSearchButton: false,
      showSubscript: false,
      showSuperscript: false,
      showLink: true,
      showHeaderStyle: false,
      showCodeBlock: false,
      showClearFormat: false,
      showQuote: false,
      showFontFamily: true,
      showCenterAlignment: false,
      showJustifyAlignment: false,
      showLeftAlignment: false,
      showRightAlignment: false,
      showListCheck: false,
      showFontSize: true,
      showColorButton: false,
      showBackgroundColorButton: false,
      showListNumbers: false,
      showListBullets: false,
      showStrikeThrough: false,
      showInlineCode: false,
      fontFamilyValues: {
        'Amatic': GoogleFonts.amaticSc().fontFamily!,
        'Annie': GoogleFonts.annieUseYourTelescope().fontFamily!,
        'Formal': GoogleFonts.petitFormalScript().fontFamily!,
        'Roboto': GoogleFonts.roboto().fontFamily!
      },
      fontSizesValues: const {
        '14': '14.0',
        '16': '16.0',
        '18': '18.0',
        '20': '20.0',
        '22': '22.0',
        '24': '24.0',
        '26': '26.0',
        '28': '28.0',
        '30': '30.0',
        '35': '35.0',
        '40': '40.0'
      },
    ),
    ),
          Builder(
            builder: (context) {
              return Expanded(
                child: MyQuillEditor(
                  configurations: QuillEditorConfigurations(
                    sharedConfigurations: const QuillSharedConfigurations(
                      // locale: Locale('en'),
                      extraConfigurations: {
                        QuillSharedExtensionsConfigurations.key:
                        const QuillSharedExtensionsConfigurations(
                          assetsPrefix: 'assets', // Defaults to assets
                        ),
                      },
                    ),
                    controller: _controller,
                  ),
                  scrollController: _editorScrollController,
                  focusNode: _editorFocusNode,
                ),
              );
            },
          ),
        ],
      ),

    );
  }
}
