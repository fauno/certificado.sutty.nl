# frozen_string_literal: true

require 'mini_magick'

Jekyll::Hooks.register :site, :after_init do |site|
  logo = site.config['logo']

  %w[16 32 48 72 96 144 168 192].each do |size|
    file = if size == '16'
             ['favicon.ico']
           else
             [File.dirname(logo), "icon#{size}.png"]
           end

    file = file.join File::SEPARATOR

    next if File.exist? file

    Jekyll.logger.info "Creating icon #{file}"
    MiniMagick::Tool::Magick.new do |m|
      m << logo
      m.resize "#{size}x#{size}"
      m.strip
      m << file
    end
  end
end
