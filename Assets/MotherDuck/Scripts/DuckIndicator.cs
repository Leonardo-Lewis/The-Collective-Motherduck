using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;

public class DuckIndicator : MonoBehaviour {

	public Sprite duckSprite1;
	public Sprite duckSprite2;
	public Sprite duckGoneSprite;

	private List<GameObject> duckImageList = new List<GameObject>();

	public GameObject duckImagePrefab;
	public Transform duckImageParent;

	private int currentFrame;
	public float timeBetweenFrames = 1;
	private int LastFrame;

	public Color teamColour;

	public void Update(){
		if (Time.time % (timeBetweenFrames * 2) > timeBetweenFrames) {
			currentFrame = 1;
		} else {
			currentFrame = 2;
		}

		if (currentFrame != LastFrame) {
			LastFrame = currentFrame;
			ChangeSprites ();
		}
	}

	private void ChangeSprites(){
		Sprite imageToChangeto;

		if (currentFrame == 1) {
			imageToChangeto = duckSprite1;
		} else {
			imageToChangeto = duckSprite2;
		}

		foreach (GameObject duckGO in duckImageList) {
			duckGO.GetComponent<Image> ().sprite = imageToChangeto;
		}
	}

	public void AddDuck(){
		GameObject GO = Instantiate (duckImagePrefab, duckImageParent) as GameObject;
		duckImageList.Add (GO);
		GO.transform.GetChild(0).GetComponentInChildren<Image>().color = teamColour;
		//GO.GetComponentInChildren<PickUpSprite> ().particleColour = teamColour;
		ChangeSprites ();
	}

	public void RemoveDuck(){
		duckImageList [duckImageList.Count - 1].GetComponent<Image> ().sprite = duckGoneSprite;
		//Destroy (duckImageList [duckImageList.Count - 1].gameObject, 2);
		duckImageList [duckImageList.Count - 1].GetComponentInChildren<ExplodeSprite>().enabled = true;
		duckImageList.RemoveAt (duckImageList.Count - 1);

	}

	void OnEnable()
	{
		EventManager.StartListening("StartPlaying", StartPlaying);
		EventManager.StartListening("StartReplay", StartPlaying);
	}

	void OnDisable()
	{
		EventManager.StopListening("StartPlaying", StartPlaying);
		EventManager.StopListening("StartReplay", StartPlaying);
	}


	private void StartPlaying(){
		foreach (GameObject duckGO in duckImageList) {
			Destroy (duckGO.gameObject);
		}
		duckImageList = new List<GameObject> ();

	}

}
