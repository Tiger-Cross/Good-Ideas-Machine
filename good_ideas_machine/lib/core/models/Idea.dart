class Idea {
  String title;
  String description;
  int originalityRating;
  int feasibilityRating;
  int impactRating;

  Idea({ this.title, this.description, this.originalityRating,
      this.feasibilityRating, this.impactRating });

  Idea.fromMap(Map snapshot, String title)
      : title = title ?? '',
        description = snapshot['description'] ?? '',
        originalityRating = snapshot['originalityRating'] ?? '',
        feasibilityRating = snapshot['feasibilityRating'] ?? '',
        impactRating = snapshot['impactRating'] ?? '';

  toJson() {
    return {
      'description' : description,
      'originalityRating' : originalityRating,
      'feasibilityRating' : feasibilityRating,
      'impactRating' : impactRating,
    };
  }
}
