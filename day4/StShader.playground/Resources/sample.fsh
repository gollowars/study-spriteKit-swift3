void main() {
  // 中心からの位置を求める
  vec2 uv = v_tex_coord - vec2(0.5, 0.5);
  float len = length(uv);

  // 1秒で１周期
  float time = mod(u_time, 1.0);

  // sinの値から参照するテクスチャのカラーを取得
  float sinVal = 1.0 + sin( 2.0 * 3.1415 * (len / 0.1 - time)) * 0.1;
  uv *= sinVal;
  vec4 texel = texture2D( u_texture, uv + vec2(0.5, 0.5));

  gl_FragColor = texel;
}
