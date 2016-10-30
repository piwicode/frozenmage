/// scr_emit_magic_burst(could_count, spark_count)
var could_count = argument0
var spark_count = argument1

with(obj_part_global_system) {
  part_emitter_region(system, em_death_cloud,
    other.bbox_left, other.bbox_right, other.bbox_top, other.bbox_bottom,
    ps_shape_diamond, ps_distr_gaussian);
  part_emitter_burst(system, em_death_cloud, pt_death_cloud, could_count);
  part_emitter_burst(system, em_death_cloud, pt_death_spark, spark_count);
  break;
}

