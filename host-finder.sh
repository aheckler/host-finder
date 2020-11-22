#!/bin/zsh
#
# A shell script for finding the company hosting a given domain.
#
# Usage: ./host-finder.sh example.com
#
# Documentation: https://github.com/aheckler/host-finder/

# Grab the domain
DOMAIN=$1;

# Use dig to find A records
DOMAIN_A_RECORDS=$(dig A +short ${DOMAIN});

# We only need one IP address
FIRST_A_RECORD=$(echo ${DOMAIN_A_RECORDS} | cut -d ' ' -f 1);

# Query IPinfo.io for the details
# IPINFO_ACCESS_TOKEN is an evironment variable
IPINFO_QUERY=$(curl --silent "https://ipinfo.io/${FIRST_A_RECORD}/json?token=${IPINFO_ACCESS_TOKEN}");

# Echo the results, using jq for colors
echo $IPINFO_QUERY | jq;
