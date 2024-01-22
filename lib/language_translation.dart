import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() {
    return _LanguageTranslationPageState();
  }
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = ['English', 'Hindi', 'Punjabi', 'Telugu'];
  var originLanguage = 'From';
  var destinationLanguage = 'To';
  var output = '';
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if (src == '--' || dest == '--') {
      setState(() {
        output = 'Fail to translate';
      });
    }
  }

  String getLanguageCode(String language) {
    if (language == 'English') return 'en';
    if (language == 'Hindi') return 'hi';
    if (language == 'Punjabi') return 'pa';
    if (language == 'Telugu') return 'te';
    return '--';
  }

  @override
  Widget build(constext) {
    return Scaffold(
      backgroundColor: const Color(0xff10223d),
      appBar: AppBar(
        title: const Text('Language Translator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  DropdownButton(
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      originLanguage,
                      style: const TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 40),
                  const Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(width: 40),
                  DropdownButton(
                    hint: Text(
                      destinationLanguage,
                      style: const TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Please enter the text...',
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                  controller: languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter the text to translate...';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    translate(
                        getLanguageCode(originLanguage),
                        getLanguageCode(destinationLanguage),
                        languageController.text.toString());
                  },
                  child: const Text('Translate'),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '\n$output',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
