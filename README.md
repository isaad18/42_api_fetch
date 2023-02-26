# 42_api_fetch
<h1 align="center">
	📖 42_api_fetch
</h1>

<p align="center">
	<b><i>fetch the data of all the users in a 42 campus using campus ID</i></b><br>
</p>

<p align="center">
	<img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/isaad18/42_api_fetch?color=lightblue" />
	<img alt="Code language count" src="https://img.shields.io/github/languages/count/isaad18/42_api_fetch?color=yellow" />
	<img alt="GitHub top language" src="https://img.shields.io/github/languages/top/isaad18/42_api_fetch?color=red" />
	<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/isaad18/42_api_fetch?color=green" />
</p>
 
## Info
This script gets all the info of all users in a single campus using the campus ID, this script due to the limited number of requests given by 42 application so it runs 1 request every 4 seconds which is 900 requests per hour. Users info will be given back in the form of JSON file, info of the student will include basic info of the student, projects done in progress, and the date of correction, cursus users info such as skills, blackhole and kickoff dates for the cursus and the same info for the piscine stats and projects, languages of the user, his/her achievements, titles, campus info, partnerships and other info. <br>
<br>
```NOTE: this script will take time while running depending of the number of users in the campus, for example if there is 900 users registered in the campus it will take one our to finish```<br>
<br>
The final result will be in the folder ``` pretty ``` as I get the users first in one line in a JSON file and then transfer them using the command jq to a prettier JSON form.
<br>

## QuickStart
To run the script run the command and wait😴
```
bash data.sh
```

## Uses
This script could be useful if you run it using crontab to fetch information from 42 API every certain amount of hours for example.
