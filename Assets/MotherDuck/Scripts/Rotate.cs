using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotate : MonoBehaviour {

	public float rotateSpeed = 1;

	void Start(){
		Vector3 startLocation = GameObject.Find ("RotationCamCenter").transform.position;
		transform.position = new Vector3 (startLocation.x, transform.position.y,startLocation.z);
	}

	// Update is called once per frame
	void Update () {
		transform.Rotate(Vector3.up * Time.deltaTime * rotateSpeed);
	}
}
