# Manages the php-fpm main ini file
{% from 'php/ng/map.jinja' import php with context %}
{% from "php/ng/ini.jinja" import php_ini %}

{% set ini_settings = php.ini.defaults %}
{% do ini_settings.update(php.fpm.config.ini.settings) %}

{%- if php.fpm.config.conf.settings.length() > 0 -%}
  {%- conf_settings = php.fpm.config.conf.settings -%}
{%- else -%}
  {%- conf_settings = php.lookup.fpm.defaults -%}
{%- endif -%}

php_fpm_ini_config:
  {{ php_ini(php.lookup.fpm.ini, php.fpm.config.ini.opts, ini_settings) }}

php_fpm_conf_config:
  {{ php_ini(php.lookup.fpm.conf, php.fpm.config.conf.opts, conf_settings) }}
