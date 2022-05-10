#!/bin/bash

#download file excel weather_data
curl -L -O https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

#pindah weather_data ke folder data
mv weather_data.xlsx data

#pindah ke folder data
cd data

#convert tiap sheet file xls ke csv
in2csv -n weather_data.xlsx
in2csv weather_data.xlsx --sheet weather_2014 > weather_2014.csv
in2csv weather_data.xlsx --sheet weather_2016 > weather_2015.csv

#menggabungkan data weather_2014 dan weather_2015 menjadi weather.csv
csvstack weather_2014.csv weather_2015.csv > weather.csv

#delete file weather_data.xlsx
rm weather_data.xlsx

#melakukan sampling pada file weather.csv dengan rate 0,3 lalu disimpan menjadi file sample_weather.csv
export PATH=”${PATH}:/home/adita/.local/bin
cat weather.csv | sample -r 0.3 > sample_weather.csv

