# MonoSodiumPlusPlus
basic e621 wrapper in haxe

# Example Usage
```haxe
var monosodium:MonosodiumPlusPlus = new MonosodiumPlusPlus();

// search individual post
monosodium.post.search(
        "5833293",
        postData -> {   
            trace("Post ID", postData.post.id);
            trace("Post Height", postData.post.file.height);
            trace("Post Width", postData.post.file.width);
            trace("Post File Size", postData.post.file.size);
            trace("Post File MD5", postData.post.file.md5);
            trace("Post Sample Height", postData.post.sample.height);
            trace("Post Sample Width", postData.post.sample.width);
            trace("Post Sample url", postData.post.sample.url);
            trace("Post alternates has", postData.post.sample.alternates.has);
         }
        , err -> trace("Error: " + err));

// search multiple posts from search
monosodium.posts
.setTag("-female")
  .setTag("femboy")
  .setLimit(5)
    .setPage(5);


monosodium.post.search(
  "5833293",
  postData -> {   
    trace("Post ID", postData.post.id);
    trace("Post Height", postData.post.file.height);
    trace("Post Width", postData.post.file.width);
    trace("Post File Size", postData.post.file.size);
    trace("Post File MD5", postData.post.file.md5);
    trace("Post Sample Height", postData.post.sample.height);
    trace("Post Sample Width", postData.post.sample.width);
    trace("Post Sample url", postData.post.sample.url);
    trace("Post alternates has", postData.post.sample.alternates.has);
     }
    , err -> trace("Error: " + err));

```
