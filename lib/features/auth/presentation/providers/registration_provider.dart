import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoply/core/config/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'registration_provider.g.dart';

class RegistrationState {
  final bool isLoading;
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final String? error;

  const RegistrationState({
    this.isLoading = false,
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
    this.error,
  });

  RegistrationState copyWith({
    bool? isLoading,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    String? error,
  }) {
    return RegistrationState(
      isLoading: isLoading ?? this.isLoading,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword: obscureConfirmPassword ?? this.obscureConfirmPassword,
      error: error,
    );
  }
}

@riverpod
class Registration extends _$Registration {
  @override
  RegistrationState build() => const RegistrationState();

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  void toggleConfirmPasswordVisibility() {
    state = state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword);
  }

  Future<bool> register(String email, String password) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final response = await SupabaseConfig.auth.signUp(
        email: email.trim(),
        password: password,
      );

      if (response.user != null) {
        return true;
      }
      
      state = state.copyWith(
        error: 'Registration failed. Please try again.',
      );
      return false;
    } on AuthException catch (e) {
      state = state.copyWith(error: e.message);
      return false;
    } catch (e) {
      state = state.copyWith(
        error: 'An unexpected error occurred. Please try again.',
      );
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
