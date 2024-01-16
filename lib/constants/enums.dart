enum ProcessTypes {
  simplex(label: 'Simplex'),
  algebraic(label: 'Algebraico'),
  graphic(label: 'Gráfico');

  const ProcessTypes({required this.label});
  final String label;
}

enum Operators {
  leq(label: '≤', value: 1.0),
  geq(label: '≥', value: -1.0),
  equal(label: '=', value: -1.0);

  const Operators({required this.label, required this.value});
  final String label;
  final double value;
}

enum Objectives {
  max(label: 'Maximizar'),
  min(label: 'Minimizar');

  const Objectives({required this.label});
  final String label;
}

enum SimplexStatus {
  optimal(label: 'Óptimo'),
  unbounded(label: 'Ilimitado'),
  notOptimal(label: 'No Óptimo');

  const SimplexStatus({required this.label});
  final String label;
}
