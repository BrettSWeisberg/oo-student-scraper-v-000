class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)

      student_hash.each do |key, value|
        if key == :name
          @name = value
        elsif key == :location
          @location = value
        end
      end
        @@all << self
    end




  def self.create_from_collection(students_array)
    #  Scraper.scrape_index_page(students_array)
      binding.pry
  end

  def add_student_attributes(attributes_hash)
  #  Scraper.scrape_profile_page(attributes_hash)
  end

  def self.all
    @@all
  end
end
