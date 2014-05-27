class Resume
  require 'yaml'

  def get_qualifications
    begin
      YAML.load_file(Rails.root.join('data', 'qualifications.yml'))
    rescue
      Array.new(['Unable to load qualifications.'])
    end
  end
end
