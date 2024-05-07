import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hide_n_seek/ui_widgets/spaces/_index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:steganograph/steganograph.dart';

import '../../app/_index.dart';
import '../../xtras/_index.dart';

part 'a.steganograph.data.dart';
part 'b.steganograph.ctrl.dart';
part 'c.steganograph.view.dart';
part 'widgets/a.steganograph.appbar.dart';
part 'widgets/b.steganograph.fab.dart';
part 'widgets/c.steganograph.charlie.dart';
part 'widgets/d.steganograph.delta.dart';
part 'widgets/e.steganograph.echo.dart';

SteganographData get _dt => Data.steganograph.st;
SteganographCtrl get _ct => Ctrl.steganograph;
