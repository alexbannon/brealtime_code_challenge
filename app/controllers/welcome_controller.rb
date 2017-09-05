class WelcomeController < ApplicationController

  def index
    render :status => 200, :json => "OK"
  end

  def ok
    render plain: "'OK' 'Alex Bannon'"
  end

  def answers
    answers = {
      name: "Alex Bannon",
      email_address: "alexbannon@gmail.com",
      phone_number: "301-919-4523",
      position: "Software Engineer - Frontend Systems",
      years: "3 years experience",
      referred: "Hired",
      education: "BA Philosophy from Boston University",
      resume: "https://hired.com/resumes/alex-bannon",
      repo: "https://github.com/alexbannon/brealtime_code_challenge",
      eligibility: "Yes",
      puzzle: "ABCDA=<<<B>=><C><=<D>>>="
    }
    render :json => answers, :status => 200
  end

end
