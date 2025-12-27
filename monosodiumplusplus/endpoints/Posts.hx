package monosodiumplusplus.endpoints;


import haxe.crypto.Base64;
import haxe.io.Bytes;
import haxe.io.BytesOutput;

import monosodiumplusplus.endpoints.schemas.PostsSchema;

import monosodiumplusplus.MonoSodiumPlusPlus.MonosodiumPlusPlus;
import haxe.Json;




class Posts {
    
    var monosodium:MonosodiumPlusPlus;

    var tags:Array<String> = [];
    var ratings:Array<String> = [];
    var limit:String;

    

    public function new(monosodium:MonosodiumPlusPlus) {
        this.monosodium = monosodium;
    }

    public function setTag(tag:String):Posts {
        this.tags.push(tag);
        return this;
    }

    public function setRating(rating:String):Posts {
        this.ratings.push(rating);
        return this;
    }

    public function setLimit(limit:String):Posts {
        this.limit = limit;
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