varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_vAlpha;

void main() {
	vec4 tex = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float gray = (tex.r + tex.g + tex.b) / 3.0;
	vec4 shade = vec4(gray, gray, gray, tex.a);
    gl_FragColor = mix(tex, shade, u_vAlpha);
}
