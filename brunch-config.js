module.exports = {
  files: {
    javascripts: {joinTo: 'app.js'},
    stylesheets: {joinTo: 'app.css'}
  },
  plugins: {
    babel: { presets: ['latest'] },
    closurecompiler: {
      compilationLevel: 'SIMPLE',
      createSourceMap: true
    },
    postcss: { processors: [require('autoprefixer')] },
    afterBrunch: [
      'npm run build:docs'
    ]
  },
  modules: {
    autoRequire: {
      'app.js': ['initialize']
    }
  }
};
