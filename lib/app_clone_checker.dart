
import 'app_clone_checker_platform_interface.dart';

class AppCloneChecker {
  Future<String?> getPlatformVersion() {
    return AppCloneCheckerPlatform.instance.getPlatformVersion();
  }
}
