# Braid & Bloom — Cloud Sync setup

This upgrade adds Supabase email/password sign-up and sign-in, per-account cloud backups, manual **Sync now**, and automatic uploads when supported local progress changes.

## 1. Create a Supabase project
1. Open https://supabase.com/ and create a project. Keep its database password private.
2. In the project dashboard, find **Project URL** and the **publishable key** (or legacy `anon` key) under API settings.
3. Do not use the `service_role` key or any secret key in this website.

## 2. Create the backup table
1. In Supabase, open **SQL Editor** and create a new query.
2. Open `supabase-setup.sql` from these website files, copy all of it into the SQL editor, and run it.
3. The table has Row Level Security (RLS) policies so a signed-in user can only read or change their own row.

## 3. Configure the website
1. Open `supabase-config.js` in a text editor.
2. Replace `https://YOUR_PROJECT_REF.supabase.co` with your real Project URL.
3. Replace `YOUR_SUPABASE_PUBLISHABLE_OR_ANON_KEY` with the publishable/anon key.
4. Save the file. The key is public by design; security depends on RLS. Never paste a service-role/secret key here.

## 4. Enable email sign-in
In Supabase Dashboard, open **Authentication** settings. Check that Email sign-in is enabled. For testing, email confirmation may be enabled; if so, check the inbox for the confirmation message. Set the Site URL / redirect URL to:
`https://praiseosazee2013-ctrl.github.io/Braid-Bloom/`

## 5. Upload to GitHub Pages
1. Extract `Braid_Bloom_Cloud_Sync.zip` on your Windows computer.
2. Open your GitHub repository `Braid-Bloom`.
3. Upload the updated `index.html`, `supabase-config.js`, `supabase-setup.sql`, `README-CLOUD-SYNC.md`, `icon.png`, and `favicon.png` to the repository root. Keep your existing Google Search Console verification HTML file.
4. Commit the changes and wait for GitHub Pages to update.
5. Open the live website, hard refresh with **Ctrl + F5**, then create an account or sign in.

## What syncs
The cloud backup includes the site's supported local data keys (`bb-state`, `bb_style_plan_v5`, `bb-mini-goal`, `bb_challenge_done`) when those keys exist. Some future features may use different storage keys and would need adding to `DATA_KEYS` in `index.html`.

## Important notes
- Cloud sync will not work until the Supabase URL/key and SQL table are configured.
- Existing data starts on the device where it was created. On first sign-in, if both local and cloud data exist, the website asks whether to restore the cloud copy or keep/upload this device's data.
- This is a single backup record per account, not a live multi-user community feed. Other users cannot see your private backup because of the RLS policies.
- Use **Sync now** before switching devices if you want to make sure the latest changes are saved.
- Do not share passwords. If you are under 18, use an email/account only with permission from a parent or trusted adult.
