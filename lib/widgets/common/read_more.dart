import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReadMoreTextWidget extends StatefulWidget {
  const ReadMoreTextWidget({
    Key? key,
    required this.text,
    this.style,
    this.maxLines,
    this.shouldExpand = true,
  }) : super(key: key);
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final bool shouldExpand;

  @override
  State<ReadMoreTextWidget> createState() => _ReadMoreTextWidgetState();
}

class _ReadMoreTextWidgetState extends State<ReadMoreTextWidget> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        final text = TextSpan(text: widget.text);

        final link = TextSpan(
          text: isCollapsed ? '... ' : '\n',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: isCollapsed ? 'more' : 'Show less',
              recognizer: TapGestureRecognizer()
                ..onTap = () => {
                      if (widget.shouldExpand)
                        {
                          setState(() {
                            isCollapsed = !isCollapsed;
                          }),
                        },
                    },
            ),
          ],
        );
        final textPainter = TextPainter(
          text: link,
          maxLines: widget.maxLines ?? 2,
          textDirection: Directionality.of(context),
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;

        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;

        int? endIndex;

        if (linkSize.width < maxWidth) {
          final pos = textPainter.getPositionForOffset(
            Offset(
              textSize.width - linkSize.width,
              textSize.height,
            ),
          );
          endIndex = textPainter.getOffsetBefore(pos.offset);
        } else {
          var pos = textPainter.getPositionForOffset(
            textSize.bottomLeft(Offset.zero),
          );
          endIndex = pos.offset;
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: TextSpan(
            text:
                isCollapsed ? widget.text.substring(0, endIndex) : widget.text,
            style: widget.style,
            children: <TextSpan>[link],
          ),
        );
      },
    );
  }
}
