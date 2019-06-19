---
---

{% turbolinks %}

{% comment %}
TODO: cuando minifiquemos JS, solo incorporar zepto y event.js
{% endcomment %}
{% node_module zepto/dist/zepto.min.js %}

$(document).on('click', '.navbar-burger', function(e) {
  e.preventDefault();

  var _toggler = $(e.currentTarget);
  var _navbar  = _toggler.parents('nav').find('.navbar-menu');

  _navbar.toggleClass('is-active');
});
