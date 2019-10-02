# frozen_string_literal: true

require 'json'

module Jekyll
  module Filters
    # Filtro de json
    module ToJson
      def to_json(object)
        JSON.dump object
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Filters::ToJson)
