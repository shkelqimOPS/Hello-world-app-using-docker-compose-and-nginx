FROM nginx:alpine

COPY nginx.conf /etc/nginx/

EXPOSE 80

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
