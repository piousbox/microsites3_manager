!function(){var n={},t=function(t){for(var i=n[t],r=i.deps,o=i.defn,d=r.length,u=new Array(d),c=0;c<d;++c)u[c]=e(r[c]);var f=o.apply(null,u);if(void 0===f)throw"module ["+t+"] returned undefined";i.instance=f},i=function(t,i,e){if("string"!=typeof t)throw"module id must be a string";if(void 0===i)throw"no dependencies for "+t;if(void 0===e)throw"no definition function for "+t;n[t]={deps:i,defn:e,instance:void 0}},e=function(i){var e=n[i];if(void 0===e)throw"module ["+i+"] was undefined";return void 0===e.instance&&t(i),e.instance},r=function(n,t){for(var i=n.length,r=new Array(i),o=0;o<i;++o)r.push(e(n[o]));t.apply(null,t)};({}).bolt={module:{api:{define:i,require:r,demand:e}}};var o=i;(function(n,t){o(n,[],function(){return t})})("2",tinymce.util.Tools.resolve),o("1",["2"],function(n){return n("tinymce.PluginManager")}),o("0",["1"],function(n){return n.add("print",function(n){n.addCommand("mcePrint",function(){n.getWin().print()}),n.addButton("print",{title:"Print",cmd:"mcePrint"}),n.addShortcut("Meta+P","","mcePrint"),n.addMenuItem("print",{text:"Print",cmd:"mcePrint",icon:"print",shortcut:"Meta+P",context:"file"})}),function(){}}),e("0")()}();