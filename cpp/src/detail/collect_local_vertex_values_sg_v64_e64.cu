/*
 * Copyright (c) 2021-2024, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "detail/collect_local_vertex_values.cuh"
#include "detail/graph_partition_utils.cuh"

#include <cugraph/graph_functions.hpp>
#include <cugraph/utilities/shuffle_comm.cuh>

#include <cuda/functional>

namespace cugraph {
namespace detail {

template rmm::device_uvector<float>
collect_local_vertex_values_from_ext_vertex_value_pairs<int64_t, float, false>(
  raft::handle_t const& handle,
  rmm::device_uvector<int64_t>&& d_vertices,
  rmm::device_uvector<float>&& d_values,
  rmm::device_uvector<int64_t> const& number_map,
  int64_t local_vertex_first,
  int64_t local_vertex_last,
  float default_value,
  bool do_expensive_check);

template rmm::device_uvector<double>
collect_local_vertex_values_from_ext_vertex_value_pairs<int64_t, double, false>(
  raft::handle_t const& handle,
  rmm::device_uvector<int64_t>&& d_vertices,
  rmm::device_uvector<double>&& d_values,
  rmm::device_uvector<int64_t> const& number_map,
  int64_t local_vertex_first,
  int64_t local_vertex_last,
  double default_value,
  bool do_expensive_check);

template rmm::device_uvector<int64_t>
collect_local_vertex_values_from_ext_vertex_value_pairs<int64_t, int64_t, false>(
  raft::handle_t const& handle,
  rmm::device_uvector<int64_t>&& d_vertices,
  rmm::device_uvector<int64_t>&& d_values,
  rmm::device_uvector<int64_t> const& number_map,
  int64_t local_vertex_first,
  int64_t local_vertex_last,
  int64_t default_value,
  bool do_expensive_check);

}  // namespace detail
}  // namespace cugraph
