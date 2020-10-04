Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOVX5D5QKGQEM4XMBUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07E282CAE
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:11 +0200 (CEST)
Received: by mail-ej1-x63e.google.com with SMTP id dc22sf2366657ejb.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838011; cv=pass;
        d=google.com; s=arc-20160816;
        b=0MOXk3e57D8LFGVAan21qczytf8YGvlP7MIl0yOq7C/ivsutTUrg8cnb7pooYILWzi
         ARfiu2MwSYgC0OrruMNa/b6Ah6LP2sZXOvSE98UL4Sg1Fu9n27GsPoeW+6QNDpZ7VdR5
         2ePSSJYBQYAfCS7heNJ+7lII+2Q7LnbXBU58N2Bg2bIOUMrKyFnVwivGGFwx/YHkMCpO
         ZmDsPuRkUUeNzLfLqMysCdFkZpcHZYZgh8p2DBjgjgWBWULDK0p8Yzp1cKcLcddXlim/
         p3shWmeu/q23a8qRvpn7+X/0L1ShNKNvmy7OEAbKMmBC1EfEJinAZoH7e5ZkL2WNYdGB
         0wcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=2lhtcIZgjb9CEPkBcI37fTIBx3+G/wqw9ULH0K4UsIw=;
        b=sWjk/h7yST5v//7NvUpjX0vTRBoQzXN7cP3L7zzIFPTyKXNufJLg5doXFIzfvuVxac
         SrBUgDusBD3+1kMD+gyjggNeBdCaw7DZ0+vGr2uS8elSzey4tEU/V2lfqQR0ZsaNMOBv
         IWmBhqUwJ83+GzZss/ozUwMt2WayZPrrxMp6OcTOBGcbyb0IqEdChRy1hBzUhIXEFETE
         s/horeHQQ7npk0BxTnYMgSSy35Z7uzFpE4phEzgelld+DCMRjK0LTXGwYHiE2TvTaOKq
         xLU0VFboN+KaH23sbqbTVk3nqWhVbihPdknQwIvLWLiKgY313y0+RvKQMIYT4iBuZwwr
         eyew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2lhtcIZgjb9CEPkBcI37fTIBx3+G/wqw9ULH0K4UsIw=;
        b=iVwWa3Z5tY8cIcc3ZNzmwrk2cnyGV7aWyQAj8EqDgwuH9nUZF+M4k+diIaBn1gnABu
         AOpl4Tows4RdwpALsWTZbE07VElujoq4O0Xnlcf5th9JQ5YNzZmLE0NtHiG7cQnKm99Q
         2l4LwkvukEHOD8PH42ziS8yPSNC5xV2lF5Gmc2sZWVvPaLYf0fQf1bOLS099+oKXoRJl
         mV/TrozyepNgH79OLXE+q63shvACXPWfuZ25SLpMrmZAOc/QQBiIlvW4IklEcT89ElQD
         oS2B5UAlDkRG9oN/RRpqrOaIAfJPHg8oF9Ss9J6i+rmB/WVa71QuRd1KCIcZwLdJulos
         HpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2lhtcIZgjb9CEPkBcI37fTIBx3+G/wqw9ULH0K4UsIw=;
        b=pZcxsX4aedkKHRS6TeVbw/lIsDm+dR1sX9feC2Urbstyo9G4/IlZDZreruukr9V0W+
         JDmSA+U3KN9kID9uxWEOBefJBV3dHUHPRp8K6cAPfk/0DxrOmCOe8imJH4Y79ii8/QAp
         7H0+aIltVMHSosiLxt/6KuyPU83tYf2inA9G6SQshcfY4F1fT42quQzkNHWnirXXGpuR
         Zul0+waYuMShSrJcFv2vAfuUzhCZdb7GFw/w1DsNXL6ch8U3V8KQj7HUAzbCKlJsNmBO
         RYmJ42V+tn6zueiogZk/AaFXYPD+NVyngc4n9kDetJ9eErTkABnvrhlENSI7pS3Rn8po
         6JtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530/hiNn1kr9SVQuOY/BAGkrYIKdmurXNFOishfqoHjOOuWDWYKA
	iOFHPr8J/ajf4ulq0Cvfong=
X-Google-Smtp-Source: ABdhPJxZnixPKQmiiG4JGQJMQ8zz2slxphTW/ZhBMReLtykHvXK3k/pb7PXWLph1sQusKOqH+s8zGQ==
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr2678987edb.129.1601838011134;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:b18:: with SMTP id h24ls2036949ejl.7.gmail; Sun, 04
 Oct 2020 12:00:10 -0700 (PDT)
