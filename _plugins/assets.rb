# frozen_string_literal: true

module Jekyll
  module Filters
    # Filtro para obtener una URL única e invalidar la caché de los
    # navegadores
    module Asset
      # TODO: En realidad queremos saber si el archivo cambió en relación
      # a una compilación anterior...
      def asset(path)
        path.to_s + '?' + Time.now.to_i.to_s
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Filters::Asset)
