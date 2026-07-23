import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/auth/forgot_password_screen.dart';
import 'package:funica/presentation/pages/profile/14_light_fill_profile.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Tombol Kembali (Back)
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 10),

              // 2. Logo Aplikasi di Tengah
              Center(
                child: SizedBox(
                  height: 60,
                  child: Image.asset(
                    'assets/images/bg_screen12.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 3. Judul "Login to Your Account"
              const Center(
                child: Text(
                  "Login to Your Account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F1D2B),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 4. Input Email
              TextField(
                controller: _emailController,
                style: const TextStyle(
                  color: Color(0xFF1F1D2B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xFF1F1D2B),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFAFAFA),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFEFEFEF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFEFEFEF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF1F1D2B),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 5. Input Password
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(
                  color: Color(0xFF1F1D2B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: Color(0xFF9E9E9E),
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Color(0xFF1F1D2B),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFF1F1D2B),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFAFAFA),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFEFEFEF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFEFEFEF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF1F1D2B),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 6. Checkbox "Remember me"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: _rememberMe,
                      activeColor: const Color(0xFF1F1D2B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color(0xFF1F1D2B),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 7. Tombol Sign In (Navigasi ke Screen 14 - Fill Your Profile)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FillProfileScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F1D2B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 8. Teks "Forgot the password?"
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot the password?',
                    style: TextStyle(
                      color: Color(0xFF1F1D2B),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 9. Garis Pembatas "or continue with"
              Row(
                children: const [
                  Expanded(
                    child: Divider(color: Color(0xFFE0E0E0), thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or continue with',
                      style: TextStyle(
                        color: Color(0xFF9E9E9E),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Color(0xFFE0E0E0), thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 10. Tombol Media Sosial
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIconButton(
                    icon: const Icon(
                      Icons.facebook,
                      color: Color(0xFF1877F2),
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIconButton(
                    icon: Image.asset(
                      'assets/icons/Google.png',
                      height: 22,
                      width: 22,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIconButton(
                    icon: const Icon(
                      Icons.apple,
                      color: Colors.black,
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // 11. Teks Bawah: Don't have an account? Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFF1F1D2B),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIconButton({
    required Widget icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFEFEFEF)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
