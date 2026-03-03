// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use

import 'package:web/web.dart' as web;
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';

class GoogleMapWeb extends StatefulWidget {
  final double height;
  final String location;

  const GoogleMapWeb({
    super.key,
    this.height = 300,
    this.location = 'Stellenbosch University',
  });

  @override
  State<GoogleMapWeb> createState() => _GoogleMapWebState();
}

class _GoogleMapWebState extends State<GoogleMapWeb> {
  late final String _viewId;

  @override
  void initState() {
    super.initState();
    _viewId = 'map-iframe-${DateTime.now().millisecondsSinceEpoch}';
    final src =
        'https://maps.google.com/maps?q=${Uri.encodeComponent(widget.location)}&t=&z=14&ie=UTF8&iwloc=&output=embed';
    ui_web.platformViewRegistry.registerViewFactory(_viewId, (int viewId) {
      final iframe = web.HTMLIFrameElement()
        ..src = src
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%';
      return iframe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: HtmlElementView(viewType: _viewId),
      ),
    );
  }
}
