class VisionService
  def scan
    require "google/cloud/vision"
    image_annotator = Google::Cloud::Vision.image_annotator
    file_path = "http://www.eatingoutintokyo.com/Lunch/wp-content/uploads/2009/10/japanese-restaurants-in-tokyo-unatoto-the-bill.jpg" #Placeholder image
    lines = []
    response = image_annotator.document_text_detection(image: file_path)
    response.responses.each do |res|
      res.text_annotations.each do |text|
        lines << text.description
      end
    end
    lines
  end
end