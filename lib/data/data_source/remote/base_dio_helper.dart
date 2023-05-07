abstract class BaseDioHelper{
void login({ required String email  , required String password});
void rejester({ required String email  , required String password , required String name  , required String phone});
void getHomeData();
void getCategories();
void getFrequanceyQuestion();
void getContact();
void getNotifications();
void getTermsAndAbout();
void putProfile({ required String email,
  required String name,
  required String phone,
  required String password,
});

void getProfile();
void addFavouriteProducts({required int productId});
void getFavouriteProducts();
void addCartProduct({required int productId});
void getCartProduct();
}