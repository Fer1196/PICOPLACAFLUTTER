
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
          date.weekday == 1
              ? messageDialog(false, 'Lunes, placas 1-2', context)
              : messageDialog(true, '', context);
        }
        break;
      case '2':
        {
          date.weekday == 1
              ? messageDialog(false, 'Lunes, placas 1-2', context)
              : messageDialog(true, '', context);
        }
        break;
      case '3':
        {
          date.weekday == 2
              ? messageDialog(false, 'Martes, placas 3-4', context)
              : messageDialog(true, '', context);
        }
        break;
      case '4':
        {
          date.weekday == 2
              ? messageDialog(false, 'Martes, placas 3-4', context)
              : messageDialog(true, '', context);
        }
        break;
      case '5':
        {
          date.weekday == 3
              ? messageDialog(false, 'Miércoles, placas 5-6', context)
              : messageDialog(true, '', context);
        }
        break;
      case '6':
        {
          date.weekday == 3
              ? messageDialog(false, 'Miércoles, placas 5-6', context)
              : messageDialog(true, '', context);
        }
        break;
      case '7':
        {
          date.weekday == 4
              ? messageDialog(false, 'Jueves, placas 7-8', context)
              : messageDialog(true, '', context);
        }
        break;
      case '8':
        {
          date.weekday == 4
              ? messageDialog(false, 'Jueves, placas 7-8', context)
              : messageDialog(true, '', context);
        }
        break;
      case '9':
        {
          date.weekday == 5
              ? messageDialog(false, 'Viernes, placas 9-0', context)
              : messageDialog(true, '', context);
        }
        break;
      case '0':
        {
          date.weekday == 5
              ? messageDialog(false, 'Viernes, placas 9-0', context)
              : messageDialog(true, '', context);
        }
        break;
      default:
    }
  }
}

void messageDialog(bool msg, String content, BuildContext context) {
  msg ? PlataformAlertDialog(
              title: "No hay Pico y placa",
              content:
                  "Circule libremente Sábados y Domingos. \n Y toda la semana de 21 horas a 4 horas",
              defaultActionText: "Aceptar")
          .show(context)
      : PlataformAlertDialog(
              title: "Pico y Placa",
              content: 'Día $content, de 5:00 a 21:00',
              defaultActionText: "Aceptar")
          .show(context);
}
  
}