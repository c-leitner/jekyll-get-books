require "jekyll"
require 'json'
require 'deep_merge'
require 'open-uri'
require 'csv'

module JekyllGetBooks
  class GetBooksGenerator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)

      config = site.config['jekyll_get_books']
      if !config
        warn "No config".yellow
        return
      end
      if !config.kind_of?(Array)
        config = [config]
      end

      config.each do |d|
        begin
          target = site.data[d['data']]
          source = d['json']
          file = d['file']
          results = {}
          if !(File.file?(file))
            warn "File does not exist / Path is incorrect".yellow
          end
          CSV.foreach((file), headers: true, col_sep: ",") do |row|
            begin
              output = JSON.load(URI.open(source+row['isbn']))
            rescue => e
              case e
                when OpenURI::HTTPError
                warn "A HTTP Error occurred while accessing the API".yellow
                when SocketError
                warn "A Socket Error occurred while accessing the API".yellow
              end
            end
            results.deep_merge(output)
          end 
          site.data[d['data']] = results
        rescue
          next
        end
      end
    end
  end
end

