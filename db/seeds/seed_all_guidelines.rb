require 'rss'
require 'open-uri'

class SeedAllGuidelines

  def self.call

    url = 'https://www.guideline.gov/rssFiles/ngc_complete.xml'
    rss_url = open(url) 
    feed = RSS::Parser.parse(rss_url)
    items = feed.channel.items


    items.each do |item|
      if item.title && item.title.start_with?("Guideline Summary:")
        # No easy way to determine whether the feed item is a guideline. :(
        puts item.title

        Guideline.where(url: item.link).first_or_create!
      end
    end
  end

end