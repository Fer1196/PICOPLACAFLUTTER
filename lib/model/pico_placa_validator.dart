import 'dart:io';
import 'package:flutter/material.dart';
import 'package:picoplaca/common_widgets/platform_alert_dialog.dart';

class PicoPlacaValidator {
  void picoPlaca(String placa, DateTime date, BuildContext context) {
    if ((date.weekday == 6 || date.weekday == 7) ||
        !((date.hour >= 7) && (Duration(hours: date.hour, minutes: date.minute) <=Duration(hours: 9, minutes: 30)) 
        ||((date.hour >= 16 &&(Duration(hours: date.hour, minutes: date.minute) <=Duration(hours: 19, minutes: 30)))))) {
      messageDialog(true, '', context);
    } else {
      switch (placa[3]) {
        case '1':
          {
            messageDialog(
                date.weekday == 1 ? false : true, 'Lunes, placas 1-2', context);
          }
          break;
        case '2':
          {
            messageDialog(
                date.weekday == 1 ? false : true, 'Lunes, placas 1-2', context);
          }
          break;
        case '3':
          {
            messageDialog(date.weekday == 2 ? false : true,
                'Martes, placas 3-4', context);
          }
          break;
        case '4':
          {
            messageDialog(date.weekday == 2 ? false : true,
                'Martes, placas 3-4', context);
          }
          break;
        case '5':
          {
            messageDialog(date.weekday == 3 ? false : true,
                'Miércoles, placas 5-6', context);
          }
          break;
        case '6':
          {
            messageDialog(date.weekday == 3 ? false : true,
                'Miércoles, placas 5-6', context);
          }
          break;
        case '7':
          {
            messageDialog(date.weekday == 4 ? false : true,
                'Jueves, placas 7-8', context);
          }
          break;
        case '8':
          {
            messageDialog(date.weekday == 4 ? false : true,
                'Jueves, placas 7-8', context);
          }
          break;
        case '9':
          {
            messageDialog(date.weekday == 5 ? false : true,
                'Viernes, placas 9-0', context);
          }
          break;
        case '0':
          {
            messageDialog(date.weekday == 5 ? false : true,
                'Viernes, placas 9-0', context);
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
                ? "Circule libremente Sábados y Domingos. \n Y toda la semana de 9:30 a 16:00 horas y de 19:30 a 7:00 horas"
                : 'Día $content, de 7:00 a 9:30 y de 16:00 a 19:30',
            defaultActionText: "Aceptar")
        .show(context);
  }
}
