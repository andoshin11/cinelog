class NotFound < ClientError
  def status_code
    404
  end
end
