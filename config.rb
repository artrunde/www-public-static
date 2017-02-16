###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

configure :build do
  
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
  
  # Asset hash for unique asset names. This makes sure everytime we make a new asset it gets a different name, and is not cached.  
  activate :asset_hash

  activate :asset_host, :host => '//dev-assets.artrunde.com.s3-website.eu-central-1.amazonaws.com/'  
  
end

# ------------------------------------------------------------------------------
# S3 sync. IAM profile is setup as CircleCI ENV
# ------------------------------------------------------------------------------
#activate :s3_sync do |s3_sync|
#  s3_sync.bucket                = 'dev-www.artrunde.com'
#  s3_sync.region                = 'eu-central-1'
#end
