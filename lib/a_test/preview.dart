import 'dart:ui' as ui;
import 'package:flutter/material.dart';
class Preview extends StatefulWidget {
  final List<ui.Image?> listUiImage;
  const Preview({
    super.key,
    required this.listUiImage,
  });

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.of(context).pop;
          },
          child: SizedBox(
            height: 400,
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < widget.listUiImage.length; i++)
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop;
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: RawImage(
                              image: widget.listUiImage[i],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              color: Colors.grey.withOpacity(0.3),
                              child: Center(
                                child: Text(
                                   
                                      "${widget.listUiImage[i]!.width} + ${widget.listUiImage[i]!.height}",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 