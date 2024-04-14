import datetime
import json
from typing import Any, Dict

import requests

# Choose Station ID from: https://opendata.dwd.de/climate_environment/CDC/observations_germany/climate/daily/kl/recent/KL_Tageswerte_Beschreibung_Stationen.txt
STATION_ID = "03379"  # Munich
API_URL = "https://dwd.api.proxy.bund.dev/v30/stationOverviewExtended"


def get_icon(id: int) -> str:
    default = ""
    icons = {
        1: "",
        2: "",
        3: "",
        4: "",
        5: "",
        6: "",
        7: "",
        8: "",
        9: "",
        10: "",
        11: "",
        12: "",
        13: "",
        14: "",
        15: "",
        16: "",
        17: "",
        18: "",
        19: "",
        20: "",
        21: "",
        22: "",
        23: "",
        24: "",
        25: "",
        26: "",
        27: "",
        28: "",
        29: "",
        30: "",
        31: "",
    }
    return icons.get(id, default)


def get_data() -> Dict[str, Any]:
    params = {"stationIds": STATION_ID}
    return requests.get(API_URL, params=params).json().get(STATION_ID)


def to_celsius(temperature: int) -> int:
    return int(temperature / 10)


def get_current_index(start: datetime.datetime, step: datetime.timedelta) -> int:
    now = datetime.datetime.now()
    current = start
    index = 0
    while True:
        if current > now:
            return index
        current += step
        index += 1


if __name__ == "__main__":
    data = get_data()
    forecast = data.get("forecast1")
    start = datetime.datetime.fromtimestamp(forecast.get("start") / 1000)
    step = datetime.timedelta(milliseconds=forecast.get("timeStep"))
    index = get_current_index(start, step)
    temps = forecast.get("temperature")
    temp = to_celsius(temps[index])
    icon = get_icon(forecast.get("icon")[index])

    temp_min = to_celsius(data.get("days")[0]["temperatureMin"])
    temp_max = to_celsius(data.get("days")[0]["temperatureMax"])

    out_data = {
        "text": f"{icon} {temp}°C",
        "tooltip": f"Min: {temp_min}°C, Max: {temp_max}°C",
    }
    print(json.dumps(out_data))
