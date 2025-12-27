package monosodiumplusplus.endpoints;


import haxe.crypto.Base64;
import haxe.io.Bytes;
import haxe.io.BytesOutput;

import monosodiumplusplus.endpoints.schemas.PostsSchema;
import monosodiumplusplus.MonoSodiumPlusPlus;

import haxe.Json;





class Posts {
    
    var monosodium:MonoSodiumPlusPlus;

    var tags:Array<String> = [];
    var ratings:Array<String> = [];
    var limit:String;
    var page:String;

    

    public function new(monosodium:MonoSodiumPlusPlus) {
        this.monosodium = monosodium;
    }

    public function setTag(tag:String):Posts {
        this.tags.push(tag);
        return this;
    }


    public function removeTag(tag:String):Posts {
        if(this.tags.contains(tag)) {
            this.tags.remove(tag);
        }
        
        return this;
    }

    // public function setRating(rating:Int):Posts {
    //     this.ratings.push(rating);
    //     return this;
    // }

    public function setPage(page:Int):Posts {
        this.page = Std.string(page);
        return this;
    }

    public function setLimit(limit:Int):Posts {
        this.limit = Std.string(limit);
        return this;
    }

    public function search(onSuccess:PostsSchema->Void, onError:String->Void):Void {
        var httpBuilder:HttpBuilder = new HttpBuilder(monosodium.getUrl() + '/posts.json');

        httpBuilder.setHeader("User-Agent", Constants.DEFAULT_USER_AGENT);

        if (tags != []) {
            for (tag in tags) {
                httpBuilder.setParam("tags", tag);
            }
        }

        if (limit != null) {
            httpBuilder.setParam("limit", limit);
        }

        if (page != null) {
            httpBuilder.setParam("page", page);
        }


        if (monosodium.username != null && monosodium.api_token != null) {
            httpBuilder.setHeader("Authorization", Base64.encode(Bytes.ofString(monosodium.username + ":" + monosodium.api_token)));
        }

        httpBuilder.getHttpData(data -> {
            var postData:PostsSchema = Json.parse(data);

            if (postData != null) {
                onSuccess(postData);
            } else
            {
                onError("Failed to parse posts");
            }
        });

    }
}