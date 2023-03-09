/// [continuous] and [discrete] types (quantitative) represent values where basically a numerical representation makes sense.
///
/// [ordinal] and [nominal] types (qualitative) represent values which are enum-like with the difference, that nominals can't be ordered and ordinal can.
///
/// further reading: https://www.turing.com/kb/statistical-data-types#nominal-data
///
/// Samples for graph usage:
///  - [continuous] : histogram, box blot
///  - [discrete] : bar graphs, stem plots
///  - [nominal] : pie chart, bar chart
///  - [ordinal] : pie chart, bar chart
enum DataType {
  continuous,
  discrete,
  ordinal,
  nominal,
}
