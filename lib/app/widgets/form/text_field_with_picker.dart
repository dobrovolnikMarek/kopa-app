import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TextFieldWithPicker extends StatelessWidget {
  final List<String>? itemsList;
  final Function onSelectItem;
  final String name;
  final String errorText;
  final Widget? prefix;
  final bool? isSizesItems;

  const TextFieldWithPicker(
      {Key? key,
      this.itemsList,
      required this.onSelectItem,
      required this.name,
      this.prefix,
      this.isSizesItems, required this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showDialog(Widget child) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      );
    }

    return FormBuilderTextField(
      key: Key(name),
      showCursor: false,
      enableInteractiveSelection: false,
      onTap: () {
        _showDialog(
          CupertinoPicker(
              selectionOverlay: Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              itemExtent: 45,
              onSelectedItemChanged: (int value) {
                onSelectItem(itemsList?[value] ?? (value + 18).toString(),
                    name
                    );
              },
              children: isSizesItems != null
                  ? List<Widget>.generate(
                      20,
                      (int index) {
                        return Center(
                          child: Text(
                            (index + 18).toString(),
                          ),
                        );
                      },
                    )
                  : itemsList!
                      .map(
                        (e) => Center(
                          child: Text(
                            e,
                            style: const TextStyle(fontSize: 23),
                          ),
                        ),
                      )
                      .toList(),
              ),
        );
      },
      name: name,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      keyboardType: TextInputType.none,
      decoration: InputDecoration(
        prefix: prefix,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: Color.fromRGBO(255, 255, 255, 0.38),
          ),
        ),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: errorText,
        ),
      ]),
    );
  }
}
