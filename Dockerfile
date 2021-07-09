#=================================================================================
#
# Create a docker image that can be used in combination with the
# Nird Toolkit application : jupyterhub
#
#=================================================================================
# Create a docker image based on a uninett base image
# See the value of dockerImage in
#
#   https://github.com/Uninett/helm-charts/blob/master/repos/stable/jupyterhub/values.yaml
#   https://quay.io/repository/uninett/jupyterhub-singleuser?tab=tags
#   
# to determine the latest base image
#=================================================================================

FROM quay.io/uninett/jupyter-spark:20210514-6405497

LABEL authors="Tomas Torsvik"
LABEL maintainer="tomas.torsvik@uib.no"

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

#=================================================================================
# Install user environment
#=================================================================================

USER notebook

# update the conda packages
#RUN conda update -y conda pip

# install latest iris version
RUN conda env update -n base --file environment.yml
