class ClientError < StandardError
  def default_message
    nil
  end

  def message
    super == self.class.name ? default_message : super
  end

  def reason_phrase
    self.class.name.demodulize.gsub(/[A-Z]/) { |x| " #{x[0]}" }.strip
  end
end
