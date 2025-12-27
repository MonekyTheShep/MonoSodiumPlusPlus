package;

import sys.io.File;


class FileManager {
    
    public var data:Dynamic;
    public var path:String;
    public var filename:String;

    public function new(data:Dynamic, path:String, filename:String) {
        this.data = data;
        this.path = path;
        this.filename = filename;
    }

    public function write() {
        var out = File.append(this.path + '/$filename');
        
        try {
            out.writeString(this.data);

            out.flush();
            out.close();
        } 
        catch (e:Dynamic) {
            trace("Error: " + e);
        }
        
    }

}