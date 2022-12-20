import 'package:aden_envanterus/core/service/dependecy_service.dart';
import 'package:aden_envanterus/core/widgets/bodymedium.dart';
import 'package:aden_envanterus/core/widgets/headline6.dart';
import 'package:aden_envanterus/feature/customers/view_model/customer_form.dart';
import 'package:aden_envanterus/models/customer_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../../core/widgets/bodysmall.dart';

class CreateCustomersView extends StatefulWidget {
  const CreateCustomersView({Key? key}) : super(key: key);

  @override
  State<CreateCustomersView> createState() => _CreateCustomersViewState();
}

class _CreateCustomersViewState extends State<CreateCustomersView> {
  String customerCompanyName = '';
  String authorityName = '';
  String customerEmail = '';
  String customerPhone = '';
  String taxPlace = '';
  String taxNo = '';
  String adress = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Headline6(data: 'Müşteri Oluştur'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: CustomerForm.customerForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Bodymedium(data: 'Lütfen Müşteri Bilgilerini Giriniz'),
              const SizedBox(
                height: 20,
              ),
              const Bodysmall(data: 'Müşteri Firma Adı :'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (newValue) {
                  customerCompanyName = newValue!;
                },
                validator: Validators.required('Bu alan boş geçilemez'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Bodysmall(data: 'Yetkili Adı Soyadı : *'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (newValue) {
                  authorityName = newValue!;
                },
                validator: Validators.required('Bu alan boş geçilemez'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Bodysmall(data: 'e-Mail Adresi : *'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (newValue) {
                  customerEmail = newValue!;
                },
                validator: Validators.compose([
                  Validators.required('Bu alan boş geçilemez'),
                  Validators.email('Geçersiz bir mail formatı'),
                ]),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Bodysmall(data: 'Müşteri Telefon Numarası : *'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (newValue) {
                  customerPhone = newValue!;
                },
                validator: Validators.required('Bu alan boş geçilemez'),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Bodysmall(data: 'Vergi Dairesi :'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (newValue) {
                  taxPlace = newValue!;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Bodysmall(data: 'Vergi No :'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (newValue) {
                  taxNo = newValue!;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Bodysmall(data: 'Adres :'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: 6,
                onSaved: (newValue) {
                  adress = newValue!;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  const Spacer(),
                  GFButton(
                    color: GFColors.DANGER,
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (CustomerForm.customerForm.currentState!.validate()) {
                        CustomerForm.customerForm.currentState!.save();
                        await getIt.get<CustomerMobx>().customerPostData(
                            customerCompanyName: customerCompanyName,
                            authorityName: authorityName,
                            customerEmail: customerEmail,
                            customerPhone: customerPhone,
                            taxPlace: taxPlace,
                            taxNo: taxNo,
                            adress: adress);
                        MotionToast.success(
                          onClose: () {
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              context.router.pop();
                            });
                          },
                          description: const Bodymedium(
                            data: 'Proje oluşturma işlemi başarıla tamamlandı',
                          ),
                          title: Bodymedium(
                              fontWeight: FontWeight.bold,
                              data: getIt.get<CustomerMobx>().infoMessage),
                        ).show(context);
                      } else {
                        getIt.get<CustomerMobx>().infoMessage = '';
                      }
                    },
                    child: const Bodysmall(data: 'Kaydet', color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
