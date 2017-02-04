class BadRequest < ClientError
  def status_code
    400
  end
end
