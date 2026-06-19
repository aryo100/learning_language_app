import 'package:flutter/material.dart';
import 'package:learning_language_app/const/color.dart';
import 'package:learning_language_app/const/typography.dart';
import 'package:learning_language_app/widgets/button/fill_button_widget.dart';

void showCheckInSuccessSheet(
  BuildContext context, {
  required int pointsEarned,
  required int streakDays,
}) {
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                size: 64,
                color: ColorPallete.success,
              ),
              const SizedBox(height: 16),
              Text(
                'Check-in successful!',
                style: body.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '+$pointsEarned points · Streak: $streakDays day${streakDays == 1 ? '' : 's'}',
                style: caption,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FillButtonWidget(
                label: 'OK',
                textStyle: const TextStyle(color: Colors.white),
                backgroundColor: ColorPallete.accent,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}
