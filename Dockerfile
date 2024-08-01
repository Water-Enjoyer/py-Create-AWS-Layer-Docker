FROM public.ecr.aws/sam/build-python3.12:1.121.0-20240730174605

WORKDIR /var/task

RUN pip install {PACKAGE} -t python/lib/python3.12/site-packages/

RUN zip -r {LAYER_NAME}.zip python
