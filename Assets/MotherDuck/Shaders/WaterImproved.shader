// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.36 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.36;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.4022492,fgcg:0.7035558,fgcb:0.8823529,fgca:1,fgde:0.005,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:2865,x:34243,y:32360,varname:node_2865,prsc:2|diff-6350-RGB,spec-358-OUT,gloss-5132-OUT,normal-7007-OUT;n:type:ShaderForge.SFN_Slider,id:358,x:33478,y:32369,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:node_358,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.6;n:type:ShaderForge.SFN_Slider,id:1813,x:33478,y:32475,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Metallic_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:2;n:type:ShaderForge.SFN_Panner,id:8106,x:32671,y:32358,varname:node_8106,prsc:2,spu:0.05,spv:0.2|UVIN-7682-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:3242,x:32195,y:32164,varname:node_3242,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:3961,x:33156,y:32358,ptovrint:False,ptlb:node_3961,ptin:_node_3961,varname:node_3961,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b21ff3fd64fecaf46b2ee2e3c9cf0840,ntxv:0,isnm:False|UVIN-3474-OUT;n:type:ShaderForge.SFN_Append,id:4593,x:33400,y:32624,varname:node_4593,prsc:2|A-3961-G,B-3348-R,C-8733-B;n:type:ShaderForge.SFN_Panner,id:9472,x:32671,y:32607,varname:node_9472,prsc:2,spu:-0.05,spv:0.15|UVIN-9354-UVOUT;n:type:ShaderForge.SFN_Panner,id:6659,x:32671,y:32859,varname:node_6659,prsc:2,spu:0.07,spv:0.1|UVIN-1357-UVOUT;n:type:ShaderForge.SFN_Normalize,id:7007,x:33580,y:32624,varname:node_7007,prsc:2|IN-4593-OUT;n:type:ShaderForge.SFN_Tex2d,id:3348,x:33156,y:32607,ptovrint:False,ptlb:node_3961_copy,ptin:_node_3961_copy,varname:_node_3961_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b21ff3fd64fecaf46b2ee2e3c9cf0840,ntxv:0,isnm:False|UVIN-7215-OUT;n:type:ShaderForge.SFN_Tex2d,id:8733,x:33156,y:32859,ptovrint:False,ptlb:node_3961_copy_copy,ptin:_node_3961_copy_copy,varname:_node_3961_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b21ff3fd64fecaf46b2ee2e3c9cf0840,ntxv:0,isnm:False|UVIN-4554-OUT;n:type:ShaderForge.SFN_Color,id:6350,x:33544,y:32127,ptovrint:False,ptlb:node_6350,ptin:_node_6350,varname:node_6350,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_UVTile,id:7682,x:32509,y:32358,varname:node_7682,prsc:2|UVIN-3242-UVOUT,WDT-3184-OUT,HGT-6333-OUT,TILE-4833-OUT;n:type:ShaderForge.SFN_Vector1,id:3184,x:32228,y:32347,varname:node_3184,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6333,x:32228,y:32418,varname:node_6333,prsc:2,v1:0.2;n:type:ShaderForge.SFN_UVTile,id:9354,x:32509,y:32607,varname:node_9354,prsc:2|UVIN-3242-UVOUT,WDT-2457-OUT,HGT-9319-OUT,TILE-4833-OUT;n:type:ShaderForge.SFN_Vector1,id:2457,x:32228,y:32597,varname:node_2457,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:9319,x:32228,y:32668,varname:node_9319,prsc:2,v1:0.5;n:type:ShaderForge.SFN_UVTile,id:1357,x:32509,y:32859,varname:node_1357,prsc:2|UVIN-3242-UVOUT,WDT-3540-OUT,HGT-6203-OUT,TILE-4833-OUT;n:type:ShaderForge.SFN_Vector1,id:3540,x:32228,y:32854,varname:node_3540,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6203,x:32228,y:32925,varname:node_6203,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Vector1,id:4833,x:32179,y:32491,varname:node_4833,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:3474,x:32995,y:32358,varname:node_3474,prsc:2|A-8106-UVOUT,B-5843-OUT;n:type:ShaderForge.SFN_Multiply,id:7215,x:32995,y:32607,varname:node_7215,prsc:2|A-9472-UVOUT,B-1572-OUT;n:type:ShaderForge.SFN_Multiply,id:4554,x:32995,y:32859,varname:node_4554,prsc:2|A-6659-UVOUT,B-5347-OUT;n:type:ShaderForge.SFN_Vector1,id:5843,x:32815,y:32392,varname:node_5843,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Vector1,id:1572,x:32815,y:32641,varname:node_1572,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Vector1,id:5347,x:32815,y:32882,varname:node_5347,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Fresnel,id:2402,x:33558,y:31898,varname:node_2402,prsc:2|NRM-7007-OUT,EXP-1485-OUT;n:type:ShaderForge.SFN_Multiply,id:7160,x:33948,y:31698,varname:node_7160,prsc:2|A-8804-OUT,B-1813-OUT;n:type:ShaderForge.SFN_Time,id:3943,x:33141,y:31569,varname:node_3943,prsc:2;n:type:ShaderForge.SFN_Sin,id:6711,x:33512,y:31529,varname:node_6711,prsc:2|IN-9066-OUT;n:type:ShaderForge.SFN_Multiply,id:3770,x:33727,y:31529,varname:node_3770,prsc:2|A-1719-OUT,B-6711-OUT;n:type:ShaderForge.SFN_Vector1,id:1719,x:33727,y:31440,varname:node_1719,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Multiply,id:3069,x:34181,y:31612,varname:node_3069,prsc:2|A-4857-OUT,B-7160-OUT;n:type:ShaderForge.SFN_Multiply,id:9066,x:33339,y:31529,varname:node_9066,prsc:2|A-4945-OUT,B-3943-T;n:type:ShaderForge.SFN_Vector1,id:4945,x:33141,y:31503,varname:node_4945,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Add,id:4857,x:33948,y:31529,varname:node_4857,prsc:2|A-5412-OUT,B-3770-OUT;n:type:ShaderForge.SFN_Vector1,id:5412,x:33948,y:31440,varname:node_5412,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:1485,x:33339,y:31864,varname:node_1485,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Fresnel,id:8804,x:33558,y:31715,varname:node_8804,prsc:2|EXP-1946-OUT;n:type:ShaderForge.SFN_Vector1,id:1946,x:33339,y:31715,varname:node_1946,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:2421,x:33899,y:32011,varname:node_2421,prsc:2|A-2402-OUT,B-2402-OUT,C-2402-OUT,D-2402-OUT,E-2402-OUT;n:type:ShaderForge.SFN_Add,id:5132,x:34266,y:31857,varname:node_5132,prsc:2|A-3069-OUT,B-7238-OUT,C-7238-OUT,D-7238-OUT;n:type:ShaderForge.SFN_Multiply,id:7238,x:34071,y:31897,varname:node_7238,prsc:2|A-2402-OUT,B-2402-OUT,C-2402-OUT,D-2402-OUT,E-2421-OUT;proporder:358-1813-3961-3348-8733-6350;pass:END;sub:END;*/

