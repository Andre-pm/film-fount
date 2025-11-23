'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "df16ec446c628f7bb38c17b3e15721d8",
"version.json": "4f789f0bd76c26a04273a7d4310d75d2",
"index.html": "6013ff1f479e1f9633b160e534b6fd25",
"/": "6013ff1f479e1f9633b160e534b6fd25",
"apple-touch-icon.png": "42ceee23f037f677831208b6197c5d77",
"main.dart.js": "08d92825ca018d498ef2e0b2574388ea",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "7b94627b96779c727f520d7ec1033aa5",
"icons/Icon-192.png": "9c3e3070b27d3c705b52d4e5151acdeb",
"icons/Icon-maskable-192.png": "9c3e3070b27d3c705b52d4e5151acdeb",
"icons/Icon-maskable-512.png": "30df757168d8845e6cb3ee91beee4397",
"icons/Icon-512.png": "30df757168d8845e6cb3ee91beee4397",
"manifest.json": "fd87538f4297888b09848287b2737def",
"assets/AssetManifest.json": "28f91ae7be606a292206303fe9bb0e43",
"assets/NOTICES": "24994c4b3d167fbb7f478d7074348b13",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "dc67602ea43aeb3a5a1fbf74b800e984",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "3d7f967b0d575dd9fb81ae97e01566af",
"assets/fonts/MaterialIcons-Regular.otf": "683ba8d3284229ebafc9e2b2ac5f393b",
"assets/assets/svg/google_icon.svg": "a44d2fab083a540c05b9cf46a7d680c6",
"assets/assets/svg/logo.svg": "d238240abb9fdd41b54ec0a682fa7b6d",
"assets/assets/svg/logo_login_horizontal.svg": "79b0cd5645035902f64d70a80786e836",
"assets/assets/svg/logo_navbar_horizontal.svg": "40d0796369db8923e445bc7ab91483d8",
"assets/assets/images/movie_poster_6.png": "88d48666bdade42a76c2e089a3a55547",
"assets/assets/images/movie_poster_7.png": "8eaa91e57bd7cbbef0d05997a3d366b3",
"assets/assets/images/movie_poster_5.png": "0db88ac759a609df9dd32950cbc65dca",
"assets/assets/images/movie_poster_4.png": "c2ef54f4ca5d29a691582bea465f81c2",
"assets/assets/images/goal_square_7.png": "5b79deb21dc7a25128031a4e69e26b9f",
"assets/assets/images/movie_poster_0.png": "7408c069276754f59a536341b5be04e4",
"assets/assets/images/movie_poster_1.png": "b0fcaf4872a751eb9fbb223d10792b66",
"assets/assets/images/goal_square_0.png": "fe7ac11128762d513c5cc3a374548797",
"assets/assets/images/movie_poster_3.png": "68e519ce9e0e86750a05cd8eeeee2c03",
"assets/assets/images/first_poster.png": "fc52e7ca3fb71ec0f56f084c2cce1bee",
"assets/assets/images/goal_background.png": "3bc4aa3c3d7ce3dbcf1e35a6acb85401",
"assets/assets/images/movie_poster_2.png": "4426b2fa8ef6a7d58913db0336afc8a3",
"assets/assets/images/goal_square_15.png": "3af9cb3697568f82209fea68dcdb887c",
"assets/assets/images/recommendation_poster_1.png": "9eb8b0859cf3876460eebffd8fa545bb",
"assets/assets/images/recommendation_poster_0.png": "8edb7a4818dd4ba7e8c3c4f6ff2920e7",
"assets/assets/images/favicon.png": "015642e41e738fd10136abae6ff963fe",
"assets/assets/images/recommendation_poster_2.png": "776914b49ca32f368fd7a20ae394a598",
"assets/assets/images/third_poster.png": "ad409c8e1e7fb10f64e7b404761e9af1",
"assets/assets/images/recommendation_poster_3.png": "9d2aca4d7cb2d0be6a0b936069149d3e",
"assets/assets/images/movie_poster_9.png": "8a0cc4bd6fd9b8b097c55e10ad748837",
"assets/assets/images/movie_poster_8.png": "aa1ba303c33bcbb3c4fc213ea04dfa5b",
"assets/assets/images/second_poster.png": "71bb5bce4b9f9a0ed32039adf1157a9a",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
