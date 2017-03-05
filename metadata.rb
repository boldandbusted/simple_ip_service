name 'simple_ip_service'
maintainer 'Jesse Adelman'
maintainer_email 'jesse@boldandbusted.com'
license 'gplv3'
description 'Installs/Configures simple_ip_service'
long_description 'Installs/Configures simple_ip_service'
version '0.1.1'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/simple_ip_service/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/simple_ip_service' if respond_to?(:source_url)
#

depends "chef_nginx"
depends "yum"
depends "poise-service"
