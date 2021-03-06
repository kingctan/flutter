// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'colors.dart';

/// An [IconThemeData] subclass that automatically resolves its [color] when retrieved
/// using [IconTheme.of].
class CupertinoIconThemeData extends IconThemeData {
  /// Creates a [CupertinoIconThemeData].
  ///
  /// The opacity applies to both explicit and default icon colors. The value
  /// is clamped between 0.0 and 1.0.
  const CupertinoIconThemeData({
    Color color,
    double opacity,
    double size
  }) : super(color: color, opacity: opacity, size: size);

  /// Called by [IconThemeData.of] to resolve [color] against the given [BuildContext].
  @override
  IconThemeData resolve(BuildContext context) {
    final Color resolvedColor = CupertinoDynamicColor.resolve(color, context);
    return resolvedColor == color ? this : copyWith(color: resolvedColor);
  }
}
