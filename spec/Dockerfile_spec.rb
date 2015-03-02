require "docker"

describe "Dockerfile" do
  before(:all) {
    @image = Docker::Image.build_from_dir('.')
  }

  it "Image should exist" do
    expect(@image).to_not be_nil
  end

  it "Should expose the default tcp port" do
    expect(@image.json["Config"]["ExposedPorts"]).to include("80/tcp")
  end
end

describe "Running a container" do
  
  it "Should accept connections" do
    id = `docker run -d -p 8080:80 infoslack/docker-nginx`.chomp
    @container = Docker::Container.get(id)
    
    response = `curl -IL 127.0.0.1:8080`
    expect(response).to include("HTTP/1.1 200 OK")

    @container.kill
  end
end
