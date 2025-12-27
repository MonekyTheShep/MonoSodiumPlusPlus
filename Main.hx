package;

import monosodiumplusplus.MonoSodiumPlusPlus;

// TODO error checking
// API key
class Main {
    static function main() {
        var monosodium:MonosodiumPlusPlus = new MonosodiumPlusPlus(MonosodiumFlavor.E926);

        //monosodium.login("username", "api_token")
        //monosodium.posts.setTag("-female").setRating("s");

        monosodium.posts.setLimit("5");
        monosodium.posts.search(
        postData -> {
            for(post in postData.posts) {
                trace("Post ID:", post.id);
            }
         }
            , err -> trace("Error: " + err)
            
        );

    }
}