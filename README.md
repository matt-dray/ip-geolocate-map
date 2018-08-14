# Test: interactive map of geolocated IP addresses

## The tool

The tool is available here: https://matt-dray.github.io/ip-geolocate-map/

## Background

This repo contains a test of the [`leaflet`](https://rstudio.github.io/leaflet/) and [`flexdashboard`](https://rmarkdown.rstudio.com/flexdashboard/) packages for presenting an interactive map.

There is a also an interactive table created using [`datatable`](https://rstudio.github.io/DT/). See the [matt-dray/ip-geolocate-map-crosstalkrepo](https://github.com/matt-dray/ip-geolocate-map-crosstalk) for how to introduce inter-widget interactivity using [`crosstalk`](https://rstudio.github.io/crosstalk/).

## Data

The [IP address](https://en.wikipedia.org/wiki/IP_address) data are fake and were generated using the [generator](https://github.com/paulhendricks/generator) package, then geolocated using the [freegeoip](https://github.com/luiscape/freegeoip) package. 'Groups' were assigned arbitrarily and randomly.
