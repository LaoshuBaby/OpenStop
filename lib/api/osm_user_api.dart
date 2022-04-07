import 'package:osm_api/osm_api.dart';

import '/commons/osm_config.dart' as osm_config;


/// This class exposes API calls for getting [OSMUserPrivateDetails] of the currently logged in user.

class OSMUserAPI {
  final _osmApi = OSMAPI(
    baseUrl: '${osm_config.osmServerUri}/api/0.6',
  );

  OSMUserAPI({
    required OAuth2 authentication
  }) {
    _osmApi.authentication = authentication;
  }

  Auth get authentication => _osmApi.authentication!;


  set authentication(Auth value) => _osmApi.authentication = value;


  /// Method to get all user details of the currently authenticated user.
  /// This method will throw [OSMAPI] exceptions, like an [OSMUnauthorizedException] if the user isn't authenticated any more.

  Future<OSMUserPrivateDetails> getUserDetails() {
    return _osmApi.getCurrentUserDetails();
  }


  /// A method to terminate the api client and cleanup any open connections.
  /// This should be called inside the widgets dispose callback.

  dispose() {
    _osmApi.dispose();
  }
}
