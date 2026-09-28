class AuthOption {
  final String image;
  final String title;

  const AuthOption({required this.image, required this.title});
}

final List<AuthOption> authOptions = [
  const AuthOption(
    image: "https://img.icons8.com/?size=96&id=17949&format=png",
    title: "Continue with Google",
  ),
  const AuthOption(
    image: "https://img.icons8.com/?size=100&id=30840&format=png&color=000000",
    title: "Continue with Apple",
  ),
  const AuthOption(
    image: "https://img.icons8.com/?size=100&id=13912&format=png&color=000000",
    title: "Continue with Facebook",
  ),
];