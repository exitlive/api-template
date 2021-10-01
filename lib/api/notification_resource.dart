import 'package:rpc/rpc.dart';
import 'messages.dart';

class NotificationResource {
  @ApiMethod(
      path: 'notifications',
      method: 'GET',
      description: 'Retrieves all notifications.')
  Future<List<Notification>> list(
      {int? limit,
      int? offset,
      String? startingFromMicrosecondsSinceEpoch}) async {
    return [Notification()..id = '123', Notification()..id = '234'];
  }

  @ApiMethod(
      path: 'notifications/{notificationId}/markAsRead',
      method: 'POST',
      description: 'Marks given notification as read')
  Future<VoidMessage> markAsRead(
      String notificationId, VoidMessage noMessage) async {
    return VoidMessage();
  }
}
