class Gone < ClientError
  def status_code
    410
  end
end
