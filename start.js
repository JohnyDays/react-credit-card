var isWindows = /^win/.test(process.platform)

if(isWindows){
  spawn = require('child_process').exec
  spawn(__dirname + "/node_modules/.bin/cjsx.cmd -o build -cw source")
  spawn(__dirname + "/node_modules/.bin/cjsx.cmd -cw test/index.cjsx")
  spawn(__dirname + "/node_modules/.bin/watchify.cmd test/index.js -o test/bundle.js")
}
else{
  spawn = require('child_process').spawn
  spawn("./node_modules/.bin/cjsx", ["-o", "build", "-cw", "source"], {stdio:'inherit', stderr:'inherit'})
  spawn("./node_modules/.bin/cjsx", ["-cw", "test/index.cjsx"], {stdio:'inherit', stderr:'inherit'})
  spawn("./node_modules/.bin/watchify", ["test/index.js", "-o", "test/bundle.js"], {stdio:'inherit', stderr:'inherit'})
}
