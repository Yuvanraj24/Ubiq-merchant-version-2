
import 'package:ubiqmerchant_version_2/core/constants/storage_keys.dart';
import 'package:ubiqmerchant_version_2/utils/local_storage/functions/storage_functions.dart';

/// Functions will vary based App requirements & App functionality.
class AppLocalStorageFunctions {
  /// Save the user authentication token
  static void saveUserToken(String token) {
    LocalStorageFunctions.saveString(StorageKeys.userAuthToken, token);
  }

  /// Retrieve the user authentication token
  static String? getUserToken() {
    return LocalStorageFunctions.getString(StorageKeys.userAuthToken);
  }

  /// Set the login status of the user
  static void setUserLoggedIn(bool status) {
    LocalStorageFunctions.saveBool(StorageKeys.isLoggedIn, status);
  }

  /// Check if the user is logged in
  static bool isUserLoggedIn() {
    return LocalStorageFunctions.getBool(StorageKeys.isLoggedIn) ?? false;
  }

  /// Save user preferences (example: theme mode)
  // static void saveUserPreferences(Map<String, dynamic> preferences) {
  //   LocalStorageFunctions.saveString(
  //     StorageKeys.userPreferences,
  //     preferences.toString(), // Convert map to a string or use jsonEncode
  //   );
  // }

  /// Get user preferences
  // static Map<String, dynamic>? getUserPreferences() {
  //   String? preferencesString = LocalStorageFunctions.getString(StorageKeys.userPreferences);
  //   if (preferencesString != null) {
  //     // Convert string back to map or use jsonDecode
  //     return {}; // Replace with actual conversion logic
  //   }
  //   return null;
  // }

  /// Clear all user-related storage (useful during logout)
  static void clearUserData() {
    LocalStorageFunctions.remove(StorageKeys.userAuthToken);
    LocalStorageFunctions.remove(StorageKeys.isLoggedIn);
  }

  static void clearAllData(){
    LocalStorageFunctions.clear();
  }
}