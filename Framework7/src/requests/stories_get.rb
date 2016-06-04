require_relative '../../src/data/stories'

class StoriesDetailsGet
  def self.call_and_return_response(client,end_point)
    status_code, response_body = client.get(end_point)
    story_details = Stories.new(response_body)

    [status_code, story_details]
  end

  def self.validate_story_details(client, end_point)
    status_code, story_details = self.call_and_return_response(client,end_point)
    status_code
    story_details.id
  end

  def self.validate_id(id)
    id.to_s =~ (/^[0-9]$/)
  end

  def self.validate_project_id(project_id)
    project_id.to_s =~ (/^[0-9]{7}$/)
  end

  def self.validate_story_name(story_name)
    story_name = story_name.to_s
    story_name.kind_of?(String) && story_name.length <= 5000
  end

  def self.validate_story_description(story_description)
    story_description = story_description.to_s
    story_description.kind_of?(String) && story_description.length <= 20000
  end

  def self.validate_story_type(story_type)
    array = ['feature', 'bug', 'chore', 'release']
    array.include?(story_type)
  end

  def self.validate_current_state(current_state)
    array_current_state = ['accepted', 'delivered', 'finished', 'started', 'rejected', 'planned', 'unstarted', 'unscheduled']
    array_current_state.include?(current_state)
  end

end