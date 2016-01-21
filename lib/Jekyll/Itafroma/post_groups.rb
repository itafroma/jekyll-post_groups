#
# Creates site variables that group posts by arbitrary front-matter keys.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2014 Mark Trapp
# License:: MIT

JEKYLL_MIN_VERSION_3 = Gem::Version.new(Jekyll::VERSION) >= Gem::Version.new('3.0.0') unless defined? JEKYLL_MIN_VERSION_3

module Jekyll
  module Itafroma
    class PostGroupsGenerator < Jekyll::Generator
      def generate(site)
        site.config['post_groups'].each do |group|
          post_key = group['key']
          collection = group['group']
          exclude = group['exclude'] || []
          site.config[collection] = post_key_hash(site, post_key, exclude)
        end
      end

      ##
      # Generates a hash using a key from a post's front-matter.
      #
      def post_key_hash(site, post_key, exclude)
        # Build a hash map based on the specified post attribute ( post attr =>
        # array of posts ) then sort each array in reverse order.
        hash = Hash.new { |hsh, key| hsh[key] = Array.new }
        posts = JEKYLL_MIN_VERSION_3 ? site.posts.docs : site.posts
        posts.each do |p|
          # Skip post if it doesn't have the correct key
          next unless p.data.key? post_key

          # Load the value for the key and check if it should be excluded
          t = p.data.fetch(post_key)
          next if exclude.include? t

          # Add the post to the hash
          hash[t] << p
        end

        # Sort the hash
        hash.values.map { |sortme| sortme.sort! { |a, b| b <=> a } }
        hash
      end
    end
  end
end
