import 'dart:io';
import 'package:flutter/material.dart';
import 'package:picoplaca/common_widgets/platform_alert_dialog.dart';

class PicoPlacaValidator {
  void picoPlaca(String placa, DateTime date, BuildContext context) {
    if (date.weekday == 6 || date.weekday == 7) {
      messageDialog(true, '', context);
    } else if (date.hour < 5 || date.hour > 20) {
      messageDialog(true, '', context);
    } else {
      switch (placa[3]) {
        case '1':
          {
            messageDialog( date.weekday == 1 ? false : true, 'Lunes, placas 1-2', context);
          }
          break;
        case '2':
          {
            messageDialog(date.weekday == 1 ? false : true, 'Lunes, placas 1-2', context);
          }
          break;
        case '3':
          {
            messageDialog(date.weekday == 2 ? false : true,'Martes, placas 3-4', context);
          }
          break;
        case '4':
          {
            messageDialog(date.weekday == 2 ? false : true, 'Martes, placas 3-4', context);
          }
          break;
        case '5':
          {
            messageDialog(date.weekday == 3 ? false : true,'Miércoles, placas 5-6', context);
          }
          break;
        case '6':
          {
            messageDialog(date.weekday == 3 ? false : true,'Miércoles, placas 5-6', context);
          }
          break;
        case '7':
          {
            messageDialog(date.weekday == 4 ? false : true,'Jueves, placas 7-8', context);
          }
          break;
        case '8':
          {
            messageDialog(date.weekday == 4 ? false : true,'Jueves, placas 7-8', context);
          }
          break;
        case '9':
          {
            messageDialog(date.weekday == 5 ? false : true,'Viernes, placas 9-0', context);
          }
          break;
        case '0':
          {
            messageDialog(date.weekday == 5 ? false : true,'Viernes, placas 9-0', context);
          }
          break;
        default:
      }
    }
  }

  void messageDialog(bool msg, String content, BuildContext context) {
    PlataformAlertDialog(
            title: msg ? "No hay Pico y placa" : "Pico y Placa",
            content: msg
                ? "Circule libremente Sábados y Domingos. \n Y toda la semana de 21 horas a 4 horas"
                : 'Día $content, de 5:00 a 21:00',
            defaultActionText: "Aceptar")
        .show(context);
  }
}
