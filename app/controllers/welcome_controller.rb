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
    when 'Email+Address'
      response = 'AlexBannon@Gmail.com'
    when 'Puzzle'
      response = 'ABCDA=<<<B>=><C><=<D>>>='
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
