class CampusLocation {
  const CampusLocation({
    required this.name,
    required this.area,
    required this.description,
    required this.image,
    required this.routeInstructions,
  });

  final String name;
  final String area;
  final String description;
  final String image;
  final List<String> routeInstructions;
}