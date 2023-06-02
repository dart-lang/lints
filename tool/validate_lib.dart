// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:path/path.dart' as p;

void main(List<String> args) {
  print('Validating that there are no .dart source files in lib/ ...');

  final dartSourceFiles = Directory('lib')
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => p.extension(file.path) == '.dart')
      .toList();

  if (dartSourceFiles.isEmpty) {
    print('No Dart files found.');
  } else {
    for (var file in dartSourceFiles) {
      print('  error: found ${file.path}');
    }
    exit(1);
  }
}
