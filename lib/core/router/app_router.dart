import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainShellRoute.page,
          initial: true,
          children: [
            AutoRoute(page: TaskListRoute.page),
            AutoRoute(page: DynamicFormRoute.page),
            AutoRoute(page: ProductListRoute.page),
            AutoRoute(page: DeviceInfoRoute.page),
            AutoRoute(
              page: Tab1WrapperRoute.page,
              children: [
                AutoRoute(page: Tab1Route.page, initial: true),
                AutoRoute(page: Tab1DetailRoute.page, path: 'detail'),
              ],
            ),
            AutoRoute(
              page: Tab2WrapperRoute.page,
              children: [
                AutoRoute(page: Tab2Route.page, initial: true),
                AutoRoute(page: Tab2DetailRoute.page, path: 'detail'),
              ],
            ),
            AutoRoute(
              page: Tab3WrapperRoute.page,
              children: [
                AutoRoute(page: Tab3Route.page, initial: true),
                AutoRoute(page: Tab3DetailRoute.page, path: 'detail'),
              ],
            ),
          ],
        ),
        // These are outside children of MainShellRoute, so they push OVER it (fullscreen)
        AutoRoute(page: TaskDetailRoute.page, path: '/todo-detail/:taskId'),
        AutoRoute(page: ProductDetailRoute.page, path: '/product-detail/:productId'),
      ];
}
