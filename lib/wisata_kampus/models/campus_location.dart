class CampusLocation {
  const CampusLocation({
    required this.name,
    required this.area,
    required this.description,
    required this.icon,
    required this.routeInstructions,
  });

  final String name;
  final String area;
  final String description;
  final String icon;
  final List<String> routeInstructions;
}