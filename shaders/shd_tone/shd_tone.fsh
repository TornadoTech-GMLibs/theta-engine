varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_vTone;

void main() {
	vec4 tex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float gray = dot(tex, vec4(0.299, 0.587, 0.114, 0)); // (tex.r + tex.g + tex.b) / 3.0;
	vec4 shade = vec4(gray * u_vTone.rgb, tex.a);
	gl_FragColor = mix(tex, shade, u_vTone.a);
}
