const fetch = require('autogit-command-fetch');
const pull = require('autogit-command-pull');
const push = require('autogit-command-push');
const status = require('autogit-command-status');

module.exports = {
//   dry: true, // Enable dry mode by default, where plugins only simulate doing the work
//   exitOnError: true, // Exit at the first error thrown
  parallel: 2, // Maximum number of commands to run in parallel
  pick: true,
  verbose: true,
  commands: {
    fetch: fetch({ remote: 'origin', branch: ''}),
    pull: pull({ remote: 'origin', branch: ''}),
    push: push({ remote: 'origin', branch: ''}),
    status
  },
  repositories: {
    depth: 2,
    roots: [process.cwd()]
  }
};
