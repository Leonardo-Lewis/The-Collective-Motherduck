using UnityEngine;
using System.Collections;

public class DuckSpawner : MonoBehaviour {

	public GameObject duckPrefab;
	private int roundNumber = 0;
	public int roundToSpawnDuck;


	private void StartPlaying(){
		if (++roundNumber == roundToSpawnDuck) {
			Instantiate (duckPrefab,transform.position,Quaternion.identity,GameObject.Find ("Ducks").transform);
		}
	}


	void OnEnable()
	{
		EventManager.StartListening("StartPlaying", StartPlaying);
	}

	void OnDisable()
	{
		EventManager.StopListening("StartPlaying", StartPlaying);
	}
}
