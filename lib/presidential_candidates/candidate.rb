class PresidentialCandidates::Candidate 
    attr_accessor :name, :age, :party, :quote

    @@all = []

    def initialize(candidate_hash)
        candidate_hash.each do |attribute, value|
          self.send("#{attribute}=", value)
        end
        @@all << self
    end

    def self.create_from_collection(candidates_array)
        candidates_array.each do |candidate_hash|
            PresidentialCandidates::Candidate.new(candidate_hash)
        end
    end

    def self.list
        puts "Presidential Candidates:\n"
        @@all.each.with_index(1) do |candidate, i|
            puts "#{i}. #{candidate.name}"
        end
    end

    def self.all
        @@all
    end

    def self.scrape_entity
        doc = Nokogiri::HTML(open("https://www.nytimes.com/interactive/2019/us/politics/2020-presidential-candidates.html"))
        candidates = []
        doc.css("div.g-info.g-balance").each do |profile|
            candidate_name = profile.css("div.g-name").text.split(',').first
            candidate_age = profile.css("span.g-age").text.gsub!(/([,])/,'').strip
            candidate_party = profile.css("div.g-small-note").text
            candidate_quote = profile.css("div.g-quote").text
            candidates << {name: candidate_name, age: candidate_age, party: candidate_party, quote: candidate_quote}
        end
        candidates
    end
end