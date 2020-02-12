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
        puts
        puts "Enter one of the following:\n 
        Candidate number to learn more\n 
        \"List\" to view candidates\n
        Type \"exit\" to quit:"

        input = gets.strip.downcase
            if input.to_i > 0 && input.to_i < PresidentialCandidates::Candidate.all.length+1
                puts PresidentialCandidates::Candidate.all[input.to_i-1].name
                puts "What would you like to know about the candidate mentioned above?\n"
                learn_more
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

    def learn_more
        puts
        puts "Enter one of the following:\n
        1. Age\n
        2. Party\n
        3. Quote (If Available)\n
        4. Stances\n
        5. Link to Profile\n
        6. Back to menu\n
        7. Exit Application"
        puts
        input = nil
        input = gets.strip.downcase
        case answer = input.to_i
        when answer = 0
            puts "Invalid entry."
            learn_more
        when answer = 1
            puts "age"
        when answer = 2
            puts "party"
        when answer = 3
            puts "quote"
        when answer = 4
            puts "stances"
        when answer = 5
            puts "link"
        when answer = 6
            menu
        when answer = 7
            goodbye
        end
    end
#name
    #party
    #status
    #age
    #if available, quote
    #stances 
    #link to profile
    def goodbye
        puts "\nPlease vote wisely!"
        puts 
    end

end