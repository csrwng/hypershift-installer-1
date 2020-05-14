FROM registry.svc.ci.openshift.org/openshift/release:golang-1.13 AS builder

WORKDIR /go/src/github.com/openshift-hive/hypershift-installer
COPY . .
RUN make

FROM registry.svc.ci.openshift.org/origin/4.1:base
COPY --from=builder /go/src/github.com/openshift-hive/hypershift-installer/bin/hypershift-installer /bin/hypershift-installer
RUN mkdir /output && chown 1000:1000 /output
USER 1000:1000
ENV PATH /bin
ENV HOME /output
WORKDIR /output
ENTRYPOINT ["/bin/hypershift-installer"]