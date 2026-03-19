import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multiapp/core/widgets/app_dialog.dart';
import 'package:multiapp/core/widgets/error_widget.dart';
import 'package:multiapp/core/widgets/loading_widget.dart';
import '../bloc/device_info_cubit.dart';
import '../bloc/device_info_state.dart';

@RoutePage()
class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DeviceInfoCubit>().fetchDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
        centerTitle: true,
      ),
      body: BlocConsumer<DeviceInfoCubit, DeviceInfoState>(
        listener: (context, state) {
          if (state.showDataFetchedDialog) {
            AppDialog.showInfo(
              context,
              title: 'Device Info',
              message: 'Data fetched from native!',
            );
            context.read<DeviceInfoCubit>().dismissDialog();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Loading
                if (state.deviceInfoStatus == DeviceApiStatus.loading)
                  const LoadingSpinner(),

                // Error
                if (state.deviceInfoStatus == DeviceApiStatus.failure)
                  AppErrorWidget(
                    message: state.errorMessage ?? 'Failed to get device info',
                    onRetry: () =>
                        context.read<DeviceInfoCubit>().fetchDeviceInfo(),
                  ),

                // Success
                if (state.deviceInfo != null) ...[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Device Information',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Divider(),
                          _InfoTile(
                            icon: Icons.battery_full,
                            label: 'Battery Level',
                            value: '${state.deviceInfo!.batteryLevel}%',
                          ),
                          _InfoTile(
                            icon: Icons.phone_android,
                            label: 'Device Model',
                            value: state.deviceInfo!.deviceModel,
                          ),
                          _InfoTile(
                            icon: Icons.power,
                            label: 'Is Charging',
                            value: state.deviceInfo!.isCharging ? 'Yes' : 'No',
                          ),
                          _InfoTile(
                            icon: Icons.schedule,
                            label: 'System Time',
                            value: DateFormat('yyyy-MM-dd HH:mm:ss')
                                .format(state.deviceInfo!.systemTime.toLocal()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                Text(
                  'Native Platform Button',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 60,
                  child: _buildNativeButton(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNativeButton() {
    const viewType = 'com.example.multiapp/native_button';
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: viewType,
        onPlatformViewCreated: (_) {},
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return const UiKitView(viewType: viewType);
    }
    return const Center(
      child: Text('PlatformView not supported on this platform'),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodySmall),
                Text(value,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
