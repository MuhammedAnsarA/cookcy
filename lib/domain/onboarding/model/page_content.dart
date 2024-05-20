import 'package:cookcy/core/res/media_res.dart';
import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });

  const PageContent.first()
      : this(
          image: MediaRes.pageOne,
          title: 'Elevate Your Culinary Creations!',
          description:
              "Welcome to RecipeRise, your ultimate recipe app for culinary excellence! Discover a treasure trove of recipes from around the world, curated to inspire and delight.",
        );

  const PageContent.second()
      : this(
          image: MediaRes.pageTwo,
          title: "Very Easy Step-by-Step Guidance!",
          description:
              "Mastering a new recipe can be a breeze with FlavorFusion's step-by-step guidance! Follow along with clear instructions and helpful tips accompanying each recipe.",
        );

  const PageContent.third()
      : this(
          image: MediaRes.pageThree,
          title: 'Personilized Recommendations Just for You',
          description:
              "recommendations just for you! Simply tell us your dietary preferences, favorite cuisines, and cooking skill level, and we'll curate a selection of recipes perfectly suited to your taste.",
        );

  final String image;
  final String title;
  final String description;

  @override
  List<Object?> get props => [image, title, description];
}
