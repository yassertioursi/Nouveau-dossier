import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropJobs extends StatelessWidget {
  const DropJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DropJobsProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: Flexible(
            child: DropdownButton<String>(
              hint: const Text(
                "  Job:",
                style: TextStyle(
                  color: MyColors.mainblue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              borderRadius: BorderRadius.circular(10),
              underline: Container(),
              focusColor: Colors.white,
              value: provider.dropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: MyColors.mainblue,
                size: 25,
              ),
              onChanged: (newValue) {
                provider.updateDropdownValue(newValue);
              },
              items: provider.categories
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "  $value",
                      style: const TextStyle(
                        color: MyColors.mainblue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class DropJobsProvider with ChangeNotifier {
  String? _dropdownValue;
  final List<String> _categories = Workers_Cat().cats;

  String? get dropdownValue => _dropdownValue;
  List<String> get categories => _categories;

  void updateDropdownValue(String? newValue) {
    _dropdownValue = newValue;
    notifyListeners();
  }
}
