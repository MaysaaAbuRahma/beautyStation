
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:omkcpa/constants/app_constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Color color;
  const SectionHeader({required this.title, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: color, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class FormCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const FormCard({required this.title, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppConstants.backgroundColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: AppConstants.textColor )),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class InputFieldX extends StatelessWidget {
  final String label;
  final String hint;
  final RxString field;
  const InputFieldX({required this.label, required this.hint, required this.field, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 6),
          TextField(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            onChanged: (value) => field.value = value,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownFieldX extends StatelessWidget {
  final String label;
  final List<String> items;
  final RxnString selected;
  const DropdownFieldX({required this.label, required this.items, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 6),
          Obx(() => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selected.value,
                    isExpanded: true,
                    hint: const Text("اختر.."),
                    icon: const Icon(Icons.arrow_drop_down),
                    alignment: Alignment.centerRight,
                    onChanged: (value) => selected.value = value,
                    items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class FilePickerFieldX extends StatelessWidget {
  final String label;
  final RxnString file;
  final Function() onPickFile;
  const FilePickerFieldX({required this.label, required this.file, required this.onPickFile, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          const SizedBox(height: 8),
          Obx(() => OutlinedButton.icon(
                onPressed: onPickFile,
                icon: const Icon(Icons.attach_file),
                label: Text(file.value ?? "اختر ملف"),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size.fromHeight(48),
                ),
              )),
          const SizedBox(height: 4),
          const Text("امتداد مسموح: PDF فقط",
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}


