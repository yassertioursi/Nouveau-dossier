import 'package:flutter/material.dart';

extension SnackBars on BuildContext {
  void showSuccessMessage(String title, String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          message,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Positioned(
            left: 20,
            top: 30,
            child: Icon(
              Icons.circle,
              size: 24,
              color: Colors.green[900],
            ),
          ),
          Positioned(
            left: 0,
            top: -15,
            child: Icon(
              Icons.circle,
              size: 40,
              color: Colors.green[900],
            ),
          ),
          Positioned(
            left: 8,
            top: -8,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
              child: const Icon(
                Icons.close,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  void showWarningMessage(String title, String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          message,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Positioned(
            left: 20,
            top: 30,
            child: Icon(
              Icons.circle,
              size: 24,
              color: Colors.yellow[900],
            ),
          ),
          Positioned(
            left: 0,
            top: -15,
            child: Icon(
              Icons.circle,
              size: 40,
              color: Colors.yellow[900],
            ),
          ),
          Positioned(
            left: 8,
            top: -8,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
              child: const Icon(
                Icons.close,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  void showErrorMessage(String title, String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.red[700],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Positioned(
            left: 20,
            top: 30,
            child: Icon(
              Icons.circle,
              size: 24,
              color: Colors.red[900],
            ),
          ),
          Positioned(
            left: 0,
            top: -15,
            child: Icon(
              Icons.circle,
              size: 40,
              color: Colors.red[900],
            ),
          ),
          Positioned(
            left: 8,
            top: -8,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
              child: const Icon(
                Icons.close,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  void showInfoMessage(String title, String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
          Positioned(
            left: 20,
            top: 30,
            child: Icon(
              Icons.circle,
              size: 24,
              color: Colors.blue[900],
            ),
          ),
          Positioned(
            left: 0,
            top: -15,
            child: Icon(
              Icons.circle,
              size: 40,
              color: Colors.blue[900],
            ),
          ),
          Positioned(
            left: 8,
            top: -8,
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
              child: const Icon(
                Icons.close,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }
}
