package;

import sys.io.File;


class FileManager {
    
    public var file:Dynamic;
    public var path:String;

    public function new(file:Dynamic, path:String) {
        this.file = file;
        this.path = path;
    }

    public function write() {
        var out = File.append(path);
        
        try {
            out.writeByte(file);

            out.flush();
            out.close();
        } 
        catch (e:Dynamic) {
            trace("Error: " + e);
        }
        
    }

}