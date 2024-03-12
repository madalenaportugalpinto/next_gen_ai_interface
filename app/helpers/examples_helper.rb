module ExamplesHelper
  def content_with_fields(example)
    parsed_content = example.content.gsub(/<([[[:alnum:]]_\s]+)>/, "<span class=\"field-tag\" data-checkbox-edit-target=\"field\" data-value=\"\\1\">\\1</span>")

    example.example_fields.each do |field|
      parsed_content.gsub!(/data\-value=\"#{field.key}\"/, "data-value=\"#{field.value}\" data-id=\"#{field.id}\"")
    end

    tag.div parsed_content.html_safe
  end
end
