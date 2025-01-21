import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoply/core/config/env_config.dart';
import 'package:shoply/core/config/supabase_config.dart';
import 'package:shoply/core/services/logging_service.dart';
import 'package:shoply/core/theme/app_theme.dart';
import 'package:shoply/core/widgets/main_screen.dart';
import 'package:shoply/features/auth/presentation/screens/login_screen.dart';
import 'package:shoply/features/auth/presentation/screens/registration_screen.dart';
import 'package:shoply/features/auth/presentation/screens/splash_screen.dart';
import 'package:shoply/features/flash_deals/presentation/screens/flash_deals_screen.dart';
import 'package:shoply/features/home/presentation/screens/home_screen.dart';
import 'package:shoply/features/product/data/repositories/hive_product_repository.dart';
import 'package:shoply/features/product/presentation/screens/products_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logging service
  final logger = LoggingService();
  logger.info('Starting Shoply application...');

  // Load environment variables
  await EnvConfig.load();
  logger.info('Environment variables loaded');

  await SupabaseConfig.initialize();
  logger.info('Supabase initialized');

  // Initialize Hive and load sample data
  final productRepository = HiveProductRepository();
  await productRepository.initialize();
  logger.info('Product repository initialized');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Shoply',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    // Auth routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationScreen(),
    ),
    // Main app routes
    ShellRoute(
      builder: (context, state, child) => MainScreen(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/flash-deals',
          builder: (context, state) => const FlashDealsScreen(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductsScreen(),
        ),
      ],
    ),
  ],
);
