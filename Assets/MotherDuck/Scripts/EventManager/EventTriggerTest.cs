using UnityEngine;
using System.Collections;

public class EventTriggerTest : MonoBehaviour {
	
	// Update is called once per frame
	void Update () {
				if(Input.GetKeyDown(KeyCode.Q)){
						EventManager.TriggerEvent("test");
				}
	}
}
