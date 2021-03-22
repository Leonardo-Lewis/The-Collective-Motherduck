using UnityEngine;
using System.Collections;
using UnityEngine.UI;


public class ScorePointer : MonoBehaviour {

	public Text roundText;


	public void Init(int roundNumber,float score){

		roundText.text = roundNumber.ToString();
		float rotationValue = (score - 0.5f) * -360;
		transform.localPosition = Vector3.zero;
		transform.rotation = Quaternion.Euler(new Vector3 (0, 0, rotationValue));
	}
}
