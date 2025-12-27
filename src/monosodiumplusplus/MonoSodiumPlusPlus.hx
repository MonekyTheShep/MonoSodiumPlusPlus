package monosodiumplusplus;


import monosodiumplusplus.endpoints.Post;
import monosodiumplusplus.endpoints.Posts;

enum abstract MonosodiumFlavor(String) from String to String {
    final E621:MonosodiumFlavor = "e621";
    final E926:MonosodiumFlavor = "e926";
}

class MonoSodiumPlusPlus {
    
    public var username:String;
    public var api_token:String;
    var monsodiumType:MonosodiumFlavor;

    public var posts:Posts;
    public var post:SinglePost;
    

    public function new(?monosodiumType:MonosodiumFlavor = MonosodiumFlavor.E926) {
        this.monsodiumType = monosodiumType;

        this.posts = new Posts(this);
        this.post = new SinglePost(this);
    }
    

    public function getUrl():String {

        var url:String;
        switch (this.monsodiumType) {
            case E621: 
                url = 'https://$E621.net';
            case E926:
                url = 'https://$E926.net';
        }
        return url;
    }

    public function login(username:String, api_token:String):Void {
        this.username = username;
        this.api_token = api_token;
    }

}