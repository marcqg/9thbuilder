module ArmyListsHelper
  def alternate_cell_class(i)
    if i == 0 || i % 3 == 0
      'prefix_1'
    elsif (i + 1) % 3 == 0
      'suffix_1'
    else
      'prefix_1 suffix_1'
    end
  end
end
