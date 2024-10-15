abstract class Repositorie {
  //Clientes
  Future<dynamic> getUser();
  Future<dynamic> postUser();
  Future<dynamic> getUserByID();
  //Productos
  Future<dynamic> getItem();
  Future<dynamic> deleteItem();
  Future<dynamic> postItem();
}
