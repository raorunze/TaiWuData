class XGWeaponTintableSheath extends XGWeapon;

simulated function UpdateWeaponMaterial(MeshComponent MeshComp, MaterialInstanceConstant MIC)
{
	local int i, a;
	local MaterialInterface Mat;
	local MaterialInstanceConstant AttachmentMIC;
	
	super.UpdateWeaponMaterial(MeshComp, MIC);

	MIC.SetScalarParameterValue('PatternUse', 0);
	
	for (i = 0; i < PawnAttachments.Length; ++i)
	{
		if (PawnAttachments.Find(MeshComp) == INDEX_NONE)
		{
			for (a = 0; a < SkeletalMeshComponent(PawnAttachments[i]).GetNumElements(); ++a)
			{
				Mat = SkeletalMeshComponent(PawnAttachments[i]).GetMaterial(a);
				AttachmentMIC = MaterialInstanceConstant(Mat);

				if (AttachmentMIC != none)
				{
					//`LOG("Apply tint and pattern to" @ SkeletalMeshComponent(PawnAttachments[i]).Name @ AttachmentMIC @ InStr(String(AttachmentMIC), "Katana3Saya"),, 'KatanaMod');
					super.UpdateWeaponMaterial(SkeletalMeshComponent(PawnAttachments[i]), AttachmentMIC);
				}
			}
		}
	}
}