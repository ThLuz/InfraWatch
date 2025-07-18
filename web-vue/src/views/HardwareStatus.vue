<script setup lang="ts">
const hardwareDetails = [
  {
    name: 'CPU',
    status: 'OK',
    usage: 42,
    temp: '61°C',
  },
  {
    name: 'Memória RAM',
    status: 'OK',
    usage: 48,
    total: '16 GB',
    used: '7.8 GB',
  },
  {
    name: 'Disco Rígido',
    status: 'Atenção',
    usage: 85,
    total: '500 GB',
    used: '425 GB',
  },
  {
    name: 'Placa de Vídeo',
    status: 'OK',
    usage: 37,
    temp: '56°C',
  },
  {
    name: 'Temperatura Geral',
    status: 'Normal',
    temp: '59°C',
  },
]

const getStatusColor = (status: string) => {
  switch (status) {
    case 'OK':
    case 'Normal':
      return '#22c55e'
    case 'Atenção':
      return '#facc15'
    case 'Crítico':
      return '#ef4444'
    default:
      return '#94a3b8'
  }
}
</script>

<template>
  <div class="hardware-status">
    <h1>Status do Hardware</h1>
    <p class="subtitle">Aqui você monitora em tempo real o estado dos principais componentes da máquina.</p>

    <div class="status-grid">
      <div v-for="(item, index) in hardwareDetails" :key="index" class="status-card">
        <div class="card-header">
          <h2>{{ item.name }}</h2>
          <span
            class="status-indicator"
            :style="{ backgroundColor: getStatusColor(item.status) }"
          >
            {{ item.status }}
          </span>
        </div>

        <div v-if="item.usage !== undefined" class="progress-bar">
          <div class="progress-fill" :style="{ width: item.usage + '%' }">
            {{ item.usage }}%
          </div>
        </div>

        <div v-if="item.temp" class="info-line">Temperatura: <span>{{ item.temp }}</span></div>
        <div v-if="item.used && item.total" class="info-line">
          Uso: <span>{{ item.used }} / {{ item.total }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.hardware-status {
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

.status-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 1.5rem;
}

.status-card {
  background: #1e293b;
  padding: 1.5rem;
  border-radius: 1rem;
  box-shadow:
    0 0 12px 0 rgba(14, 165, 233, 0.3),
    inset 0 0 6px 0 rgba(14, 165, 233, 0.5);
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
  transition: transform 0.25s ease;
}

.status-card:hover {
  transform: translateY(-4px);
  box-shadow:
    0 0 22px 2px #06b6d4,
    inset 0 0 10px 0 #38bdf8;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.card-header h2 {
  font-size: 1.2rem;
  font-weight: 700;
  color: #bae6fd;
}

.status-indicator {
  padding: 0.2rem 0.75rem;
  border-radius: 9999px;
  font-weight: 600;
  font-size: 0.9rem;
  color: #0f172a;
  background-color: #94a3b8;
  user-select: none;
}

.progress-bar {
  background: #334155;
  height: 1rem;
  border-radius: 9999px;
  overflow: hidden;
  position: relative;
  box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.4);
  padding: 0 0.25rem;
}

.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, #0ea5e9, #22d3ee);
  color: #0f172a;
  font-weight: bold;
  font-size: 0.9rem;
  text-align: right;
  padding-right: 0.5rem;
  border-radius: 9999px;
  box-shadow: 0 0 6px #38bdf8;
  transition: width 0.4s ease;

  width: calc(var(--usage, 0%) - 0.5rem);
  min-width: 1rem
}

.info-line {
  font-size: 0.95rem;
  color: #cbd5e1;
}

.info-line span {
  color: #38bdf8;
  font-weight: 600;
}
</style>
