import chokidar from 'chokidar';
import { exec } from 'node:child_process';

let running = false;

function runBuild() {
    if (running) return;
    running = true;

    exec('npm run build', (error, stdout, stderr) => {
        if (stdout) process.stdout.write(stdout);
        if (stderr) process.stderr.write(stderr);
        if (error) console.error(error.message);
        running = false;
    });
}

chokidar.watch('sources', { ignored: [/(^|\/)\../] })
    .on('ready', runBuild)
    .on('change', runBuild)
    .on('add', runBuild)
    .on('unlink', runBuild);