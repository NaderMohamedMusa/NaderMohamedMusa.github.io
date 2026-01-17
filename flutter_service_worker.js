'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "0075c380358cced74ad4b0d32838080b",
"assets/AssetManifest.bin.json": "cb927af3dd2dd54c2912ed58c844d720",
"assets/AssetManifest.json": "15004b6aa575f991169edc36adb3bddb",
"assets/assets/images/al_reef.png": "d92dc194a1d1ffa18e63cc4cceb90882",
"assets/assets/images/background.png": "e758be3550a1094347bb37589a8c8c08",
"assets/assets/images/check_qr_saudi.png": "f87b5f44c9d0478597c881e30c04a0ed",
"assets/assets/images/coding_background.png": "b30db14260c8ed68a9ae8b66a368250c",
"assets/assets/images/dr_omar_kamel.png": "dd92629f607c9870e9d1f0ad5bc977fa",
"assets/assets/images/fekra_pos.png": "406102d541b33dd381f4d2173375d8f0",
"assets/assets/images/gddeaf.png": "c94a3f0c3162d276846e816d1eb99aa9",
"assets/assets/images/gfdeaf.png": "6bec9ebdffcc9901ec40987c11249dac",
"assets/assets/images/gig_dentist.png": "d3882130bc369610550a299e8a52881e",
"assets/assets/images/handartis.png": "50ccc9ea24c3e0d2d1b4e0ef71a7f41b",
"assets/assets/images/islamic_app.png": "e2a631310cfb49b76ab1f0f2c24f6e8c",
"assets/assets/images/mdizon.png": "8c0efbd7cb3a671a4480964292b01444",
"assets/assets/images/morc.png": "1eb06b7de7f3c456af197b5f9555718f",
"assets/assets/images/nasr.png": "ef340f4dd38fe308cb179a1912b122f3",
"assets/assets/images/onyx_erp.png": "9122f48d1dc7897217e33f5798301085",
"assets/assets/images/otlob_gas_customer.png": "b3de28e9581bf847f73b0864aa1ea4cd",
"assets/assets/images/otlob_gas_driver.png": "e1fdfa4377f01594ecb834db8b4bf714",
"assets/assets/images/profile.jpg": "a69b50c08f283cda0e4e0aa6655dafd5",
"assets/assets/images/road_distance.png": "8bdc82a818921c886f5431cc0362d358",
"assets/assets/images/shnider.png": "8caf61a801c757acee4a6211e7045054",
"assets/assets/images/sigma.png": "082de25f4d24371d4e03afcc7d3793cf",
"assets/assets/images/skylayers_pos.png": "140b2edad5aacc8524bf9ff06bbcd8bb",
"assets/assets/images/splash_logo.png": "e17fd7e0ea10dfd0b0a7ecaab47488c8",
"assets/assets/images/splash_text.png": "7a26b1f614040915208aeb596969bd8f",
"assets/assets/images/tam.png": "a86856f3cb0ecbabf4a8b5b8de55fe96",
"assets/assets/images/watemo.png": "ab98887c51990df1e95071d5772588ae",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "be8cdeae7ad4e02f5c22b02ec67f8c0e",
"assets/NOTICES": "d0a4ab865a0e8318bfefd140bddfa4ef",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "31c923c20cc4f72132e951e4dd3d252c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "67ea428ce3084cc879a73463f9b394f6",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "c72bf568aff3643451c4499d6fd38b33",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "e17fd7e0ea10dfd0b0a7ecaab47488c8",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "5e4ccc80a72e9b52620e9a81557620a4",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "42d43961fe8de3ebe86eb66f5ca2a5a2",
"/": "42d43961fe8de3ebe86eb66f5ca2a5a2",
"main.dart.js": "7100d72689d04c4fa8cab3e248f81b6e",
"manifest.json": "fa057e19119b198aff63bc199a6fa519",
"splash/img/light-background.png": "b30db14260c8ed68a9ae8b66a368250c",
"version.json": "009c9e65172e010890f7f65fde438006"};
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
