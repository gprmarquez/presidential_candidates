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
    
    def list_candidates
        PresidentialCandidates::Candidate.list
    end

    def menu
        input = nil
        while input != "exit"
        puts
        puts "Enter one of the following:\n 
        Candidate number to learn more\n 
        \"List\" to view candidates\n
        Type \"exit\" to quit:"

        input = gets.strip.downcase
            if input.to_i > 0 && input.to_i < PresidentialCandidates::Candidate.all.length+1
                candidate = PresidentialCandidates::Candidate.all[input.to_i-1]
                puts candidate.name
                puts "What would you like to know about the candidate mentioned above?\n"
                learn_more(candidate)
                break
            elsif input.to_i > PresidentialCandidates::Candidate.all.length
                puts "You entered #{input}. There are no candidates assigned to that number."
            elsif input == "list"
                puts "\nHere is the list again!"
                list_candidates
                sleep(1)
            elsif input == "exit"
                goodbye
            else
                puts "You entered #{input}."
                puts "Is this what you meant? Please choose a candidate's number, list, or exit."
            end
        end
    end

    def learn_more(candidate)
        puts
        puts "Enter one of the following for #{candidate.name}:\n
        1. Age\n
        2. Party\n
        3. Quote (If Available)\n
        4. Back to menu\n
        5. Exit Application"
        puts
        input = nil
        input = gets.strip.downcase
        case input 
        when input = 0
            puts "Invalid entry. Please try again."
            sleep(1)
            learn_more(candidate)
        when "age", "1"
            puts
            puts candidate.age
            learn_more(candidate)
        when "party", "2"
            puts
            puts candidate.party
            learn_more(candidate)
        when "quote", "3"
            puts
            puts candidate.quote
            learn_more(candidate)
        when "menu", "4"
            puts
            menu
        when "exit","5"
            puts
            goodbye
        else
            puts
            puts "Please choose a digit from the list [1-5]."
            learn_more(candidate)
        end
    end

    def goodbye
        puts "\nPlease vote wisely!"
        puts 
    end

end