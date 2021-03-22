using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;


public class PickUpSprite : MonoBehaviour {

	public Image pickupImage;
	public List<Sprite> pickupSprites = new List<Sprite> ();
	private int framePointer = 0;
	public float timeBetweenFrames = 0.05f;
	private float timer;
	public Color particleColour = Color.blue;

	// Use this for initialization
	void Start () {
		timer = Time.time;
		pickupImage.sprite = pickupSprites [0];

	}
	
	// Update is called once per frame
	void Update () {
		if (framePointer + 1 > pickupSprites.Count) {
			this.enabled = false;
		} else {
			if (Time.time - timer > timeBetweenFrames) {
				pickupImage.sprite = pickupSprites [framePointer++];
				//transform.parent.GetComponent<Image>().color = new Color(particleColour.r,particleColour.g,particleColour.b,(((float)pickupSprites.Count-(float)framePointer)/(float)pickupSprites.Count));
				timer = Time.time;
			}
		}
	}
}
