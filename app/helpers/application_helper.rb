module ApplicationHelper
  def equipment_status(equipment)
    if equipment.disposal_status == 0
      if equipment.lendings_status == 0
        content_tag(:span, "貸出可")
      elsif equipment.lendings_status == 1
        content_tag(:span, "貸出中", class: "text-danger")
      end
    elsif equipment.disposal_status == 1
        content_tag(:span, "廃棄済", class: "text-danger")
    end
  end
end
