package monosodiumplusplus;


import monosodiumplusplus.endpoints.Post;
import monosodiumplusplus.endpoints.Posts;


import haxe.crypto.Hmac.HashMethod;
import haxe.http.HttpMethod;
import haxe.crypto.Base64;
import haxe.io.Bytes;
import haxe.io.BytesOutput;



// The site's mirror
enum MonosodiumFlavor {
    E621;
    E926;
}

enum MonosodiumRequestType {
    POSTS;
    POST;
}

class MonosodiumPlusPlus {
    
    public var username:String;
    public var api_token:String;
    var monsodiumType:MonosodiumFlavor;

    public var posts:Posts;
    public var post:Post;
    

    public function new(?monosodiumType:MonosodiumFlavor = MonosodiumFlavor.E926) {
        this.monsodiumType = monosodiumType;

        this.posts = new Posts(this);
        this.post = new Post(this);
    }
    

    public function getUrl():String {

        var url:String;
        switch (this.monsodiumType) {
            case E621: 
                url = "https://e621.net";
            case E926:
                url = "https://e926.net";
        }
        return url;
    }

    public function login(?username:String, api_token:String):Void {
        this.username = username;
        this.api_token = api_token;
    }

}