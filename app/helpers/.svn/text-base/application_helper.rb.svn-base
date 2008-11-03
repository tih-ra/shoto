# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper
  def album_cover(album)
    if album.cover?
      album_cover = album.photos.find_or_initialize_by_id(album.cover)
      if !album_cover.filename.nil?
        return album_cover.public_filename(:cover)
      else
          return 'default-150.gif'
      end
    else
      return album.photos.empty? ? 'default-150.gif' : album.photos.first.public_filename(:cover)
    end
  end
  def tih_date(obj_date, style='')
    return "<div class='date_block' style='#{style}'>
			<div class='date_block_day' style='background: url(/images/dates/d#{obj_date.day.to_s}.png);'>&nbsp;</div>
			<div class='date_block_month' style='background: url(/images/dates/m#{obj_date.month.to_s}.png);'>&nbsp;</div>
			<div class='date_block_year' style='background: url(/images/dates/y#{obj_date.year.to_s}.png);'>&nbsp;</div>
		</div>"
  end
  def collection_select_multiple(object, method,
                                   collection, value_method, text_method,
                                   options = {}, html_options = {})
      real_method = "#{method.to_s.singularize}_ids".to_sym
      collection_select(
        object, real_method,
        collection, value_method, text_method,
        options,
        html_options.merge({
          :multiple => true,
          :name => "#{object}[#{real_method}][]"
        })
      )
    end
  def collection_select_multiple_posts(object, method,
                                              options = {}, html_options = {})
      collection_select_multiple(
        object, method,
        Post.find(:all), :id, :title,
        options, html_options
      )
    end
end
