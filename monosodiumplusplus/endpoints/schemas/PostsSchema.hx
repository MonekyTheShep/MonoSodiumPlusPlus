package monosodiumplusplus.endpoints.schemas;

typedef PostsSchema = {
    var posts:Array<Post>;
}


typedef Post = {
    var id:String;
    var created_at:String;
    var updated_at:String;
    var file:PostFile;
    var preview:PostPreview;
    var tags:Array<String>;
    var score:PostScore;
    var rating:Int;
    var favCount:Int;
    var samples:PostSamples;
    var change_seq:Int;
    var flag:PostFlag;
    var sources:Array<String>;
    var pools:Array<Int>;
    var relationships:PostRelationships;
    var approver_id:Int;
    var uploader_id:Int;
    var description:String;
    var comment_count:String;
    var is_favourited:Bool;
    var has_notes:Bool;
    var duration:Float;
    var uploader_name:String;
}

typedef PostFile = {
    var width:Int;
    var height:Int;
    var ext:String;
    var size:Int;
    var md5:String;
    var url:String; 
}

typedef PostPreview = {
    var width:Int;
    var height:Int;
    var url:String;
}

typedef PostScore = {
    var up:Int;
    var down:Int;
    var total:Int;
}

typedef PostRelationships = {
    var parent_id:Int;
    var has_children:Bool;
    var has_active_children:Bool;
    var children:Array<Int>;
}

typedef PostFlag = {
    var pending:Bool;
    var flagged:Bool;
    var note_locked:Bool;
    var status_locked:Bool;
    var rating_locked:Bool;
    var deleted:Bool;
}



// the longest one im going to cry
typedef PostSamples = {
    var has:Bool;
    var height:Int;
    var width:Int;
    var url:String;
    var alternates:PostSamplesAlternates;
    var variants:PostSamplesVariants;
    var samples:PostSample;
}

typedef PostSamplesAlternates = {
    var has:Bool;
    var original:SamplesAlternatesOriginal;
    var variants:PostSamplesVariants;
    var sample:PostSample;
}

typedef SamplesAlternatesOriginal = {
    var fps:Int;
    var codec:String;
    var size:Int;
    var width:Int;
    var height:Int;
    var url:String;
}

typedef PostSamplesVariants = {
    var webm:SamplesVariantsWebm;
    var mp4:SamplesVariantsMP4;
}

typedef SamplesVariantsWebm = {
    var fps:Float;
    var codec:String;
    var size:Float;
    var height:Int;
    var width:Int;
    var url:String;
}

typedef SamplesVariantsMP4 = {
    var fps:Float;
    var codec:String;
    var size:Float;
    var height:Int;
    var width:Int;
    var url:String;
}

typedef PostSample = {
    var p480:Sample480p;
    var p720:Sample720p;
}

typedef Sample480p = {
    var fps:Float;
    var codec:String;
    var size:Float;
    var height:Int;
    var width:Int;
    var url:String;
}

typedef Sample720p = {
    var fps:Float;
    var codec:String;
    var size:Float;
    var height:Int;
    var width:Int;
    var url:String;  
}