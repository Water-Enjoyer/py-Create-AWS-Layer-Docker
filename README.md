# py-Create-AWS-Layer-Docker
Simple Docker workflow for creating AWS layers for Python dependencies

Before running, make sure you have the latest SAM build from AWS. Update the first line in the Dockerfile if needed.
https://gallery.ecr.aws/sam/build-python3.12

***

- Change `{PACKAGE}` and `{LAYER_NAME}.zip` to values needed, we'll use LXML in this example.
  ```
  RUN pip install lxml -t python/lib/python3.12/site-packages/
  RUN zip -r lxml_layer.zip python
  ```
   
- Build the Docker image
  ```
  docker build -t lxml-layer .
  ```

- Run the Docker image
  ```
  docker run --name lxml_layer_container lxml-layer
  ```

- Copy the file out, upload to AWS Layer.
  ```
  docker cp lxml_layer_container:/var/task/lxml_layer.zip ./lxml_layer.zip
  ```
