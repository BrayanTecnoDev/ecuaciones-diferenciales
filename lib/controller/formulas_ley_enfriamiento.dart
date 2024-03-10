import 'dart:math' as math;

///Algunas abreviaciones:
///Donde:
///t0 = temperatura inicial
///ta = temperatura ambiente
///t1 = temperatura en tiempo(1)
///c = constante C
///k = constante K


///Hallar la constante C
double hallarC({required double t0, required double ta}) => t0 - ta;

///Realiza una resta entre temperatura 1 y temperatura ambiente
///Luego divide por la constante C
double operacionValores(
        {required double t1, required double ta, required double c}) =>
    (t1 - ta) / c;

//Hallar la constante K
double hallarKEnfriamiento(
    {required double t1,
    required double c,
    required double ta,
    double tiempo = 1}) {
  double res = operacionValores(t1: t1, ta: ta, c: c);
  return math.log(res / tiempo);
}

//Hallar tiempo
double hallarTiempoE(
    {required double k,
    required double ta,
    required double t2,
    required double c}) {
  double res = operacionValores(t1: t2, ta: ta, c: c);
  return math.log(res)/k;
}

// Hallar Temperatura final
double hallarTemperaturaFinal(
    {required double c,
    required double ta,
    required double k,
    required double t}) {
  return ta + c * (math.exp(k * t));
}