X-Received: by 2002:a17:906:d8bc:: with SMTP id qc28mr12300376ejb.490.1601838010047;
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838010; cv=none;
        d=google.com; s=arc-20160816;
        b=sVkurpKetWZp5pU8kiIPkX2yq1anup18fSG2h3N5GkvjMwEyPNWG5Q1g1Gn4awbPGg
         4GCPJLULvQKBxlBLMAn4k3f1wTZ/nFwclqUW7UjA1yLCgjLg5mjMxKUC0sbYNPo++/gd
         Ff5kmI49wfS4lQVJgJ9ukxGkN6zFKnlh9Idt4Cm+ao5QCh+g1DQmGuYxZvrdhz93+L7J
         maVffSSo6y3Swil3uqmfFdcAkg9aakO14xorJqG/vfHDGDDM29FeNA6urHebb8Kr7dlG
         F3pZu53LUI8vQdqGh18LneFUXQ8/nlAyWDAA7fs0giMW1uNh+nup/46qdTMtKFV999np
         KNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=gjEuO68itfRDxBrk9JME6oc8+AZg7KbElxgVyQg4QAQ=;
        b=cmRZ5kN67JrWS9XbRMjnN5noATT9YJMBIY6l9MFng116n8jEegzdPvWepBvXMivGp2
         wptxNXSE+CSxPxKygH2I1MdChCqiS1V/gubFC+nF739dGRLNTERdDoRgq+WyBGF08dTJ
         eiKjtVp7exCeenZWv6VtLFawZffsl7e9Rv9tngaWUc4f1S0xYWZMIJOczOmNbozKZEGr
         6v501toni92RZQuEUw438ApAfBVDts0bG4Z8B1XeVeepuu6bv8bTDDHbimqFTrn6VRlf
         1Nfg1ot7SLX5mhORERmsG+pNgsHhUB2qJHL0HjANfJn7qLrsz9gL8kGk0XVPxfmwhzCa
         g8UA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v18si106554edx.4.2020.10.04.12.00.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J09TA025040
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060K017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 08/45] arm64: smmu: Refactor smmu device setup and usage
Date: Sun,  4 Oct 2020 20:59:29 +0200
Message-Id: <0ff6b52404d8c7f517e3bea2d682301323aed37b.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

From: Jan Kiszka <jan.kiszka@siemens.com>

We only need iommu_units from the system configuration during setup.
Afterwards, we work solely against entries of smmu_device.

Rework the usage of the latter by filling the smmu_device array
independently of the iommu_units and iterating over the former later on.
Introduce an iterator macro for this. Helps to simplify the code.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 117 +++++++++++++++++------------------
 1 file changed, 56 insertions(+), 61 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 938139d0..9b3d59fb 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -285,10 +285,17 @@ struct arm_smmu_device {
 	unsigned long			pgsize_bitmap;
 	u32				num_global_irqs;
 	unsigned int			*irqs;
-} smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
+};
 
+static struct arm_smmu_device smmu_device[JAILHOUSE_MAX_IOMMU_UNITS];
+static unsigned int num_smmu_devices;
 static unsigned long pgsize_bitmap = -1;
 
+#define for_each_smmu(smmu, counter)				\
+	for ((smmu) = &smmu_device[0], (counter) = 0;		\
+	     (counter) < num_smmu_devices;			\
+	     (smmu)++, (counter)++)
+
 static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
 {
 	struct arm_smmu_smr *smr = smmu->smrs + idx;
@@ -811,33 +818,26 @@ static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
 
 static int arm_smmu_cell_init(struct cell *cell)
 {
-	struct jailhouse_iommu *iommu;
 	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
+	struct arm_smmu_device *smmu;
 	struct arm_smmu_s2cr *s2cr;
 	struct arm_smmu_cfg *cfg;
 	struct arm_smmu_smr *smr;
+	unsigned int dev, n;
 	const __u32 *sid;
-	unsigned int n;
-	int ret, idx, i;
-
-	if (!iommu_count_units())
-		return 0;
+	int ret, idx;
 
 	/* If no sids, ignore */
 	if (!cell->config->num_stream_ids)
 		return 0;
 
-	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < iommu_count_units(); iommu++, i++) {
-		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
-			continue;
-
-		s2cr = smmu_device[i].s2crs;
-		cfg = &smmu_device[i].cfgs[cell->config->id];
+	for_each_smmu(smmu, dev) {
+		s2cr = smmu->s2crs;
+		cfg = &smmu->cfgs[cell->config->id];
 
-		if (smmu_device[i].features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
-					       ARM_SMMU_FEAT_FMT_AARCH64_16K |
-					       ARM_SMMU_FEAT_FMT_AARCH64_4K))
+		if (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
+				      ARM_SMMU_FEAT_FMT_AARCH64_16K |
+				      ARM_SMMU_FEAT_FMT_AARCH64_4K))
 			cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
 
 		cfg->cbar = CBAR_TYPE_S2_TRANS;
@@ -847,16 +847,16 @@ static int arm_smmu_cell_init(struct cell *cell)
 		cfg->irptndx = cfg->cbndx;
 		cfg->vmid = cfg->cbndx + 1;
 
-		ret = arm_smmu_init_context_bank(&smmu_device[i], cfg, cell);
+		ret = arm_smmu_init_context_bank(smmu, cfg, cell);
 		if (ret)
 			return ret;
 
-		arm_smmu_write_context_bank(&smmu_device[i], cfg->cbndx);
+		arm_smmu_write_context_bank(smmu, cfg->cbndx);
 
-		smr = smmu_device[i].smrs;
+		smr = smmu->smrs;
 
 		for_each_smmu_sid(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(*sid, &smmu_device[i]);
+			ret = arm_smmu_find_sme(*sid, smmu);
 			if (ret < 0)
 				return trace_error(-ret);
 			idx = ret;
@@ -865,20 +865,20 @@ static int arm_smmu_cell_init(struct cell *cell)
 			s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
 			s2cr[idx].cbndx = cfg->cbndx;
 
-			arm_smmu_write_s2cr(&smmu_device[i], idx);
+			arm_smmu_write_s2cr(smmu, idx);
 
 			smr[idx].id = *sid;
-			smr[idx].mask = smmu_device[i].arm_sid_mask;
+			smr[idx].mask = smmu->arm_sid_mask;
 			smr[idx].valid = true;
 
-			arm_smmu_write_smr(&smmu_device[i], idx);
+			arm_smmu_write_smr(smmu, idx);
 		}
 
 		printk("Found %d masters\n", n);
 
-		mmio_write32(ARM_SMMU_GR0(&smmu_device[i])
-			     + ARM_SMMU_GR0_TLBIVMID, cfg->vmid);
-		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
+			     cfg->vmid);
+		ret = arm_smmu_tlb_sync_global(smmu);
 		if (ret < 0)
 			return ret;
 	}
