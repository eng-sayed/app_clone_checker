import 'package:flutter_test/flutter_test.dart';
import 'package:app_clone_checker/app_clone_checker.dart';
import 'package:app_clone_checker/app_clone_checker_platform_interface.dart';
import 'package:app_clone_checker/app_clone_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppCloneCheckerPlatform
    with MockPlatformInterfaceMixin
    implements AppCloneCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AppCloneCheckerPlatform initialPlatform = AppCloneCheckerPlatform.instance;

  test('$MethodChannelAppCloneChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppCloneChecker>());
  });

  test('getPlatformVersion', () async {
    AppCloneChecker appCloneCheckerPlugin = AppCloneChecker();
    MockAppCloneCheckerPlatform fakePlatform = MockAppCloneCheckerPlatform();
    AppCloneCheckerPlatform.instance = fakePlatform;

    expect(await appCloneCheckerPlugin.getPlatformVersion(), '42');
  });
}
