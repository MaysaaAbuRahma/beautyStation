

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omkcpa/constants/app_constants.dart';
import 'package:omkcpa/widget/form.dart';
import 'package:omkcpa/widget/home.dart';
import '../controller/salon_form_controller.dart';
import '../widget/salon_form_widgets.dart';

class SalonRegistrationForm extends StatelessWidget {
  SalonRegistrationForm({super.key});

  final SalonFormController controller = Get.put(SalonFormController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
         endDrawer: buildDrawer(),
        backgroundColor: AppConstants.backgroundColor,
        appBar: AppBar(
          title: const Text(
            AppConstants.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppConstants.primaryColor,
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SectionHeader(
                title: AppConstants.headerText,
                color: AppConstants.primaryColor,
              ),
              const SizedBox(height: 16),

              FormCard(
                title: AppConstants.sectionBusinessInfo,
                children: [
                  InputFieldX(
                    label: AppConstants.centerNameLabel,
                    hint: AppConstants.centerNameHint,
                    field: controller.centerName,
                  ),
                  InputFieldX(
                    label: AppConstants.commercialRegLabel,
                    hint: AppConstants.commercialRegHint,
                    field: controller.commercialReg,
                  ),
                  DropdownFieldX(
                    label: AppConstants.businessTypeLabel,
                    items: AppConstants.businessTypes,
                    selected: controller.businessType,
                  ),
                  InputFieldX(
                    label: AppConstants.descriptionLabel,
                    hint: AppConstants.descriptionHint,
                    field: controller.description,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              FormCard(
                title: AppConstants.sectionContactInfo,
                children: [
                  InputFieldX(
                    label: AppConstants.phoneLabel,
                    hint: AppConstants.phoneHint,
                    field: controller.phone,
                  ),
                  InputFieldX(
                    label: AppConstants.whatsappLabel,
                    hint: AppConstants.whatsappHint,
                    field: controller.whatsapp,
                  ),
                  InputFieldX(
                    label: AppConstants.emailLabel,
                    hint: AppConstants.emailHint,
                    field: controller.email,
                  ),
                  InputFieldX(
                    label: AppConstants.websiteLabel,
                    hint: AppConstants.websiteHint,
                    field: controller.website,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              FormCard(
                title: AppConstants.sectionLocation,
                children: [
                  DropdownFieldX(
                    label: AppConstants.cityLabel,
                    items: AppConstants.cityOptions,
                    selected: controller.city,
                  ),
                  InputFieldX(
                    label: AppConstants.areaLabel,
                    hint: AppConstants.areaHint,
                    field: controller.area,
                  ),
                  InputFieldX(
                    label: AppConstants.addressLabel,
                    hint: AppConstants.addressHint,
                    field: controller.address,
                  ),
                  InputFieldX(
                    label: AppConstants.mapLinkLabel,
                    hint: AppConstants.mapLinkHint,
                    field: controller.googleMapLink,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              FormCard(
                title: AppConstants.sectionAttachments,
                children: [
                  FilePickerFieldX(
                    label: AppConstants.fileCommercialLabel,
                    file: controller.commercialFile,
                    onPickFile: () =>
                        controller.pickFile(controller.commercialFile),
                  ),
                  FilePickerFieldX(
                    label: AppConstants.fileTaxLabel,
                    file: controller.taxFile,
                    onPickFile: () => controller.pickFile(controller.taxFile),
                  ),
                  FilePickerFieldX(
                    label: AppConstants.fileNationalAddressLabel,
                    file: controller.nationalAddressFile,
                    onPickFile: () =>
                        controller.pickFile(controller.nationalAddressFile),
                  ),
                  FilePickerFieldX(
                    label: AppConstants.fileVatLabel,
                    file: controller.vatFile,
                    onPickFile: () => controller.pickFile(controller.vatFile),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              buildAgreementSection(context),
            ],
          ),
        ),
      ),
    );
  }
}
