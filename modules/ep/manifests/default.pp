class ep::default {
  require boxen::config
  require homebrew
  require ruby
  require nodejs

  include brewcask
  include mysql
  include sysctl
  include redis
  include xquartz
  include pkgconfig
  include imagemagick
  include phantomjs
  include jumpcut
  include imageoptim
  include tower
  include caffeine
  include postgresapp
  include pow
  include pdftk
  include textmate::textmate2::release
  include sublime_text
  include iterm2::stable
  include autoconf
  include automake
  include mdbtools
  include heroku
  include s3cmd
  include keycastr

  # Use Brewcask to install Screenhero
  # Note: it seems like this is the way to go for new apps:
  # https://github.com/boxen/our-boxen/issues/683#issuecomment-64502104
  # See https://github.com/caskroom/homebrew-cask
  package { 'screenhero': provider => 'brewcask' }

  # Default Ruby
  class { 'ruby::global': version => "2.1.2" }

  # Default Node.js
  class { 'nodejs::global': version => 'v0.10' }

  # Make sure bundler is always there
  # For installing other dependencies
  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }

  # Make sure powder is always there
  # For managing pow.cx
  ruby_gem { 'powder for all rubies':
    gem          => 'powder',
    version      => '~> 0.3.0',
    ruby_version => '*',
  }
}
