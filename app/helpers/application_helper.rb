module ApplicationHelper
  def value_points(vp)
    number_with_precision vp, strip_insignificant_zeros: true, delimiter: ' ', separator: ','
  end

  def transliterate(str)
    ActiveSupport::Inflector.transliterate(str)
  end
end
