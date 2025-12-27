package monosodiumplusplus.endpoints;

import haxe.crypto.Base64;
import haxe.io.Bytes;
import monosodiumplusplus.endpoints.schemas.PostsSchema;
import monosodiumplusplus.MonoSodiumPlusPlus.MonosodiumPlusPlus;
import haxe.Json;

class SinglePost {
    
    var monosodium:MonosodiumPlusPlus;
    public function new(monosodium:MonosodiumPlusPlus) {
        this.monosodium = monosodium;
    }

    public function search(id:String, onSuccess:PostSchema->Void, onError:String->Void):Void { 
        var httpBuilder:HttpBuilder = new HttpBuilder(monosodium.getUrl() + '/posts/$id.json');

        httpBuilder.setHeader("User-Agent", Constants.DEFAULT_USER_AGENT);


        httpBuilder.setHeader("id", id);

        if (monosodium.username != null && monosodium.api_token != null) {
            httpBuilder.setHeader("Authorization", Base64.encode(Bytes.ofString(monosodium.username + ":" + monosodium.api_token)));
        }

        httpBuilder.getHttpData(data -> {
            var postData:PostSchema = Json.parse(data);

            if (postData != null) {
                onSuccess(postData);
            } else
            {
                onError("Failed to parse posts");
            }
        });
        
    }
}