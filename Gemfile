# frozen_string_literal: true

if ENV['JEKYLL_ENV'] == 'production'
  source 'https://gems.sutty.nl'
else
  source 'https://rubygems.org'
end

gem 'jekyll', '~> 4'

group :jekyll_plugins do
  gem 'jekyll-archives',
    git: 'https://0xacab.org/edsl/jekyll-archives.git',
    branch: 'liquid-slug'
  gem 'jekyll-brotli'
  gem 'jekyll-commonmark'
  gem 'jekyll-drafts-as-metadata'
  gem 'jekyll-feed'
  gem 'jekyll-gzip'
  gem 'jekyll-hardlinks'
  gem 'jekyll-images'
  gem 'jekyll-locales'
  gem 'jekyll-purgecss',
      git: 'https://0xacab.org/sutty/jekyll/jekyll-purgecss.git'
  gem 'jekyll-relative-urls'
  gem 'jekyll-seo-tag'
  gem 'jekyll-sitemap'
  gem 'jekyll-turbolinks'
  gem 'ruby-filemagic'
  gem 'mini_magick'
end

group :development do
  gem 'pry'
  gem 'rubocop'
  gem 'neocities'
end
