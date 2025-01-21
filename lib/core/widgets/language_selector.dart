import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoply/core/providers/locale_provider.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);

    return PopupMenuButton<String>(
      icon: const Icon(Icons.language),
      onSelected: (String languageCode) {
        ref.read(localeProvider.notifier).setLocale(Locale(languageCode));
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'en',
          child: Text('English'),
        ),
        const PopupMenuItem<String>(
          value: 'pl',
          child: Text('Polski'),
        ),
      ],
      initialValue: currentLocale.languageCode,
    );
  }
}
