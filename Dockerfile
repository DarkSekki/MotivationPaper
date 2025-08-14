# Minimal image with Pandoc and full LaTeX stack
FROM pandoc/latex:latest

# Work directory for mounted project
WORKDIR /work

# Copy template and build script into the image
COPY letter.tex /opt/template/letter.tex
COPY docker_build.sh /usr/local/bin/docker_build.sh

RUN chmod +x /usr/local/bin/docker_build.sh

# Default command allows passing INPUT and OUTPUT
ENTRYPOINT ["/usr/local/bin/docker_build.sh"]
CMD ["letter.md","Motivationsschreiben.pdf"]
