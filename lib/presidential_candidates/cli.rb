class PresidentialCandidates::CLI
    def call
        list_candidates
        menu
        goodbye
    end

    def list_candidates
        @candidates = PresidentialCandidates::Candidate.list
    end

    def menu
        input = nil
        while input != "exit"
        puts "Enter the number of the candidate you would like to learn about, list to view candidates, or type exit to quit:"

        input = gets.strip.downcase
            case input
            when "1"
                puts "More info on candidate 1 ..."
            when "2"
                puts "More info on candidate 2 ..."
            when "list"
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