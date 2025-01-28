import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.body();
  final now = DateTime.now();
  unawaited(
    File(
      'payment_'
      '${now.year}_${now.month.toString().padLeft(2, '0')}'
      '_${now.day.toString().padLeft(2, '0')}.log',
    ).writeAsString('${DateTime.now()} ||| $body\n', mode: FileMode.append),
  );
  return Response();
}
