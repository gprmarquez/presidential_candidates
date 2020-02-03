class PresidentialCandidates::Candidate 
    attr_accessor :name, :party

    def self.list
        #should return a bunch of instances of candidates
        puts "Presidential Candidates:"
        puts <<-DOC.gsub /^\s*/,''
        1. Bernie
        2. Bernie 2
        DOC
        candidate_1 = self.new
        candidate_1.name = "Bernie"
        candidate_1.party = "Liberator"

        candidate_2 = self.new
        candidate_2.name = "Bernie 2"
        candidate_1.party = "Liberator"

        [candidate_1, candidate_2]
    end
end
end 