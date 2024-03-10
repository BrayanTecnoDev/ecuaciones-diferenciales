import 'dart:math' as math;

//Hallar la constante K
double hallarKPoblacion(
    {required double p0, required double p1, double t = 1}) {
  double result = p1 / p0;
  return math.log(result / t);
}

// Hallar tiempo final cuando tengo una población dada.
double hallarTiempoP(
    {required double p0, required double p2, required double k}) {
  double result = p2 / p0;
  return math.log(result) / k;
}

// Hallar población en el tiempo
double hallarPoblacionFinal(
    {required double p0, required double k, required double t}) {
  return p0 * (math.exp(k * t));
}