Shader "Shader Forge/WaterImproved" {
    Properties {
        _Metallic ("Metallic", Range(0, 0.6)) = 0
        _Gloss ("Gloss", Range(0, 2)) = 2
        _node_3961 ("node_3961", 2D) = "white" {}
        _node_3961_copy ("node_3961_copy", 2D) = "white" {}
        _node_3961_copy_copy ("node_3961_copy_copy", 2D) = "white" {}
        _node_6350 ("node_6350", Color) = (0,0,0,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _Metallic;
            uniform float _Gloss;
            uniform sampler2D _node_3961; uniform float4 _node_3961_ST;
            uniform sampler2D _node_3961_copy; uniform float4 _node_3961_copy_ST;
            uniform sampler2D _node_3961_copy_copy; uniform float4 _node_3961_copy_copy_ST;
            uniform float4 _node_6350;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_1030 = _Time + _TimeEditor;
                float node_3184 = 1.0;
                float node_4833 = 1.0;
                float2 node_7682_tc_rcp = float2(1.0,1.0)/float2( node_3184, 0.2 );
                float node_7682_ty = floor(node_4833 * node_7682_tc_rcp.x);
                float node_7682_tx = node_4833 - node_3184 * node_7682_ty;
                float2 node_7682 = (i.uv0 + float2(node_7682_tx, node_7682_ty)) * node_7682_tc_rcp;
                float2 node_3474 = ((node_7682+node_1030.g*float2(0.05,0.2))*0.2);
                float4 _node_3961_var = tex2D(_node_3961,TRANSFORM_TEX(node_3474, _node_3961));
                float node_2457 = 1.0;
                float2 node_9354_tc_rcp = float2(1.0,1.0)/float2( node_2457, 0.5 );
                float node_9354_ty = floor(node_4833 * node_9354_tc_rcp.x);
                float node_9354_tx = node_4833 - node_2457 * node_9354_ty;
                float2 node_9354 = (i.uv0 + float2(node_9354_tx, node_9354_ty)) * node_9354_tc_rcp;
                float2 node_7215 = ((node_9354+node_1030.g*float2(-0.05,0.15))*0.1);
                float4 _node_3961_copy_var = tex2D(_node_3961_copy,TRANSFORM_TEX(node_7215, _node_3961_copy));
                float node_3540 = 1.0;
                float2 node_1357_tc_rcp = float2(1.0,1.0)/float2( node_3540, 0.8 );
                float node_1357_ty = floor(node_4833 * node_1357_tc_rcp.x);
                float node_1357_tx = node_4833 - node_3540 * node_1357_ty;
                float2 node_1357 = (i.uv0 + float2(node_1357_tx, node_1357_ty)) * node_1357_tc_rcp;
                float2 node_4554 = ((node_1357+node_1030.g*float2(0.07,0.1))*0.1);
                float4 _node_3961_copy_copy_var = tex2D(_node_3961_copy_copy,TRANSFORM_TEX(node_4554, _node_3961_copy_copy));
                float3 node_7007 = normalize(float3(_node_3961_var.g,_node_3961_copy_var.r,_node_3961_copy_copy_var.b));
                float3 normalLocal = node_7007;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 node_3943 = _Time + _TimeEditor;
                float node_2402 = pow(1.0-max(0,dot(node_7007, viewDirection)),0.5);
                float node_7238 = (node_2402*node_2402*node_2402*node_2402*(node_2402*node_2402*node_2402*node_2402*node_2402));
                float gloss = (((0.5+(0.3*sin((0.01*node_3943.g))))*(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_Gloss))+node_7238+node_7238+node_7238);
                float perceptualRoughness = 1.0 - (((0.5+(0.3*sin((0.01*node_3943.g))))*(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_Gloss))+node_7238+node_7238+node_7238);
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = _Metallic;
                float specularMonochrome;
                float3 diffuseColor = _node_6350.rgb; // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                half surfaceReduction;
                #ifdef UNITY_COLORSPACE_GAMMA
                    surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;
                #else
                    surfaceReduction = 1.0/(roughness*roughness + 1.0);
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                indirectSpecular *= surfaceReduction;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _Metallic;
            uniform float _Gloss;
            uniform sampler2D _node_3961; uniform float4 _node_3961_ST;
            uniform sampler2D _node_3961_copy; uniform float4 _node_3961_copy_ST;
            uniform sampler2D _node_3961_copy_copy; uniform float4 _node_3961_copy_copy_ST;
            uniform float4 _node_6350;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_1509 = _Time + _TimeEditor;
                float node_3184 = 1.0;
                float node_4833 = 1.0;
                float2 node_7682_tc_rcp = float2(1.0,1.0)/float2( node_3184, 0.2 );
                float node_7682_ty = floor(node_4833 * node_7682_tc_rcp.x);
                float node_7682_tx = node_4833 - node_3184 * node_7682_ty;
                float2 node_7682 = (i.uv0 + float2(node_7682_tx, node_7682_ty)) * node_7682_tc_rcp;
                float2 node_3474 = ((node_7682+node_1509.g*float2(0.05,0.2))*0.2);
                float4 _node_3961_var = tex2D(_node_3961,TRANSFORM_TEX(node_3474, _node_3961));
                float node_2457 = 1.0;
                float2 node_9354_tc_rcp = float2(1.0,1.0)/float2( node_2457, 0.5 );
                float node_9354_ty = floor(node_4833 * node_9354_tc_rcp.x);
                float node_9354_tx = node_4833 - node_2457 * node_9354_ty;
                float2 node_9354 = (i.uv0 + float2(node_9354_tx, node_9354_ty)) * node_9354_tc_rcp;
                float2 node_7215 = ((node_9354+node_1509.g*float2(-0.05,0.15))*0.1);
                float4 _node_3961_copy_var = tex2D(_node_3961_copy,TRANSFORM_TEX(node_7215, _node_3961_copy));
                float node_3540 = 1.0;
                float2 node_1357_tc_rcp = float2(1.0,1.0)/float2( node_3540, 0.8 );
                float node_1357_ty = floor(node_4833 * node_1357_tc_rcp.x);
                float node_1357_tx = node_4833 - node_3540 * node_1357_ty;
                float2 node_1357 = (i.uv0 + float2(node_1357_tx, node_1357_ty)) * node_1357_tc_rcp;
                float2 node_4554 = ((node_1357+node_1509.g*float2(0.07,0.1))*0.1);
                float4 _node_3961_copy_copy_var = tex2D(_node_3961_copy_copy,TRANSFORM_TEX(node_4554, _node_3961_copy_copy));
                float3 node_7007 = normalize(float3(_node_3961_var.g,_node_3961_copy_var.r,_node_3961_copy_copy_var.b));
                float3 normalLocal = node_7007;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float4 node_3943 = _Time + _TimeEditor;
                float node_2402 = pow(1.0-max(0,dot(node_7007, viewDirection)),0.5);
                float node_7238 = (node_2402*node_2402*node_2402*node_2402*(node_2402*node_2402*node_2402*node_2402*node_2402));
                float gloss = (((0.5+(0.3*sin((0.01*node_3943.g))))*(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_Gloss))+node_7238+node_7238+node_7238);
                float perceptualRoughness = 1.0 - (((0.5+(0.3*sin((0.01*node_3943.g))))*(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_Gloss))+node_7238+node_7238+node_7238);
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = _Metallic;
                float specularMonochrome;
                float3 diffuseColor = _node_6350.rgb; // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float _Metallic;
            uniform float _Gloss;
            uniform sampler2D _node_3961; uniform float4 _node_3961_ST;
            uniform sampler2D _node_3961_copy; uniform float4 _node_3961_copy_ST;
            uniform sampler2D _node_3961_copy_copy; uniform float4 _node_3961_copy_copy_ST;
            uniform float4 _node_6350;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float3 diffColor = _node_6350.rgb;
                float specularMonochrome;
                float3 specColor;
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, _Metallic, specColor, specularMonochrome );
                float4 node_3943 = _Time + _TimeEditor;
                float4 node_9839 = _Time + _TimeEditor;
                float node_3184 = 1.0;
                float node_4833 = 1.0;
                float2 node_7682_tc_rcp = float2(1.0,1.0)/float2( node_3184, 0.2 );
                float node_7682_ty = floor(node_4833 * node_7682_tc_rcp.x);
                float node_7682_tx = node_4833 - node_3184 * node_7682_ty;
                float2 node_7682 = (i.uv0 + float2(node_7682_tx, node_7682_ty)) * node_7682_tc_rcp;
                float2 node_3474 = ((node_7682+node_9839.g*float2(0.05,0.2))*0.2);
                float4 _node_3961_var = tex2D(_node_3961,TRANSFORM_TEX(node_3474, _node_3961));
                float node_2457 = 1.0;
                float2 node_9354_tc_rcp = float2(1.0,1.0)/float2( node_2457, 0.5 );
                float node_9354_ty = floor(node_4833 * node_9354_tc_rcp.x);
                float node_9354_tx = node_4833 - node_2457 * node_9354_ty;
                float2 node_9354 = (i.uv0 + float2(node_9354_tx, node_9354_ty)) * node_9354_tc_rcp;
                float2 node_7215 = ((node_9354+node_9839.g*float2(-0.05,0.15))*0.1);
                float4 _node_3961_copy_var = tex2D(_node_3961_copy,TRANSFORM_TEX(node_7215, _node_3961_copy));
                float node_3540 = 1.0;
                float2 node_1357_tc_rcp = float2(1.0,1.0)/float2( node_3540, 0.8 );
                float node_1357_ty = floor(node_4833 * node_1357_tc_rcp.x);
                float node_1357_tx = node_4833 - node_3540 * node_1357_ty;
                float2 node_1357 = (i.uv0 + float2(node_1357_tx, node_1357_ty)) * node_1357_tc_rcp;
                float2 node_4554 = ((node_1357+node_9839.g*float2(0.07,0.1))*0.1);
                float4 _node_3961_copy_copy_var = tex2D(_node_3961_copy_copy,TRANSFORM_TEX(node_4554, _node_3961_copy_copy));
                float3 node_7007 = normalize(float3(_node_3961_var.g,_node_3961_copy_var.r,_node_3961_copy_copy_var.b));
                float node_2402 = pow(1.0-max(0,dot(node_7007, viewDirection)),0.5);
                float node_7238 = (node_2402*node_2402*node_2402*node_2402*(node_2402*node_2402*node_2402*node_2402*node_2402));
                float roughness = 1.0 - (((0.5+(0.3*sin((0.01*node_3943.g))))*(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0)*_Gloss))+node_7238+node_7238+node_7238);
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
