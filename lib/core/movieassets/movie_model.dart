class Movie {
  final String title;
  final String imageUrl;
  final int year;
  final double rating;
  final String details;
  final String trailerUrl;
  final int duration;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.year,
    required this.rating,
    required this.details,
    required this.trailerUrl,
    required this.duration,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'غير معروف',
      imageUrl: json['imageUrl'] ?? '',
      year: json['year'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      details: json['details'] ?? '',
      trailerUrl: json['trailerUrl'] ?? '',
      duration: json['duration'] ?? 0,
    );
  }
}
