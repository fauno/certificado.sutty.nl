---
---

{% turbolinks %}

{% comment %}
TODO: cuando minifiquemos JS, solo incorporar zepto y event.js
{% endcomment %}
{% node_module zepto/dist/zepto.min.js %}

$(document).on('turbolinks:load', function() {
  $('.navbar-burger').on('click', function(e) {
    e.preventDefault();

    var _toggler = $(e.currentTarget);
    var _navbar  = _toggler.parents('nav').find('.navbar-menu');

    _toggler.attr('aria-expanded', true);
    _navbar.toggleClass('is-active');
  });
});
