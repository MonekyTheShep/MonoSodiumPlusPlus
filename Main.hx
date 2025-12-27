package;

import monosodiumplusplus.MonoSodiumPlusPlus;

// TODO error checking
// API key
class Main {
    static function main() {
        var monosodium:MonosodiumPlusPlus = new MonosodiumPlusPlus(MonosodiumFlavor.E926);
        //.setParam("tags", "-female")
        //.setHeader("User-Agent", "MyCoolBot/1.0 (by username on e621)");

        // monosodium.posts.search(
        //     postData -> {
        //     for(post in postData.posts) {
        //         trace("Post ID:", post.id);
        //         trace("Post count", post.rating);
        //     }
        //  }
        //     , err -> trace("Error: " + err)
            
        // );

        monosodium.post.search(
        "5833293",
        postData -> {
            for(post in postData.posts) {
                trace("Post ID:", post.id);
                trace("Post count", post.rating);
            }
         }
            , err -> trace("Error: " + err)
            
        );

    }
}