module ApplicationHelper

  def full_title(page_title)
    base_title = "Cinelog" # 自分のアプリ名を設定する
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
