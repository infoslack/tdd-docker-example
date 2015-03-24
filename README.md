Example TDD to Dockerfile
=========================

Run the tests and see them fail:

	$ bundle install
	$ rspec spec/Dockerfile_spec.rb

Build the image and make the test pass:

	$ docker build -t infoslack/docker-nginx .
	$ rspec spec/Dockerfile_spec.rb
