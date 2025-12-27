package monosodiumplusplus.endpoints;

import haxe.Http;
import monosodiumplusplus.endpoints.schemas.PostsSchema;

import monosodiumplusplus.MonoSodiumPlusPlus.MonosodiumPlusPlus;
import haxe.Json;

class Post {
    
    var monosodium:MonosodiumPlusPlus;
    public function new(monosodium:MonosodiumPlusPlus) {
        this.monosodium = monosodium;
    }

    public function search(id:String, onSuccess:PostsSchema->Void, onError:String->Void):Void { 
        
        var httpBuilder:HttpBuilder = new HttpBuilder(monosodium.getUrl() + '/posts/$id.json');

        httpBuilder.setParam("id", id);
        httpBuilder.setHeader("User-Agent", "MyCoolBot/1.0 (by username on e621)");

        var postData:PostsSchema = Json.parse(httpBuilder.getHttpData());

        if (postData != null) {
            onSuccess(postData);
        } else
        {
            onError("Failed to parse posts");
        }
        
        
    }
}