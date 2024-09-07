<template>

        
        <div class="flex flex-col justify-center px-2 py-12 bg-scroll md:p-12 " >
            <div data-aos="fade" class="w-full text-center contents lg:flex-shrink-0">
                <img class="w-64 h-64 mx-auto rounded-full xl:h-64 xl:w-64" src="https://cdn.mattgilpin.au/images/scotchegg.jpg" alt="">
            </div>
        </div>

</template>

<script>

// import Layout from "@/AppLayout/Layout.vue"
// import PastProjects from "@/components/PastProjects.vue"
// import Articles from "@/components/Articles.vue"
// import Skills from '@/components/Skills.vue'

export default {
  name: 'Home', 
  components: {
    // Layout,
    // PastProjects,
    // Articles,
    // Skills
  },
  data: () => {
        return {
            bgWallpaper: "background: url('https://cdn.mattgilpin.au/images/background.jpg');",
            project_summary: "Ever since 2010, I have been facinated with computers and electrical systems. Currently I am a fifth year electrical engineering and computer science student at The University of Queensland. I do enjoy playing computer games from time to time, but my passion is to design and build circuits and code programs to solve problems.",

    
        }
  
  },
  computed: {
  
  }
}
</script>