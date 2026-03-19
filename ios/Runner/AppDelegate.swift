import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    let DEVICE_INFO_CHANNEL = "com.example.multiapp/device_info"
    let BATTERY_REFRESH_CHANNEL = "com.example.multiapp/battery_refresh"
    let PLATFORM_VIEW_TYPE = "com.example.multiapp/native_button"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        
        let refreshChannel = FlutterMethodChannel(
            name: BATTERY_REFRESH_CHANNEL,
            binaryMessenger: controller.binaryMessenger
        )

        // Register PlatformView factory
        let factory = NativeButtonFactory(messenger: controller.binaryMessenger, refreshChannel: refreshChannel)
        registrar(forPlugin: PLATFORM_VIEW_TYPE)?
            .register(factory, withId: PLATFORM_VIEW_TYPE)

        // MethodChannel
        let deviceChannel = FlutterMethodChannel(
            name: DEVICE_INFO_CHANNEL,
            binaryMessenger: controller.binaryMessenger
        )
        deviceChannel.setMethodCallHandler { [weak self] call, result in
            if call.method == "getDeviceInfo" {
                result(self?.getDeviceInfo())
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        UIDevice.current.isBatteryMonitoringEnabled = true
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func getDeviceInfo() -> [String: Any] {
        let battery = Int(UIDevice.current.batteryLevel * 100)
        let isCharging = UIDevice.current.batteryState == .charging ||
                         UIDevice.current.batteryState == .full
        let model = UIDevice.current.model
        let systemTime = ISO8601DateFormatter().string(from: Date())
        return [
            "batteryLevel": battery,
            "deviceModel": model,
            "isCharging": isCharging,
            "systemTime": systemTime
        ]
    }
}

class NativeButtonFactory: NSObject, FlutterPlatformViewFactory {
    private let messenger: FlutterBinaryMessenger
    private let refreshChannel: FlutterMethodChannel

    init(messenger: FlutterBinaryMessenger, refreshChannel: FlutterMethodChannel) {
        self.messenger = messenger
        self.refreshChannel = refreshChannel
        super.init()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return NativeButtonView(frame: frame, messenger: messenger, refreshChannel: refreshChannel)
    }
}

class NativeButtonView: NSObject, FlutterPlatformView {
    private let button: UIButton
    private let messenger: FlutterBinaryMessenger
    private let refreshChannel: FlutterMethodChannel

    init(frame: CGRect, messenger: FlutterBinaryMessenger, refreshChannel: FlutterMethodChannel) {
        self.messenger = messenger
        self.refreshChannel = refreshChannel
        button = UIButton(type: .system)
        button.setTitle("Refresh Battery (Native)", for: .normal)
        button.frame = frame
        super.init()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    func view() -> UIView { button }

    @objc func buttonTapped() {
        // Native feedback not easily done with Toast in iOS, skipping or using alert
        refreshChannel.invokeMethod("refreshBattery", arguments: nil)
    }
}
