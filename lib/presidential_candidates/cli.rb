class PresidentialCandidates::CLI

    def call
        welcome
        make_candidate
        list_candidates
        menu
    end

    def welcome
        puts "\nLet's learn about the 2020 Presidential Candidates!"
        # sleep(1)
    end

    def make_candidate
        candidates_array = PresidentialCandidates::Candidate.scrape_entity
        PresidentialCandidates::Candidate.create_from_collection(candidates_array)
    end

    def add_attributes_to_candidates
        PresidentialCandidates::Candidate.all.each do |candidate|
          attributes = PresidentialCandidates::Candidate.scrape_entity
          student.add_student_attributes(attributes)
        end
    end
    
    def list_candidates
        PresidentialCandidates::Candidate.list
    end

    def menu
        input = nil
        while input != "exit"
        puts "Enter one of the following:\n 
        Candidate number to learn more\n 
        \"List\" to view candidates\n
        Type exit to quit:"

        input = gets.strip.downcase
            if input.to_i > 0 
                the_candidate = @candidates[input.to_i-1]
                puts "#{the_candidate.name}"
            elsif input == "list"
                puts "\nHere is the list again!"
                list_candidates
            elsif input == "exit"
                goodbye
            else
                puts "What do you mean? Please choose a candidate's number, list, or exit."
            end
        end
    end

    def goodbye
        puts "\nPlease vote wisely!"
        puts 
    end

end