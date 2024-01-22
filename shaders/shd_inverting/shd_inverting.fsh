varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_vAlpha;

void main() {
	vec4 color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 invertColor =  1.0 - color;
	vec3 colorMix = mix(color.rgb, invertColor.rgb, u_vAlpha);
    gl_FragColor = vec4(colorMix, color.a);
}
