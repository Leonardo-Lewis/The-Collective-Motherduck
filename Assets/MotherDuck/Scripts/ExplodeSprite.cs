using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;


public class ExplodeSprite : MonoBehaviour {

	public Image explodeImage;
	public List<Sprite> explodeSprites = new List<Sprite> ();
	private int framePointer = 0;
	public float timeBetweenFrames = 0.05f;
	private float timer;
	public Color particleColour;

	// Use this for initialization
	void Start () {
		timer = Time.time;
		explodeImage.sprite = explodeSprites [0];
		transform.parent.GetComponent<Outline> ().enabled = false;
		//GetComponent<Image> ().color = particleColour;
	}
	
	// Update is called once per frame
	void Update () {
		if (framePointer + 1 > explodeSprites.Count) {
			Destroy (this.transform.parent.gameObject);
		} else {
			if (Time.time - timer > timeBetweenFrames) {
				explodeImage.sprite = explodeSprites [framePointer++];
				transform.parent.GetComponent<Image>().color = new Color(particleColour.r,particleColour.g,particleColour.b,(((float)explodeSprites.Count-(float)framePointer)/(float)explodeSprites.Count));

				//GetComponentInParent<Image>().color = Color.black;
				timer = Time.time;
			}
		}
	}
}
