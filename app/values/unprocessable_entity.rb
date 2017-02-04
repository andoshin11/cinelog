class UnprocessableEntity < ClientError
  def status_code
    422
  end
end