@@ -888,38 +888,31 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 static void arm_smmu_cell_exit(struct cell *cell)
 {
-	const __u32 *sid;
-	unsigned int n;
-	int idx, i;
 	int cbndx = cell->config->id;
-	struct jailhouse_iommu *iommu;
-
-	if (!iommu_count_units())
-		return;
+	struct arm_smmu_device *smmu;
+	unsigned int dev, n;
+	const __u32 *sid;
+	int idx;
 
 	/* If no sids, ignore */
 	if (!cell->config->num_stream_ids)
 		return;
 
-	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; iommu++, i++) {
-		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
-			continue;
-
-		mmio_write32(ARM_SMMU_GR0(&smmu_device[i]) + ARM_SMMU_GR0_TLBIVMID,
-					  smmu_device[i].cbs[cbndx].cfg->vmid);
-		arm_smmu_tlb_sync_global(&smmu_device[i]);
+	for_each_smmu(smmu, dev) {
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
+					  smmu->cbs[cbndx].cfg->vmid);
+		arm_smmu_tlb_sync_global(smmu);
 
 		for_each_smmu_sid(sid, cell->config, n) {
-			idx = arm_smmu_find_sme(*sid, &smmu_device[i]);
+			idx = arm_smmu_find_sme(*sid, smmu);
 			if (idx < 0)
 				continue;
 
-			if (arm_smmu_free_sme(&smmu_device[i], idx))
-				arm_smmu_write_sme(&smmu_device[i], idx);
+			if (arm_smmu_free_sme(smmu, idx))
+				arm_smmu_write_sme(smmu, idx);
 
-			smmu_device[i].cbs[cbndx].cfg = NULL;
-			arm_smmu_write_context_bank(&smmu_device[i], cbndx);
+			smmu->cbs[cbndx].cfg = NULL;
+			arm_smmu_write_context_bank(smmu, cbndx);
 		}
 	}
 }
@@ -927,38 +920,40 @@ static void arm_smmu_cell_exit(struct cell *cell)
 static int arm_smmu_init(void)
 {
 	struct jailhouse_iommu *iommu;
-	int err, i, num = 0;
+	struct arm_smmu_device *smmu;
+	unsigned int n;
+	int err;
 
-	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < iommu_count_units(); iommu++, i++) {
+	for (n = 0; n < iommu_count_units(); n++) {
+		iommu = &system_config->platform_info.iommu_units[n];
 		if (iommu->type != JAILHOUSE_IOMMU_ARM_MMU500)
 			continue;
 
-		num++;
+		smmu = &smmu_device[num_smmu_devices];
+		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
 
-		smmu_device[i].arm_sid_mask = iommu->arm_mmu500.sid_mask;
-
-		smmu_device[i].base = paging_map_device(iommu->base,
-							iommu->size);
-		if (!smmu_device[i].base)
+		smmu->base = paging_map_device(iommu->base, iommu->size);
+		if (!smmu->base)
 			return -ENOMEM;
 
 		printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
 
-		smmu_device[i].cb_base = smmu_device[i].base + iommu->size / 2;
+		smmu->cb_base = smmu->base + iommu->size / 2;
 
-		err = arm_smmu_device_cfg_probe(&smmu_device[i]);
+		err = arm_smmu_device_cfg_probe(smmu);
 		if (err)
 			return err;
 
-		err = arm_smmu_device_reset(&smmu_device[i]);
+		err = arm_smmu_device_reset(smmu);
 		if (err)
 			return err;
 
-		arm_smmu_test_smr_masks(&smmu_device[i]);
+		arm_smmu_test_smr_masks(smmu);
+
+		num_smmu_devices++;
 	}
 
-	if (!num)
+	if (num_smmu_devices == 0)
 		return 0;
 
 	return arm_smmu_cell_init(&root_cell);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0ff6b52404d8c7f517e3bea2d682301323aed37b.1601838005.git.jan.kiszka%40siemens.com.
