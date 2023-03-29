
function helloJSWorld() {
    let input = Host.inputString()
    let result = {
        message: "👋 Hello World 🌍 from JavaScript",
        input: input,
    } 

    Host.outputString(JSON.stringify(result))
    return 0
}

module.exports = {helloJSWorld}

// the PDK uses QuickJS and wizer to run javascript as an Extism Plug-in.
// this is essentially a fork of Javy by Shopify. 
