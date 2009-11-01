module TwitterHelper
  def add_href(text)
    a_forward = '<a href="'
    a_backward = '" target="_blank">'
    links = text.scan(/http[s]?\:\/\/[\w\+\$\;\?\.\%\,\!\#\~\*\/\:\@\&\\\=\_\-]+/)
    links.each do |l|
      text = text.sub(l,a_forward + l + a_backward + l + "</a>")
    end
    return text
  end
end
