import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoply/core/config/supabase_config.dart';
import 'package:shoply/core/config/env_config.dart';
import 'package:shoply/core/theme/app_theme.dart';
import 'package:shoply/core/widgets/main_screen.dart';
import 'package:shoply/features/auth/presentation/screens/login_screen.dart';
import 'package:shoply/features/auth/presentation/screens/registration_screen.dart';
import 'package:shoply/features/auth/presentation/screens/splash_screen.dart';
import 'package:shoply/features/flash_deals/presentation/screens/flash_deals_screen.dart';
import 'package:shoply/features/home/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await EnvConfig.load();

  // Initialize Supabase
  await SupabaseConfig.initialize();

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
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
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

        /*
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductsScreen(),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),*/
        GoRoute(
          path: '/flash-deals',
          builder: (context, state) => const FlashDealsScreen(),
        ),
      ],
    ),
  ],
);
