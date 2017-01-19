FROM frolvlad/alpine-glibc
RUN mkdir /app
COPY fixup-checker /app/fixup-checker
CMD ["/app/fixup-checker"]
