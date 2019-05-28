require 'jekyll/document'

module Jekyll
  class Document
    alias_method :old_render_with_liquid?, :render_with_liquid?

    # Redefine render_with_liquid? para que podamos indicar manualmente
    # cuándo queremos que se pueda usar liquid en un artículo o no.
    #
    # XXX: Queremos que se puedar usar liquid en los artículos?
    # TODO: Implementar variable liquid en Sutty
    def render_with_liquid?
      old_render_with_liquid? && data['liquid'] != false
    end
  end
end
