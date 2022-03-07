FROM bitnami/laravel:8.6.11

ENTRYPOINT ["/opt/bitnami/scripts/laravel/entrypoint.sh"]

CMD ["/opt/bitnami/scripts/laravel/run.sh"]
