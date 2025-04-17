import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(List<double>) onParseNumber;

  const InputField({
    Key? key,
    required this.controller,
    required this.onParseNumber,
  }) : super(key: key);

  List<double> _parseNumbers(String input) {
    try {
      return input
          .split(',')
          .map((e) => double.tryParse(e.trim()) ?? 0.0)
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingresa números separados por comas:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 16.0, color: Colors.black87),
            decoration: InputDecoration(
              hintText: 'Ejemplo: 1, 2, 3',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: Colors.blueAccent,
                  width: 1.5,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 14.0,
              ),
              prefixIcon: const Icon(Icons.numbers, color: Colors.blueAccent),
            ),
            onChanged: (value) {
              final numbers = _parseNumbers(value);
              onParseNumber(numbers);
            },
          ),
        ],
      ),
    );
  }
}
