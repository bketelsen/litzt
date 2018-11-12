import 
  dom, jsffi, jsconsole, macros, strutils,
  nes

class Ticker:
  tickerTempl = html_templ:
    d(data={"key1": "value1", "key2": "value2"}):
      h1: "Hello, World!"
      h2: "It is ${new Date().toLocaleTimeString()}."

var t = newTicker()
  
proc tick(r: JsObject) =
  tagTempl(r, t.tickerTempl)
  
discard window.setInterval(proc () = tick(bindLit(document.getElementById("root"))), 10000)


class Welcome(HTMLElement):
  args: varargs[JsObject]
  constructorBody:
    this.html = bindLit(this)
  welcomeTempl = html_templ:
    h1: "Hello, ${this.getAttribute('name')}"
  connectedCallback = proc(w: Welcome): Element =
    w.render()
  render = proc(w: Welcome): Element =
    result = tagCustomElement(w.html, w.welcomeTempl, w)

customElements.define("h-welcome", WelcomeConstructor)
    
