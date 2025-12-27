package monosodiumplusplus.endpoints;

import haxe.Http;

class HttpEntry {
    
    public var httpBuilder:HttpBuilder;
    public var url:String;
    public function new(httpBuilder:HttpBuilder, url:String) {
        this.httpBuilder = httpBuilder;
        this.url = url;
    }

    public function build():Void {
        this.httpBuilder = new HttpBuilder(url);
    }

}