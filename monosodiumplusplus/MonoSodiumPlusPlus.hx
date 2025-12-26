package monosodiumplusplus;


import monosodiumplusplus.endpoints.PostJson;
import haxe.Http;
import haxe.crypto.Hmac.HashMethod;
import haxe.http.HttpMethod;
import haxe.crypto.Base64;
import haxe.io.Bytes;
import haxe.io.BytesOutput;



// The site's theme
enum MonosodiumFlavor {
    E621;
    E926;
}

enum MonosodiumRequestType {
    POSTJSON;
}

class MonosodiumPlusPlus {
    
    var username:String;
    var api_token:String;
    var monsodiumType:MonosodiumFlavor;
	var monsodiumRequestType:MonosodiumRequestType;
    public var params = new Map<String, String>();
    public var header = new Map<String, String>();

    public var postJson:PostJson;
    public var data:Dynamic;
    

    public function new(?username:String = "", ?api_token:String = "", ?monosodiumType:MonosodiumFlavor = MonosodiumFlavor.E926, monosodiumRequestType:MonosodiumRequestType) {
        this.username = username;
        this.api_token = api_token;
        this.monsodiumType = monosodiumType;
        this.monsodiumRequestType = monosodiumRequestType;

        this.postJson = new PostJson(this);
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

    public function setParam(name:String, value:String):MonosodiumPlusPlus {
        this.params[name] = value;
        return this;
    }

    public function setHeader(header:String, value:String):MonosodiumPlusPlus {
        this.header[header] = value;
        return this;
    }

    public function build():Void {

        var url = getUrl();
        
                
        switch (monsodiumRequestType) {
            case POSTJSON: 
                url = '$url/posts.json';
        } 

        var haxeHTTP:Http = new Http(url);
        for (name => value in params) {
            haxeHTTP.setParameter(name, value);
        }

        for (headerName => value in header) {
            haxeHTTP.setHeader(headerName, value);
        }


        haxeHTTP.onData = function(data:String) {
           this.data = data;
        
        }

        haxeHTTP.onError = function(err:String) {
            trace("Error: " + err);
            
        };

        haxeHTTP.request(false);
        
    
    }

    
}