<script setup lang="ts">
const hardwareStatus = [
  { title: 'Uso da CPU', value: '42%' },
  { title: 'Memória RAM', value: '7.8 GB / 16 GB' },
  { title: 'Armazenamento', value: '120 GB / 500 GB' },
  { title: 'Temperatura', value: '61°C' },
]
</script>

<template>
  <div class="dashboard">
    <h1>Dashboard</h1>
    <p class="subtitle">Resumo do monitoramento de hardware</p>

    <div class="cards">
      <div v-for="(item, i) in hardwareStatus" :key="i" class="card">
        <h2 class="card-title">{{ item.title }}</h2>
        <div class="value">{{ item.value }}</div>
        <div
          v-if="item.value.toString().includes('%')"
          class="progress-bar"
        >
          <div
            class="progress-fill"
            :style="{ width: item.value.toString() }"
          ></div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.dashboard {
  background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
  min-height: 91vh;
  padding: 2rem 1.5rem;
  color: #f8fafc;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

h1 {
  font-size: 2.5rem;
  font-weight: 900;
  letter-spacing: 0.05em;
  margin-bottom: 0.25rem;
  background: linear-gradient(90deg, #3b82f6, #06b6d4);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  user-select: none;
}

.subtitle {
  color: #94a3b8;
  font-size: 1.1rem;
  margin-bottom: 2rem;
  user-select: none;
}

.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1.5rem;
}

.card {
  background: #1e293b;
  border-radius: 1rem;
  box-shadow:
    0 0 12px 0 rgba(14, 165, 233, 0.3),
    inset 0 0 6px 0 rgba(14, 165, 233, 0.5);
  padding: 1.5rem 1.5rem;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  transition: transform 0.25s ease, box-shadow 0.25s ease;
  cursor: default;
}

.card:hover {
  transform: translateY(-6px);
  box-shadow:
    0 0 22px 2px #06b6d4,
    inset 0 0 10px 0 #38bdf8;
}

.card-title {
  font-size: 1.15rem;
  font-weight: 700;
  color: #bae6fd;
  margin-bottom: 1rem;
  user-select: none;
}

.value {
  font-size: 22px;
  font-weight: 900;
  color: #38bdf8;
  line-height: 1;
  user-select: none;
}

.progress-bar {
  height: 0.7rem;
  background: #334155;
  border-radius: 9999px;
  overflow: hidden;
  margin-top: 1.5rem;
  box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.4);
}

.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, #0ea5e9, #22d3ee);
  border-radius: 9999px 0 0 9999px;
  transition: width 0.6s ease;
  box-shadow: 0 0 6px #38bdf8;
}
</style>
