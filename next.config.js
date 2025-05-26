

/** @type {import('next').NextConfig} */
const repo = 'next-report-app';     // ← your repository name

export default {
  output: 'export',

  // ---- GitHub Pages settings ----
  basePath: `/${repo}`,
  assetPrefix: `/${repo}/`,
  trailingSlash: true,              // nicer URLs for static hosting
};
