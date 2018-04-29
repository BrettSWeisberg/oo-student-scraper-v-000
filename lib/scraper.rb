require 'open-uri'
require 'pry'


class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
     name_container = doc.css("div .roster-cards-container")
  #   name = doc.css("div .student-card").first.css("h4").text
  #   from = doc.css("div .student-card").first.css("p").text
  #   link = doc.css("div .student-card").first.css("a").first.first.last
     name_container.map do |div|
       div.css(".student-card").map do |attribute|
         name = attribute.css("h4").text
         from = attribute.css("p").text
         link = attribute.css("a").first.first.last

          [:name => "#{name}", :location => "#{from}", :profile_url => "#{link}"]
      end.flatten
    end.flatten
  end



  def self.scrape_profile_page(profile_url)

        html = open(profile_url)
        doc = Nokogiri::HTML(html)
    #
    #     twitter = ".."
    #   #   doc.css("body").css("a")[1].attributes["href"].value
    #     linkedin = ".."
    # #    doc.css("body").css("a")[2].attributes["href"].value
    #     github = ".."
    # #    doc.css("body").css("a")[3].attributes["href"].value
    #     blog = ".."
         profile_quote = doc.css("body").css("div")[6].text
         bio =  doc.css("body").css("p").first.text

      hash = {}
        doc.css(".social-icon-container a").each do |element|

        url = element.attributes["href"].value
      #  binding.pry
          if url.include?('twitter')
            hash[:twitter] = url
          elsif url.include?('linkedin')
            hash[:linkedin] = url
          elsif url.include?('github')
            hash[:github] = url
          else
            hash[:blog] = url
          end
         end
         hash[:bio] = bio
         hash[:profile_quote] = profile_quote
            return hash
      end
    end
