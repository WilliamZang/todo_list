package com.example.todo_list;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity {
  static String CHANNEL = "williamzang.com.qrShow";
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
              @Override
              public void onMethodCall(MethodCall call, Result result) {
if (call.method.equls('qrShow')) {
  Intnet ...
  startActivityForResult(intnet, 300);
  this.callback = result;
}
              }
            });
  }

  private Result callback;
  @Override
  void onActiviyResult(int requestCode, int resultCode, Intent data) {
    callback.success(data.putString(""));
  }
}
