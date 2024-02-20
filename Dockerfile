# Use openldap base image
FROM osixia/openldap

# Install the necessary package
RUN apt-get update --allow-insecure-repositories
RUN apt-get install -y build-essential

# Define basic settings
ENV LDAP_ORGANISATION="Vio"
ENV LDAP_DOMAIN="viodotcom.com"
ENV LDAP_ADMIN_PASSWORD="sy5-4dm1n"

# Hold all necessary files
RUN mkdir /assignment

# Move working dir
WORKDIR /assignment

# Copy source data
COPY ldap/ .

# Copy and run the Makefile
COPY Makefile .

# Since Makefile is running multiple targets (or ldap operations) which is not possible to run during the image building phase, I'm commenting it out. In assumption that you will run the "make" command manually inside the running container (after it's being built)
# RUN make
