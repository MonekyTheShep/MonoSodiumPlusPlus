package;

import monosodiumplusplus.MonoSodiumPlusPlus;
class Main {
    static function main() {
        var monosodium:MonosodiumPlusPlus = new MonosodiumPlusPlus(MonosodiumFlavor.E926, MonosodiumRequestType.POSTJSON)
        .setParam("tags", "-female")
        .setHeader("User-Agent", "MyCoolBot/1.0 (by username on e621)");

        monosodium.build();

        monosodium.postJson.getSearchResults(
            postData -> {
            for(post in postData.posts) {
                trace("Post ID: " + post.id);
                trace("Post count", post.rating);
            }
         }
            , err -> trace("Error: " + err)
            
        );

        trace(monosodium.params);
        trace(monosodium.header);
    }
}