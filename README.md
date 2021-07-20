# jekyll-get-books
> 💎 Fetch and safe meta information for books from the Google Book API for a Jekyll Site.



## Installation

1. Use `bundle add jekyll-get-books` to add this to your site's Gemfile.
2. Add this plugin to the `plugins` listed in your `_config.yml` file. For example:
    ```
    plugins:
      - jekyll-get-books
    ```

## Usage

Add a `jekyll_get_books` section to your `_config.yml` file. This section should be an array of objects containing `data`, `json` and `file`  properties:
* The `data` property specifies where in the `site.data` you would like to put this data.
* The `json` property is the remote URL of the JSON file without specific data attributes.
* The `file` property is the path to the csv file with the ISBN numbers.

Examples can be found in the examples folder.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/c-leitner/jekyll-get-books.

## Credit

This plugin was inspired by [jekyll-get-json](https://github.com/brockfanning/jekyll-get-json).