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
nix run github:IntersectMBO/credential-manager/cad3cee28d51335d8f7e4ad1ba79d3e9c05d5393#orchestrator-cli -- init-cold --testnet \
 --policy-id $(cat nativeScripts/thomasNativeScript.policy) \
 --token-name "ff" \
 --ca-cert ../IOHK/ca-role/ca-cert.pem \
 --membership-cert ../IOHK/membership-role/carlos/carlos-member-cert.pem \
 --membership-cert ../IOHK/membership-role/sam/sam-member-cert.pem \
 --membership-cert ../IOHK/membership-role/thomas/thomas-member-cert.pem \
 --delegation-cert ../IOHK/delegation-role/carlos/carlos-delegation-cert.pem \
 --delegation-cert ../IOHK/delegation-role/sam/sam-delegation-cert.pem \
 --delegation-cert ../IOHK/delegation-role/thomas/thomas-delegation-cert.pem \
 --out-dir IOHK-cc-scripts
```
