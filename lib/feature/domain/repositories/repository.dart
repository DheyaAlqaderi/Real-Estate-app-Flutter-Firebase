import '../entities/category/category_entity.dart';
import '../entities/user/user_entity.dart';

abstract class Repository {

  // Authentication
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);
  // // data
  // Stream<List<CategoryEntity>> getCategories();
  // Future<List<CategoryEntity>> search(String search);
  // Future<List<CategoryEntity>> filter(String filter);
  // Future<void> makeItMyFavorite(int propertyId);
  // Future<void> giveFeedback();
  // void sendMessage();
  // void getMessage();
  // void setAlarm();
  // Future<void> addNewNote(NoteEntity note);
  // Future<void> updateNote(NoteEntity note);
  // Future<void> deleteNote(NoteEntity note);


}