class Forbidden < ClientError
  def status_code
    403
  end
end
