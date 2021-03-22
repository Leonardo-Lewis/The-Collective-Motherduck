using UnityEngine;
using System.Collections;
using XboxCtrlrInput;

[RequireComponent (typeof (Rigidbody))]
[RequireComponent (typeof (CapsuleCollider))]

public class PlayerController : MonoBehaviour {

	//Head Movement
	private enum RotationAxes { MouseXAndY = 0, MouseX = 1, MouseY = 2 }
	private RotationAxes axes = RotationAxes.MouseXAndY;
	public Transform head;

//	private float minimumX = 0f;
//	private float maximumX = 360f;
	public float minimumY = -50f;
	public float maximumY = 45f;

	public float mouseSensitivityX = 2.5f;
	public float mouseSensitivityY = 2.5f;
	private float rotationY = 0f;

	//Body Movement
	public float walkSpeed = 25;
	private float runSpeed = 10;
	public float strafeSpeed = 5;
	public float gravity = 20;
	public float jumpHeight = 2;
	public bool canJump = true;
	private bool isRunning = false;
	private bool isGrounded = false;
	//public float charSkin = 1f;
	private XboxController controllerNumber = XboxController.All;

//	private bool testBoolSpeedOnDuckage = false;
//	public float testDuckSpeedModifier = 0.15f;
//	private float testDefaultWalkSpeed = 6;

	public float minimumYValue;
	public Vector3 startPostion;
	public Quaternion startRotation;
//
//	public void TestUpdateDuckCount(int count){
//		if (testBoolSpeedOnDuckage){
//			walkSpeed = testDefaultWalkSpeed - (testDuckSpeedModifier * count);
//			Debug.Log (walkSpeed);
//		}
//	}


	    public bool IsRunning
	    {
	        get { return isRunning; }
	    }
		
	public void Init(int teamNumber,int playerNumber){
		if(teamNumber == 1){
			controllerNumber = XboxController.First;
		}else if(teamNumber == 2){
			controllerNumber = XboxController.Second;
		}else if(teamNumber == 3){
			controllerNumber = XboxController.Third;
		}else if(teamNumber == 4){
			controllerNumber = XboxController.Fourth;
		}
	}

	public void LogStartingPosition(){
		startPostion = transform.position;
		startRotation = transform.rotation;
	}

	void Awake () 
	{
		minimumYValue = GameObject.Find ("Y-DepthResetPlayer").transform.position.y;

		GetComponent<Rigidbody>().freezeRotation = true;
		GetComponent<Rigidbody>().useGravity = false;

		// Make the rigid body not change rotation
		if (GetComponent<Rigidbody> ()) {
			GetComponent<Rigidbody> ().freezeRotation = true;
		}

		UnityEngine.Cursor.visible = false;
		Cursor.lockState = CursorLockMode.Locked;
	}
	
	void FixedUpdate () 
	{
		// get correct speed
		float forwardAndBackSpeed = walkSpeed;

        // if running, set run speed
		if (isRunning) {
			forwardAndBackSpeed = runSpeed;
		}

		// calculate how fast it should be moving
		//Vector3 targetVelocity = new Vector3(CheckMoveDirection(XCI.GetAxis(XboxAxis.LeftStickX,controllerNumber),transform.right) * strafeSpeed, 0,CheckMoveDirection(XCI.GetAxis(XboxAxis.LeftStickY,controllerNumber),transform.forward)* forwardAndBackSpeed);
		Vector3 targetVelocity = new Vector3(XCI.GetAxis(XboxAxis.LeftStickX,controllerNumber) * strafeSpeed, 0, XCI.GetAxis(XboxAxis.LeftStickY,controllerNumber) * forwardAndBackSpeed);


        /////
        ///// Hacked in keyboard movement for both players (at the same time)
        /////
        ///
        Vector3 targetVelocityHack = new Vector3(0, 0, 0);
        if (gameObject.GetComponent<TimeRecorder>().playerNumber == 1)
        {
            if (Input.GetKey(KeyCode.W))
            {
                targetVelocityHack = new Vector3(targetVelocityHack.x, 0, 1 * forwardAndBackSpeed);
            }
            if (Input.GetKey(KeyCode.S))
            {
                targetVelocityHack = new Vector3(targetVelocityHack.x, 0, -1 * forwardAndBackSpeed);
            }

        }

        if (gameObject.GetComponent<TimeRecorder>().playerNumber == 2)
        {
            if (Input.GetKey(KeyCode.UpArrow))
            {
                targetVelocityHack = new Vector3(targetVelocityHack.x, 0, 1 * forwardAndBackSpeed);
            }
            if (Input.GetKey(KeyCode.DownArrow))
            {
                targetVelocityHack = new Vector3(targetVelocityHack.x, 0, -1 * forwardAndBackSpeed);
            }
        }



        /////
        ///// Hacked in keyboard movement for both players (at the same time) --> + targetVelocityHack
        /////
        targetVelocity = transform.TransformDirection(targetVelocity + targetVelocityHack);

        // apply a force that attempts to reach our target velocity
        Vector3 velocity = GetComponent<Rigidbody>().velocity;
		Vector3 velocityChange = (targetVelocity - velocity);
		velocityChange.y = 0;
		GetComponent<Rigidbody>().AddForce(velocityChange, ForceMode.VelocityChange);


        // jump

        /////
        ///// Hacked in keyboard movement for both players (at the same time) --> ||Input.GetKeyDown(KeyCode.Space)) ||Input.GetKeyDown(KeyCode.RightControl))
        /////
        ///

        if (gameObject.GetComponent<TimeRecorder>().playerNumber == 1)
        {
            if (canJump && isGrounded && (XCI.GetButton(XboxButton.A, controllerNumber) || Input.GetKeyDown(KeyCode.Space)))
            {
                GetComponent<Rigidbody>().velocity = new Vector3(velocity.x, Mathf.Sqrt(2 * jumpHeight * gravity), velocity.z);
                isGrounded = false;
            }
        }
        if (gameObject.GetComponent<TimeRecorder>().playerNumber == 2)
        {
            if (canJump && isGrounded && (XCI.GetButton(XboxButton.A, controllerNumber) || Input.GetKeyDown(KeyCode.RightControl)))
            {
                GetComponent<Rigidbody>().velocity = new Vector3(velocity.x, Mathf.Sqrt(2 * jumpHeight * gravity), velocity.z);
                isGrounded = false;
            }
        }

        // apply gravity
        GetComponent<Rigidbody>().AddForce(new Vector3 (0, -gravity * GetComponent<Rigidbody>().mass, 0));
	}

