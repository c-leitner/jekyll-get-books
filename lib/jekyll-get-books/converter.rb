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
          table = CSV.read(File.read(file), headers: true)
          counter = 0
          table.each do |row|
            output = JSON.load(URI.open(source+row['isbn']))
            site.data[d['data'[coutner.status]]] = row['status']
            if target
              target.deep_merge(source)
            else
              site.data[d['data'[coutner]]] = output
            end   
            counter += 1
          end
        rescue
          next
        end
      end
    end
  end
end

