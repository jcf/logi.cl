# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def body_attrs
    {:id => controller.controller_name,
     :class => controller.action_name}
  end

  def tab_to(value, url, html_options={})
    element_class = current_page?(url) ? 'active' : 'inactive'
    link_to value, url, :class => element_class
  end
  

  def lorem(link_frequency=0)
    link_frequency = 20 if link_frequency > 20
    lorem_text = "Lorem ipsum dolor sit amet, consectetur adipisicing
    elit, sed do eiusmod tempor incididunt ut labore et dolore magna
    aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
    laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
    dolor in reprehenderit in voluptate velit esse cillum dolore eu
    fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est
    laborum."
    
    return lorem_text if link_frequency == 0
    lorem_text.split(/\b/).map do |word|
      if (0..link_frequency).include?(rand(20)) && word =~ /\w/
        link_to word, '#' + rand(10).to_s
      else
        word
      end
    end
  end

end
