class EnvConfig {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://eerkdsoogvotktvecqwj.supabase.co',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVlcmtkc29vZ3ZvdGt0dmVjcXdqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzczOTAxMjEsImV4cCI6MjA1Mjk2NjEyMX0.7dNAn_RIW3pSHYqo8dKfp-dk-sCbO7b9-VwFYhO0pqM',
  );

  static const String stripePublishableKey = String.fromEnvironment(
    'STRIPE_PUBLISHABLE_KEY',
    defaultValue: 'YOUR_STRIPE_PUBLISHABLE_KEY',
  );
}
