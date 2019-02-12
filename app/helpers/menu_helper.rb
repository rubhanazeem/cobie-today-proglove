module MenuHelper
  require 'open-uri'

  def get_todays_menu
    begin
      doc = Nokogiri::HTML(open("https://www.cobie.de/speisekarte/"))
      html = doc.css('section.page__content div.vc_row.wpb_row.vc_row-fluid div.foodCarousel div.item')[0].children
      success = true
      error = nil
    rescue => e
      html = nil
      success = false
      error = e
    end
    {html: html, success: success, error: error}
  end
end
