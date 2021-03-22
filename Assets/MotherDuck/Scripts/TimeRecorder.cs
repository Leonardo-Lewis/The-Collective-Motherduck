using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class TimeRecorder : MonoBehaviour {

	private List<TimeMoment> recordingList = new List<TimeMoment> ();
	private float recorderPlayerTimer;
	public float timeBetweenRecordings = 0.1f;
	private float recordingStartTime;

	public bool isRecording = false;
	private bool isPlayback = false;
	private bool useTrails = false;
	private int playbackPointer = 0;
	private Vector3 moveToPosition;
	private Quaternion rotateToPosition;
	private bool hasPlayed = false;

	public GameObject playerCamera;
	public PlayerController pc;
	public PlayerDuckManager pdm;
	private Rigidbody rb;

	public GameObject PlaybackLineRender;

	public int playerNumber = 0;
	public int teamNumber = 0;

	public Material blueTrail;
	public Material redTrail;

	public Material playerMatRed;
	public Material playerMatBlue;

	public void Init(int playerNo, int teamNo){
		teamNumber = teamNo;
		playerNumber = playerNo;

		playerCamera.GetComponent<Camera> ().rect = new Rect (0.5f * (playerNumber - 1), 0, 0.5f, 1);
		GetComponent<PlayerController> ().Init (teamNo, playerNo);

		Material trailMat;

		if (teamNo == 1) {
			trailMat = blueTrail;
			GetComponentInChildren<Renderer> ().material = playerMatBlue;
		} else {
			trailMat = redTrail;
			GetComponentInChildren<Renderer> ().material = playerMatRed;
		}
		PlaybackLineRender.GetComponent<PlayerPlaybackTrails> ().init (trailMat);



	}
	// Use this for initialization
	void Start () {
		rb = GetComponent<Rigidbody> ();
		pc = GetComponent<PlayerController> ();
		//pc.enabled = false;

		//StartPlaying ();
	}
	
	// Update is called once per frame
	void Update () {
		if (isRecording) {
			Recording ();
		} else if (isPlayback) {
			PlayBack ();
		}

	}

	private void Recording(){
		if (Time.time - recorderPlayerTimer > timeBetweenRecordings) {
			recordingList.Add(new TimeMoment(transform.position,transform.rotation,Time.time-recordingStartTime));
			recorderPlayerTimer = Time.time;
		}
	}

	public void InsertReset(){
		if (isRecording) {
			recordingList.Add (new TimeMoment (Vector3.zero,Quaternion.identity, Time.time - recordingStartTime));
		}
	}

	private void ResetDucks(){
		GetComponent<PlayerDuckManager> ().LoseAllDucks ();
	}

	private void PlayBack(){
		
		if (playbackPointer >= recordingList.Count -1) {
			StopPlaying ();
		}

		if (Time.time - recordingStartTime > recordingList [playbackPointer].Time) {
			if (recordingList [playbackPointer].Position == Vector3.zero) {
				ResetDucks ();
				playbackPointer++;
				return;
			}

			moveToPosition = recordingList [playbackPointer].Position;
			rotateToPosition = recordingList [playbackPointer].Rotation;

			if (useTrails) {
				if (playbackPointer > 3) {
					PlaybackLineRender.GetComponent<PlayerPlaybackTrails> ().AddLineRenderPosition (recordingList [playbackPointer - 3].Position);
				}
			}

			playbackPointer++;
		}

		transform.position = Vector3.Lerp(transform.position, moveToPosition, timeBetweenRecordings *4);
		transform.rotation = Quaternion.Lerp(transform.rotation,rotateToPosition, timeBetweenRecordings *4);
		//transform.position = Vector3.MoveTowards(transform.position, moveToPosition, timeBetweenRecordings);

	}

	private void StopPlaying(){
		isPlayback = false;
		hasPlayed = true;
	}

	private void StartPlayback(){
		//Debug.Log ("Hi");
		isRecording = false;
		isPlayback = true;
		recordingStartTime = Time.time;
		playbackPointer = 0;
		rb.isKinematic = true;
		rb.velocity = Vector3.zero;
		pc.enabled = false;
		playerCamera.SetActive (false);
		transform.position = recordingList [0].Position;
		pdm.RestartRound ();

	}


	private void StartRecording(){
		isRecording = true;
		recordingStartTime = Time.time;
		recorderPlayerTimer = Time.time - timeBetweenRecordings;
	}

	private void StartPlaying(){
		if (!hasPlayed) {
			pc.enabled = true;
			StartRecording ();
		} else {
			StartPlayback ();
		}
	}

	public void StartReplay(){
		PlaybackLineRender.SetActive (true);
		PlaybackLineRender.GetComponent<PlayerPlaybackTrails> ().ResetTrail ();
		useTrails = true;
		StartPlaying ();
	}


	void OnEnable()
	{
		EventManager.StartListening("StartPlaying", StartPlaying);
		EventManager.StartListening("StopRecording", StopPlaying);
		EventManager.StartListening("StartReplay", StartReplay);
	}

	void OnDisable()
	{
		EventManager.StopListening("StartPlaying", StartPlaying);
		EventManager.StopListening("StopRecording", StopPlaying);
		EventManager.StopListening("StartReplay", StartReplay);
	}

}

public class TimeMoment{

	private Vector3 position;
	private Quaternion rotation;
	private float time;

	public TimeMoment (Vector3 position, Quaternion rotation, float time)
	{
		this.position = position;
		this.rotation = rotation;
		this.time = time;
	}

	public Vector3 Position {
		get {
			return this.position;
		}
	}

	public Quaternion Rotation {
		get {
			return this.rotation;
		}
	}

	public float Time {
		get {
			return this.time;
		}
	}

}