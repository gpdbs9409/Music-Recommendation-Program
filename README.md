### 프로젝트 리드미 (README.md)

---

# 🎵 노래 추천 프로그램 (Music Recommendation Program)

## 📚 소개

이 프로젝트는 사용자 입력(감정), 시스템 상태(CPU 사용량), 그리고 날씨 데이터를 결합하여 적합한 음악을 추천하고 재생하는 유닉스 기반 프로그램입니다. 사용자 경험을 고려한 데이터 기반의 음악 추천 시스템을 통해, 사용자는 자신의 감정, 현재 상태, 그리고 날씨에 맞는 음악을 쉽게 즐길 수 있습니다.

---

## 🛠️ 주요 기능

### 1. **사용자 감정 입력 저장**
   - 사용자가 현재 감정을 입력하면 프로그램이 이를 분석하여 적합한 음악을 추천합니다.
   - 감정 데이터는 파일로 저장되어 이후 추천 시스템의 개선에 활용될 수 있습니다.

### 2. **시스템 상태 모니터링**
   - 시스템의 CPU 사용량 및 메모리 상태를 확인합니다.
   - 시스템 리소스가 높을 경우, 작업 집중에 적합한 음악을 추천합니다.

### 3. **날씨 데이터 연동**
   - 외부 날씨 API를 통해 실시간 날씨 데이터를 가져옵니다.
   - 예를 들어, 비 오는 날에는 잔잔한 음악을, 맑은 날에는 활기찬 음악을 추천합니다.

### 4. **음악 재생**
   - 추천된 음악을 터미널에서 직접 재생하거나, 외부 음악 재생 라이브러리를 활용합니다.

---

## 📂 디렉토리 구조

```
.
├── src/                # 소스 코드 디렉토리
│   ├── main.c          # 프로그램 메인 로직
│   ├── emotion.c       # 사용자 감정 입력 및 저장 처리
│   ├── system_status.c # 시스템 상태 확인 (CPU, 메모리)
│   ├── weather.c       # 날씨 데이터 API 호출 및 처리
│   └── music.c         # 음악 추천 및 재생
├── include/            # 헤더 파일 디렉토리
│   ├── emotion.h
│   ├── system_status.h
│   ├── weather.h
│   └── music.h
├── data/               # 데이터 디렉토리
│   ├── emotions.txt    # 사용자 감정 데이터 저장 파일
│   ├── weather_log.txt # 날씨 데이터 로그 파일
│   └── music_list.txt  # 추천 음악 목록
├── scripts/            # 유틸리티 스크립트 디렉토리
│   └── setup_env.sh    # 환경 설정 스크립트
├── Makefile            # 컴파일 및 실행 자동화
└── README.md           # 리드미 파일
```

---

## 🚀 실행 방법

### 1. **프로그램 빌드**
```bash
make
```

### 2. **프로그램 실행**
```bash
./music_recommendation
```

### 3. **환경 초기화**
```bash
bash scripts/setup_env.sh
```

---

## 💻 요구 사항

- GCC 컴파일러
- cURL (날씨 API 호출)
- mpg123 또는 유사한 음악 재생 라이브러리
- 인터넷 연결 (날씨 API 호출을 위한 네트워크 환경)

---

## 🧑‍🤝‍🧑 팀원

- **기획 및 개발**: [Yoon](https://github.com/Yoon)  
- **코드 리뷰 및 디버깅**: [Team Member]  

---

## 📌 참고 자료

- OpenWeather API: [https://openweathermap.org/](https://openweathermap.org/)
- Linux System Calls Documentation  
- GCC Manual: [https://gcc.gnu.org/onlinedocs/](https://gcc.gnu.org/onlinedocs/)  

---

### 앞으로 보완할 점
1. 추천 알고리즘 개선 (감정 입력 데이터와 날씨 데이터를 연동한 결과의 정확도 향상).  
2. GUI 기반 음악 플레이어로 확장.  
3. 감정 분석을 위한 머신러닝 모델 연동.  
