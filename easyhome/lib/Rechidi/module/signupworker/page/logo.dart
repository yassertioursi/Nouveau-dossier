part of 'index.dart';

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.network(
      "https://lottie.host/646b0918-eb09-421d-9424-3d8d245a7bc8/cThRm7xKjU.json",
      height: 220.h,
    );
  }
}
