class ResumeController < ApplicationController
  def index
    @programming_experience = Resume.get_programming_experience
    @employment_history = Resume.get_employment_history
    @education = Resume.get_education
    @extras = Resume.get_extras
  end
end
