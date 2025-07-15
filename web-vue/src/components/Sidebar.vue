<script setup lang="ts"></script>

<template>
  <aside class="sidebar">
    <img src="/logo.svg" alt="Logo" class="logo" />
    <nav>
      <ul>
        <li>
          <router-link to="/" class="nav-link" active-class="active">📊 Dashboard</router-link>
        </li>
        <li>
          <router-link to="/hardware" class="nav-link" active-class="active">💻 Status Hardware</router-link>
        </li>
        <li>
          <router-link to="/settings" class="nav-link" active-class="active">⚙️ Configurações</router-link>
        </li>
      </ul>
    </nav>
  </aside>
</template>

<style scoped>
.sidebar {
  width: 260px;
  /* Removi height fixa para ajustar à altura do conteúdo */
  height: auto;
  min-height: 100vh; /* opcional: para ter altura mínima da tela */
  background-color: #0f172a;
  color: #ffffff;
  padding: 2rem 1.5rem;
  display: flex;
  flex-direction: column;
  border-right: 1px solid #1e293b;
  box-shadow: inset -2px 0 5px rgba(0, 0, 0, 0.1);
}

.sidebar {
  width: 260px;
  background-color: #0f172a;
  color: #fff;
  padding: 2rem 1.5rem;
  border-right: 1px solid #1e293b;
  box-shadow: inset -2px 0 5px rgba(0, 0, 0, 0.1);
  height: auto; /* importante para crescer conforme conteúdo */
  align-self: flex-start; /* para não esticar verticalmente */
  display: flex;
  flex-direction: column;
}


.logo {
  width: 220px; /* ajustado para caber dentro do sidebar */
  height: auto;
  margin-bottom: 2rem;
  object-fit: contain;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.nav-link {
  display: block;
  padding: 0.8rem 1rem;
  margin-bottom: 0.5rem;
  color: #cbd5e1;
  text-decoration: none;
  border-radius: 8px;
  transition: all 0.2s ease;
  font-weight: 500;
  position: relative;
}

.nav-link:hover {
  background-color: #1e293b;
  padding-left: 1.5rem;
  color: #ffffff;
}

.nav-link.active {
  background-color: #334155;
  color: #ffffff;
  font-weight: 600;
  box-shadow: inset 2px 0 0 #3b82f6;
}
</style>
