<script setup lang="ts"></script>

<template>
  <div>
    <h1>Configurações</h1>
    <p>Aqui você poderá ajustar as configurações do sistema InfraWatch.</p>

    <form>
      <label>
        Intervalo de Monitoramento (segundos):
        <input type="number" min="5" value="60" />
      </label>
      <br /><br />
      <label>
        Enviar alertas por email:
        <input type="checkbox" checked />
      </label>
      <br /><br />
      <button type="submit">Salvar</button>
    </form>
  </div>
</template>
