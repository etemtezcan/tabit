defmodule IndealsWeb.Helpers.Twbs4FormHelper do
  import Phoenix.HTML.Tag
  import Phoenix.HTML.Form

  def twbs4_error_tag(form, field) do
    if error = form.errors[field] do
      {message, _} = error
      IO.inspect message
      content_tag :div, humanize(field) <> " " <> message, class: "invalid-feedback"
    end
  end
  
  def twbs4_text_input_tag(form, field, opts \\ []) do
    class_name = "form-control " <> Keyword.get(opts, :class, "")
    if form.errors[field] do
      custom_opts = Keyword.put(opts, :class, class_name <> " is-invalid")
      text_input form, field, custom_opts
    else
      custom_opts = Keyword.put(opts, :class, class_name)
      text_input form, field, custom_opts
    end
  end

  def twbs4_textarea_tag(form, field, opts \\ []) do
    class_name = "form-control " <> Keyword.get(opts, :class, "")
    if form.errors[field] do
      custom_opts = Keyword.put(opts, :class, class_name <> " is-invalid")
      textarea form, field, custom_opts
    else
      custom_opts = Keyword.put(opts, :class, class_name)
      textarea form, field, custom_opts
    end
  end

  def twbs4_select_tag(form, field, options, opts \\ []) do
    class_name = "form-control " <> Keyword.get(opts, :class, "")
    if form.errors[field] do
      custom_opts = Keyword.put(opts, :class, class_name <> " is-invalid")
      select form, field, options, custom_opts
    else
      custom_opts = Keyword.put(opts, :class, class_name)
      select form, field, options, custom_opts
    end
  end

end