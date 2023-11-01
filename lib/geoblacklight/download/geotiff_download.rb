# frozen_string_literal: true

module Geoblacklight
  class GeotiffDownload < Geoblacklight::Download
    GEOTIFF_DOWNLOAD_PARAMS = {
      format: "image/geotiff",
      request: "GetFeature",
      service: "wfs",
      version: "2.0.0",
      width: 4096
    }.freeze

    def initialize(document, options = {})
      request_params = GEOTIFF_DOWNLOAD_PARAMS.merge(typeName: document[Settings.FIELDS.WXS_IDENTIFIER])
      super(document, {
        type: "geotiff",
        extension: "tif",
        request_params: request_params,
        content_type: "image/geotiff",
        service_type: "wms",
        reflect: true
      }.merge(options))
    end
  end
end
