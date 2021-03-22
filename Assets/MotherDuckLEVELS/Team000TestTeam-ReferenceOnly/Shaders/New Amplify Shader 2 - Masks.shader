// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader 2 - Masks"
{
	Properties
	{
		_Mask("Mask", 2D) = "white" {}
		_WoodDeck("WoodDeck", 2D) = "white" {}
		_Color0("Color 0", Color) = (0,0,0,0)
		_Color1("Color 0", Color) = (0,0,0,0)
		_Color2("Color 0", Color) = (0,0,0,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Color0;
		uniform sampler2D _Mask;
		uniform float4 _Mask_ST;
		uniform float4 _Color1;
		uniform float4 _Color2;
		uniform sampler2D _WoodDeck;
		uniform float4 _WoodDeck_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Mask = i.uv_texcoord * _Mask_ST.xy + _Mask_ST.zw;
			float4 tex2DNode1 = tex2D( _Mask, uv_Mask );
			float2 uv_WoodDeck = i.uv_texcoord * _WoodDeck_ST.xy + _WoodDeck_ST.zw;
			o.Albedo = ( ( _Color0 * tex2DNode1.r ) + ( _Color1 * tex2DNode1.g ) + ( _Color2 * tex2DNode1.b ) + tex2D( _WoodDeck, uv_WoodDeck ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18000
259;62;1524;893;1647.599;1040.56;1.79354;True;False
Node;AmplifyShaderEditor.SamplerNode;1;-828.4888,-257.5153;Inherit;True;Property;_Mask;Mask;0;0;Create;True;0;0;False;0;-1;2d1edb4ab6c0b2c42a3063eea06b8d41;2d1edb4ab6c0b2c42a3063eea06b8d41;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;4;-739.6865,-835.7747;Inherit;False;Property;_Color0;Color 0;2;0;Create;True;0;0;False;0;0,0,0,0;1,0.4086607,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;10;-742.7582,-645.0846;Inherit;False;Property;_Color1;Color 0;3;0;Create;True;0;0;False;0;0,0,0,0;1,0.4086607,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;12;-739.1712,-463.9369;Inherit;False;Property;_Color2;Color 0;4;0;Create;True;0;0;False;0;0,0,0,0;1,0.4086607,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-823.9831,77.13647;Inherit;True;Property;_WoodDeck;WoodDeck;1;0;Create;True;0;0;False;0;-1;31e660d88882f164b96fa2e73cc61aa5;31e660d88882f164b96fa2e73cc61aa5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-106.5674,-672.5627;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-109.6392,-481.8724;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-106.0521,-300.7248;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;383.0689,-286.952;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;719.2093,-238.5407;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;New Amplify Shader 2 - Masks;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;3;0;4;0
WireConnection;3;1;1;1
WireConnection;11;0;10;0
WireConnection;11;1;1;2
WireConnection;13;0;12;0
WireConnection;13;1;1;3
WireConnection;5;0;3;0
WireConnection;5;1;11;0
WireConnection;5;2;13;0
WireConnection;5;3;2;0
WireConnection;0;0;5;0
ASEEND*/
//CHKSM=FA0402E139BA0F14345D020E46114EC644CA5029