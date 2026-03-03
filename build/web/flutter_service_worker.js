'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "9e41eec7edbb7813b083500526ff90d1",
"version.json": "b3b0565cfe19d423830d5f18cf71e85b",
"index.html": "0577be77cbc5eb236a2402dfa0c81c33",
"/": "0577be77cbc5eb236a2402dfa0c81c33",
"main.dart.js": "0e529a9228326ea6eadda9891627b9fa",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"_redirects": "90089384e323456f0532d83964de8c94",
"_headers": "141d1d5ecd9d1fbd9e72ce19613c5d54",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "78b1ff8cee8384f094fb2fc30f6ea988",
"print.css": "43f8f4148638fa788b6933cebbed3416",
"assets/NOTICES": "5edcc7f5053ff0aac56e2df456bd3046",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "6d542b0786284f8a8b19b7899ba19b32",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "aad7555e3e11e82da83699da89557e56",
"assets/fonts/MaterialIcons-Regular.otf": "09e544ad6a363af97b7d47f80de7adeb",
"assets/assets/general/stellenbosch-university-library-1.jpeg-1024x576.webp": "84bd592ec6d17ddf1753b71cb47226ff",
"assets/assets/general/logo.svg": "53ba0949846a66dbfd530146f28122e9",
"assets/assets/general/stellenbosch-university.jpg": "8363c759f9c3108d1b4cfa1d98bb1e01",
"assets/assets/general/favicon.svg": "4e5f3b18c7d3b6657946642a1dd58d75",
"assets/assets/staff/admin/gfortuin.jpg": "b7951cb024027b170feeabdf8aa1c85c",
"assets/assets/staff/admin/djstep.jpg": "9b6abd0cecd1a6509f53458e3f695b17",
"assets/assets/staff/academic/wschulze.jpg": "1162336c3724cb763445d383517ed7f9",
"assets/assets/staff/academic/aek1.jpg": "ee82fcd03ea79820e3c5bbce612601f0",
"assets/assets/staff/academic/mdunaiski.jpg": "dd599e8ec5d39b84cae2031d0d2cdcda",
"assets/assets/staff/academic/ajcollett.jpg": "2d46bf5fd0eef315e29adbac0e60f523",
"assets/assets/staff/academic/petruccione.jpg": "4b18bbc4976ba4a911631c60a6a50577",
"assets/assets/staff/academic/bfischer.jpg": "43e5a6615d59b97816c219b141d3c08f",
"assets/assets/staff/academic/ngxandem.jpg": "99c88c71ff456d0fe4d4bfd9c8418e2d",
"assets/assets/staff/academic/svanlitsenborgh.jpg": "35cbe43728394f3a7dd7b521292f662e",
"assets/assets/staff/academic/geld.jpg": "b4de754ffdab906626a79bad8544b66e",
"assets/assets/staff/academic/mcelory.jpg": "e6129e166ae31a9c74ec9f3a82ed6e9a",
"assets/assets/staff/academic/lcleophas.jpg": "2d3d9dbb065d05e5e4ac71b6c00fa7ec",
"assets/assets/staff/academic/bbecker.jpg": "a952a07a0829c4bcdfeb5a78d0905de9",
"assets/assets/staff/academic/grens.jpg": "96c9af872a6dadfc73b94f3a465c75c4",
"assets/assets/staff/academic/mchristoph.jpg": "70aa36c50f232cf3c58815fbcbdbed10",
"assets/assets/staff/academic/fabian3.jpg": "1d50910a75d4cbf70b0d5929afb3778a",
"assets/assets/staff/academic/zmohamed.jpg": "2f9596c7ce40989add1367dd8f8b30cd",
"assets/assets/staff/academic/cinggs.jpg": "c3cbb677691dda207094a2a0c5d0ea4b",
"assets/assets/staff/academic/visserw.jpg": "89440182b2d56a2053ec6cec3d667bad",
"assets/assets/staff/academic/masakuna.jpg": "068cfb69684c3ce41747f60e46d46e45",
"assets/assets/staff/academic/btucker.jpg": "324d49cff30dc316cebd74a753fedf30",
"assets/assets/staff/academic/evanbiljon.jpg": "924e8e1a65b8c3ffc6f6f1b4694e064b",
"assets/assets/staff/academic/jbishop.jpg": "9e1d3af67e42e9f676fcae4e93c6e734",
"assets/assets/staff/academic/whkbester.jpg": "3eff9351a2d393a7f83bde8bfa15dd30",
"assets/assets/staff/academic/csteyl.jpg": "c34b7494adabfab911427e853ccd957d",
"assets/assets/staff/academic/deffendi.jpg": "9ff8033ade1c679d70d94e7436ad8c5a",
"assets/assets/staff/academic/gazzopardi.jpg": "f18aa8b080ef6f3f32da292832ff063d",
"assets/assets/staff/academic/lpretorius.jpg": "369bfeba230e5c1fd7db229042720ebb",
"assets/assets/staff/academic/jtaljaard.jpg": "e9d5db03208f20ef83cb81b37b573428",
"assets/assets/staff/academic/engel.jpg": "da337f706ef0d349289216b623104fbd",
"assets/assets/staff/academic/tbalke.jpg": "a9f856a161e1fee47f6888386ee4cb64",
"assets/assets/staff/academic/mkeet.png": "2cd917b5854ce676aaa1e921a8c1bb1d",
"assets/assets/staff/academic/dcoetsee.jpg": "53ea0805414632736a37cc6e3e899488",
"assets/assets/staff/academic/abvdm.jpg": "9f2cb9ad1db095384c777a4e3072db06",
"assets/assets/staff/academic/lvzijl.jpg": "40c3885a6898310c0e53751c0c82148c",
"assets/assets/staff/academic/pvanheerden.jpg": "dcd30cdad18b6968a6f80789ed606b47",
"assets/assets/staff/academic/tlgrobler.jpg": "95494ec8efb2dcedb37b622f22248e4b",
"assets/assets/staff/academic/apretorius.jpg": "ec00716b26e8274f126047241e8a6219",
"assets/assets/staff/academic/kroon.jpg": "8da3cf4e534e03fcdff710f96c24ddd0",
"assets/assets/staff/academic/mraselimo.jpg": "ba9d023db09e120474976e7664408819",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
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
