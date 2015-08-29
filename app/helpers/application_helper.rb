module ApplicationHelper
  
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end
  
  def flash_messages flash
    html = ""
    flash.each do |type, message|
      html += "<div class='alert #{bootstrap_class_for(type.to_sym)} fade in'>"
      html += "<button class='close' data-dismiss='alert'>×</button>"
      html += message
      html += "</div>"
    end
    html
  end
end
