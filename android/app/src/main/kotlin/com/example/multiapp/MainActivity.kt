package com.example.multiapp

import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.view.View
import android.widget.Button
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import io.flutter.plugin.common.StandardMessageCodec
import java.time.Instant

class MainActivity : FlutterActivity() {
    private val DEVICE_INFO_CHANNEL = "com.example.multiapp/device_info"
    private val BATTERY_REFRESH_CHANNEL = "com.example.multiapp/battery_refresh"
    private val PLATFORM_VIEW_TYPE = "com.example.multiapp/native_button"

    private var batteryRefreshChannel: MethodChannel? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Initialize refresh channel
        batteryRefreshChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BATTERY_REFRESH_CHANNEL)

        // Register PlatformView
        flutterEngine.platformViewsController.registry
            .registerViewFactory(PLATFORM_VIEW_TYPE,
                NativeButtonFactory(context, batteryRefreshChannel!!))

        // MethodChannel for device info
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DEVICE_INFO_CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "getDeviceInfo") {
                    result.success(getDeviceInfoMap())
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun getDeviceInfoMap(): Map<String, Any> {
        val batteryStatus: Intent? = IntentFilter(Intent.ACTION_BATTERY_CHANGED).let { filter ->
            context.registerReceiver(null, filter)
        }
        val level = batteryStatus?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
        val scale = batteryStatus?.getIntExtra(BatteryManager.EXTRA_SCALE, -1) ?: -1
        val batteryPct = if (level >= 0 && scale > 0) (level * 100 / scale) else -1

        val status = batteryStatus?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1
        val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                         status == BatteryManager.BATTERY_STATUS_FULL

        val deviceModel = "${Build.MANUFACTURER} ${Build.MODEL}"
        val systemTime = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
            Instant.now().toString() else java.util.Date().toString()

        return mapOf(
            "batteryLevel" to batteryPct,
            "deviceModel" to deviceModel,
            "isCharging" to isCharging,
            "systemTime" to systemTime
        )
    }
}

// PlatformView Factory
class NativeButtonFactory(
    private val context: Context,
    private val refreshChannel: MethodChannel
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(ctx: Context, viewId: Int, args: Any?): PlatformView {
        return NativeButtonView(ctx, refreshChannel)
    }
}

class NativeButtonView(
    private val ctx: Context,
    private val refreshChannel: MethodChannel
) : PlatformView {
    private val button = Button(ctx).apply {
        text = "Refresh Battery (Native)"
        setOnClickListener {
            // Provide native visual feedback
            Toast.makeText(ctx, "Refreshing Battery Info...", Toast.LENGTH_SHORT).show()
            
            // Invoke the Flutter handler to re-fetch data
            refreshChannel.invokeMethod("refreshBattery", null)
        }
    }
    override fun getView(): View = button
    override fun dispose() {}
}
