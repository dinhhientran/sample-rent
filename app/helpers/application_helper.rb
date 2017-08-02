module ApplicationHelper
  def google_maps_javascript_include_tag
    javascript_include_tag "//maps.googleapis.com/maps/api/js?v=3.27&libraries=places&key=AIzaSyDcUIPXcqpTPVBHz0E59ATKGysf8Rscw1M&callback=initMap".html_safe, async: true, defer: true
  end
end
