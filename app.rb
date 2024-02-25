require 'nokogiri'
require 'open-uri'
require 'csv'

main_link = "https://www.reddit.com"
url = 'https://www.reddit.com/r/ListOfSubreddits/wiki/listofsubreddits'

html = URI.open(url)
doc = Nokogiri::HTML(html)

CSV.open('output.csv', 'wb') do |csv|
  csv << ['Topic', 'Subreddit', 'Subreddit Link']

  doc.css('div.md.wiki').each do |div|
    div.css('h1, h2, h3, h4').each do |header|
      if header['id'] == 'wiki_general_content'
        next
      end

      topic = header.text.strip
      paragraph = header.xpath('following-sibling::p').first

      if paragraph
        paragraph.css('a').each do |link|
          title = link.text.strip
          url = main_link + link['href']

          csv << [topic, title, url]
        end
      end
    end
  end
end
