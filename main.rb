class Main
    OPTIONS = {
        1 => :select_books
        2 => :select_music
        3 => :select_games
        0 => :exit_app
    }
    
    def initialize(app)
        @app = app
    end

    def display_menu_options
        puts "Please selelct an option:"
        OPTIONS.each do |key, value|
            puts "#{key}: #{menu_option_name(value)}"
        end
    end

    def handle_choice(choice)
        if OPTIONS.keys?(choice)
            send(OPTIONS[choice])
        else
            puts "Invalid choice, please try again."
        end
    end

    private

    def menu_option_name(method_name)
        method_name.to_s.split("_").map(&:capitalize).join(" ")
    end

    def select_books
        @app.select_books
    end

    def select_music
        @app.select_music
    end

    def select_games
        @app.select_games
    end

    def exit_app
        puts "Exiting the app, goodbye!"
    end
end