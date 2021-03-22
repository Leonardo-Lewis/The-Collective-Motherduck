using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TriggerToggle : MonoBehaviour {

	public enum ToggleType{ turnOn, turnOff, toggle }

	public GameObject toggleObject;
	public ToggleType toggleType;

	void OnTriggerEnter (Collider other)
	{
		if (other.tag == "Player")
		{
			if (toggleType == ToggleType.turnOn)
				toggleObject.SetActive (true);
			else if (toggleType == ToggleType.turnOff)
				toggleObject.SetActive (false);
			else if (toggleType == ToggleType.toggle)
				toggleObject.SetActive (!toggleObject.activeSelf);
		}
		
	}
}
