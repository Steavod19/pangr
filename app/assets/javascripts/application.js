// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//
//= require jquery
//= require jquery_ujs
//= require jquery.colorbox-min
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).foundation();



window.onload = function() {
  stickyFooter();

};

//check for changes to the DOM
function checkForDOMChange() {
  stickyFooter();
}

//check for resize event if not IE 9 or greater
window.onresize = function() {
  stickyFooter();
}

//lets get the marginTop for the <footer>
function getCSS(element, property) {

  var elem = document.getElementsByTagName(element)[0];
  var css = null;

  if (elem.currentStyle) {
    css = elem.currentStyle[property];

  } else if (window.getComputedStyle) {
    css = document.defaultView.getComputedStyle(elem, null).
    getPropertyValue(property);
  }

  return css;

}

function stickyFooter() {

  if (document.getElementsByTagName("footer")[0].getAttribute("style") != null) {
    document.getElementsByTagName("footer")[0].removeAttribute("style");
  }

  if (window.innerHeight != document.body.offsetHeight) {
    var offset = window.innerHeight - document.body.offsetHeight;
    var current = getCSS("footer", "margin-top");

    if (isNaN(current) == true) {
      document.getElementsByTagName("footer")[0].setAttribute("style","margin-top:0px;");
      current = 0;
    } else {
      current = parseInt(current);
    }

    if (current+offset > parseInt(getCSS("footer", "margin-top"))) {
      document.getElementsByTagName("footer")[0].setAttribute("style","margin-top:"+(current+offset)+"px;");
    }
  }
}