	public void ResetPlayer(){
		transform.position = startPostion;
		transform.rotation = startRotation;
		GetComponent<PlayerDuckManager> ().LoseAllDucks ();
		GetComponent<TimeRecorder> ().InsertReset ();
	}


	void Update()
	{
		MoveHead ();
		MoveBody ();

		if (Input.GetKey (KeyCode.Escape)) {
			UnityEngine.Cursor.visible = true;
			Cursor.lockState = CursorLockMode.None;
		}

		if (transform.position.y < minimumYValue) {
			ResetPlayer ();
		}

//		if (Input.GetKeyDown (KeyCode.N)) {
//			
//			if(!testBoolSpeedOnDuckage){
//				testBoolSpeedOnDuckage = true;
//				Debug.Log ("Speed change on Duckage on");
//			} else {
//				testBoolSpeedOnDuckage = false;
//				Debug.Log ("Speed change on Duckage off");
//			}
//		}
	}

	private void MoveHead()
	{
		if (axes == RotationAxes.MouseXAndY)
		{
			float rotationX = transform.localEulerAngles.y  + XCI.GetAxis(XboxAxis.RightStickX,controllerNumber) * mouseSensitivityX * Time.deltaTime * 60 ;


			rotationY +=  XCI.GetAxis(XboxAxis.RightStickY,controllerNumber) * mouseSensitivityY;

            /////
            ///// Hacked in mouse movement for both players (at the same time)
            /////
            rotationY += Input.GetAxis("Mouse Y") * mouseSensitivityY;


            rotationY = Mathf.Clamp (rotationY, minimumY, maximumY);

			transform.localEulerAngles = new Vector3(0, rotationX, 0);
			head.localEulerAngles = new Vector3(-rotationY,0,0);

            /////
            ///// Hacked in mouse movement for both players (at the same time)
            /////
            ///
            if (gameObject.GetComponent<TimeRecorder>().playerNumber == 1)
            {

                if (Input.GetKey(KeyCode.A))
                {
                    transform.Rotate(0, -1 * mouseSensitivityX, 0);
                }
                if (Input.GetKey(KeyCode.D))
                {
                    transform.Rotate(0, 1 * mouseSensitivityX, 0);
                }
            }

            if (gameObject.GetComponent<TimeRecorder>().playerNumber == 2)
            {

                if (Input.GetKey(KeyCode.LeftArrow))
                {
                    transform.Rotate(0, -1 * mouseSensitivityX, 0);
                }
                if (Input.GetKey(KeyCode.RightArrow))
                {
                    transform.Rotate(0, 1 * mouseSensitivityX, 0);
                }
            }
            transform.Rotate(0, Input.GetAxis("Mouse X") * mouseSensitivityX, 0);
        }
		else if (axes == RotationAxes.MouseX)
		{
			transform.Rotate(0, XCI.GetAxis(XboxAxis.RightStickX,controllerNumber) * mouseSensitivityX , 0);
		}
		else
		{
			rotationY +=  + XCI.GetAxis(XboxAxis.RightStickX,controllerNumber) * mouseSensitivityY  /3;
			rotationY = Mathf.Clamp (rotationY, minimumY, maximumY);

			transform.localEulerAngles = new Vector3(-rotationY, transform.localEulerAngles.y, 0);
		}
	}

	private void MoveBody()
	{
		// check if the player is touching a surface below them
		CheckGrounded();

		// check if the player is running
		if (isGrounded && Input.GetKeyDown(KeyCode.LeftShift)) {
			isRunning = true;
		}

		// check if the player stops running
		if (Input.GetKeyUp(KeyCode.LeftShift)) {
			isRunning = false;
		}
	}
		
	private void CheckGrounded() 
	{
        /* ==============
         * REMEMBER
         * ==============
         * If you change the size of the prefab, you may have
         * to change the length of the ray to ensure it hits
         * the ground.
         * 
         * All obstacles/walls/floors must have rigidbodies
         * attached to them. If not, Unity physics may get
         * confused and the player can jump really high
         * when in a corner between 2 walls for example.
         */
        float rayLength = 1f;
        RaycastHit hit;
        Ray ray = new Ray(transform.position, -transform.up);
 		Debug.DrawRay(ray.origin, ray.direction * rayLength);
        // if there is something directly below the player
        if (Physics.Raycast(ray, out hit, rayLength)) {
			if (hit.transform.tag != "duck") {
				isGrounded = true;
			}
        }
	}


}
