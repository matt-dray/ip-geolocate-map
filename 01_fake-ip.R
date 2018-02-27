# Can geodata be matched to IP addresses?
# Matt Dray
# Feb 2018

# Approach: generate some fake IPs, get their ltlongs and map them
# See here for freegeoip package:
# <https://heuristically.wordpress.com/2013/05/20/geolocate-ip-addresses-in-r/>
# <https://github.com/luiscape/freegeoip>


# Packages ----------------------------------------------------------------


library(generator)  # for generating fake IP addreses
# CERAN version not available for R v3.4.2, so download from GitHub instead
# library(devtools)  
# install_github("freegeoip", "luiscape")
#library(freegeoip)  # API for matching IP addresses to geolocation



# Generate fake IP addresses ----------------------------------------------


# freegeoip function found online

freegeoip <- function(ip, format = ifelse(length(ip)==1,'list','dataframe'))
{
  if (1 == length(ip))
  {
    # a single IP address
    require(rjson)
    url <- paste(c("http://freegeoip.net/json/", ip), collapse='')
    ret <- fromJSON(readLines(url, warn=FALSE))
    if (format == 'dataframe')
      ret <- data.frame(t(unlist(ret)))
    return(ret)
  } else {
    ret <- data.frame()
    for (i in 1:length(ip))
    {
      r <- freegeoip(ip[i], format="dataframe")
      ret <- rbind(ret, r)
    }
    return(ret)
  }
}

# generate fake ip addresses

set.seed(seed = 1337)  # for reproducibility
fake_ip <- generator::r_ipv4_addresses(500) # must be df form


# Geolocate the IPs -------------------------------------------------------

fake_ip_geo <- freegeoip(fake_ip)

#readr::write_rds(fake_ip_geo, "data/fake_ip_geo.RDS")
