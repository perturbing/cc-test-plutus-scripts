### Please do the following check
1) Verify that you public key is present in the `vkeys` folder under `nameNFT.vkey`. That is,
```bash
cat vkeys/thomasNFT.vkey
```
2) Verify that the correct pkh is derived from you vkey, this command should output the same for,
```bash
cardano-cli address key-hash --payment-verification-key-file vkeys/thomasNFT.vkey
cat vkeys/thomasNFT.pkh 
```
3) Verify that you pkh is correctly encoded in the native script. That is,
```bash
cat nativeScripts/thomasNative.script
```
4) Verify that the correct policy id is derived from that scripts. You can use for this
```bash
cardano-cli transaction policyid --script-file nativeScripts/thomasNative.script
cat nativeScripts/thomasNativeScript.policy
```
5) You can compile the CC cold credential script via 
```bash
nix run github:IntersectMBO/credential-manager/e7cc4586bdf167d17bf5f97a66164cf8e35deba5#orchestrator-cli -- cold-credential init -p $(cat nativeScripts/thomasNativeScript.policy) -o thomas-cc-script
```
