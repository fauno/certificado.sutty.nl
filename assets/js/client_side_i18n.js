---
---

document.addEventListener('DOMContentLoaded', function() {
  const available_locales = {{ site.locales | to_json }};

  var current_locale = navigator.languages.map(function(language) {
    return language.split('-')[0];
  }).find(function(locale) {
    return available_locales.includes(available_locales);
  });

  if (current_locale == undefined) current_locale = available_locales[0];

  available_locales.forEach(function(locale) {
    if (locale == current_locale) return;

    document.querySelectorAll('[lang='+locale+']').forEach(function(el) {
      el.parentNode.removeChild(el);
    });
  });
});
