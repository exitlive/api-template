import 'package:rpc/rpc.dart';

class Registration {
  @ApiProperty(
      required: true,
      description:
          'The unencrypted plain text email. This will be verified by hashedEmail')
  String email;

  @ApiProperty(
      required: true,
      description:
          'The hashed email address that has been sent to the user by email')
  String hashedEmail;

  @ApiProperty(required: true, description: 'A SHA256 hash of the password')
  String password;

  @ApiProperty(required: true, description: 'The name of the user')
  String name;

  @ApiProperty(required: true, description: 'The ISO2 country code of the user')
  String countryCode;

  @ApiProperty(
      description: 'Whether you want a long lived session (use this in an app)')
  bool longLived;

  @ApiProperty(required: false, description: 'Might be a user_id or page_id')
  String referrer;
}

/// Gets returned after successful registration.
class RegistrationInfo {
  @ApiProperty(
      required: true,
      description:
          'List of pages this user was made an administrator of before registering')
  List<Page> pages;

  @ApiProperty(required: true, description: 'The user that has been created')
  User user;
}

class UpdateUser {
  @ApiProperty(required: false, description: 'The name of the user')
  String name;

  @ApiProperty(
      required: false, description: 'If provided the password will be changed')
  PasswordReset passwordReset;

  @ApiProperty(required: false, description: 'Two letter ISO Code country code')
  String country;

  @ApiProperty(
      required: false, description: 'Whether the user is over the age of 18')
  bool isAdult;
}

class PasswordReset {
  @ApiProperty(
      required: true, description: 'A SHA256 hash of the current password')
  String currentPassword;

  @ApiProperty(required: true, description: 'A SHA256 hash of the new password')
  String newPassword;
}

class OauthToken {
  @ApiProperty(required: true)
  String token;

  @ApiProperty(values: {
    'apple': 'When using Apple as OAuth provider',
    'google': 'When using Google as OAuth provider',
    'facebook': 'When using Facebook as OAuth provider',
    'twitter': 'When using Twitter as OAuth provider'
  }, required: true)
  String provider;

  @ApiProperty(
      description: 'Whether you want a long lived session (use this in an app)')
  bool longLived;

  @ApiProperty(
    /// Until all mobile clients have upgrade to latest version this needs to
    /// remain false.
    required: false,
    description:
        'The platform on which the oauth authentication has been made.',
    values: {
      'mobile': 'Deprecated',
      'ios': 'iOS',
      'android': 'Android',
      'web': 'Web',
    },
  )
  String platform;
}

class OauthRegistration {
  @ApiProperty(required: true)
  OauthToken oauthToken;

  @ApiProperty(required: false, description: 'Might be a user_id or page_id')
  String referrer;

  @ApiProperty(required: true, description: 'The ISO2 country code of the user')
  String countryCode;
}

class SignInRequest {
  @ApiProperty(required: true)
  String username;

  @ApiProperty(required: true, description: 'The SHA256 hash of the password')
  String password;

  @ApiProperty(
      description: 'Whether you want a long lived session (use this in an app)')
  bool longLived;
}

class VerifyRegistrationEmail {
  String email;
}

class ForgotPassword {
  String email;
}

class ResetPasswordWithToken {
  String token;

  String password;
}

class ResetPassword {
  @ApiProperty(required: true)
  String oldPassword;

  @ApiProperty(required: true)
  String password;
}

class BasePage {
  @ApiProperty(required: true)
  String id;

  @ApiProperty(required: true)
  String name;

  @ApiProperty(required: false)
  String handle;

  @ApiProperty(required: false)
  String website;
}

@ApiMessage(includeSuper: true)
class Page extends BasePage {}

class User {
  @ApiProperty(required: true)
  DateTime creationTime;

  @ApiProperty(required: true)
  String id;

  @ApiProperty(required: true)
  String email;

  @ApiProperty(required: true)
  String name;

  @ApiProperty(required: true, format: 'int64')
  BigInt lastSeenNotificationMicrosecondsSinceEpoch;

  String country;

  @ApiProperty()
  List<OAuthAccount> oAuthAccounts;

  @ApiProperty(
      required: false, description: 'Whether the user is over the age of 18')
  bool isAdult;

  @ApiProperty(
      required: false,
      description: 'The time, this user has last been logged in.')
  DateTime lastSignIn;
}

class OAuthAccount {
  @ApiProperty(required: true)
  String id;

  @ApiProperty(required: true)
  String accountId;

  @ApiProperty(required: true)
  String email;

  @ApiProperty(required: true)
  String name;

  @ApiProperty(required: true)
  bool isVerified;

  @ApiProperty(required: true)
  String provider;
}

const Map<String, String> notificationTypes = {
  'generic': 'Generic',
  'newFollower': 'New Follower',
  'purchase': 'Purchase',
  'changedBankAccount': 'Changed Bank Account',
  'userJoinedAsManager': 'User Joined As Manager',
  'teleportUploadFinished': 'Teleport Upload Finished',
};

class Notification {
  @ApiProperty(required: true)
  String id;

  @ApiProperty(required: true)
  DateTime creationTime;

  @ApiProperty(required: true, format: 'int64')
  BigInt creationMicrosecondsSinceEpoch;

  @ApiProperty(required: true, values: notificationTypes)
  String type;

  @ApiProperty(required: true)
  String message;

  @ApiProperty(required: true)
  String messageHtml;

  @ApiProperty(required: true)
  bool isRead = false;

  @ApiProperty(required: true)
  String imageUrl;

  @ApiProperty(required: false)
  String linkUrl;

  /// An optional secondary image URL that can be used to provide context.
  @ApiProperty(required: false)
  String contextImageUrl;
}
