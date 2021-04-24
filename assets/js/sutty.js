---
---

document.addEventListener('turbolinks:load', function() {
  document.querySelectorAll('a.navbar-burger').forEach(function(el) {

    const _toggler = el;
    const _navbar  = _toggler.closest('nav').querySelector('.navbar-menu');
    const _aria    = _toggler.getAttribute('aria-expanded');

    _toggler.setAttribute('aria-expanded', (_aria == 'true') ? 'false' : 'true');
    _navbar.classList.toggle('is-active');

    el.addEventListener('click', function(e) {
      e.preventDefault();

      const _toggler = e.currentTarget;
      const _navbar  = _toggler.closest('nav').querySelector('.navbar-menu');
      const _aria    = _toggler.getAttribute('aria-expanded');

      _toggler.setAttribute('aria-expanded', (_aria == 'true') ? 'false' : 'true');
      _navbar.classList.toggle('is-active');
    });
  });

  document.querySelectorAll('input[type="submit"]').forEach(submit => {
    submit.disabled = true;
    submit.dataset.value = submit.value;

    submit.dataset.interval = setInterval(() => {
      const delay = parseInt(submit.dataset.delay);

      if (delay == 0) {
        clearInterval(parseInt(submit.dataset.interval));
        submit.disabled = false;
        submit.value = submit.dataset.value;
      } else {
        submit.dataset.delay = delay - 1;
        submit.value = submit.dataset.value + ' (' + delay + ')';
      }
    }, 1000);

  });
});
