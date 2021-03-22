using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioController : MonoBehaviour {

	public AudioClip getDuck;
	public AudioClip loseDuck;
	public AudioClip backgroundAudio;

	public AudioSource backgroundAudioSource;
	public AudioSource getDuckAudioSource;
	public AudioSource loseDuckAudioSource;


	public void PickUpDuck(){
		if (getDuckAudioSource.clip != null) {
			getDuckAudioSource.Play ();
		}
	}

	public void LoseDuck(){
		if (loseDuckAudioSource.clip != null) {
			loseDuckAudioSource.Play ();
		}
	}

	// Update is called once per frame
	void Start () {
	
		if (backgroundAudioSource) {
			backgroundAudioSource.clip = backgroundAudio;
			backgroundAudioSource.Play ();
		}

		if (getDuck) {
			getDuckAudioSource.clip = getDuck;
		}

		if (loseDuck) {
			loseDuckAudioSource.clip = loseDuck;
		}
	}
}
