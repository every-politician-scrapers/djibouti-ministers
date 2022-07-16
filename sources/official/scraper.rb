#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      noko.css('.card-title').text.tidy
    end

    def position
      noko.css('.card-text').text.tidy
    end

    private

    def position_node
      noko.css('strong').first
    end
  end

  class Members
    def member_container
      noko.css('.card')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv if file.exist? && !file.empty?
