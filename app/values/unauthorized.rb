class Unauthorized < ClientError
  def status_code
    401
  end
end
