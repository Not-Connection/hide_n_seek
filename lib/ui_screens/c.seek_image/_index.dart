import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:steganograph/steganograph.dart';

import '../../app/_index.dart';
import '../../ui_widgets/_index.dart';
import '../../xtras/_index.dart';

part 'a.seek_image.data.dart';
part 'b.seek_image.ctrl.dart';
part 'c.seek_image.view.dart';
part 'widgets/a.seek_image.appbar.dart';
part 'widgets/b.seek_image.fab.dart';
part 'widgets/c.seek_image.charlie.dart';
part 'widgets/d.seek_image.delta.dart';
part 'widgets/e.seek_image.echo.dart';

SeekImageData get _dt => Data.seekImage.st;
SeekImageCtrl get _ct => Ctrl.seekImage;
