require_relative '../data/me_details'

class TaskPost

  def self.call_and_return_response_task(end_point,description)
    url_elements = end_point
    status_code, response_body = client.post(url_elements,{:description => description})
    task_details = TaskDetails.new(response_body)
    [status_code, task_details]
  end

  def self.validate_task(end_point,project_id,story_id,description)
    status_code, task_details = self.call_and_return_response_task(end_point,description)
    p status_code
    p task_details

    # Validations
  end
end