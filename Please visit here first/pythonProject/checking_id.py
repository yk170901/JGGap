# -*- coding: utf-8 -*-
import requests, json, sys

def checking_id(name):
    api_key = "RGAPI-f2e8aba1-e75d-47c8-8829-e097207ecd61"

    URL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + name
    res = requests.get(URL, headers={"X-Riot-Token": api_key})
    if res.status_code == 200:
        resobj = json.loads(res.text)
        print("success")

    else:
        # 코드가 200이 아닐때(즉 찾는 닉네임이 없을때)
        print("failed")

if __name__ == "__main__":
    checking_id(sys.argv[1])
