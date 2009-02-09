module PostsHelper
  require 'hpricot'
  WhiteListHelper.tags += %w(object param embed)
  WhiteListHelper.tags += %w(table tbody tr th td)
  WhiteListHelper.tags += %w(span)
  WhiteListHelper.attributes.merge %w(id style allowscriptaccess allowfullscreen flashvars name value)
  def cut_text text, full_url
    if(m = /<hr\s[^>]*class\s*=\s*("|')?cut("|')?[^>]*>/i.match(text))
      text = Hpricot(text[0..(m.offset(0)[0] - 1)]).to_html + content_tag("div", link_to("читати далі...", full_url, :class => "info"), :class=>"read-more")
    end
    return text
  end
end
