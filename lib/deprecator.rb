class Deprecator
  def deprecation_warning(method_name, message, caller_backtrace = nil)
    message = [
      '[DEPRECATION WARNING]',
      "`#{method_name}` is deprecated and will be removed.",
      "Use `#{message}` instead.",
    ].join(' ')

    warn "\n#{message}\n\n"
  end
end
