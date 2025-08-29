import 'dart:io';

class Alumno {
  String nombre;
  double promedio;

  Alumno(this.nombre, this.promedio);

  String get condicion => promedio >= 12 ? "Aprobado" : "Desaprobado";
}

void main() {
  List<Alumno> alumnos = [];
  int opcion = -1;

  while (opcion != 0) {
    print("\n===== MENÚ PRINCIPAL =====");
    print("1) Ingresar datos");
    print("2) Reporte de alumnos");
    print("3) Promedio General");
    print("0) Salir");
    stdout.write("Seleccione una opción: ");
    opcion = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

    switch (opcion) {
      case 1:
        ingresarDatos(alumnos);
        break;
      case 2:
        reporteAlumnos(alumnos);
        break;
      case 3:
        promedioGeneral(alumnos);
        break;
      case 0:
        print("Saliendo del programa...");
        break;
      default:
        print("Opción inválida. Intente nuevamente.");
    }
  }
}

void ingresarDatos(List<Alumno> alumnos) {
  String continuar = "s";
  while (continuar.toLowerCase() == "s") {
    stdout.write("Ingrese el nombre del alumno: ");
    String nombre = stdin.readLineSync() ?? "";

    stdout.write("Ingrese el promedio: ");
    double promedio = double.tryParse(stdin.readLineSync() ?? "") ?? 0;

    alumnos.add(Alumno(nombre, promedio));

    stdout.write("¿Desea agregar otro alumno? (s/n): ");
    continuar = stdin.readLineSync() ?? "n";
  }
}

void reporteAlumnos(List<Alumno> alumnos) {
  if (alumnos.isEmpty) {
    print("No hay alumnos registrados.");
    return;
  }
  print("\n===== REPORTE DE ALUMNOS =====");
  for (var alumno in alumnos) {
    print("Alumno: ${alumno.nombre}");
    print("Promedio: ${alumno.promedio}");
    print("Condición: ${alumno.condicion}");
    print("***************************");
  }
}

void promedioGeneral(List<Alumno> alumnos) {
  if (alumnos.isEmpty) {
    print("No hay alumnos registrados.");
    return;
  }
  double suma = alumnos.fold(0, (acum, alumno) => acum + alumno.promedio);
  double promedio = suma / alumnos.length;
  print("\n===== PROMEDIO GENERAL =====");
  print(
    "El promedio general de todos los alumnos es: ${promedio.toStringAsFixed(2)}",
  );
}
