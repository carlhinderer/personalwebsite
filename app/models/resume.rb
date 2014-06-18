class Resume
  require 'yaml'

  def self.get_programming_experience
    get_yaml_data 'qualifications.yml', 'Unable to load programming experience.'
  end

  def self.get_employment_history
    get_yaml_data 'employment_history.yml', 'Unable to load employment history.'
  end
  
  def self.get_education
    get_yaml_data 'education.yml', 'Unable to load education.'
  end

  def self.get_extras
    get_yaml_data 'extras.yml', 'Unable to load extras.'
  end

  private 
  def self.get_yaml_data(file, error_message)
    begin
      YAML.load_file(Rails.root.join('data', file))
    rescue
      Array.new([error_message])
    end
  end
end
