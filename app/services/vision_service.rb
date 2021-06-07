class VisionService
  def scan
    require "google/cloud/vision"
    image_annotator = Google::Cloud::Vision.image_annotator
    # WORKS FOR BOTH TOTAL AND STORE NAME
    # file_path = "https://live.staticflickr.com/5063/5569368001_2d78ce99b6_b.jpg" #Placeholder image

    # WORKS FOR STORE NAME
    # file_path = "http://mediaassets.thedenverchannel.com/photo/2015/11/06/7-11MassReceipt_1446816119821_26360098_ver1.0_640_480.jpg"

    # WORKS FOR STORE NAME
    file_path = 'https://expensefast.com/wp-content/uploads/2020/05/costco-wholesale-receipt-template-301x1024.jpg'
    lines = []
    response = image_annotator.document_text_detection(image: file_path)
    response.responses.each do |res|
      # p res
      res.text_annotations.each do |text|
        lines << text.description
      end
    end

    # Finds the storename
    regex_store = /\S[^ ]([\d]*-?[a-zA-Z]*)/
    if regex_store.match(lines[0])
      p regex_store.match(lines[0])
      store = regex_store.match(lines[0])[0]
    end

    # Finds the total or all the prices !(CHANGE FLOATS AND ROUND AFTER INSTALLING THE MONEY GEM)!
    regex_total = /([^SUB]TOTAL)/
    regex_total_with_numbers = /([^SUB]TOTAL (\d*.\d{2}))/

    # Finds the total if there is one
    if regex_total_with_numbers.match(lines[0])
      total = regex_total_with_numbers.match(lines[0])[-1].to_f.round

    # If there's no 'total' then it finds all the prices
    elsif regex_total.match(lines[0])
      regex_all_prices = /(\d+\.\d{2})/
      prices = lines[0].scan(regex_all_prices).map do |price|
        price[0].to_f
      end
      # Gives an ordered list of the 5 highest prices on the receipt
      prices = prices.sort.reverse[0..4]
    end

    # Find a smart way to return the total / prices / store
  end
end
