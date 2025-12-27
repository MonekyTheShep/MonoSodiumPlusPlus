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
        
        
    }
}