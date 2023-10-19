'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "6570606e3b5ec2f19af368393e93703e",
"/": "6570606e3b5ec2f19af368393e93703e",
"version.json": "2d8234348a911776e97da4b8bcd3c863",
"favicon.png": "4ad382679d23817ab77850af6b0e4c34",
"assets/AssetManifest.bin": "ed2fe8eb22a836bdd89fc8e00ed13c83",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/fonts/MaterialIcons-Regular.otf": "6c4f64ec43d80bc1081e784350b3cf3c",
"assets/assets/images/slideshow.png": "f889c68239f3613a99823273f98d79b0",
"assets/assets/images/vline.png": "76961b60ee75af93eccfe62bac975953",
"assets/assets/images/googleplay.png": "0cf1b2af37cf52589c5c6040b822d1c5",
"assets/assets/images/quizapp.png": "e91183234056a22d8e89a144e6171e31",
"assets/assets/images/learn.png": "7827c9e2366da4aaeec20a4342b76953",
"assets/assets/images/logo.jpeg": "62119ce875ef90d0bf676987ea633478",
"assets/assets/images/social/linkedin.png": "898c0407d74c75fa110de76293d96ddd",
"assets/assets/images/social/github.png": "b37b05a713d8eebcbb475119e587859b",
"assets/assets/images/social/email.png": "7a97194d3c075caa1a2f2fb89f793d4e",
"assets/assets/images/social/medium.png": "276ae11521896bd9a529e02aad79ff71",
"assets/assets/images/social/whatsapp.png": "19455d676899e370bd5cc0bab6b41c6f",
"assets/assets/images/social/linkedin-logo.png": "95e6c045dd5f8ea3ed14fc2de308d115",
"assets/assets/images/social/instagram.png": "4f7cb5fbb28d0f9ddc97641f8b288735",
"assets/assets/images/ic_launcher-playstore.png": "bf3713c69151ac0013ba34bacabc0ea5",
"assets/assets/images/githubButton.png": "4bd6f1c59644afa862fba9beb6bcb742",
"assets/assets/images/develop.png": "723c47f15273f7013cacb03032b547c2",
"assets/assets/images/appstore.png": "695bd2712323e24cf0f6a5f1198a921c",
"assets/assets/images/hoc_avatar.jpg": "9f1155581729b784ca739029851b15be",
"assets/assets/images/technology/agora.png": "25ec00d13df6894b41a081b9c5af9a1a",
"assets/assets/images/technology/swift.png": "6740f74615e8d2b6558d7d31fc7edb1e",
"assets/assets/images/technology/dart.png": "315f803bc60fc21c86efc35ad309d629",
"assets/assets/images/technology/kotlin.png": "c49b566ec705ccce4c94879360557507",
"assets/assets/images/technology/nestJS.png": "cde8c69aac872ba25c655de892105924",
"assets/assets/images/technology/ios.png": "97a545d4bf675486caef3336cac7d190",
"assets/assets/images/technology/ffmpeg.png": "26205499f60fe7a432dbf0dd55a544cf",
"assets/assets/images/technology/bloc.png": "977fbfba561065f9a68c4b47f9774531",
"assets/assets/images/technology/android.png": "62e1bde4ef8fd347dd61af2ed27bd069",
"assets/assets/images/technology/apple.png": "4b4ca803f78fd0ea6c2fe1d0e53e6b6a",
"assets/assets/images/technology/firebase.png": "d139ba1e59d9bcc1ed86617547dd51ee",
"assets/assets/images/technology/opengl.png": "af04e36e273109ed7bb2fc0c7e141a3d",
"assets/assets/images/technology/rx.png": "d5003cb48845d7dc1325eb6f6559c9f0",
"assets/assets/images/technology/flutter.png": "47e4c5ea380dc3b9241ee7b4f8b65c20",
"assets/assets/images/technology/javascript.png": "2e5de0a7d635b437db088d43f847d39c",
"assets/assets/images/chung_avatar.png": "6b2d964d9621b705aae2c6e6734ee8e3",
"assets/assets/images/ic_remote_app.jpg": "6cfe123450d5e7306ef9494ffc223114",
"assets/assets/images/projects/3.jpeg": "af53f50f05e7506f4810f66d29291d40",
"assets/assets/images/projects/2.jpeg": "cc921da43e453f2eea34fc9888d4957c",
"assets/assets/images/projects/1.jpeg": "8704aef3b5caf79771e0fa1e56707d35",
"assets/assets/images/projects/5.jpeg": "df85aac6e06aef3dfcedd34ea0e6a4fc",
"assets/assets/images/projects/4.jpeg": "e6d14f0b5985debf1be7edeccfd47d4b",
"assets/assets/images/blog.png": "383501168390c3833d9c81843c33d566",
"assets/assets/images/logo.png": "d5003cb48845d7dc1325eb6f6559c9f0",
"assets/assets/svg/guy.svg": "384b0cd380b8ce087e170fe5b3dc7f6b",
"assets/assets/svg/person.svg": "00abbb5ba3e0acac159c8a7a664b7750",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/NOTICES": "a7c96834171c72154157cf68da472801",
"assets/AssetManifest.json": "a6fc323297b17a381378cbdd0d1a1720",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"manifest.json": "f646271a0f3f186555f10a45c7f2eedf",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"icons/Icon-maskable-512.png": "7b89a3ecc30ffe40da713c5c424d52d0",
"icons/Icon-maskable-192.png": "84ee8cc778c2a8d2cfe4f4a8555e5c7d",
"icons/Icon-512.png": "7b89a3ecc30ffe40da713c5c424d52d0",
"icons/Icon-192.png": "84ee8cc778c2a8d2cfe4f4a8555e5c7d",
"main.dart.js": "e5399326856816c47c94a27adc7e6833"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
