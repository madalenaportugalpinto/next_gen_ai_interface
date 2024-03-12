module ExamplesHelper
  def content_with_fields(example:, controller:, only_active: false)
    default_content = only_active ? example.content_with_active_fields_only : example.content

    parsed_content = default_content.gsub(/<([[[:alnum:]]_\s]+)>/, "<span class=\"field-tag\" data-#{controller}-target=\"field\" data-value=\"\\1\">\\1</span>")

    example.example_fields.each do |field|
      parsed_content.gsub!(/data-value="#{field.key}"/, "data-value=\"#{field.value}\" data-id=\"#{field.id}\"")
    end

    tag.div parsed_content.html_safe
  end
end
