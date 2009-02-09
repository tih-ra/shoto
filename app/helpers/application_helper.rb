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
=begin
  def tih_date(obj_date, style='')
    return "<div class='date_block' style='#{style}'>
			<div class='date_block_day' style='background: url(/images/dates/d#{obj_date.day.to_s}.png);'>&nbsp;</div>
			<div class='date_block_month' style='background: url(/images/dates/m#{obj_date.month.to_s}.png);'>&nbsp;</div>
			<div class='date_block_year' style='background: url(/images/dates/y#{obj_date.year.to_s}.png);'>&nbsp;</div>
		</div>"
  end
=end
  def comments_area(parent, &block)
    if (parent.comment_status==2 || (logged_in? && parent.comment_status==1))
      concat content_tag(:div, capture(&block))
    end
  end
  
  def admin_content(tag_name='div', css='', &block)
    if logged_in? && current_user.admin?
      concat content_tag(tag_name, capture(&block), :class=>css)
    end
  end
  
  def moderator_content(tag_name='div', css='', &block)
    if logged_in? && current_user.moderator?
      concat content_tag(tag_name, capture(&block), :class=>css)
    end
  end
  
  def producer_content(tag_name='div', css='', &block)
    if logged_in? && current_user.producer?
      concat content_tag(tag_name, capture(&block), :class=>css)
    end
  end
  
  def my_or_producer_content(parent, tag_name='div', css='', &block)
    if logged_in? && (current_user.producer? || parent.user_id==current_user.id)
      concat content_tag(tag_name, capture(&block), :class=>css)
    end
  end
  
  
  def editor_content(tag_name='div', css='', &block)
    if logged_in? && current_user.editor?
      concat content_tag(tag_name, capture(&block), :class=>css)
    end
  end
  
  def avatar(user)
    image_tag((user.avatar.nil? ? '/images/default_avatar.gif' : user.avatar.public_filename), :class=>"avatar")
  end
  def avatar_from_nested(parent)
     
    content_tag(:div, :class=>"avatar_from_nested") do
      c1 = content_tag(:div, :class=>"face") do
        avatar(User.find(parent.user_id))
      end
      c1 += content_tag(:div, :class=>"info") do
        c2 = content_tag(:span, "#{parent.user.firstname} #{parent.user.lastname}", :class=>"username")
        c2 += concat tih_date(parent.created_at, '', 1)
        c2
      end
      c1
    end
  end
  
  def public_from_nested(parent)
    content_tag(:div, :class=>"avatar_from_nested") do
       c1 = content_tag(:div, :class=>"face") do
          image_tag("/images/public_avatar.jpg", :class=>"avatar")
        end
      c1 += content_tag(:div, :class=>"info") do
        c2 = content_tag(:span, "#{parent.title}", :class=>"username")
        c2 += concat tih_date(parent.created_at, '', 1)
        c2
      end
      c1
    end
  end
  
  def tih_date(obj_date, style='', time=nil)
    content_tag(:div, :class=>"date_block", :style=>style) do
        #c1 = content_tag :span, 'achtung'
        c1 = content_tag :div, obj_date.to_s(:day), :class=>"date_block_day"
        c1 += time.nil? ? '' : content_tag(:div, obj_date.to_s(:time), :class=>"date_block_time")
        c1 += content_tag :div, obj_date.to_s(:month)+"/"+obj_date.to_s(:year), :class=>"date_block_month_year"
        c1
      end
  end
  def admin_buttons(edit_path, delete_path)
    content_tag(:div, :class=>"admin_buttons") do
      c1 = link_to(image_tag("icons/edit.gif"), edit_path)
      c1 += link_to(image_tag("icons/delete.gif"), delete_path, :method=>:delete, :confirm => "Видалити?")
      c1
    end
  end
  def admin_delete_button(delete_path)
    content_tag(:div, :class=>"admin_buttons") do
      link_to(image_tag("icons/delete.gif"), delete_path, :method=>:delete, :confirm => "Видалити?")
    end
  end
  def admin_remote_delete_button(delete_path)
    content_tag(:div, :class=>"admin_buttons") do
      link_to_remote(image_tag("icons/delete.gif"), :url=>delete_path, :method=>:delete, :confirm => "Видалити?")
    end
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
