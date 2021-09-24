import 'package:rpc/rpc.dart';

import 'account_resource.dart';
import 'notification_resource.dart';

@ApiClass(version: 'v1', name: 'account')
class AccountApi {
  @ApiResource()
  AccountResource account = AccountResource();

  @ApiResource()
  NotificationResource notification = NotificationResource();
}
