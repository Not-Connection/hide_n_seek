import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../app/_index.dart';
import '../../xtras/_index.dart';

part 'a.steganograph.prov.dart';
part 'b.steganograph.serv.dart';
part 'c.steganograph.repo.dart';
part 'd.steganograph.repo.mock.dart';

SteganographProv get _pv => Prov.steganograph.st;
SteganographServ get _sv => Serv.steganograph;
SteganographRepo get _rp => Repo.steganograph.st;
