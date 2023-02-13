FROM ubuntu

RUN mkdir worker

ADD ./ProcessResourceLimiter ./worker/Worker

# CMD ["/worker/Worker"]
