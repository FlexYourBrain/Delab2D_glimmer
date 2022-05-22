//---  Glimmer Shader (wip) by Agustin R  --//
//------------  Free to use  ----------// 
varying mediump vec2 var_texcoord0;
varying mediump vec2 var_texcoord1;

uniform lowp sampler2D texture_sampler;

void main()
{
    float speed = 0.5;
    vec2 uv0 = var_texcoord0;
    vec2 uv1 = fract(var_texcoord1);
    vec3 light_range = vec3(2.0,2.0,2.0);
    vec3 dark_range = vec3(0.9,0.9,0.9);

    vec4 tex = texture2D(texture_sampler, uv0.xy);

    vec3 gleem = mix(light_range,dark_range,abs(uv1.y * uv1.y * 2.0 - 1.0));

    vec4 final = vec4(tex.rgb*(gleem.rgb-speed/tex.a),tex.a);

    gl_FragColor = final;

}