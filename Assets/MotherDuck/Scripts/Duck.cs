using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Duck : MonoBehaviour {

	private bool isFollowingPlayer = false;
	public Transform transformToFollow;
	public Vector3 moveTowardsPoint;
	public float followDistance  = 2;
	public float movespeed = 2.5f;
	//public List<Vector3> followPositions = new List<Vector3> ();
	public Vector3 lastQueuePoint = Vector3.zero;
	public Vector3 startPoint;

	public int teamNumber = 0;
	public GameObject CurrentOwner;
	public GameObject PreviousOwner;

	public Material duckYellow;
	public Material duckRed;
	public Material duckBlue;

	public List<GameObject> colourChangeObjects = new List<GameObject>();

	// Use this for initialization
	void Start () {
		
		startPoint = transform.position;
		transform.rotation = Quaternion.Euler (0, Random.Range (0f, 360f), 0);
	}
	
	// Update is called once per frame
	void Update () {
		if (isFollowingPlayer) {
			Follow ();
		}
	}

	void UpdateDuckMats(int colour){

		Material mat = duckYellow;
		switch (colour) {
		case(0):
			mat = duckYellow;
			break;
		case(1):
			mat = duckBlue;
			break;
		case(2):
			mat = duckRed;
			break;

		default:
		
			break;
		}


		foreach (GameObject GO in colourChangeObjects) {
			GO.GetComponent<Renderer> ().material = mat;
		}
	}
		
	void OnTriggerEnter(Collider other){
		//Debug.Log (other.name);
		//if (!isFollowingPlayer) {
		if (other.transform.tag == "Player") {
			if (other.GetComponent<TimeRecorder> ().teamNumber != teamNumber) {
				if (PreviousOwner != other.gameObject) {
					if (CurrentOwner) {
						//Debug.Log ("lose Duck");
						CurrentOwner.GetComponent<PlayerDuckManager> ().LoseDuck (this);
					}

					PreviousOwner = CurrentOwner;
					CurrentOwner = other.gameObject;
					teamNumber = other.GetComponent<TimeRecorder> ().teamNumber;
					transformToFollow = other.GetComponent<PlayerDuckManager> ().PickUpDuck (this).transform;
					isFollowingPlayer = true;
					//followPositions.Add (transformToFollow.position);
					moveTowardsPoint = transformToFollow.position;
					UpdateDuckMats (teamNumber);
				}
			}
		}
		//}
	}

	public void ChangeFollowDuck(Transform duck){
		transformToFollow = duck;
	}

	private void Follow(){

		transform.LookAt (transformToFollow);
		if (Vector3.Distance (lastQueuePoint, transformToFollow.position) > 0.02f) {
			//followPositions.Add (transformToFollow.position);
			//lastQueuePoint = transformToFollow.position;
			transform.position = Vector3.Lerp (transform.position, transformToFollow.position, movespeed);
		}

//		if (followPositions.Count > 0){
//			if(Vector3.Distance(followPositions[0],transform.position)< followDistance){
//				//Debug.Log ("hi");
//				moveTowardsPoint = followPositions[0] ;
//				followPositions.RemoveAt (0);
//			}
//		}

//		if (Vector3.Distance (transform.position, transformToFollow.position) > followDistance) {
//			
//			moveTowardsPoint = transformToFollow.position;
//			//transform.position = Vector3.MoveTowards(transform.position,
//		}

	}

	private void StartPlaying(){
		UpdateDuckMats (0);
		teamNumber = 0;
		PreviousOwner = null;
		transform.position = startPoint;
		transform.rotation = Quaternion.Euler (0, Random.Range (0f, 360f), 0);
		isFollowingPlayer = false;
		transformToFollow = null;
		//followPositions = new List<Vector3> ();
		lastQueuePoint = Vector3.zero;
		CurrentOwner = null;
	}

	private void StopPlaying(){
		moveTowardsPoint = Vector3.zero;
	}

	public void StartReplay(){
		UpdateDuckMats (0);
		teamNumber = 0;
		PreviousOwner = null;
		transform.position = startPoint;
		transform.rotation = Quaternion.Euler (0, Random.Range (0f, 360f), 0);
		isFollowingPlayer = false;
		transformToFollow = null;
		//followPositions = new List<Vector3> ();
		lastQueuePoint = Vector3.zero;
		CurrentOwner = null;
		moveTowardsPoint = Vector3.zero;
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


	void OnDrawGizmos() {
		if (moveTowardsPoint != Vector3.zero) {
			Gizmos.color = Color.yellow;
			Gizmos.DrawLine (transform.position, transformToFollow.position);
		}
	}
		
}
