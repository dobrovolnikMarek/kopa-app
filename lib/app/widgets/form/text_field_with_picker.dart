import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TextFieldWithPicker extends StatelessWidget {
  final List<String>? itemsList;
  final List<Map<String, String>>? sizeTypeList;
  final Function onSelectItem;
  final String name;
  final String? errorText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final bool? isSizesItems;
  final TextEditingController? textController;

  const TextFieldWithPicker(
      {Key? key,
      this.itemsList,
      required this.onSelectItem,
      required this.name,
      this.prefix,
      this.isSizesItems,
      this.errorText,
      this.prefixIcon,
      this.sizeTypeList, this.textController})
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
      controller: textController,
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
              onSelectItem(sizeTypeList != null ? sizeTypeList![value]['short'] : itemsList?[value] ?? (value == 0 ? "" : (value + 17).toString()), name);
            },
            children: isSizesItems != null
                ? List<Widget>.generate(
                    30,
                    (int index) {
                      return Center(
                        child: Text( index == 0 ? '' :
                          (index + 17).toString(),
                        ),
                      );
                    },
                  )
                : itemsList != null
                    ? itemsList!
                        .map(
                          (e) => Center(
                            child: Text(
                              e,
                              style: const TextStyle(fontSize: 23),
                            ),
                          ),
                        )
                        .toList()
                    : sizeTypeList!
                        .map(
                          (e) => Center(
                            child: Text(
                              e['full']!,
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
        prefixIcon: prefixIcon,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: Color.fromRGBO(255, 255, 255, 0.38),
          ),
        ),
      ),
      validator: errorText != null ?  FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: errorText,
        ),
      ]) : null,
    );
  }
}
