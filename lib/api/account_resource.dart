import 'package:rpc/rpc.dart';

import 'messages.dart';

final voidMessage = VoidMessage();

/// Defines basic user handling stuff, like authentication, registering, etc...
class AccountResource {
  User getUser() {
    return User()
      ..creationTime = DateTime.now()
      ..id = '123'
      ..email = 'email'
      ..name = 'name'
      ..lastSeenNotificationMicrosecondsSinceEpoch = BigInt.two;
  }

  @ApiMethod(
      path: 'signIn',
      method: 'POST',
      description: 'Post username and password to this resource to sign in')
  Future<User> signIn(SignInRequest request) async {
    return User()
      ..creationTime = DateTime.now()
      ..id = '123'
      ..email = 'email'
      ..name = 'name'
      ..lastSeenNotificationMicrosecondsSinceEpoch = BigInt.two;
  }

  /// Deletes the authentication token from the redis store
  @ApiMethod(
      path: 'logout',
      method: 'GET',
      description: 'DEPRECATED. Simply delete your JWT to logout.')
  Future<VoidMessage> logout() async {
    return voidMessage;
  }

  /// Registers given user in our datastore.
  @ApiMethod(path: 'register', method: 'POST')
  Future<RegistrationInfo> register(Registration registration) async {
    return RegistrationInfo()..user = getUser();
  }

  @ApiMethod(
      path: 'signInWithToken',
      method: 'POST',
      description: 'Needs to be called with the OAuth token')
  Future<User> signInWithToken(OauthToken oauthToken) async {
    return getUser();
  }

  /// Registers given user in our datastore with an OAuthToken.
  @ApiMethod(
      path: 'registerWithToken',
      method: 'POST',
      description:
          'Needs to be called with the OAuth token after successful authentication')
  Future<RegistrationInfo> registerWithToken(
      OauthRegistration oauthRegistration) async {
    return RegistrationInfo()..user = getUser();
  }

  /// Sends an email to the given email address with the link to verify the email
  /// address.
  ///
  /// If the user already exists, this will send a Reset Password email instead.
  @ApiMethod(
      path: 'sendVerifyRegistrationEmail',
      description:
          'Sends an email with a registration link to given email address')
  Future<VoidMessage> sendVerifyRegistrationEmail({
    String? email,
    String? referrerUrlString,
    String? recaptchaResponse,
  }) async {
    return VoidMessage();
  }

  /// Uses the services to store a reset password token, and sends off the email
  @ApiMethod(path: 'sendResetPasswordEmail')
  Future<VoidMessage> sendResetPasswordEmail({String? email}) async {
    return VoidMessage();
  }

  @ApiMethod(path: 'resetPassword', method: 'POST')
  Future<User> resetPassword(ResetPassword resetPassword) async {
    return getUser();
  }

  /// The actual implementation without any checks

}
