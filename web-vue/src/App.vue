<script lang="ts">
import Sidebar from './components/Sidebar.vue'
import HeaderBar from './components/HeaderBar.vue'

export default {
  components: { Sidebar, HeaderBar }
}
</script>

<template>
  <div class="app-container" style="display: flex; min-height: 100vh;">
    <Sidebar />
    <div style="flex: 1; display: flex; flex-direction: column;">
      <HeaderBar />
      <main style="flex: 1; overflow-y: auto;">
        <router-view />
      </main>
    </div>
  </div>
</template>
