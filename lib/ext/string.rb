class String
  def to_highlight
    text = self.bb_to_html
        .gsub(/(?:\n\r?|\r\n?)/, '<br/>')
        .html_safe
    text
  end
end