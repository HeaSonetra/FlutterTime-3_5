import 'package:first_api/model/post.dart';
import 'package:http/http.dart' as http;


class Remoteservice {
  Future<List<Post>?> getPosts() async { // not getPost()
  var client = http.Client();
  var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  try {
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json); // Make sure this is implemented
    }
  } catch (e) {
    print("Error: $e");
  } finally {
    client.close();
  }
  return null;
}

}