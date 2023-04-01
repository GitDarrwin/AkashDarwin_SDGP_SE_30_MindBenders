import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';

class snakeFind {
  final species_list = ["Ahaetulla nasuta", "Ahaetulla prasina", "Albino cobra", "Arani", "Buff-striped keel back", "CGR", "Checkered keel back",
    "Chrysopelea ornata", "Cobra", "Common krait", "Daboia russelii", "Flowery wolf snake", "Forsten's cat snake", "Green pit viper", "Green vine snake",
    "Hump-nosed viper", "Pipe snake", "Python", "Rat snake", "Russell's viper", "Sri Lanka cat snake", "Trinket snake", "Wolf snake"];

  Future sendImage(File imageFile) async {
    var result = null;
    // Define endpoint URL
    var request = http.MultipartRequest('POST', Uri.parse('http://localhost:4000/predict'));
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      result= await response.stream.bytesToString();
      return getList(result);
    }
    else {
      print(response.reasonPhrase);
    }
    return result;
  }

  List<Object> getList(result) {
    Map<String, dynamic> jsonResult = json.decode(result);
    String name = species_list[jsonResult['predicted_class']];
    double confidence = jsonResult['confidence_level']*100;
    print("Name : "+ name+ " confidence : "+ confidence.round().toString());
    return [name,confidence];
  }


}