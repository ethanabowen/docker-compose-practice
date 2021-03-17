# download image from docker hub
FROM python:3.8

# directory in docker container to start at
WORKDIR /code 

# env vars for flash
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# install gcc and other dependencies
#RUN apk add --no-cache gcc musl-dev linux-headers

# move and install python requirements
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Port to listen on
EXPOSE 5000

# copy the working directory in the project
# to the work directory in the image
COPY . .

# flask execution
CMD ["flask", "run"]