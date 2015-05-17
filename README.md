# Jekyll Post Group Generator

This plugin provides a generator for grouping posts by arbitrary front-matter keys.

Jekyll provides two grouping variables for posts: `site.categories` and `site.tags`. This plugin provides a method to create groups for any other key you’d like.

## Installation

This plugin is provided as a gem:

```sh
gem install jekyll-itafroma-post_groups
```

Once the gem is installed, include it in your Jekyll site's configuration:

```yaml
gems: ['jekyll/itafroma/post_groups']
```

## Configuration

This plugin is configured using a sequence of mappings named `post_groups`:

```yaml
post_groups:
    - key: section
      group: sections
      exclude: ['Philosophy']
```

Each mapping has the following keys:

* **key:** *(required)* The name of the front-matter key to group on.
* **group:** *(required)* Used to name the `site.*` variable (e.g., `site.sections` for the front-matter key `section`). *Note:* this cannot be the same name as a built-in Jekyll variable.
* **exclude:** *(optional)* A sequence of values that should be excluded from the grouping. In the example above, posts keyed with `section: Philosophy` will be excluded from `site.sections`.

## Usage

Once defined, you can use your new post groups within templates in the same way that you can use `site.categories` and `site.tags`:

* Each post group will be defined as an array within the `site` variable (e.g. `site.sections`).
* Each key within that array will be another array containing two elements: the first element is the key value (e.g. "Philosophy") and the second element is an array of posts that are keyed with that value (e.g. every post with `section: Philosophy` in its front matter).

Let's say you wanted to have a new key, `section`, and wanted to display each value in `section` on a page with a list of post titles within each section:

```liquid
{% for section in site.sections %}
<section>
    <h1>{{ section[0] }}</h1>
    {% for post in section[1] %}
    <article>
        <h1>{{ post.title }}</h1>
    </article>
    {% endfor %}
</section>
{% endfor %}
```

## Copyright and license

This plugin is copyright © 2014 [Mark Trapp][1]. All rights reserved. It is made
available via the MIT license. A copy of the license can be found in the
`LICENSE` file.

## Related links

* [Canonical project page][2]
* [RubyGems project page][3]

[1]: https://marktrapp.com "Mark Trapp’s website"
[2]: https://marktrapp.com/projects/jekyll-post-groups "Jekyll Indentation Filter project page"
[3]: https://rubygems.org/gems/jekyll-itafroma-post_groups "RubyGems project page"
