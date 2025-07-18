<script setup lang="ts">
import { ref } from 'vue'

const interval = ref(60)
const sendAlerts = ref(true)

const saveSettings = () => {
  // Aqui você pode fazer algo com os dados, como chamar uma API ou salvar no storage
  alert(`Configurações salvas:
  Intervalo: ${interval.value} segundos
  Enviar alertas: ${sendAlerts.value ? 'Sim' : 'Não'}`)
}
</script>

<template>
  <div class="settings">
    <h1>Configurações</h1>
    <p class="subtitle">Aqui você poderá ajustar as configurações do sistema InfraWatch.</p>

    <form class="settings-form" @submit.prevent="saveSettings">
      <div class="form-group">
        <label for="interval">Intervalo de Monitoramento (segundos):</label>
        <input id="interval" type="number" min="5" v-model="interval" />
      </div>

      <div class="form-group checkbox">
        <label>
          <input type="checkbox" v-model="sendAlerts" />
          Enviar alertas por email
        </label>
      </div>

      <button type="submit" class="btn-save">Salvar</button>
    </form>
  </div>
</template>

<style scoped>
.settings {
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

.settings-form {
  background: #1e293b;
  padding: 2rem;
  border-radius: 1rem;
  box-shadow:
    0 0 12px 0 rgba(14, 165, 233, 0.3),
    inset 0 0 6px 0 rgba(14, 165, 233, 0.5);
  max-width: 500px;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.form-group label {
  font-weight: 600;
  display: block;
  margin-bottom: 0.5rem;
  color: #bae6fd;
}

.form-group input[type='number'] {
  width: 100%;
  padding: 0.6rem;
  border-radius: 0.5rem;
  border: none;
  background: #334155;
  color: #f1f5f9;
  font-size: 1rem;
  outline: none;
  transition: box-shadow 0.3s ease;
}

.form-group input[type='number']:focus {
  box-shadow: 0 0 0 2px #38bdf8;
}

.checkbox label {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-weight: 500;
}

.checkbox input[type='checkbox'] {
  width: 18px;
  height: 18px;
  accent-color: #38bdf8;
}

.btn-save {
  background: linear-gradient(90deg, #0ea5e9, #22d3ee);
  color: #0f172a;
  font-weight: bold;
  border: none;
  border-radius: 0.75rem;
  padding: 0.75rem 1.5rem;
  font-size: 1rem;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  box-shadow: 0 4px 12px rgba(56, 189, 248, 0.4);
}

.btn-save:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 18px rgba(56, 189, 248, 0.6);
}
</style>
