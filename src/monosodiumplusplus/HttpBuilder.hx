package monosodiumplusplus;

import haxe.Http;

class HttpBuilder {
    
    var url:String;

    var params = new Map<String, String>();
    var header = new Map<String, String>();

    public function new(url:String) {
        this.url = url;
    }

    public function getHttpData(onResult:String->Void):Void {

        var haxeHTTP:Http = new Http(url);

        for (name => value in params) {
            haxeHTTP.setParameter(name, value);
        }

        for (headerName => value in header) {
            haxeHTTP.setHeader(headerName, value);
        }


        haxeHTTP.onData = function(data:String) {
           onResult(data);
        }

        haxeHTTP.onError = function(err:String) {

            trace("Error: " + err);
            
        };

        haxeHTTP.request(false);
        
    }

    public function setParam(name:String, value:String):HttpBuilder {
        this.params[name] = value;
        return this;
    }

    public function setHeader(header:String, value:String):HttpBuilder {
        this.header[header] = value;
        return this;
    }
}