FROM pandoc/latex:latest

WORKDIR /work
COPY letter.tex /opt/template/letter.tex
COPY build.sh /usr/local/bin/build.sh
RUN chmod +x /usr/local/bin/build.sh

ENTRYPOINT ["/usr/local/bin/build.sh"]
CMD ["letter_variable.md", "letter_static.md", "Motivationsschreiben.pdf"]
