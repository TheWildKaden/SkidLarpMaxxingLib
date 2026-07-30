-- Generated from package.json | build/build.sh

return [[
{
    "name": "windui",
    "version": "1.6.66",
    "main": "./dist/main.lua",
    "repository": "https://github.com/TheWildKaden/SkidLarpMaxxingLib",
    "discord": "",
    "author": "TheWildKaden",
    "description": "Fork of WindUI — lightweight UI library for Roblox (bundled source)",
    "license": "MIT",
    "dependencies": {},
    "scripts": {
        "dev": "bash build/build.sh dev $INPUT_FILE",
        "build": "bash build/build.sh build $INPUT_FILE",
        "sync-deps": "node scripts/sync-deps.js",
        "live": "python3 -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\"",
        "example-live-build": "INPUT_FILE=main_example.lua npm run live-build",
        "updater": "python3 updater/main.py"
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}
]]
