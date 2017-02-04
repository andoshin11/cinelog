class Slack::Message::InternalServerError < Slack::Message::AbstractMessage
  def initialize(exception:, env:, user:)
    @exception, @env, @user = exception, env, user
  end

  def attachment_color
    :danger
  end

  def attachment_fallback
    'Internal Server Error'
  end

  def attachment_fields
    [
      {
        title: 'method',
        value: env['REQUEST_METHOD'],
        short: true,
      },
      {
        title: 'path',
        value: env['REQUEST_PATH'],
        short: true,
      },
      {
        title: 'parameters',
        value: env['action_dispatch.request.parameters'].to_s,
        short: false,
      },
      {
        title: 'referer',
        value: env['HTTP_REFERER'] || '(empty)',
        short: true,
      },
      {
        title: 'user agent',
        value: env['HTTP_USER_AGENT'],
        short: true,
      },
      {
        title: 'ip',
        value: env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR'],
        short: true,
      },
      {
        title: 'user id',
        value: user&.id || '(empty)',
        short: true,
      },
      {
        title: 'exception backtrace',
        value: exception.backtrace.join("\n"),
        short: false,
      },
    ].compact
  end

  def attachment_pretext
    "#{exception.class}: #{exception.message}"
  end

  def attachment_title
    exception.to_s
  end

  private

  attr_reader :exception, :env, :user
end
