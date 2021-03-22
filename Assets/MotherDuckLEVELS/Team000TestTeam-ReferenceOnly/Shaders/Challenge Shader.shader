// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Challenge Shader"
{
	Properties
	{
		_Clouds("Clouds", 2D) = "white" {}
		_Grass("Grass", 2D) = "white" {}
		_Slate("Slate", 2D) = "white" {}
		_Float0("Float 0", Range( 0 , 20)) = 0
		_PushValue("Push Value", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Grass;
		uniform float4 _Grass_ST;
		uniform sampler2D _Clouds;
		uniform float4 _Clouds_ST;
		uniform float _Float0;
		uniform float _PushValue;
		uniform sampler2D _Slate;
		uniform float4 _Slate_ST;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_vertexNormal = v.normal.xyz;
			float2 uv_Grass = v.texcoord * _Grass_ST.xy + _Grass_ST.zw;
			float2 uv_Clouds = v.texcoord * _Clouds_ST.xy + _Clouds_ST.zw;
			float clampResult11 = clamp( ( tex2Dlod( _Clouds, float4( uv_Clouds, 0, 0.0) ).r * ( _Float0 * (0.0 + (_SinTime.z - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) ) , 0.0 , 1.0 );
			float temp_output_15_0 = round( clampResult11 );
			float4 temp_output_6_0 = ( tex2Dlod( _Grass, float4( uv_Grass, 0, 0.0) ) * temp_output_15_0 );
			float3 desaturateInitialColor22 = temp_output_6_0.rgb;
			float desaturateDot22 = dot( desaturateInitialColor22, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar22 = lerp( desaturateInitialColor22, desaturateDot22.xxx, 0.0 );
			v.vertex.xyz += ( ase_vertexNormal * desaturateVar22 * _PushValue );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Grass = i.uv_texcoord * _Grass_ST.xy + _Grass_ST.zw;
			float2 uv_Clouds = i.uv_texcoord * _Clouds_ST.xy + _Clouds_ST.zw;
			float clampResult11 = clamp( ( tex2D( _Clouds, uv_Clouds ).r * ( _Float0 * (0.0 + (_SinTime.z - -1.0) * (1.0 - 0.0) / (1.0 - -1.0)) ) ) , 0.0 , 1.0 );
			float temp_output_15_0 = round( clampResult11 );
			float4 temp_output_6_0 = ( tex2D( _Grass, uv_Grass ) * temp_output_15_0 );
			float2 uv_Slate = i.uv_texcoord * _Slate_ST.xy + _Slate_ST.zw;
			o.Albedo = ( temp_output_6_0 + ( ( 1.0 - temp_output_15_0 ) * tex2D( _Slate, uv_Slate ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18000
0;0;1920;1019;1231.831;856.0192;1.380576;True;False
Node;AmplifyShaderEditor.SinTimeNode;17;-1068.903,245.6716;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;4;-1040.392,132.0919;Inherit;False;Property;_Float0;Float 0;3;0;Create;True;0;0;False;0;0;20;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;19;-844.1666,324.8819;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-907.4224,-129.8251;Inherit;True;Property;_Clouds;Clouds;0;0;Create;True;0;0;False;0;-1;33c58a1c40ebefa44beeef6cdf1087d3;33c58a1c40ebefa44beeef6cdf1087d3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;18;-648.9038,149.8823;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-496.2734,-15.32194;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;11;-267.376,-66.49427;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-332.9849,-434.6338;Inherit;True;Property;_Grass;Grass;1;0;Create;True;0;0;False;0;-1;90c11759a0344ec4680daab03422d4e9;90c11759a0344ec4680daab03422d4e9;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RoundOpNode;15;-45.19191,-24.72048;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-324.6295,364.9728;Inherit;True;Property;_Slate;Slate;2;0;Create;True;0;0;False;0;-1;b5adb3b5120ccee4297c295be6d41181;b5adb3b5120ccee4297c295be6d41181;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;7;125.1927,82.70866;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;306.5233,-115.1551;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;331.4775,210.3002;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;22;480.0829,-295.5052;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;20;478.7025,-506.7335;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;23;504.9335,-169.8727;Inherit;False;Property;_PushValue;Push Value;4;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;729.9675,-349.3477;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;9;531.0071,39.72074;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1029.543,-111.4485;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Challenge Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;19;0;17;3
WireConnection;18;0;4;0
WireConnection;18;1;19;0
WireConnection;5;0;1;1
WireConnection;5;1;18;0
WireConnection;11;0;5;0
WireConnection;15;0;11;0
WireConnection;7;0;15;0
WireConnection;6;0;2;0
WireConnection;6;1;15;0
WireConnection;8;0;7;0
WireConnection;8;1;3;0
WireConnection;22;0;6;0
WireConnection;21;0;20;0
WireConnection;21;1;22;0
WireConnection;21;2;23;0
WireConnection;9;0;6;0
WireConnection;9;1;8;0
WireConnection;0;0;9;0
WireConnection;0;11;21;0
ASEEND*/
//CHKSM=ABC214A344AECC23D18950E08F763B06B91A6932