# frozen_string_literal: true

module Geoblacklight
  class ShapefileDownload < Geoblacklight::Download
    SHAPEFILE_DOWNLOAD_PARAMS = {
      outputformat: "SHAPE-ZIP",
      request: "GetFeature",
      service: "wfs",
      srsName: "EPSG:4326",
      version: "2.0.0"
    }.freeze

    def initialize(document, options = {})
      request_params = SHAPEFILE_DOWNLOAD_PARAMS.merge(typeName: document[Settings.FIELDS.WXS_IDENTIFIER])
      super(document, {
        type: "shapefile",
        extension: "zip",
        request_params: request_params,
        content_type: "application/zip",
        service_type: "wfs"
      }.merge(options))
    end
  end
end
