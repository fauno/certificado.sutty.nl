document.addEventListener('turbolinks:load', function() {
  const form = document.querySelector('#contact');

  if (form) {
    let uuid = window.localStorage.uuid
    if (!uuid) {
      uuid = ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c => (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16))
      window.localStorage.uuid = uuid
    }

    const data = new FormData();
    data.append('fingerprint', uuid);

    fetch('https://contacto.sutty.nl/api/v1/form_config',
          { credentials: 'omit', method: 'POST', body: data })
          .then(r => r.json())
          .then(r => {
            form.action = r.endpoint;
            form.fingerprint.value = uuid;
            form.token.value = r.token;
          })
  }

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
