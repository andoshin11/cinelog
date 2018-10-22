class Conflict < ClientError
  def status_code
    409
  end
end
