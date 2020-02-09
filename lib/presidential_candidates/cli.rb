class PresidentialCandidates::CLI
    def call
        list_candidates
        menu
        goodbye
    end

    def list_candidates
        @candidates = PresidentialCandidates::Candidate.list
        @candidates.each.with_index(1) do |candidate, i|
            puts "#{i}. #{candidate.name} - #{candidate.party}"
        end
    end

    def menu
        input = nil
        while input != "exit"
        puts "Enter the number of the candidate you would like to learn about, list to view candidates, or type exit to quit:"

        input = gets.strip.downcase
            if input.to_i > 0 
                the_candidate = @candidates[input.to_i-1]
                puts puts "#{the_candidate.name} - #{the_candidate.party}"
            elsif input == "list"
                list_candidates
            else
                puts "What do you mean? Please choose a candidate's number, list, or exit."
            end
        end
    end

    def goodbye
        puts "Please vote wisely!"
    end

end