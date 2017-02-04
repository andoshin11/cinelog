class SlackNotifier
  WEBHOOK_URL = 'https://hooks.slack.com/services/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'.freeze

  def initialize(options = {})
    @options = options
  end

  def send(message)
    raise TypeError, "Slack::Message::Base expected, got #{message.class}" unless message.is_a? Slack::Message::AbstractMessage

    return if Rails.env.test?

    Thread.new do
      Slack::Notifier.new(WEBHOOK_URL, username: 'Hostly', icon_emoji: ':hostly:').ping(message.to_h.merge(options))
    end
  end

  private

  attr_reader :options
end
