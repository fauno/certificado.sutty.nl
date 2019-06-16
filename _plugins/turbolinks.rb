# frozen_string_literal: true

require 'turbolinks/source'
require 'pry'

module Jekyll
  module Tags
    # Crea un tag de Liquid que trae el contenido de turbolinks.js
    class Turbolinks < Liquid::Tag
      def render(_context)
        File.read([::Turbolinks::Source.asset_path, 'turbolinks.js'].join(File::SEPARATOR))
      end
    end
  end
end

# Registrar el tag
Liquid::Template.register_tag('turbolinks', Jekyll::Tags::Turbolinks)
