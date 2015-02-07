# Class to encrypt the text by caesar cipher

class Encrypt
	attr_accessor :text, :shiftFactor					# text and shift factor passed for ciphering
	def caesar_cipher									# method to cipher

## gsub is used to substitute the character in the string - using pattern match to substitute		
		text.gsub!(/([a-zA-Z])/){ |char|
## If the shift in character results in char above z or Z, subtract 26 characters to start with a or A
## ord returns the numeric equivalent of the character and chr converts back to character			
			if ((char.ord + shiftFactor > 90 && char.ord + shiftFactor < 97) || char.ord + shiftFactor > 122)
				(char.ord + shiftFactor - 26).chr
			else
				(char.ord + shiftFactor).chr
			end
		}

		return text										# return the changed string from the method
	end

	def caesar_decipher
## gsub is used to substitute the character in the string - using pattern match to substitute		
		text.gsub!(/([a-zA-Z])/){ |char|
## If the shift in character results in char below a or A, add 26 characters to start from z or Z
## ord returns the numeric equivalent of the character and chr converts back to character
			if ((char.ord - shiftFactor < 97 && char.ord - shiftFactor > 90) || char.ord + shiftFactor < 65)
				(char.ord - shiftFactor + 26).chr
			else
				(char.ord - shiftFactor).chr
			end
		}

		return text										# return the changed string from the method		
	end
end


## Get the input from the user, instantiate the class and call the method for ciphering

cipher = Encrypt.new

puts "Do you want to ciper or decipher? Enter your choice: 0 - Cipher, 1 - Decipher"
choice = gets.chomp.to_i
case choice
when 1
	puts "Enter string for deciphering"
	cipher.text = gets.chomp

	puts "Enter the shift factor"
	cipher.shiftFactor = gets.chomp.to_i

	puts cipher.caesar_decipher

when 0
	puts "Enter string for ciphering"
	cipher.text = gets.chomp

## Using a rnadom number to encypt and output the random number to enable deciphering
	cipher.shiftFactor = 1 + rand(8)

	puts cipher.caesar_cipher
	puts "Shift Factor is " + cipher.shiftFactor.to_s	
else
	puts "Invalid Input!"
end