class VisionService
  def scan
    require "google/cloud/vision"
    image_annotator = Google::Cloud::Vision.image_annotator
    file_path = "https://res.cloudinary.com/dig7hpfiq/image/upload/v1622615546/OCR-TEST_f9okfo.jpg" #Placeholder image
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
