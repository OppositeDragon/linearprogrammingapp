enum ProcessTypes {
  simplex(label: 'Simplex'),
  algebraic(label: 'Algebraico'),
  graphic(label: 'Gráfico');

  const ProcessTypes({required this.label});
  final String label;
}

enum Operators {
  geq(label: '≥'),
  leq(label: '≤'),
  equal(label: '=');

  const Operators({required this.label});
  final String label;
}

enum Objectives {
  max(label: 'Maximizar'),
  min(label: 'Minimizar');

  const Objectives({required this.label});
  final String label;
}
