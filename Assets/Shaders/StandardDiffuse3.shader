Shader "Cook/StandardDiffuse3" {
	// Properties 영역에서 속성값을 정의한다.
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_AmbientColor ("Ambient Color", Color) = (1, 1, 1, 1)
		_MySliderValue ("This is a Slider", Range(0,10)) = 2.5
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		// CGPROGRAM 내의 속성 변수 자료형을 선언하여
		// Properties 영역에서 해당 값에 접근할 수 있도록 만든다.
		CGPROGRAM
		#pragma surface surf Standard fullforwardshadows
		#pragma target 3.0

		struct Input {
			float2 uv_MainTex;
		};

		fixed4 _Color;
		float4 _AmbientColor;
		float _MySliderValue;

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
			fixed4 c = pow((_Color + _AmbientColor), _MySliderValue);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
