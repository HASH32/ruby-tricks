require 'minitest/autorun'
require_relative 'marklist'

describe Marklist do
  before do
    @marklist = Marklist.new
    Aws.config[:s3] = {
      stub_responses: {
        upload_file: { response: true },
        bucket: { bucket: 'mybucket'},
        object: { object: 'myobject'}
      }
    }
  end

  describe "data processing" do
    it "must process data and upload to s3" do
      @marklist.process_data

    end
  end
end
