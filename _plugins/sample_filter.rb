# frozen_string_literal: true

module Jekyll
  module Filters
    # Filtros para Liquid
    module Sample
      # Obtiene un elemento al azar de un array
      def sample(input)
        raise ArgumentError, 'Input must be an Array' unless input.is_a?(Array)

        input.sample
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Filters::Sample)
