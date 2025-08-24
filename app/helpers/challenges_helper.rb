module ChallengesHelper
  def download_attachment_link(
    attachment,
    link_text: "Download",
    css_class: "text-blue-600 hover:text-blue-800 text-sm font-medium"
  )

    if attachment&.attached?
      link_to link_text,
              url_for(attachment),
              class: css_class,
              download: true
    else
      content_tag(:span, "Não disponível", class: "text-gray-500 text-sm italic")
    end
  end
end