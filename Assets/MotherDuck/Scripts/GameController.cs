using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using XboxCtrlrInput;
using UnityEngine.SceneManagement;

public class GameController : MonoBehaviour {

	public int gameRounds = 4;
	public int curRound = 0;
	public float roundLength = 30;
	private float roundTimer;
	private float roundStartTime;

	public List<Transform> teamOneStartPoint = new List<Transform>();
	public List<Transform> teamTwoStartPoint = new List<Transform>();

	public enum states{notPlaying,playing,replayingGame};
	public states GameState;

	public Text roundTimeText;
	public Text roundNumber;

	public GameObject playerPrefab;

	public Image teamScore;
	public int teamOneScore = 0;
	public int teamTwoScore = 0;

	public Transform scorePointerParent;
	public GameObject scorePointerPrefab;

	public GameObject redIndicatorPanel;
	public GameObject blueIndicatorPanel;

	public GameObject inGamePanel;
	public GameObject MenuPanel;


	// Use this for initialization
	void Start () {
		GameState = states.notPlaying;
		MenuPanel.SetActive(true);
		//StartRound ();

		GameObject.Find ("VersionText").GetComponent<Text> ().text = "v1.2";
	}

	public void StartGame(){
		inGamePanel.SetActive(true);
		MenuPanel.SetActive(false);

		StartRound ();
	}

	public void AdjustScore(int team, int value){
		//Debug.Log (team + " " + value);
		if (team == 1) {
			teamOneScore += value;
		} else {
			teamTwoScore += value;
		}
	}

	private void StartRound(){
		teamOneScore = 0;
		teamTwoScore = 0;
		teamScore.fillAmount = 0.5f;
		curRound++;
		roundNumber.text = curRound.ToString();
		roundStartTime = Time.time;
		GameState = states.playing;

		Transform startingPoint;

		for (int cnt = 1;cnt<=2;cnt++){

			if (cnt == 1) {
				startingPoint = teamOneStartPoint[curRound-1];
			} else {
				startingPoint = teamTwoStartPoint[curRound-1];
			}

			GameObject GO = Instantiate (playerPrefab, startingPoint.position, startingPoint.rotation) as GameObject;
			GO.GetComponent<TimeRecorder> ().Init (cnt,cnt);
			GO.GetComponent<PlayerController> ().LogStartingPosition ();
			GameObject indicatorPanel;
			if (cnt == 1) {
				indicatorPanel = blueIndicatorPanel;
			}else{
				indicatorPanel = redIndicatorPanel;
			}

			GO.GetComponent<PlayerDuckManager> ().duckIndicatedPanel = indicatorPanel;
		}

		EventManager.TriggerEvent("StartPlaying");
	}

	private void FinishRound(){
		EventManager.TriggerEvent("StopRecording");

		if(GameState != states.replayingGame){
			GameObject GO = Instantiate (scorePointerPrefab, scorePointerParent) as GameObject;

			float finalScore;
			if (teamTwoScore == 0 && teamOneScore == 0) {
				finalScore = 0;
			} else {
				finalScore = 1 - ((float)teamTwoScore / ((float)teamOneScore + (float)teamTwoScore));
			}
			GO.GetComponent<ScorePointer> ().Init (curRound,finalScore );
		}
		teamOneScore = 0;
		teamTwoScore = 0;
		teamScore.fillAmount = 0.5f;
	}

	private void StartReplay(){
		//FinishRound ();
		roundStartTime = Time.time;
		EventManager.TriggerEvent("StartReplay");
		teamOneScore = 0;
		teamTwoScore = 0;
		teamScore.fillAmount = 0.5f;
	}

	// Update is called once per frame
	void Update () {

		if (GameState == states.playing || GameState == states.replayingGame) {
			PlayGame ();
		} else {
			if (XCI.GetButtonDown (XboxButton.Start, XboxController.All)) {
				StartGame ();
			}
		}

		if(GameState == states.replayingGame && XCI.GetButton (XboxButton.Start, XboxController.All)){
			SceneManager.LoadScene (0);
		}

		if (teamTwoScore != 0 || teamOneScore != 0) { 
			float targetScore = 1 - ((float)teamTwoScore / ((float)teamOneScore + (float)teamTwoScore));
			//Debug.Log ((float)teamTwoScore + " " + (float)teamOneScore + " " + (float)teamTwoScore / ((float)teamOneScore + (float)teamTwoScore));
			teamScore.fillAmount = (Mathf.Lerp (teamScore.fillAmount, targetScore, 0.02f));
		}
	}

	private void PlayGame(){
		roundTimeText.text = (Mathf.Round(roundLength - Time.time + roundStartTime )).ToString();
		if(Time.time - roundStartTime > roundLength){
			//Debug.Log ("NewRound");
			FinishRound();


			if (curRound >= gameRounds) {
				//FinishRound ();
				StartReplay ();
				GameState = states.replayingGame;
			} else {
				StartRound();
			}
		}
	}
}
