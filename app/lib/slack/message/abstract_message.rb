class Slack::Message::AbstractMessage
  def attachment_author
    nil
  end

  def attachment_color
    nil
  end

  def attachment_fallback
    nil
  end

  def attachment_fields
    []
  end

  def attachment_image_url
    nil
  end

  def attachment_pretext
    nil
  end

  def attachment_title
    nil
  end

  def attachment_title_link
    nil
  end

  def attachment_text
    nil
  end

  def attachment_thumb_url
    nil
  end

  def channel
    nil
  end

  def icon_emoji
    nil
  end

  def to_h
    {
      attachments: [attachment],
      channel: channel,
      icon_emoji: icon_emoji,
      username: username,
      text: text
    }.compact
  end

  def text
    nil
  end

  def username
    nil
  end

  private

  def attachment
    {
      author_icon: attachment_author&.icon,
      author_link: attachment_author&.link&.to_s,
      author_name: attachment_author&.name,
      color: attachment_color,
      fallback: attachment_fallback,
      fields: attachment_fields.map(&:to_h),
      image_url: attachment_image_url&.to_s,
      pretext: attachment_pretext,
      text: attachment_text,
      title: attachment_title,
      title_link: attachment_title_link&.to_s,
      thumb_url: attachment_thumb_url&.to_s
    }.compact
  end
end
