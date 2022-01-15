#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      position_node.xpath('following-sibling::text()').first.text.tidy.delete_prefix(', ')
    end

    def position
      position_node.text.tidy.gsub(/^\d+.? /, '')
    end

    private

    def position_node
      noko.css('strong').first
    end
  end

  class Members
    def member_container
      noko.xpath('//table//tr//p[.//strong]')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv if file.exist? && !file.empty?
