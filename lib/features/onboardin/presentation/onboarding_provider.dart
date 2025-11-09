import 'package:flutter/material.dart';
import 'package:hotelino/features/onboardin/data/repositories/onboarding_repository.dart';

class OnboardingProvider extends ChangeNotifier {
  final OnboardingRepository repository;

  OnboardingProvider(this.repository) {
    _loadData();
  }

  int currentPage = 0;

  List<Map<String, String>> onboardingData = [];

  void _loadData() {
    onboardingData = repository.onboardingData;
    notifyListeners();
  }

  void updateCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
