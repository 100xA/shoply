import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoply/features/home/presentation/providers/welcome_provider.dart';
import 'package:shoply/core/config/supabase_config.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeState = ref.watch(welcomeProvider);
    final currentUser = SupabaseConfig.auth.currentUser;
    final userName = currentUser?.userMetadata?['name'] as String? ?? 'Shopper';

    return Scaffold(
      body: welcomeState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (isFirstTime) => CustomScrollView(
          slivers: [
            SliverAppBar.large(
              floating: true,
              pinned: true,
              title: Text(
                isFirstTime ? 'Welcome to Shoply!' : 'Welcome back!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            if (isFirstTime)
              SliverToBoxAdapter(
                child: WelcomeMessage(
                  userName: userName,
                  onGetStarted: () {
                    ref.read(welcomeProvider.notifier).markWelcomeAsSeen();
                  },
                ),
              ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildListDelegate([
                  _QuickActionCard(
                    icon: Icons.local_offer,
                    title: 'Flash Deals',
                    color: Colors.orange.shade100,
                    onTap: () => Navigator.pushNamed(context, '/flash-deals'),
                  ),
                  _QuickActionCard(
                    icon: Icons.category,
                    title: 'Categories',
                    color: Colors.blue.shade100,
                    onTap: () => Navigator.pushNamed(context, '/categories'),
                  ),
                  _QuickActionCard(
                    icon: Icons.favorite,
                    title: 'Wishlist',
                    color: Colors.red.shade100,
                    onTap: () => Navigator.pushNamed(context, '/wishlist'),
                  ),
                  _QuickActionCard(
                    icon: Icons.shopping_cart,
                    title: 'Cart',
                    color: Colors.green.shade100,
                    onTap: () => Navigator.pushNamed(context, '/cart'),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeMessage extends StatelessWidget {
  final String userName;
  final VoidCallback onGetStarted;

  const WelcomeMessage({
    super.key,
    required this.userName,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi $userName! 👋',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Welcome to your one-stop shopping destination. We\'re excited to help you discover amazing products at great prices!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: onGetStarted,
            child: const Text('Get Started'),
          ),
          const SizedBox(height: 32),
          const Divider(),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: Colors.black87,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
