import 'dart:io';

import 'package:logging/logging.dart';
import 'package:rpc/rpc.dart';
import 'package:rpc_template/api/account.dart';

main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(print);
  final _apiServer = ApiServer(prettyPrint: true)
    ..addApi(AccountApi())
    ..enableDiscoveryApi();

  const port = 8080;

  HttpServer server = await HttpServer.bind(InternetAddress.anyIPv4, port);
  server.listen(_apiServer.httpRequestHandler);
  print('Listening on port $port');
  print(
      'You can now visit http://localhost:$port/account/v1/notifications to test it');
}
