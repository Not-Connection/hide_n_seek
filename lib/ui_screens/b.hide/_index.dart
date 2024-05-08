import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hide_n_seek/ui_widgets/spaces/_index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:steganograph/steganograph.dart';

import '../../app/_index.dart';
import '../../xtras/_index.dart';

part 'a.hide.data.dart';
part 'b.hide.ctrl.dart';
part 'c.hide.view.dart';
part 'widgets/a.hide.appbar.dart';
part 'widgets/b.hide.image_button.dart';
part 'widgets/c.hide.image_selected.dart';
part 'widgets/d.hide.picked_image_tile.dart';
part 'widgets/e.hide.form_message.dart';
part 'widgets/f.hide.button.dart';
part 'widgets/g.hide.result.dart';

HideData get _dt => Data.hide.st;
HideCtrl get _ct => Ctrl.hide;
