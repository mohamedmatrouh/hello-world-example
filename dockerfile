FROM ubuntu:18.04

# Run the Update
RUN apt-get update && apt-get upgrade -y

# Install s3cmd
RUN apt-get install -y s3cmd


#=========POSTGRES========#
RUN apt-get install -y gnupg2
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic"-pgdg main | tee  /etc/apt/sources.list.d/pgdg.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8
RUN apt update
RUN apt -y install postgresql-13