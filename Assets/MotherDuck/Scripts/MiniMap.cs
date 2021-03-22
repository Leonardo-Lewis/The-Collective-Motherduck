using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MiniMap : MonoBehaviour {
	// Use this for initialization
	void Start () {
		Vector3 startLocation = GameObject.Find ("MinimapCenter").transform.position;
		transform.position = new Vector3 (startLocation.x, transform.position.y,startLocation.z);
	}
}
