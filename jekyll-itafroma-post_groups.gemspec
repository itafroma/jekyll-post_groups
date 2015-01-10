Gem::Specification.new do |s|
  s.name        = 'jekyll-itafroma-post_groups'
  s.version     = '0.2.0'
  s.date        = '2014-10-29'
  s.summary     = 'Jekyll plugin to group posts by arbitrary front-matter keys.'
  s.description = <<-EOF
    Jekyll Post Group Generator is a plugin that provides a generator for
    grouping posts by arbitrary front-matter keys.

    Jekyll provides two grouping variables for posts: site.categories and 
    site.tags. This plugin provides a method to create groups for any other key
    you'd like.
  EOF
  s.authors     = ['Mark Trapp']
  s.email       = 'mark@marktrapp.com'
  s.files       = ['lib/jekyll/itafroma/post_groups.rb']
  s.homepage    = 'http://marktrapp.com/projects/jekyll-post-groups'
  s.license     = 'MIT'
end
