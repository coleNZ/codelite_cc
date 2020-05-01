FROM nztech/codelite_cc:base_14.0
LABEL maintainer="cole@nztech.ca"

#copy over the two folders
COPY raspi-sysroot /home/nztech/raspi

CMD ["/usr/bin/codelite"]
