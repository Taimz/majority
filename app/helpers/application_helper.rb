module ApplicationHelper

  def json_response (message, data, error, token=nil)
    response = {
        message: message,
        data: data,
        error: error
    }
    response[:token] = token if token.present?  # TODO: generalize extra variables in the response structure
    response
  end

end
