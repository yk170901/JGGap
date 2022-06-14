# -*- coding: utf-8 -*-
import requests, json, sys
import jpype
import jaydebeapi as jp

def lol_record(name, game_id):
    api_key = "RGAPI-f2e8aba1-e75d-47c8-8829-e097207ecd61"
    champion_KR = {"Aatrox": "아트록스", "Ahri": "아리", "Akali": "아칼리", "Akshan": "아크샨", "Alistar": "알리스타", "Amumu": "아무무"
                   , "Anivia": "애니비아", "Annie": "애니", "Aphelios": "아펠리오스", "Ashe": "애쉬", "AurelionSol": "아우렐리온 솔"
                   , "Azir": "아지르", "Bard": "바드", "Blitzcrank": "블리츠크랭크", "Brand": "브랜드", "Braum": "브라움", "Caitlyn": "케이틀린"
                   , "Camille": "카밀", "Cassiopeia": "카시오페아", "Chogath": "초가스", "Corki": "코르키", "Darius": "다리우스"
                   , "Diana": "다이애나", "Draven": "드레이븐", "DrMundo": "문도 박사", "Ekko": "에코", "Elise": "엘리스", "Evelynn": "이블린"
                   , "Ezreal": "이즈리얼", "FiddleSticks": "피들스틱", "Fiora": "피오라", "Fizz": "피즈", "Galio": "갈리오", "Gangplank": "갱플랭크"
                   , "Garen": "가렌", "Gnar": "나르", "Gragas": "그라가스", "Graves": "그레이브즈", "Gwen": "그웬", "Hecarim": "헤카림"
                   , "Heimerdinger": "하이머딩거", "Illaoi": "일라오이", "Irelia": "이렐리아", "Ivern": "아이번", "Janna": "잔나"
                   , "JarvanIV": "자르반 4세", "Jax": "잭스", "Jayce": "제이스", "Jhin": "진", "Jinx": "징크스", "Kaisa": "카이사"
                   , "Kalista": "칼리스타", "Karma": "카르마", "Karthus": "카서스", "Kassadin": "카사딘", "Katarina": "카타리나"
                   , "Kayle": "케일", "Kayn": "케인", "Kennen": "케넨", "Khazix": "카직스", "Kindred": "킨드레드", "Kled": "클레드"
                   , "KogMaw": "코그모", "Leblanc": "르블랑", "LeeSin": "리 신", "Leona": "레오나", "Lillia": "릴리아", "Lissandra": "리산드라"
                   , "Lucian": "루시안", "Lulu": "룰루", "Lux": "럭스", "Malphite": "말파이트", "Malzahar": "말자하", "Maokai": "마오카이"
                   , "MasterYi": "마스터 이", "MissFortune": "미스 포츈", "MonkeyKing": "오공", "Mordekaiser": "모데카이저"
                   , "Morgana": "모르가나", "Nami": "나미", "Nasus": "나서스", "Nautilus": "노틸러스", "Neeko": "니코"
                   , "Nidalee": "니달리", "Nocturne": "녹턴", "Nunu": "누누와 윌럼프", "Olaf": "올라프", "Orianna": "오리아나"
                   , "Ornn": "오른", "Pantheon": "판테온", "Poppy": "뽀삐", "Pyke": "파이크", "Qiyana": "키아나", "Quinn": "퀸"
                   , "Rakan": "라칸", "Rammus": "람머스", "RekSai": "렉사이", "Rell": "렐", "Renata": "레나타 글라스크"
                   , "Renekton": "레넥톤", "Rengar": "렝가", "Riven": "리븐", "Rumble": "럼블", "Ryze": "라이즈", "Samira": "사미라"
                   , "Sejuani": "세주아니", "Senna": "세나", "Seraphine": "세라핀", "Sett": "세트", "Shaco": "샤코", "Shen": "쉔"
                   , "Shyvana": "쉬바나", "Singed": "신지드", "Sion": "사이온", "Sivir": "시비르", "Skarner": "스카너", "Sona": "소나"
                   , "Soraka": "소라카", "Swain": "스웨인", "Sylas": "사일러스", "Syndra": "신드라", "TahmKench": "탐켄치", "Taliyah": "탈리야"
                   , "Talon": "탈론", "Taric": "타릭", "Teemo": "티모", "Thresh": "쓰레쉬", "Tristana": "트리스타나", "Trundle": "트런들"
                   , "Tryndamere": "트린다미어", "TwistedFate": "트위스티드 페이트", "Twitch": "트위치", "Udyr": "우디르", "Urgot": "우르곳"
                   , "Varus": "바루스", "Vayne": "베인", "Veigar": "베이가", "Velkoz": "벨코즈", "Vex": "벡스", "Vi": "바이"
                   , "Viego": "비에고", "Viktor": "빅토르", "Vladimir": "블라디미르", "Volibear": "볼리베어", "Warwick": "워윅"
                   , "Xayah": "자야", "Xerath": "제라스", "XinZhao": "신 짜오", "Yasuo": "야스오", "Yone": "요네", "Yorick": "요릭"
                   , "Yuumi": "유미", "Zac": "자크", "Zed": "제드", "Zeri": "제리", "Ziggs": "직스", "Zilean": "질리언", "Zoe": "조이"
                   , "Zyra": "자이라"}
    spell = {1: "SummonerBoost", 3: "SummonerExhaust", 4:"SummonerFlash", 6: "SummonerHaste", 7: "SummonerHeal", 11: "SummonerSmite"
        , 12: "SummonerTeleport", 13: "SummonerMana", 14: "SummonerDot", 21: "SummonerBarrier", 32: "SummonerSnowball"}

    URL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"+name
    res = requests.get(URL, headers={"X-Riot-Token": api_key})
    if res.status_code == 200:
        resobj = json.loads(res.text)
        puuid = resobj["puuid"]
        URL = "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/" + puuid + "/ids?start=0&count=30"
        res = requests.get(URL, headers={"X-Riot-Token": api_key})
        matchinfo = json.loads(res.text)
        featured_matches = []
        for match in matchinfo:
            if match == game_id:
                break;
            featured_matches.append(match)
        if res.status_code == 200:
            for index, info in enumerate(featured_matches):
                detail = {}
                participant = {}
                URL = "https://asia.api.riotgames.com/lol/match/v5/matches/" + info
                res = requests.get(URL, headers={"X-Riot-Token": api_key})
                matches = json.loads(res.text)
                if matches["info"]["gameType"] == "MATCHED_GAME" and matches["info"]["gameMode"] == "ARAM" or matches["info"]["gameMode"] == "CLASSIC":
                    if matches["info"]["gameDuration"] > 3600:
                        detail["game_duration"] = str(matches["info"]["gameDuration"] // 3600) + ":" + str((matches["info"]["gameDuration"] % 3600) // 60) + ":" + str((matches["info"]["gameDuration"] % 3600) % 60)
                    else :
                        detail["game_duration"] = str(matches["info"]["gameDuration"] // 60) + ":" + str(matches["info"]["gameDuration"]  % 60)

                    detail["game_timestamp"] = matches["info"]["gameEndTimestamp"] / 1000
                    if matches["info"]["queueId"] == 420:
                        detail["game_mode"] = "솔로 랭크"
                    elif matches["info"]["queueId"] == 430:
                        detail["game_mode"] = "일반"
                    elif matches["info"]["queueId"] == 440:
                        detail["game_mode"] = "자유 랭크"
                    elif matches["info"]["queueId"] == 450:
                        detail["game_mode"] = "칼바람 나락"
                    else:
                        detail["game_mode"] = "미등록 모드"
                    detail["game_id"] = matches["metadata"]["matchId"]
                    for cnt in range(0, 10):
                        if matches["info"]["participants"][cnt]["summonerName"] == name:
                            detail["assists"] = matches["info"]["participants"][cnt]["assists"]
                            detail["kills"] = matches["info"]["participants"][cnt]["kills"]
                            detail["champ_level"] = matches["info"]["participants"][cnt]["champLevel"]
                            detail["champion_name"] = matches["info"]["participants"][cnt]["championName"]
                            detail["champion_name_KR"] = champion_KR.get(matches["info"]["participants"][cnt]["championName"], "미등록 챔피언")
                            detail["deaths"] = matches["info"]["participants"][cnt]["deaths"]
                            detail["item0"] = matches["info"]["participants"][cnt]["item0"]
                            detail["item1"] = matches["info"]["participants"][cnt]["item1"]
                            detail["item2"] = matches["info"]["participants"][cnt]["item2"]
                            detail["item3"] = matches["info"]["participants"][cnt]["item3"]
                            detail["item4"] = matches["info"]["participants"][cnt]["item4"]
                            detail["item5"] = matches["info"]["participants"][cnt]["item5"]
                            detail["item6"] = matches["info"]["participants"][cnt]["item6"]
                            detail["lane"] = matches["info"]["participants"][cnt]["lane"]
                            if matches["info"]["participants"][cnt]["pentaKills"] != 0:
                                detail["multi_killed"] = "penta"
                            elif matches["info"]["participants"][cnt]["quadraKills"] != 0:
                                detail["multi_killed"] = "quadra"
                            elif matches["info"]["participants"][cnt]["tripleKills"] != 0:
                                detail["multi_killed"] = "triple"
                            elif matches["info"]["participants"][cnt]["doubleKills"] != 0:
                                detail["multi_killed"] = "double"
                            else:
                                detail["multi_killed"] = ""
                            detail["primary_perk"] = matches["info"]["participants"][cnt]["perks"]["styles"][0]["selections"][0]["perk"]
                            detail["sub_perk"] = matches["info"]["participants"][cnt]["perks"]["styles"][1]["style"]
                            detail["spell_fir"] = spell.get(matches["info"]["participants"][cnt]["summoner1Id"], "미등록스펠")
                            detail["spell_sec"] = spell.get(matches["info"]["participants"][cnt]["summoner2Id"], "미등록스펠")
                            detail["win"] = matches["info"]["participants"][cnt]["win"]
                            detail["eaten_minions"] = matches["info"]["participants"][cnt]["totalMinionsKilled"]
                            detail["vision_point"] = matches["info"]["participants"][cnt]["visionScore"]
                            detail["ward_cnt"] = matches["info"]["participants"][cnt]["visionWardsBoughtInGame"]
                            if matches["info"]["participants"][cnt]["teamId"] == 100:
                                detail["team_total_kills"] = matches["info"]["teams"][0]["objectives"]["champion"]["kills"]
                            elif matches["info"]["participants"][cnt]["teamId"] != 100:
                                detail["team_total_kills"] = matches["info"]["teams"][1]["objectives"]["champion"]["kills"]

                        for cnt in range(0, 10):
                            if cnt < 5:
                                participant["blue_summonerId"+str(cnt+1)] = matches["info"]["participants"][cnt]["summonerName"]
                                participant["blue_champion"+str(cnt+1)] = matches["info"]["participants"][cnt]["championName"]
                            else:
                                participant["red_summonerId" + str(cnt-4)] = matches["info"]["participants"][cnt]["summonerName"]
                                participant["red_champion" + str(cnt-4)] = matches["info"]["participants"][cnt]["championName"]

                    JDBC_Driver = 'C:/Users/yk170/Desktop/ojdbc10-full/ojdbc10.jar'
                    jar = r'C:/Users/yk170/Desktop/ojdbc10-full/ojdbc10.jar'
                    args = '-Djava.class.path=%s' % jar

                    if not jpype.isJVMStarted():
                        jpype.startJVM(jpype.getDefaultJVMPath(), args)

                    conn = jp.connect('oracle.jdbc.driver.OracleDriver',
                                      'jdbc:oracle:thin:@dbjunglegap_high?TNS_ADMIN=C:/Users/yk170/Desktop/Wallet_DBJungleGap',
                                      ["admin", "Ab1234567890"], JDBC_Driver)
                    cursor = conn.cursor()
                    sql = "insert into lol_record values (RECORD_NO.nextval, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"%("'"+name+"'", "'"+detail["game_mode"]+"'", "'"+detail["champion_name"]+"'", str(detail["champ_level"]), str(detail["eaten_minions"]), str(detail["primary_perk"]), str(detail["sub_perk"]), str(detail["vision_point"]), str(detail["ward_cnt"]), str(detail["item0"]), str(detail["item1"]), str(detail["item2"]), str(detail["item3"]), str(detail["item4"]), str(detail["item5"]), str(detail["item6"]), str(detail["kills"]), str(detail["deaths"]), str(detail["assists"]), "'"+str(detail["win"])+"'", "'"+detail["spell_fir"]+"'", "'"+detail["spell_sec"]+"'", "'"+detail["game_id"]+"'", "'"+detail["lane"]+"'", "'"+detail["game_duration"]+"'", "'"+participant["blue_champion1"]+"'", "'"+participant["blue_summonerId1"]+"'", "'"+participant["blue_champion2"]+"'", "'"+participant["blue_summonerId2"]+"'", "'"+participant["blue_champion3"]+"'", "'"+participant["blue_summonerId3"]+"'", "'"+participant["blue_champion4"]+"'", "'"+participant["blue_summonerId4"]+"'", "'"+participant["blue_champion5"]+"'", "'"+participant["blue_summonerId5"]+"'", "'"+participant["red_champion1"]+"'", "'"+participant["red_summonerId1"]+"'", "'"+participant["red_champion2"]+"'", "'"+participant["red_summonerId2"]+"'", "'"+participant["red_champion3"]+"'", "'"+participant["red_summonerId3"]+"'", "'"+participant["red_champion4"]+"'", "'"+participant["red_summonerId4"]+"'", "'"+participant["red_champion5"]+"'", "'"+participant["red_summonerId5"]+"'", detail["game_timestamp"], detail["team_total_kills"], "'"+detail["champion_name_KR"]+"'", "'"+detail["multi_killed"]+"'")
                    cursor.execute(sql)
                    cursor.close()
                    conn.close()

    else:
        # 코드가 200이 아닐때(즉 찾는 닉네임이 없을때)
        print("소환사가 존재하지 않습니다")

def update_lol_info(name):
    api_key = "RGAPI-f2e8aba1-e75d-47c8-8829-e097207ecd61"

    URL = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + name
    res = requests.get(URL, headers={"X-Riot-Token": api_key})
    if res.status_code == 200:
        lol_info = {}
        resobj = json.loads(res.text)
        URL = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + resobj["id"]
        res = requests.get(URL, headers={"X-Riot-Token": api_key})
        rankinfo = json.loads(res.text)
        if len(rankinfo) == 2:
            for i in rankinfo:
                if i["queueType"] == "RANKED_SOLO_5x5":
                    # 솔랭과 자랭중 솔랭
                    lol_info["solo_tier"] = i["tier"]
                    if i["tier"] != "CHALLANGER" or i["tier"] != "GRANDMASTER" or i["tier"] != "MASTER":
                        lol_info["solo_tier_grade"] = "'"+i["rank"]+"'"
                    else:
                        lol_info["solo_tier_grade"] = "null"
                    lol_info["solo_lp"] = i["leaguePoints"]
                    lol_info["solo_win"] = i["wins"]
                    lol_info["solo_lose"] = i["losses"]
                if i["queueType"] == "RANKED_FLEX_SR":
                    # 솔랭과 자랭중 자랭
                    lol_info["free_tier"] = i["tier"]
                    if i["tier"] != "CHALLANGER" or i["tier"] != "GRANDMASTER" or i["tier"] != "MASTER":
                        lol_info["free_tier_grade"] = "'"+i["rank"]+"'"
                    else:
                        lol_info["free_tier_grade"] = "null"
                    lol_info["free_tier_grade"] = "'"+i["rank"]+"'"
                    lol_info["free_lp"] = i["leaguePoints"]
                    lol_info["free_win"] = i["wins"]
                    lol_info["free_lose"] = i["losses"]
        elif len(rankinfo) == 1:
            for i in rankinfo:
                try:
                    # 솔랭과 자랭중 솔랭
                    lol_info["solo_tier"] = i["tier"]
                    if i["tier"] != "CHALLANGER" or i["tier"] != "GRANDMASTER" or i["tier"] != "MASTER":
                        lol_info["solo_tier_grade"] = "'"+i["rank"]+"'"
                    else:
                        lol_info["solo_tier_grade"] = "null"
                    lol_info["solo_lp"] = i["leaguePoints"]
                    lol_info["solo_win"] = i["wins"]
                    lol_info["solo_lose"] = i["losses"]
                    lol_info["free_tier"] = "UNRANKED"
                    lol_info["free_tier_grade"] = "null"
                    lol_info["free_lp"] = 0
                    lol_info["free_win"] = 0
                    lol_info["free_lose"] = 0
                except:
                    # 솔랭과 자랭중 자랭
                    lol_info["free_tier"] = "'"+i["rank"]+"'"
                    if i["tier"] != "CHALLANGER" or i["tier"] != "GRANDMASTER" or i["tier"] != "MASTER":
                        lol_info["free_tier_grade"] = "'"+i["rank"]+"'"
                    else:
                        lol_info["free_tier_grade"] = "null"
                    lol_info["free_tier_grade"] = "'"+i["rank"]+"'"
                    lol_info["free_lp"] = i["leaguePoints"]
                    lol_info["free_win"] = i["wins"]
                    lol_info["free_lose"] = i["losses"]
                    lol_info["solo_tier"] = "UNRANKED"
                    lol_info["solo_tier_grade"] = "null"
                    lol_info["solo_lp"] = 0
                    lol_info["solo_win"] = 0
                    lol_info["solo_lose"] = 0
        else:
            lol_info["solo_tier"] = "UNRANKED"
            lol_info["solo_tier_grade"] = "null"
            lol_info["solo_lp"] = 0
            lol_info["solo_win"] = 0
            lol_info["solo_lose"] = 0
            lol_info["free_tier"] = "UNRANKED"
            lol_info["free_tier_grade"] = "null"
            lol_info["free_lp"] = 0
            lol_info["free_win"] = 0
            lol_info["free_lose"] = 0

        # oracle jdbc 파일 경로 및 class 경로 설정
        JDBC_Driver = 'C:/Users/yk170/Desktop/ojdbc10-full/ojdbc10.jar'
        jar = r'C:/Users/yk170/Desktop/ojdbc10-full/ojdbc10.jar'
        args = '-Djava.class.path=%s' % jar
        # java class path 설정
        if not jpype.isJVMStarted():
            jpype.startJVM(jpype.getDefaultJVMPath(), args)
        # oracle 접근
        conn = jp.connect('oracle.jdbc.driver.OracleDriver',
                          'jdbc:oracle:thin:@dbjunglegap_high?TNS_ADMIN=C:/Users/yk170/Desktop/Wallet_DBJungleGap',
                          ["admin", "Ab1234567890"], JDBC_Driver)
        cursor = conn.cursor()
        # insert Query 실행
        sql = "update lol_info set solo_tier =  %s, solo_tier_grade = %s, free_tier = %s, free_tier_grade = %s, solo_win = %d, solo_lose = %d, solo_lp = %d, free_win = %d, free_lose = %d, free_lp = %d where summoner_id = %s)"%("'"+lol_info["solo_tier"]+"'", lol_info["solo_tier_grade"], "'"+lol_info["free_tier"]+"'", lol_info["free_tier_grade"], lol_info["solo_win"], lol_info["solo_lose"], lol_info["solo_lp"], lol_info["free_win"], lol_info["free_lose"], lol_info["free_lp"], "'"+name+"'")
        cursor.execute(sql)
        cursor.close()
        conn.close()
        print("update_lol_info")

    else:
        # 코드가 200이 아닐때(즉 찾는 닉네임이 없을때)
        print("failed")

if __name__ == "__main__":
    update_lol_info(sys.argv[1])
    lol_record(sys.argv[1], sys.argv[2])