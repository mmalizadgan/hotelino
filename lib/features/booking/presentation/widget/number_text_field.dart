import 'package:flutter/material.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:hotelino/features/booking/data/models/country_phone.dart';

class NumberTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final String initialValue;
  const NumberTextField({
    super.key,
    this.validator,
    this.onSaved,
    required this.initialValue,
  });

  @override
  State<NumberTextField> createState() => NumberTextFieldState();
}

class NumberTextFieldState extends State<NumberTextField> {
  late CountryPhone selectedCountry;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  TextAlign _textAlign = TextAlign.right;

  final List<CountryPhone> countries = [
    CountryPhone(name: 'ایران', dialCode: '+98', countryCode: 'IR'),
    CountryPhone(name: 'ایالات متحده', dialCode: '+1', countryCode: 'US'),
    CountryPhone(name: 'بریتانیا', dialCode: '+44', countryCode: 'GB'),
    CountryPhone(name: 'آلمان', dialCode: '+49', countryCode: 'DE'),
    CountryPhone(name: 'فرانسه', dialCode: '+33', countryCode: 'FR'),
    CountryPhone(name: 'اسپانیا', dialCode: '+34', countryCode: 'ES'),
    CountryPhone(name: 'ایتالیا', dialCode: '+39', countryCode: 'IT'),
    CountryPhone(name: 'استرالیا', dialCode: '+61', countryCode: 'AU'),
    CountryPhone(name: 'هند', dialCode: '+91', countryCode: 'IN'),
  ];

  @override
  void initState() {
    super.initState();
    selectedCountry = countries[0];
    _controller.text = widget.initialValue;

    _controller.addListener(() {
      setState(() {
        _textAlign = _controller.text.isEmpty
            ? TextAlign.right
            : TextAlign.left;
      });
    });

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: _controller.text,
      validator: widget.validator,
      onSaved: widget.onSaved,
      builder: (FormFieldState<String> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("شماره تماس", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            SizedBox(
              height: 56,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: field.hasError
                        ? Theme.of(context).colorScheme.error
                        : _focusNode.hasFocus
                        ? Theme.of(context).colorScheme.primary
                        : AppColors.lightBorder,
                    width: field.hasError ? 1 : 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SizedBox(
                      width: 160,
                      child: DropdownButton<CountryPhone>(
                        value: selectedCountry,
                        isExpanded: true,
                        items: countries.map((CountryPhone country) {
                          return DropdownMenuItem<CountryPhone>(
                            value: country,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  'https://flagsapi.com/${country.countryCode}/shiny/64.png',
                                  width: 28,
                                  height: 28,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.flag, size: 28),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  country.name,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(width: 8),
                                Text(country.dialCode),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (CountryPhone? newCountry) {
                          if (newCountry != null) {
                            setState(() {
                              selectedCountry = newCountry;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.number,
                        textAlign: _textAlign,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                          filled: false,
                          border: InputBorder.none,
                          hintText: '...شماره تماس',
                        ),
                        onChanged: (value) {
                          field.didChange(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 12),
                child: Text(
                  field.errorText ?? '',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
