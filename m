Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPNTL6AKGQEIXYUOOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DF328DB5B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:17 +0200 (CEST)
Received: by mail-ej1-x63d.google.com with SMTP id z19sf878199eja.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664157; cv=pass;
        d=google.com; s=arc-20160816;
        b=BrEZPHa2Wl0Jkf1KGoLRmAZM1IfWovo0G8cSuev9RAWw+UVinbU18CgCJTwh+/pI/f
         qIPZ36ck3xymHkLlkWW58u+gjXLH/F6Q/dbvSM8zxmPqbOAsBFZcEesAsgfYv6uQk6KM
         HBJ0IKr+9N5BrhXktBiOgLaCrqf1b3QI5/iJjhLw0Qavre2fqyj87ekVtMks7tiVFP03
         HYfRWXHOhFmobkimZVMqjJfWBficDR3i2aS6+a+2X+OgdON+K/BMy3R/lDSa6Sy9ckRn
         qc+HmnlKC7V7gMnLb1Y4GxD/Kw5ebO9baTb2W3uc/7WHelmpY+uPF2fDX8ENwpv4A2Jl
         CegA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=wj3hapLoUz/ZmTOTPwuZHibT6qCM8lahJXF6L6cWDyw=;
        b=CgQfqoep67mV4T9kMe9qNVC8hhkme9VIgUpVCxoJcdHJo3V0Y21stECL/Mvj4jw8YA
         a/2Wcd1h91OXBrMpFwn3izr1BqSdF2xOyXrXE1sMWU7WNMFP/8AzGERnVaQFjto2tmGB
         Zho+0EbA8kfX6clbGD3iZWtxjgkL+6sleL/yGyZlMXsR4wtaZSG956aFlOzDdqeGODqJ
         tH6gRZUw3ku0ScCkJ45Sq3RccAgT52TkMs1dGBApzekDG8PJTKTQCnav9plEiW8OgnNH
         fGLeJYqa1W2eS8Ug97vU4fvYUzCuBGA30HxMTXYubUIjqKCiNp7ALgh8woKutJE3PDwp
         l2Fw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wj3hapLoUz/ZmTOTPwuZHibT6qCM8lahJXF6L6cWDyw=;
        b=HP8nJYlZc3Hb4lFNUpyfOg4voCS7tSMvJzix4diE1MUH3oQYhRnEEds+UMOgyF3aVi
         57mvL1fPgBfpkGulkDDmW0o5BxXA+ZGU0MCshsHNclVhzxrQmGizw1lWG+ayvcggr03a
         QyF0R+qmdeP9rmiFLjsMl3pioQCYoAC94m44Ah5OVc7o7t9SKypWVmWbmPqx5XBA41vR
         +NHIrh3UEzU9WRtnhG4DsZfzYqay/rKAMFEwb1qlwnEA9Y0EeemlwRK+lW3sm54o5ejs
         aRB/ZeczkIOU9fYgO8h86xIMSsT2iyImEchJyi4YwLrgXh+n4Um4zkEYA5kqZ9MjwbO0
         ZHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wj3hapLoUz/ZmTOTPwuZHibT6qCM8lahJXF6L6cWDyw=;
        b=UlfvmzuS9wEJZQLYTnxdlYihAUFkE15s7JkS7Rpirol0sJLTnpYM+bg7y06UP8sgKa
         KKqjhpotWWKMSlWxke/gbrZaQnhlcz0O5Z3/ZeOOfbzfP7V4BhDDoavaanyy+Ph5TsXa
         RgB9+4/JuDicjyfiv9RsUoMBpHCVJbmy/LzdVUyYqPHYALIQZGXsfyN3CoIRVBHNArVm
         8nn1DdcleI796QQdsqM5/fS0wVsKns9cRENWUSlZnWF62jiTxmBYVYeJQ+ZBXHdwMjtM
         5/UTbbJCMLEkmp9EhgMsKZG/bHMdVGBSgTjCYYeCUkL8XBZWroIFReTwu77/RXl5b1XM
         b/3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533gg8A7cxKIfYnTEwgIFjNznoqDq4nPOaITW/jzK+FIDWXClmgI
	5Ldah8oX8nflD1vaurJ8SwA=
X-Google-Smtp-Source: ABdhPJwyketK9xaJkaEXwHnTHbEodZ/IULo45DiQ648CCtV8tfhgl77LPg4feExRwRrAQQ6idTSQfw==
X-Received: by 2002:a17:907:2056:: with SMTP id pg22mr4169072ejb.177.1602664157368;
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:160e:: with SMTP id f14ls2614058edv.2.gmail; Wed,
 14 Oct 2020 01:29:16 -0700 (PDT)
