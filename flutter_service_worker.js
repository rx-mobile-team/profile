'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "ceff8abbf1d2456220c38f2b36dc8336",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"manifest.json": "f646271a0f3f186555f10a45c7f2eedf",
"icons/Icon-maskable-512.png": "7b89a3ecc30ffe40da713c5c424d52d0",
"icons/Icon-maskable-192.png": "84ee8cc778c2a8d2cfe4f4a8555e5c7d",
"icons/Icon-512.png": "7b89a3ecc30ffe40da713c5c424d52d0",
"icons/Icon-192.png": "84ee8cc778c2a8d2cfe4f4a8555e5c7d",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"assets/AssetManifest.json": "ec8bd7ac51083750f699dd2887f07cbf",
"assets/shaders/ink_sparkle.frag": "ab4751ef630837e294889ca64470bb70",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/images/hoc_avatar.jpeg": "9d593356ce237fdbb6e99e5ed0f9b372",
"assets/assets/images/googleplay.png": "0cf1b2af37cf52589c5c6040b822d1c5",
"assets/assets/images/develop.png": "723c47f15273f7013cacb03032b547c2",
"assets/assets/images/vline.png": "76961b60ee75af93eccfe62bac975953",
"assets/assets/images/appstore.png": "695bd2712323e24cf0f6a5f1198a921c",
"assets/assets/images/technology/ios.png": "97a545d4bf675486caef3336cac7d190",
"assets/assets/images/technology/javascript.png": "2e5de0a7d635b437db088d43f847d39c",
"assets/assets/images/technology/apple.png": "4b4ca803f78fd0ea6c2fe1d0e53e6b6a",
"assets/assets/images/technology/nestJS.png": "cde8c69aac872ba25c655de892105924",
"assets/assets/images/technology/rx.png": "d5003cb48845d7dc1325eb6f6559c9f0",
"assets/assets/images/technology/android.png": "62e1bde4ef8fd347dd61af2ed27bd069",
"assets/assets/images/technology/firebase.png": "d139ba1e59d9bcc1ed86617547dd51ee",
"assets/assets/images/technology/swift.png": "6740f74615e8d2b6558d7d31fc7edb1e",
"assets/assets/images/technology/flutter.png": "47e4c5ea380dc3b9241ee7b4f8b65c20",
"assets/assets/images/technology/agora.png": "25ec00d13df6894b41a081b9c5af9a1a",
"assets/assets/images/technology/dart.png": "315f803bc60fc21c86efc35ad309d629",
"assets/assets/images/technology/kotlin.png": "c49b566ec705ccce4c94879360557507",
"assets/assets/images/githubButton.png": "4bd6f1c59644afa862fba9beb6bcb742",
"assets/assets/images/projects/3.jpeg": "af53f50f05e7506f4810f66d29291d40",
"assets/assets/images/projects/2.jpeg": "cc921da43e453f2eea34fc9888d4957c",
"assets/assets/images/projects/5.jpeg": "df85aac6e06aef3dfcedd34ea0e6a4fc",
"assets/assets/images/projects/1.jpeg": "8704aef3b5caf79771e0fa1e56707d35",
"assets/assets/images/projects/4.jpeg": "e6d14f0b5985debf1be7edeccfd47d4b",
"assets/assets/images/learn.png": "7827c9e2366da4aaeec20a4342b76953",
"assets/assets/images/logo.png": "d5003cb48845d7dc1325eb6f6559c9f0",
"assets/assets/images/social/whatsapp.png": "19455d676899e370bd5cc0bab6b41c6f",
"assets/assets/images/social/github.png": "b37b05a713d8eebcbb475119e587859b",
"assets/assets/images/social/linkedin.png": "898c0407d74c75fa110de76293d96ddd",
"assets/assets/images/social/medium.png": "276ae11521896bd9a529e02aad79ff71",
"assets/assets/images/social/email.png": "7a97194d3c075caa1a2f2fb89f793d4e",
"assets/assets/images/social/linkedin-logo.png": "95e6c045dd5f8ea3ed14fc2de308d115",
"assets/assets/images/social/instagram.png": "4f7cb5fbb28d0f9ddc97641f8b288735",
"assets/assets/images/ic_remote_app.jpg": "6cfe123450d5e7306ef9494ffc223114",
"assets/assets/images/ic_launcher-playstore.png": "bf3713c69151ac0013ba34bacabc0ea5",
"assets/assets/images/blog.png": "383501168390c3833d9c81843c33d566",
"assets/assets/images/logo.jpeg": "62119ce875ef90d0bf676987ea633478",
"assets/assets/images/chung_avatar.png": "6b2d964d9621b705aae2c6e6734ee8e3",
"assets/assets/svg/guy.svg": "384b0cd380b8ce087e170fe5b3dc7f6b",
"assets/assets/svg/person.svg": "00abbb5ba3e0acac159c8a7a664b7750",
"assets/NOTICES": "995e07ac07fa0dc621718c1af3b1b54f",
"index.html": "a02dbd1a32adb4006c0162124fe7c85b",
"/": "a02dbd1a32adb4006c0162124fe7c85b",
"favicon.png": "4ad382679d23817ab77850af6b0e4c34",
"version.json": "2d8234348a911776e97da4b8bcd3c863"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
