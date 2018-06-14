class String
  def to_highlight
    text = self
    if text.nil? or text.empty?
      return text
    end

    text = RuBB.to_html(text)

    unless text.nil?
      text = text.gsub(/(?:\n\r?|\r\n?)/, '<br/>')
                 .html_safe
    end

    text
  end
end