require "docker"

describe "Dockerfile" do
  before(:all) {
    @image = Docker::Image.build_from_dir('.')
  }

  it "image should exist" do
    expect(@image).to_not be_nil
  end

  it "should expose the default tcp port" do
    expect(@image.json["Config"]["ExposedPorts"]).to include("80/tcp")
  end
end
