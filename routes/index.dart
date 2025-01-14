import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final body = await context.request.body();
  unawaited(
    File('logs.log')
        .writeAsString('${DateTime.now()} ||| $body\n', mode: FileMode.append),
  );
  return Response();
}
