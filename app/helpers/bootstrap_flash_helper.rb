module BootstrapFlashHelper
  ALERT_TYPES = [:error,  :info,  :success,  :warning]

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      type = type.to_sym
      type = type == :notice ? :success : :danger

      next if message.blank?
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div, content_tag(:button, raw("&times;"), class: "close", "data-dismiss" => "alert") +
          msg, class: "alert fade in alert-#{type} #{options[:class]}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
