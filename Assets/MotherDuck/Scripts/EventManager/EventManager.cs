using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.Events;

public class EventManager : MonoBehaviour {

	private Dictionary <string, UnityEvent> eventDictionary;
	private static EventManager eventManager;
	private static EventManager instance
	{
		get
		{
			if (!eventManager)
			{
					eventManager = FindObjectOfType (typeof(EventManager)) as EventManager;

					if (!eventManager)
					{
							Debug.LogError("There needs to be an active EventManager in the scene.");
					}
					else
					{
							eventManager.Init();
					}
			}
			return eventManager;
		}
	}

	void Init ()
	{
		if (eventDictionary == null)
		{
			eventDictionary = new Dictionary<string, UnityEvent>();
		}
	}


	//start Listening
	public static void StartListening(string eventName, UnityAction listener)
	{
		UnityEvent thisEvent = null;
		if (instance.eventDictionary.TryGetValue(eventName,out thisEvent))
		{
				thisEvent.AddListener(listener);

		}
		else
		{
				thisEvent = new UnityEvent();
				thisEvent.AddListener(listener);
				instance.eventDictionary.Add(eventName,thisEvent);
		}
	}

	//stop Listening
	public static void StopListening(string eventName, UnityAction listener)
	{
			if(eventManager == null) return;
			UnityEvent thisEvent = null;
			if (instance.eventDictionary.TryGetValue(eventName,out thisEvent))
			{
					thisEvent.RemoveListener(listener);
			}
	}

	//trigger event
	public static void TriggerEvent(string eventName)
	{
			UnityEvent thisEvent = null;
			if (instance.eventDictionary.TryGetValue(eventName,out thisEvent))
			{
					thisEvent.Invoke();
			}
	}

}
