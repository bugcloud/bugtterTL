module TwitterHelper
  def add_href(text)
    a_forward = '<a href="'
    a_backward = '" target="_blank">'
    links = text.scan(/http[s]?\:\/\/[\w\+\$\;\?\.\%\,\!\#\~\*\/\:\@\&\\\=\_\-]+/)
    usernames = text.scan(/@[a-zA-Z0-9_]+/).uniq
    links.each do |l|
      text = text.sub(l,a_forward + l + a_backward + l + "</a>")
    end
    usernames.each do |u|
      text = text.gsub(u,a_forward + "http://twitter.com/" + u.sub("@","") + a_backward + u + "</a>")
    end
    return text
  end
end
