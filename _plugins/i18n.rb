# frozen_string_literal: true

module Jekyll
  # Plugin de i18n simple de Jekyll
  #
  # * Los posts se organizan en directorios _IDIOMA
  # * El idioma por defecto queda en _posts
  # * Las strings de traducción de los sitios están en _data/IDIOMA.yml
  class Site
    alias process_one process
    def process
      langs = config.fetch('i18n', [])
      langs.each do |lang|
        Jekyll.logger.info 'I18n:', lang
        # Agregar el idioma al destino del sitio, pero primero eliminar
        # cualquier idioma anterior
        dest = config['destination'].split(File::Separator)
        dest.pop if langs.include? dest.last
        # Hacer lo mismo con la URL base
        base = (config.dig('baseurl') || '').split(File::Separator)
        base.pop if langs.include? base.last

        # Modificar el destino de los archivos en varios lados
        @dest = config['destination'] = (dest + [lang]).join(File::Separator)
        @lang = config['lang'] = lang
        config['baseurl'] = (base + [lang]).join(File::Separator)

        Jekyll.logger.info 'Destination:', config['destination']
        Jekyll.logger.info 'Base URL:', config['baseurl']

        # En lugar de cambiar el funcionamiento interno de Jekyll, le
        # engañamos a que busque los _posts en otro lado
        FileUtils.rm_f('_posts')
        FileUtils.ln_s("_#{@lang}", '_posts')

        process_one
      end
    end
  end
end
