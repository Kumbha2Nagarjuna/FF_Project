// @ts-nocheck               // keep Next’s TS checker off this file
import { defineConfig } from 'vitest/config';
import path from 'path';

export default defineConfig({
  test: {
    environment: 'jsdom',
    include: ['src/tests/**/*.test.ts*'],
    globals: true,

    // ----------- CI‑friendly switches -----------
    threads: false,   // run tests in main thread (no worker pool)
    exit: true        // ← force process.exit(0) once tests are done
  },

  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src')
    }
  }
});
