using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PlayerDuckManager : MonoBehaviour {

	public List<Duck> duckList = new List<Duck> ();
	private GameController gc;

	public GameObject duckIndicatedPanel;

	// Use this for initialization
	void Start () {
		gc = GameObject.Find ("GameController").GetComponent<GameController>();
	}

	public void LoseAllDucks(){

		while (duckList.Count > 0) {
			duckList[0].StartReplay();
			LoseDuck (duckList [0]);
		}

//		for (int i = 0; i < duckList.Count; i++) {
//			
//			duckIndicatedPanel.GetComponent<DuckIndicator> ().RemoveDuck ();
//		}
	}

	public GameObject PickUpDuck(Duck duck){
		GameObject.Find ("AudioController").GetComponent<AudioController> ().PickUpDuck ();
		gc.AdjustScore (GetComponent<TimeRecorder> ().teamNumber, 1);
		//Debug.Log(duckList.Count);

		GameObject followGO;
		if (duckList.Count == 0) {
			followGO = gameObject;
		} else {
			followGO = duckList [duckList.Count - 1].gameObject;
		}
			
		duckList.Add (duck);
		///Test
		//GetComponent<PlayerController> ().TestUpdateDuckCount (duckList.Count);

		if (GetComponent<TimeRecorder> ().isRecording) {
			duckIndicatedPanel.GetComponent<DuckIndicator> ().AddDuck ();
		}

		return followGO;


	}



	public void LoseDuck(Duck duck){


		GameObject.Find ("AudioController").GetComponent<AudioController> ().LoseDuck ();
		gc.AdjustScore (GetComponent<TimeRecorder> ().teamNumber, -1);
		duckList.Remove (duck);


		if (duckList.Count > 0) {
			duckList [0].transformToFollow = transform;
			for (int cnt = 1; cnt < duckList.Count; cnt++) {
				////Debug.Log (duckList.Count);
				//Debug.Log (cnt);
				duckList [cnt].transformToFollow = duckList [cnt - 1].transform;


			}
		}
		if (GetComponent<TimeRecorder> ().isRecording) {
			duckIndicatedPanel.GetComponent<DuckIndicator> ().RemoveDuck ();
		}
	}

	public void RestartRound(){
		duckList = new List<Duck> ();
	}


}
