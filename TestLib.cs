using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;
public class TestLib : MonoBehaviour {

	[DllImport("__Internal")]
	 static extern void test ();

	public GUIStyle style;
	private string ptrmsgPitch;
	private string ptrmsgRoll;
	private string ptrmsgYaw;
	// Use this for initialization
	void Start () {
		test();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	 void OnGUI(){
		test();
		GUI.Label (new Rect (0, 0, 100, 100), "this is " + ptrmsgPitch, style);
	    GUI.Label (new Rect (0,200, 100, 100), "this is " + ptrmsgRoll, style);
		GUI.Label (new Rect (0,400, 100, 100), "this is " + ptrmsgYaw, style);
	}
	 void testBtnResultPitch(string strTemp){
		ptrmsgPitch = strTemp;
	}
	void testBtnResultRoll(string strTemp){
		ptrmsgRoll = strTemp;
	}
	void testBtnResultYaw(string strTemp){
		ptrmsgYaw = strTemp;
	}
}
