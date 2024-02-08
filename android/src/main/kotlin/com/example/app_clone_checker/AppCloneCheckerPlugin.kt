package com.example.app_clone_checker

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class AppCloneCheckerPlugin(registrar: Registrar) : MethodCallHandler, MethodChannel.MethodCallJavaScriptHandler {
  private val channel = MethodChannel(registrar.messenger(), "app_clone_checker")

  init {
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "appOriginality") {
      result.success(appOriginality(call.arguments as String))
    } else {
      result.notImplemented()
    }
  }

  private fun appOriginality(packageName: String): String {
    val packageManager = registrar.context().packageManager
    val appInfo = packageManager.getInstalledPackages(0).find { pkgInfo -> pkgInfo.packageName == packageName }
    if (appInfo == null || appInfo.applicationInfo.uid != registrar.context().applicationInfo.uid) {
      return "{\"result\": \"Failure\", \"message\": \"Cloned / In-Valid App\"}"
    }
    return "{\"result\": \"Success\", \"message\": \"Valid App\"}"
  }
}