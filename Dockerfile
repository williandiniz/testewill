FROM bitnami/laravel:8.6.11

EXPOSE 3000 8000

ENTRYPOINT ["/opt/bitnami/scripts/laravel/entrypoint.sh"]

CMD ["/opt/bitnami/scripts/laravel/run.sh"]
