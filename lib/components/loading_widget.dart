import 'package:flutter/material.dart';

// CircularProgressIndicator used in NetworkImageCache
class LoadingWidget extends StatelessWidget {
  final bool isImage;

  LoadingWidget({this.isImage = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (isImage) {
      return CircularProgressIndicator();
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
