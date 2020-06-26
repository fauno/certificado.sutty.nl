# frozen_string_literal: true

module Jekyll
  module Filters
    module Relative
      # Busca el siguiente post al actual
      #
      # @see Jekyll::Document#next_doc
      def next_post(input, post)
        pos = index input, post

        input.at(pos + 1) if pos && pos < input.length - 1
      end

      # Busca el anterior post al actual
      #
      # @see Jekyll::Document#previous_doc
      def previous_post(input, post)
        pos = index input, post

        input.at(pos - 1) if pos && pos.positive?
      end

      private

      def index(input, post)
        input.map(&:to_liquid).index(post)
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Filters::Relative)
