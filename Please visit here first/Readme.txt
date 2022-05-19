개발환경 설정
spring sts-4.14.0 버전
Wallet_DBJungleGap 압축파일 및 ojdbc10-full 폴더를 프로젝트 파일 과 동등한 디렉토리에 둠
Orcale SQL Devleoper 버전 21.4.2
java jdk-11.0.14
apache-tomcat 버전 9.0.60
tomcat server의 Web Modules 내 Path를 /로 설정
상단의 Window - Preferences로 이동 후 encoding으로 검색, 하단 목록의 다음 항목들의 인코딩을 UTF-8로 설정
General-Context Types : Java Class File 클릭 후 하단 Default encoding에 UTF-8 입력, 이후 Update 클릭
그 외 : 모두 Encoding 항목들을 UTF-8로 설정

WEB-INF 폴더 내 spring 폴더 내 root-context.xml 파일의 id=dataSource인 bean 아래 다음의 property를 추가
<property name="url" value="jdbc:oracle:thin:@dbjunglegap_high?TNS_ADMIN=자신 컴퓨터의 Wallet_DBJungleGap 압축파일까지의 경로"/>

python 버전 3.7
python 프로젝트는 아나콘다 pycharm을 통해 접속
파이썬 프로젝트 경로 : C:\\Users\\사용자\\PycharmProjects\\프로젝트이름
파이썬 경로 : C:\\Users\\사용자\\.conda\\envs\\JGGap\\python.exe
좌측 상단의 File - Settings - Python Interpreter로 이동, + 버튼을 눌러 다음의 라이브러리들을 검색후 install
requests
jpype1
jaydebeapi

파이썬 파일 update_lol.py와 insert_lol.py 내의 JDBC_Driver 변수 및 jar 변수의 값을 자신 컴퓨터의 ojdbc10.jar까지의 경로로 설정
ex) JDBC_Driver = 'C:/Users/grood/Desktop/JGGapProject/ojdbc10-full/ojdbc10.jar'
                 jar = r'C:/Users/grood/Desktop/JGGapProject/ojdbc10-full/ojdbc10.jar'
	이후 conn 변수의 값을 다음과 같이 설정
 conn = jp.connect('oracle.jdbc.driver.OracleDriver',
                          'jdbc:oracle:thin:@dbjunglegap_high?TNS_ADMIN=자신 컴퓨터의 Wallet_DBJungleGap 압축파일까지의 경로',
                          ["admin", "Ab1234567890"], JDBC_Driver)

Wallet 미사용시 DB에 dbeaverDB.txt 내의 내용을 복사 & 붙여넣기하여 데이터베이스 구성