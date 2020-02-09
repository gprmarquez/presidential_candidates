class PresidentialCandidates::Candidate 
    attr_accessor :name, :party

    def self.list
        # should return a bunch of instances of candidates
        puts "Presidential Candidates:"
        #this will scrape from the website with the list of the candidates
        # candidate_1 = self.new
        # candidate_1.name = "Bernie"
        # candidate_1.party = "Liberator"

        # candidate_2 = self.new
        # candidate_2.name = "Bernie 2"
        # candidate_2.party = "Liberal"

        # [candidate_1, candidate_2]
        self.scrape_candidates
    end

    def self.scrape_candidates
        candidates = []

        candidates << self.scrape_entity

        #go to the website
        #extract properties
        #instantiate candidate

        candidates
    end

    def self.scrape_entity
        doc = Nokogiri::HTML(open("https://www.theatlantic.com/politics/archive/2020/02/2020-candidates-president-guide/582598/"))
        binding.pry
    end
end