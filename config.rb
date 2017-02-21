###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Set different hosts by environment
configure :development do
  activate :asset_host, :host => '//dev-assets.artrunde.com'
end

configure :master do
  activate :asset_host, :host => '//assets.artrunde.com'
end

configure :build do
  
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
  
  # Asset hash for unique asset names. This makes sure everytime we make a new asset it gets a different name, and is not cached.  
  activate :asset_hash

end