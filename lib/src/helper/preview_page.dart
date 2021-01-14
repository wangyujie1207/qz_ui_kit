import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qz_ui_kit/src/custom_back_button.dart';

class ImagePreview {
  final ImageProvider image;
  final ImageProvider thumbnail;
  final Object tag;

  ImagePreview({this.image, this.tag, this.thumbnail});
}

class PreviewPage extends StatefulWidget {
  final List<ImagePreview> images;
  final int current;

  const PreviewPage({Key key, this.images, this.current}) : super(key: key);

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  int currentIndex = 0;
  PageController pageController;

  @override
  void initState() {
    currentIndex = widget.current;
    pageController = PageController(initialPage: widget.current);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: CustomBackButton(color: Colors.white),
          backgroundColor: Colors.black,
          elevation: 0),
      body: ExtendedImageGesturePageView.builder(
        controller: pageController,
        itemCount: widget.images.length,
        onPageChanged: (int index) {
          currentIndex = index;
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = widget.images[index];
          return Container(
            color: Colors.black,
            child: Hero(
              tag: item.tag,
              child: ExtendedImage(
                image: item.image,
                fit: BoxFit.contain,
                mode: ExtendedImageMode.gesture,
                initGestureConfigHandler: (ExtendedImageState state) {
                  return GestureConfig(
                    initialScale: 1.0,
                    minScale: 1.0,
                    maxScale: 3.0,
                    animationMinScale: 0.6,
                    animationMaxScale: 4.0,
                    cacheGesture: false,
                    inPageView: true,
                  );
                },
                loadStateChanged: (ExtendedImageState state) {
                  if (state.extendedImageLoadState == LoadState.loading) {
                    return item.thumbnail != null
                        ? Stack(
                      children: [
                        Center(
                            child: ExtendedImage(image: item.thumbnail)),
                        Positioned.fill(
                          child: Center(
                            child: SpinKitCircle(
                                color: Theme.of(context).primaryColor),
                          ),
                        )
                      ],
                    )
                        : SpinKitCircle(color: Theme.of(context).primaryColor);
                  }
                  if (state.extendedImageLoadState == LoadState.failed) {
                    return Icon(Icons.image);
                  }
                  return null;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
