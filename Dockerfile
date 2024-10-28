FROM centos:latest

# Install httpd, zip, and unzip
RUN yum install -y httpd zip unzip && \
    yum clean all

# Add the zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set the working directory
WORKDIR /var/www/html/

# Unzip the file and clean up
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Start httpd in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
