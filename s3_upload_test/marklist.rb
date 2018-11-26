require_relative 's3_file.rb'
require 'yaml'

class Marklist
  def initialize
    setup_environment
  end

  def process_data
    puts "Processing data..."
    upload
  end

  def upload
    file = create_and_return_file
    s3file = S3File.new('tmp/marklist.txt')
    puts "Uploading file..."
    s3file.upload(file)
  end

  private

  def create_and_return_file
    file = Tempfile.new('marklist_tmp')
    file.write("hello world marklist")
    file
  end

  def setup_environment
    env_file = File.join('local_env.yml')
    YAML.load(File.open(env_file)).each do |key, value|
      ENV[key.to_s] = value
    end if File.exists?(env_file)
  end
end

ml = Marklist.new
ml.upload
