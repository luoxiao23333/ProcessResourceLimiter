FROM ubuntu

RUN mkdir worker

ADD ./ProcessResourceLimiter ./worker/Worker
ADD ./test.py ./test.py

CMD ["/worker/Worker"]
