<script setup lang="ts"></script>

<template>
  <aside style="width: 250px; background-color: #1e293b; color: white; padding: 1rem;">
    <h2 style="font-weight: bold; font-size: 1.5rem; margin-bottom: 1rem;">InfraWatch</h2>
    <nav>
      <ul style="list-style: none; padding: 0;">
        <li style="margin-bottom: 1rem;">
          <router-link to="/" style="color: white; text-decoration: none;">Dashboard</router-link>
        </li>
        <li style="margin-bottom: 1rem;">
          <router-link to="/hardware" style="color: white; text-decoration: none;">Status Hardware</router-link>
        </li>
        <li style="margin-bottom: 1rem;">
          <router-link to="/settings" style="color: white; text-decoration: none;">Configurações</router-link>
        </li>
      </ul>
    </nav>
  </aside>
</template>
