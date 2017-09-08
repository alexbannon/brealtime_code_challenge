class WelcomeController < ApplicationController
  def index
    which_question = params[:q]
    case which_question
    when 'Ping'
      response = 'OK'
    when 'Name'
      response = 'Alex Bannon'
    when 'Position'
      response = 'Software Engineer - Frontend Systems'
    when 'Email Address'
      response = 'AlexBannon@Gmail.com'
    when 'Puzzle'
      full_puzzle = params[:d]
      full_puzzle = full_puzzle.split("\n")
      puzzle_array = []
      (2..5).each do |number|
        puzzle_array.push(full_puzzle[number][1..-1].split(''))
      end

      letters = ['a', 'b', 'c', 'd']

      puzzle_response = {
        a: puzzle_array[0],
        b: puzzle_array[1],
        c: puzzle_array[2],
        d: puzzle_array[3]
      }

      puzzle_response[:a][0] = '='
      puzzle_response[:b][1] = '='
      puzzle_response[:c][2] = '='
      puzzle_response[:d][3] = '='

      any_changes = false
      loop do
        changes = 0
        puzzle_response.each do |row_letter, array|
          array.each_with_index do |symbol, column_letter_index|
            column_letter = letters[column_letter_index].to_sym
            if symbol == '<'
              if puzzle_response[column_letter][letters.index row_letter.to_s] != '>'
                changes += 1
                puzzle_response[column_letter][letters.index row_letter.to_s] = '>'
              end
              other_big_elements = puzzle_response[column_letter].each_index.select{|i| puzzle_response[column_letter][i] == '<'}
              other_big_elements.each do |big_element|
                if puzzle_response[row_letter][big_element] != '<'
                  changes += 1
                  puzzle_response[row_letter][big_element] = '<'
                end
              end
            elsif symbol == '>'
              if puzzle_response[column_letter][letters.index row_letter.to_s] != '<'
                changes += 1
                puzzle_response[column_letter][letters.index row_letter.to_s] = '<'
              end
              other_small_elements = puzzle_response[column_letter].each_index.select{|i| puzzle_response[column_letter][i] == '>'}
              other_small_elements.each do |small_element|
                if puzzle_response[row_letter][small_element] != '>'
                  changes += 1
                  puzzle_response[row_letter][small_element] = '>'
                end
              end
            end
          end
        end
        break if changes == 0
      end
      formatted_response = " ABCD\n"
      puzzle_response.each do |key, value|
        formatted_response += key.to_s.upcase
        value.each do |symbol|
          formatted_response += symbol
        end
        formatted_response += "\n"
      end
      formatted_response = formatted_response[0..-2]
      response = formatted_response
    when 'Phone'
      response = '301-919-4523'
    when 'Referrer'
      response = 'Hired'
    when 'Degree'
      response = 'BA Philosophy from Boston University. Web Development Immersive from General Assembly'
    when 'Years'
      response = '3 years'
    when 'Source'
      response = 'https://github.com/alexbannon/brealtime_code_challenge'
    when 'Resume'
      response = 'https://hired.com/resumes/alex-bannon'
    when 'Status'
      response = 'Yes'
    else
      response = ''
    end
    render plain: response
  end
end
