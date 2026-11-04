# Consignes pour Claude — NOM_DU_PROJET

<!-- Modèle posé par setup-repo.sh. À compléter puis garder sous ~40 lignes :
     ce fichier est relu à chaque message. Pas d'historique, pas de description
     fichier par fichier, pas de banalités. Le détail va dans NOTES.md. -->

- Français simple, phrases courtes : l'utilisateur ne code pas. Détail du projet : NOTES.md (lire la section utile, pas tout) ; y ajouter une ligne au Journal en fin de tâche.
- But : UNE PHRASE.
- Stack et fichiers clés : OÙ MODIFIER QUOI (signaler les fichiers de plus de 300 lignes : Grep puis Read avec offset/limit).
- Vérifier : COMMANDE DE TEST OU DE BUILD.
- Ne jamais committer ni afficher : SECRETS ET DONNÉES (.env, data/…).
- Branches `claude/*` : PR fusionnée automatiquement dans `main`. Ne pousser que ce qui est prêt.
- Modifications ciblées (Edit) ; ouvrir seulement les fichiers concernés.
