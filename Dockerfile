# Alpine based image
FROM node:20-alpine
WORKDIR /usr/src/app
RUN apk update
RUN apk add wget perl
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -xzf install-tl-unx.tar.gz
RUN cd install-tl-* && echo "selected_scheme scheme-basic" > profile && ./install-tl -profile profile
RUN rm -rf install-tl-*
ENV PATH="/usr/local/texlive/2023/bin/x86_64-linuxmusl:${PATH}"
RUN tlmgr install parskip pgf chessboard etoolbox ifmtarg xifthen skaknew lambda-lists xkeyval chessfss skak xskak

# Debian based image
#FROM node:20-slim
#WORKDIR /usr/src/app
#RUN apt-get update && apt-get install -y wget perl
#RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
#RUN tar -xzf install-tl-unx.tar.gz
#RUN cd install-tl-* && echo "selected_scheme scheme-basic" > profile && ./install-tl -profile profile
#RUN rm -rf install-tl-*
#ENV PATH="/usr/local/texlive/2023/bin/x86_64-linux:${PATH}"
#RUN tlmgr install parskip pgf chessboard etoolbox ifmtarg xifthen skaknew lambda-lists xkeyval chessfss skak xskak
