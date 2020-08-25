import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picoplaca/common_widgets/platform_alert_dialog.dart';

import '../model/pico_placa_validator.dart';

class PicoPlacaScreen extends StatefulWidget {
  @override
  _PicoPlacaScreenState createState() => _PicoPlacaScreenState();
}

class _PicoPlacaScreenState extends State<PicoPlacaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _digitisPlate = TextEditingController();
  final _letterPlate = TextEditingController();
  final FocusNode _digitFocusNode = FocusNode();
  final FocusNode _letterFocusNode = FocusNode();
  DateTime dateTime = DateTime.now();
  String placa;
  PicoPlacaValidator validar = PicoPlacaValidator();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _digitisPlate.dispose();
    _letterPlate.dispose();
    _digitFocusNode.dispose();
    _letterFocusNode.dispose();
    super.dispose();
  }

  bool _validareAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _verificar() {
    if (_validareAndSaveForm()) {
      validar.picoPlaca(placa, dateTime, context);
    } else {
      PlataformAlertDialog(
              title: "Datos Incompletos",
              content: "Verifique los datos",
              defaultActionText: "Aceptar")
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pico y Placa'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildForm(),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 120,
                    width: 300,
                    child: CupertinoDatePicker(
                      use24hFormat: true,
                      initialDateTime: dateTime,
                      onDateTimeChanged: (dateTime1) {
                        setState(() {
                          dateTime = dateTime1;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    child: Text(
                      'Verificar Pico y Placa',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _verificar,
                    color: Colors.pink,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFields(),
      ),
    );
  }

  List<Widget> _buildFields() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Ingrese placa PCF'),
        textCapitalization: TextCapitalization.characters,
        maxLength: 3,
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(_digitFocusNode),
        validator: (value) => value.isNotEmpty &&
                value[0].contains(new RegExp(r'[ABUCXHOEWGILRMVNSPKQTZY]')) &&
                value.length == 3
            ? null
            : '4 digitos o Placa inválida',
        onSaved: (value) => placa = value,
      ),
      SizedBox(
        height: 50,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Ingrese número 0250'),
        keyboardType: TextInputType.number,
        maxLength: 4,
        controller: _digitisPlate,
        focusNode: _digitFocusNode,
        validator: (value) =>
            value.isNotEmpty && value.length == 4 ? null : '4 digitos ',
        onSaved: (value) => placa = value,
      ),
    ];
  }
}
