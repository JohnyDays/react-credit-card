var isWindows = /^win/.test(process.platform)
var spawn = require('child_process').spawn
var cjsxBin = __dirname + "/node_modules/.bin/cjsx" + (isWindows ? ".cmd" : "")
var watchifyBin = __dirname + "/node_modules/.bin/watchify" + (isWindows ? ".cmd" : "")

spawn(cjsxBin, ["-o", "build", "-cw", "source"], {stdio:'inherit', stderr:'inherit'})
spawn(cjsxBin, ["-cw", "test/index.cjsx"], {stdio:'inherit', stderr:'inherit'})
spawn(watchifyBin, ["test/index.js", "-o", "test/bundle.js"], {stdio:'inherit', stderr:'inherit'})