X-Received: by 2002:a05:6402:602:: with SMTP id n2mr3960645edv.327.1602664156221;
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664156; cv=none;
        d=google.com; s=arc-20160816;
        b=CSCpT5CLpSd86vC5oJnB5NsOB2ZvfirT4tbhB4fxeR1SFCc2IrrJc2HeDHdYgcqBF3
         hG6l1f6hMhJRQuG9baHQD4taQLwF8r2dNMH4hdfRdmlWRjrcAO/MEvrPFysSEiC01r2J
         RyiM7DvtGfZVPydLlId6LW0N4SbzX1+1S6fNU9QwF636N6KJNIYs3bBAJRB3b9/6kWDi
         PTwhnNFggpx08Kl0MG/mIbgK7CmZLN8sWQAgAMix0UG1ylE4oTwu9wOllTfnxekBNxE9
         0LTdvy8PpNzQ4ZgCRmaLJPBEz2GziZHaE2Mhw7sqv0benZkLFy5DKQgH1ZSrugdvRKWP
         lRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=BCRkS9ie3ugni5dpzSKYCVLBvo5JHxwvfzziVudKNkw=;
        b=ENBFRRJ2KnLTLkWspb6TnawLJYgIZEXhro91mukE15WdS9TDSuO8obd/N/7rlOpBo1
         fBEN2llZmIdNuYCc0yl4MDLgwxoPIHjSGGlx6jHCp0+bQYNAEqD+jzIFAoDwlQp23CAe
         tdRAY1tHvVdNeT0gUaxx0ghk1qTsLvlmAQQccS4xCq+xIoikCW5yvtHzrCJxP+cnDkcQ
         Yj4saa7GP6tkd8nvMqhvOPRzhvhB3/8Qbb/ltlcIUCu3JHHyyCnNdF+S/8/CUzraQAad
         ZEZvc/PwUkEvsLlCtCp8DPAyuv/LCy5o/UaA1909R90IgonT31HDSQfXzDqPfa6xwakt
         GWwQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id bi6si56101edb.2.2020.10.14.01.29.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TFkN031250
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ7002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 21/46] arm64: smmu: Simplify VMID and CBNDX allocation
Date: Wed, 14 Oct 2020 10:28:45 +0200
Message-Id: <ae8780ca2e5441f0c2c3950594967d0de9ffb73d.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Leaving VMID 0 free comes from Linux but is unneeded for Jailhouse.
Simply use one ID, the cell ID, for both VMID and the context bank
index.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 37 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 68162607..44cecd33 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -224,11 +224,7 @@ enum arm_smmu_context_fmt {
 };
 
 struct arm_smmu_cfg {
-	u8				cbndx;
-	union {
-		u16			asid;
-		u16			vmid;
-	};
+	unsigned int			id;
 	u32				cbar;
 	enum arm_smmu_context_fmt	fmt;
 };
@@ -313,7 +309,7 @@ static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 				      struct arm_smmu_cfg *cfg,
 				      struct cell *cell)
 {
-	struct arm_smmu_cb *cb = &smmu->cbs[cfg->cbndx];
+	struct arm_smmu_cb *cb = &smmu->cbs[cfg->id];
 	struct paging_structures *pg_structs;
 	unsigned long cell_table;
 	u32 reg;
@@ -402,7 +398,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 		reg = CBA2R_RW64_32BIT;
 	/* 16-bit VMIDs live in CBA2R */
 	if (smmu->features & ARM_SMMU_FEAT_VMID16)
-		reg |= cfg->vmid << CBA2R_VMID_SHIFT;
+		reg |= cfg->id << CBA2R_VMID_SHIFT;
 
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
 
@@ -415,7 +411,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	 */
 	if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
 		/* 8-bit VMIDs live in CBAR */
-		reg |= cfg->vmid << CBAR_VMID_SHIFT;
+		reg |= cfg->id << CBAR_VMID_SHIFT;
 	}
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
 
@@ -428,7 +424,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 
 	/* TTBRs */
 	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
-		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->asid);
+		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->id);
 		mmio_write32(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
 		mmio_write32(cb_base + ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
 	} else {
@@ -756,15 +752,17 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 		cfg->cbar = CBAR_TYPE_S2_TRANS;
 
-		/* We use cell->config->id here, one cell use one context */
-		cfg->cbndx = cell->config->id;
-		cfg->vmid = cfg->cbndx + 1;
+		/*
+		 * We use the cell ID here, one cell use one context, and its
+		 * index is also the VMID.
+		 */
+		cfg->id = cell->config->id;
 
 		ret = arm_smmu_init_context_bank(smmu, cfg, cell);
 		if (ret)
 			return ret;
 
-		arm_smmu_write_context_bank(smmu, cfg->cbndx);
+		arm_smmu_write_context_bank(smmu, cfg->id);
 
 		smr = smmu->smrs;
 
@@ -778,7 +776,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 			       sid, cell->config->name);
 
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
-					    cfg->cbndx);
+					    cfg->id);
 
 			smr[idx].id = sid;
 			smr[idx].mask = smmu->arm_sid_mask;
@@ -788,7 +786,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 		}
 
 		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
-			     cfg->vmid);
+			     cfg->id);
 		ret = arm_smmu_tlb_sync_global(smmu);
 		if (ret < 0)
 			return ret;
@@ -799,7 +797,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 static void arm_smmu_cell_exit(struct cell *cell)
 {
-	int cbndx = cell->config->id;
+	int id = cell->config->id;
 	struct arm_smmu_device *smmu;
 	unsigned int dev, n, sid;
 	int idx;
@@ -809,8 +807,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
 		return;
 
 	for_each_smmu(smmu, dev) {
-		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
-					  smmu->cbs[cbndx].cfg->vmid);
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID, id);
 		arm_smmu_tlb_sync_global(smmu);
 
 		for_each_stream_id(sid, cell->config, n) {
@@ -827,8 +824,8 @@ static void arm_smmu_cell_exit(struct cell *cell)
 			}
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_FAULT, 0);
 
-			smmu->cbs[cbndx].cfg = NULL;
-			arm_smmu_write_context_bank(smmu, cbndx);
+			smmu->cbs[id].cfg = NULL;
+			arm_smmu_write_context_bank(smmu, id);
 		}
 	}
 }
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ae8780ca2e5441f0c2c3950594967d0de9ffb73d.1602664150.git.jan.kiszka%40siemens.com.
