package;

import monosodiumplusplus.MonoSodiumPlusPlus;

// TODO error checking
// API key
class Main {
    static function main() {
        var monosodium:MonosodiumPlusPlus = new MonosodiumPlusPlus(MonosodiumFlavor.E926);

        //monosodium.login("username", "api_token")
        monosodium.posts
            .setTag("-female")
                .setLimit("5")
                    .setPage("2");

        monosodium.posts.search(
        postData -> {
            for(post in postData.posts) {
                trace("Post Height", post.file.height);
                trace("Post Width", post.file.width);
                trace("Post File Size", post.file.size);
                trace("Post File MD5", post.file.md5);
                trace("Post Sample Height", post.sample.height);
                trace("Post Sample Width", post.sample.width);
                trace("Post Sample url", post.sample.url);
                trace("Post alternates has", post.sample.alternates.has);
            }
         }
        , err -> trace("Error: " + err));

        monosodium.post.search(
        "5833293",
        postData -> {   
            trace(postData.post.file.height);
            trace("Post Width", postData.post.file.width);
            trace("Post File Size", postData.post.file.size);
            trace("Post File MD5", postData.post.file.md5);
            trace("Post Sample Height", postData.post.sample.height);
            trace("Post Sample Width", postData.post.sample.width);
            trace("Post Sample url", postData.post.sample.url);
            trace("Post alternates has", postData.post.sample.alternates.has);
         }
        , err -> trace("Error: " + err));

    }
}