package monosodiumplusplus.endpoints;

import monosodiumplusplus.endpoints.schemas.PostsSchema;

import monosodiumplusplus.MonoSodiumPlusPlus.MonosodiumPlusPlus;
import haxe.Json;

class PostJson {
    
    var monosodium:MonosodiumPlusPlus;
    public function new(monosodium:MonosodiumPlusPlus) {
        this.monosodium = monosodium;
    }

    public function getSearchResults(onSuccess:PostsSchema->Void, onError:String->Void):Void {
        var postData:PostsSchema = Json.parse(monosodium.data);

        if (postData != null) {
            onSuccess(postData);
        } else
        {
            onError("Failed to parse posts");
        }
        
        
    }
}