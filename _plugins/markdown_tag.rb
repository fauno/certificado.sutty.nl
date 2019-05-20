# frozen_string_literal: true

module Jekyll
  module Filters
    module Markdown
      # Reutiliza la configuración de jekyll-commonmark para pasar texto
      # por un filtro de markdown
      #
      # TODO: debería usar el sabor de markdown elegido por el sitio,
      # pero vamos a homogeneizar en CommonMark porque es el más moderno
      # y veloz
      def markdown(plaintext)
        config = @context.registers[:site].config
        parser = Jekyll::Converters::Markdown::CommonMark.new(config)

        parser.convert(plaintext)
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Filters::Markdown)
