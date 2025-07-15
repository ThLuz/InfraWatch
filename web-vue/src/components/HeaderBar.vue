<script setup lang="ts"></script>

<template>
  <header class="header-bar">
    <div class="branding">
      <span>Monitoramento de Hardware em tempo real</span>
    </div>
  </header>
</template>

<style scoped>
.header-bar {
  background: linear-gradient(to right, #0f172a, #1e293b);
  color: #ffffff;
  padding: 1rem 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.4);
  border-bottom: 1px solid #334155;
  position: sticky;
  top: 0;
  z-index: 10;
}

.branding {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  font-weight: bold;
  font-size: 1.4rem;
}

.tagline {
  font-size: 1rem;
  color: #94a3b8;
}
</style>
