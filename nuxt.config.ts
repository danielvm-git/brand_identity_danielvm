// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ['@nuxt/ui', '@nuxt/fonts'],
  css: ['~/assets/css/main.css'],
  
  fonts: {
    families: [
      { 
        name: 'Bricolage Grotesque', 
        provider: 'google',
        weights: [200, 400, 600, 700, 800],
      },
      { 
        name: 'Source Serif 4', 
        provider: 'google',
        weights: [200, 400, 600, 700, 900],
        italics: true
      }
    ]
  },

  // Ensure Tailwind 4 is configured correctly if needed, 
  // though @nuxt/ui v3 handles most of this.
  future: {
    compatibilityVersion: 4
  },

  compatibilityDate: '2024-11-01'
})
