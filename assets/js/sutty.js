---
---

{% turbolinks %}

{% comment %}
TODO: cuando minifiquemos JS, solo incorporar zepto y event.js
{% endcomment %}

document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('a.navbar-burger').forEach(function(el) {
    el.addEventListener('click', function(e) {
      e.preventDefault();

      const _toggler = e.currentTarget;
      const _navbar  = _toggler.closest('nav').querySelector('.navbar-menu');
      const _aria    = _toggler.getAttribute('aria-expanded');

      _toggler.setAttribute('aria-expanded', (_aria == 'true') ? 'false' : 'true');
      _navbar.classList.toggle('is-active');
    });
  });
});
