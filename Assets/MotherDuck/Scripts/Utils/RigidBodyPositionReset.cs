using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RigidBodyPositionReset : MonoBehaviour {

	private Vector3 startPosition;
	private Quaternion startRotation;

	// Use this for initialization
	void Start () {
		startPosition = transform.position;
		startRotation = transform.rotation;
	}

	private void ResetObject(){
		transform.position = startPosition;
		transform.rotation = startRotation;
	}

	void OnEnable()
	{
		EventManager.StartListening("StartPlaying", ResetObject);
	}

	void OnDisable()
	{
		EventManager.StopListening("StartPlaying", ResetObject);
	}
}
