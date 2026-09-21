import os, pathlib, subprocess, tempfile, hashlib, json
repo=pathlib.Path(__file__).resolve().parents[1]
with tempfile.TemporaryDirectory(prefix='hondi-tests-') as tmp:
 root=pathlib.Path(tmp); home=root/'codex home'; env=dict(os.environ,CODEX_HOME=str(home))
 def run(*args,ok=True,custom=None):
  r=subprocess.run(['sh',str(repo/'install.sh'),*args],env=custom or env,capture_output=True,text=True)
  assert (r.returncode==0)==ok,(r.stdout,r.stderr)
  return r.stdout
 run('--from',str(repo)); target=home/'pets/hondi'; manifest=json.loads((target/'pet.json').read_text())
 assert manifest['spriteVersionNumber']==2 and (target/manifest['spritesheetPath']).is_file()
 assert 'already installed' in run('--from',str(repo))
 (target/'keep.txt').write_text('old custom content'); (target/'pet.json').write_text('{}')
 run('--from',str(repo)); assert list((home/'pet-backups').glob('hondi.*/keep.txt'))
 old=(target/'pet.json').read_bytes()
 bad=root/'bad'; (bad/'assets').mkdir(parents=True); (bad/'assets/hondi-spritesheet-v2.png').write_bytes(b'bad')
 run('--from',str(bad),ok=False); assert (target/'pet.json').read_bytes()==old
 run('--from',str(root/'missing'),ok=False); assert (target/'pet.json').read_bytes()==old
 run('--invalid',ok=False)
 (home/'.hondi-install.lock').mkdir(); run('--from',str(repo),ok=False); (home/'.hondi-install.lock').rmdir()
 assert not list((home/'pets').glob('.hondi-install.*'))
 fallback=dict(os.environ); fallback.pop('CODEX_HOME',None); fallback['HOME']=str(root/'default home')
 run('--from',str(repo),custom=fallback); assert (root/'default home/.codex/pets/hondi/pet.json').exists()
 print('PASS: fresh install, manifest, repeated install, backup, checksum failure, missing source, invalid option, lock, cleanup, HOME fallback, paths with spaces')
