var isWin = /^win/.test(process.platform)

if(isWin){
  spawn = require('child_process').exec
  spawn(__dirname + "/node_modules/.bin/cjsx.cmd -o build -cw source")
  spawn(__dirname + "/node_modules/.bin/cjsx.cmd -cw test/index.cjsx")
  spawn(__dirname + "/node_modules/.bin/watchify.cmd test/index.js -o test/bundle.js")
}
else{
  spawn = require('child_process').spawn
  spawn(__dirname + "/node_modules/.bin/cjsx.cmd -o build -cw source", {stdio:'inherit', stderr:'inherit'})
  spawn(__dirname + "/node_modules/.bin/cjsx.cmd -cw test/index.cjsx", {stdio:'inherit', stderr:'inherit'})
  spawn(__dirname + "/node_modules/.bin/watchify.cmd test/index.js -o test/bundle.js", {stdio:'inherit', stderr:'inherit'})
}

