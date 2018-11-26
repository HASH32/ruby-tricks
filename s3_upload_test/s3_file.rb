# encoding: utf-8
require 'aws-sdk'

class S3File
  DEFAULT_REGION = 'us-east-1'.freeze

  def initialize(remote_file_name)
    @remote_file_name = remote_file_name
    configure
  end

  def upload(local_file)
    s3 = Aws::S3::Resource.new(region: DEFAULT_REGION)
    puts "s3 #{s3.inspect}"
    s3_bucket = s3.bucket(bucket_name)
    puts "s3_bucket #{s3_bucket.inspect}"
    obj = s3_bucket.object(@remote_file_name)
    obj.upload_file(local_file)
    puts "obj #{obj.inspect}"
  end

  private

  def bucket_name
    "data.awin"
  end

  def configure
    puts 'Configuring AWS...'
    Aws.config.update(
      region: DEFAULT_REGION,
      credentials: Aws::Credentials.new(ENV['S3_KEY'], ENV['S3_SECRET']),
      # host_name: 'data.awin.s3-website-us-east-1.amazonaws.com'
    )
  end
end
