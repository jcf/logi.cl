module MessagesHelper
  def h_blank(object, blank='&nbsp;')
    h(object.blank? ? blank : object)
  end
end
