using UnityEngine;
using System.Collections;
using UnityEngine.Events;

public class Test1 : MonoBehaviour {

//		private UnityAction someListener;
//	
//		void Awake()
//		{
//				someListener = new UnityAction(SomeFunction);
//		}

		void OnEnable()
		{
				EventManager.StartListening("test", SomeFunction);
		}

		void OnDisable()
		{
				EventManager.StopListening("test",SomeFunction);
		}

		void SomeFunction()
		{
				Debug.Log("HERE");
		}
}
