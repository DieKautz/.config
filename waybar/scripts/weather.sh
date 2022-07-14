#!/bin/bash
source $HOME/.profile

# Put Location into env virable 'LOC'
# HTML encode string as %20
LOCATION=$(sed -e "s/ /%20/g" <<<"$LOC")
content=$(curl -sS "https://thisdavej.azurewebsites.net/api/weather/current?loc=$LOCATION&deg=C")

TEMP=$(echo $content | jq -r '. | "\(.temperature)°\(.degType)"' | sed 's/"//g')
TOOLTIP=$(echo $content | jq -r '. | "\(.skytext) \(.temperature)°\(.degType)\n"' | sed 's/"//g')
CLASS=$(echo $content | jq .skytext)
echo '{"text": "'$LOC' '$TEMP'", "alt": '$CLASS', "class": '$CLASS', "tooltip": "'$TOOLTIP'"}'


