# blockchain-voting-project
# Projeto II - SSC0958 Blockchain e Criptomoedas
### Votação Eletrônica Baseada em Blockchain

**Aluno:** João Pedro Matos de Deus  
**Número USP:** 12677492  

---

## 🧭 Objetivo
Desenvolver um **smart contract** em Solidity que realize uma votação eletrônica de forma **transparente**, **imutável** e **auditável**.  
O sistema permite que cada endereço vote apenas uma vez e define automaticamente o vencedor.

---

## ⚙️ Escopo
- Registro de candidatos no momento do deploy  
- Um voto por endereço (prevenção de duplicidade)  
- Abertura e fechamento controlados pelo administrador  
- Consulta pública ao vencedor  

---

## 🧩 Justificativa do Uso de Blockchain
A **blockchain** é essencial neste contexto pois garante a **integridade** e **transparência** dos votos sem necessidade de uma autoridade central.

**Vantagens:**  
- Imutabilidade dos registros.  
- Transparência total das transações.  
- Redução do risco de fraude eleitoral.

**Limitações:**  
- Custos de gas em redes públicas.  
- Privacidade limitada (votos visíveis, mas sem identificação pessoal).

**Conclusão:**  
O uso de blockchain é plenamente justificado em cenários onde a **confiança e a auditabilidade** são mais importantes que a privacidade.

---

## 🪙 Plataforma Escolhida
**Ethereum (Remix VM - ambiente de desenvolvimento)**

**Motivos da escolha:**  
- Ambiente educacional gratuito e sem custos de gas.  
- Ferramentas consolidadas (Remix IDE, Solidity).  
- Execução local rápida e simples.  

---

## 💻 Contrato Inteligente
**Arquivo:** `BallotSimple.sol`  
**Linguagem:** Solidity 0.8.20  
**Linhas de código:** ~70  

**Principais funções:**  
- `openVoting()` — abre a votação.  
- `vote(uint index)` — permite um voto por endereço.  
- `closeVoting()` — encerra a votação.  
- `winner()` — retorna o candidato vencedor.  

**Demonstração no Remix:**  
1. Deploy com `["Alice","Bob","Carol"]`  
2. `openVoting()` → `vote()` → `closeVoting()`  
3. `winner()` mostra o resultado final  

---

## 📊 Aplicações Similares
- [Snapshot](https://snapshot.org) — Votação on-chain para DAOs.  
- [Aragon](https://aragon.org) — Governança descentralizada.  
- [Tally](https://www.tally.xyz) — Transparência e auditoria em votações DAO.  

---

## ⚡ Desempenho
O contrato foi testado e executado com sucesso no **Remix VM (Prague)**, demonstrando:  
- Registro e contagem correta dos votos.  
- Bloqueio automático de votos duplicados.  
- Determinação precisa do vencedor.

---

## 📚 Repositório e Licença
**Licença:** MIT  
**GitHub:** [https://github.com/jjonhy/blockchain-voting-project]  


---

## 🧮 Autoavaliação
**Nota sugerida:** 9/10  
O trabalho cumpre todos os requisitos: implementação funcional, demonstração prática e documentação completa.
