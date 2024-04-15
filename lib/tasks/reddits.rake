namespace :reddits do
  desc "Parse reddit topics"

  task :parse, [:file_name] => :environment do
    main_link = "https://www.reddit.com"
    url = 'https://www.reddit.com/r/ListOfSubreddits/wiki/listofsubreddits'

    html = URI.open(url)
    doc = Nokogiri::HTML(html)

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

            Reddit.create(topic: topic, subreddit: title, link: url)

          end
        end
      end
    end
  end
end