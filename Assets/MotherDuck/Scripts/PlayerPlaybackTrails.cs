using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PlayerPlaybackTrails : MonoBehaviour {

	private TimeRecorder tr;
	public LineRenderer lineRender;
	private int linePointer = 1;

	// Use this for initialization
	void Start () {
		lineRender.SetPosition (0,transform.position + Vector3.up);
	}
	
	// Update is called once per frame
	void Update () {
		lineRender.SetPosition (linePointer,transform.position + Vector3.up);
	}

	public void init(Material mat){
		lineRender.material = mat;
	}

	public void AddLineRenderPosition(Vector3 point){
		lineRender.positionCount = linePointer + 2;
		//lineRender.SetVertexCount (linePointer + 2);
		lineRender.SetPosition (linePointer++,point + Vector3.up);
	}

	public void ResetTrail(){
		linePointer = 1;
		lineRender.positionCount = 2;
		//lineRender.SetVertexCount (2);

	}
}
