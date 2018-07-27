Shader "Cook/StandardDiffuse2" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		// _MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
		_AmbientColor ("Ambient Color", Color) = (1, 1, 1, 1)
		_MySliderValue ("This is a Slider", Range(0,10)) = 2.5
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		// 물리 기반의 표준 광원 모델과 모든 종류의 라이트에 대한 그림자를 활성화한다.
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		// 세이더 모델 3.0을 사용해 더 세련된 광원을 만든다.
		#pragma target 3.0

		// sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		// Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
		// See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
		// #pragma instancing_options assumeuniformscaling
		UNITY_INSTANCING_BUFFER_START(Props)
			// put more per-instance properties here
		UNITY_INSTANCING_BUFFER_END(Props)

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			// Albedo는 색조를 입힌 텍스처로 지정한다.
			// fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			fixed4 c = _Color;
			o.Albedo = c.rgb;
			// Metallic and smoothness come from slider variables
			// Meralic과 Smoothness는 슬라이더 값으로 지정한다.
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
