// webpack.custom.config.js
module.exports = {
    + mode: 'none',
    - performance: {
    -  hints: false
    - },
- optimization: {
    -   flagIncludedChunks: false,
        -   occurrenceOrder: false,
        -   concatenateModules: false,
        -   splitChunks: {
        -     hidePathInfo: false,
            -     minSize: 10000,
            -     maxAsyncRequests: Infinity,
            -     maxInitialRequests: Infinity,
            -   },
    -   noEmitOnErrors: false,
        -   checkWasmTypes: false,
        -   minimize: false,
        - },
- plugins: []
}