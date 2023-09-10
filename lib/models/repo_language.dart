class RepoLanguage {
  const RepoLanguage({
    required this.name,
    required this.value,
    this.color = '#808080',
  });

  final String name;
  final int value;
  final String color;
}
