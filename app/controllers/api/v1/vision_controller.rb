class Api::V1::VisionController < Api::V1::BaseController
  def scan
    skip_authorization
    render json: VisionService.new.scan(params[:photo].tempfile.path)
  end
end
