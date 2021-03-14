import 'package:news/models/category_model.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> category = List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.bannerName = "Apple";
  categoryModel.categoryName = "Apple";
  categoryModel.q = "apple";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1614312385003-dcea7b8b6ab6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80";
  category.add(categoryModel);


  categoryModel = new CategoryModel();
  //
  categoryModel.bannerName = "Tesla";
  categoryModel.categoryName = "Tesla";
  categoryModel.q = "tesla";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1553260188-75a8d6205b6c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1000&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  //
  categoryModel.bannerName = "Microsoft";
  categoryModel.categoryName = "Microsoft";
  categoryModel.q = "microsoft";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1496171367470-9ed9a91ea931?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  //
  categoryModel.bannerName = "Google";
  categoryModel.categoryName = "Google";
  categoryModel.q = "google";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1518186285589-2f7649de83e0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  return category;

}