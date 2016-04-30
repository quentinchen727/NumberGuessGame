#---------
# name: NumberGuess.rb
#
#----------------

class Screen

 def cls
   puts ("\n" * 30)
   puts "\a"
 end

 def pause
    STDIN.gets
 end

end

class Game
	def display_greeting
		Console_Screen.cls
		print "\t\t Welcome to the Ruby Number Guessing Game!" +
		"\n\n\n\n\n\n\n\n\n\n\n\n\ Press Enter to " + 
		"continue."

		Console_Screen.pause
	end

	def display_instruction
		Console_Screen.cls
		puts "Instruction:\n\n"

		puts "This game randomly generates a number from 1 to 1000 and "
		puts "challaenges you to identify it in as few guesses and possible "
	end

	def generate_number
        # increaset to 1000
		return randomNo = 1 + rand(1000)
		#return randomNo = 1 + rand(100)
	end
    
	def play_game
		number = generate_number

        local_guess = 0

		loop do

            # limit maximum number to guess
            if local_guess == 1
				Console_Screen.cls
				print "You have guess 10 times! You lost!"
				Console_Screen.pause
                break
            end

			Console_Screen.cls
			print "\nEnter your guess and press the enter key: "

			reply = STDIN.gets
			reply.chop!

			#decide whether it is valid input
            Console_Screen.cls
            Console_Screen.pause
            if not !!(/^(\d)+$/.match(reply))
				Console_Screen.cls
                print "Not a number! Please input a number between 1 to 1000\n"
				Console_Screen.pause
                next
            elsif reply.to_i < 1 or reply.to_i > 1000
				Console_Screen.cls
                print "number should be between 1 and 1000! Please input a number between 1 to 1000\n"
				Console_Screen.pause
                next
            end

            reply = reply.to_i

			if reply < 1 or reply > 1000 then
				redo # redo the ciurrent iteration of the loop
			end

            $total_guess_number += 1


			if reply == number then
                # increment the number of right
                $noRight += 1
				Console_Screen.cls
				print "You have guessed the number! Press Enter to continue."
				Console_Screen.pause
				break
			elsif reply < number then
				Console_Screen.cls
                local_guess += 1
				print "Your guess is too low! Press enter to continue."
				Console_Screen.pause
			elsif reply > number then
				Console_Screen.cls
                local_guess += 1
				print "Your guess is too high! Press enter to continue."
				Console_Screen.pause
			end

		end
			
	end

	def display_credits
		Console_Screen.cls
		puts "\t\t\Thanks you for playing the number game!!"
	end

	$noRight = 0
    # define $total_guess_number
    $total_guess_number = 0
    $game_number = 0

	Console_Screen = Screen.new

	SQ = Game.new

	SQ.display_greeting

	answer = ""

	loop do
		Console_Screen.cls

		print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

		answer = STDIN.gets

		answer.chop!

		break if answer == "y" || answer == "n"
	end

	if answer == "n"

		Console_Screen.cls

		puts "Perhaps anoher time.\n\n"

	else
		SQ.display_instruction

		loop do
			SQ.play_game
            $game_number += 1

			Console_Screen.cls

			print "Would you like to play again? (y/n): "
            print "Your total guess of games is #{$total_guess_number}\n"
            print "Your total played game is #{$game_number}\n"
            print "Your average is #{$total_guess_number/$game_number}\n"

			playAgain = STDIN.gets
			playAgain.chop!

			break if playAgain == "n"
		end

		SQ.display_credits

	end

end


