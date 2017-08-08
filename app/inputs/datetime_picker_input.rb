class DatetimePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    str = <<~HEREDOC
    <div class='input-group date' id='datetime_picker_input_#{attribute_name}'>
          #{@builder.text_field(attribute_name, merged_input_options)}
          <span class="input-group-addon">
              <span class="glyphicon glyphicon-calendar"></span>
          </span>
    </div>
    HEREDOC
end
end
