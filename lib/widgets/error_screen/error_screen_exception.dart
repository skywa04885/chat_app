import 'package:flutter/material.dart';

class ErrorScreenException extends StatelessWidget {
  final String title;
  final String subtitle;

  const ErrorScreenException(this.title, this.subtitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.dangerous_outlined,
                  size: 30.0,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
