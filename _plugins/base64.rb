# frozen_string_literal: true

require 'base64'
require 'filemagic'

module Jekyll
  module Tags
    # Crea un tag de Liquid que busca un archivo dentro del directorio
    # node_modules y lo incorpora tal cual
    class Base64 < Liquid::Tag
      attr_reader :file

      def initialize(tag, markup, tokens)
        super

        @file = markup.strip

        raise ArgumentError, "#{file} doesn't exist" unless File.exist? file
      end

      def render(_context)
        base64 = ::Base64.encode64(File.read(file)).split("\n").join
        mime   = FileMagic.new(FileMagic::MAGIC_MIME).file(file).tr(' ', '')

        "data:#{mime};base64,#{base64}"
      end
    end
  end
end

# Registrar el tag
Liquid::Template.register_tag('base64', Jekyll::Tags::Base64)
