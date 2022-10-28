import 'package:flutter_test/flutter_test.dart';
import 'package:honey/honey.dart';
import 'package:honey/src/consts/param_names.dart';

import '../../utils.dart';

void main() {
  group('core functions', () {
    test('concat num', () async {
      final input = func(F.concat, {
        pValue: list([val(1), val(2)])
      });
      expectEval(input, val(12));
    });

    test('concat string', () async {
      final input = func(F.concat, {
        pValue: list([val('foo'), val('bar')])
      });
      expectEval(input, val('foobar'));
    });

    test('property length', () async {
      final input = func(F.property, {
        pName: val('length'),
        pValue: val('MyValue'),
      });
      expectEval(input, val(7));
    });

    test('empty property length', () async {
      final input = func(F.property, {
        pName: val('length'),
        pValue: empty(),
      });
      expectEval(input, val(0));
    });

    test('property length with retry', () async {
      final input = func(F.property, {
        pName: val(''),
        pValue: empty(retry: true),
      });
      expectEval(input, empty(retry: true));
    });

    test('property words count', () async {
      final input = func(F.property, {
        pName: val('words'),
        pValue: val('My Value'),
      });
      expectEval(input, val(2));
    });

    test('property lines count', () async {
      final input = func(F.property, {
        pName: val('lines'),
        pValue: val('My\nValue'),
      });
      expectEval(input, val(2));
    });

    test('variable', () async {
      final input = func(F.variable, {
        pName: val('foo'),
        pValue: val('bar'),
      });
      expectEval(input, val('bar'));
    });
  });
}
