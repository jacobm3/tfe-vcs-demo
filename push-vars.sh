HOST=app.terraform.io
ORG=jacobm3
WS=tfe-vcs-demo
REPO=jacobm3/${WS}

tfe workspace create -tfe-address $HOST -tfe-org $ORG -tfe-workspace $WS -vcs-id $REPO

tfe pushvars -dry-run false -overwrite-all true -name ${ORG}/${WS} \
 -tfe-address $HOST \
 -var "business_unit=fin_srv" \
 -var "team=internal_qa" \
 -svar "secret=123456" \
 -env-var "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
 -senv-var "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
 -env-var "CONFIRM_DESTROY=1"

