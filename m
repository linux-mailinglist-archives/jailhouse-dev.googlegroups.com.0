Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPVX5D5QKGQEF5JMHJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id AA239282CC4
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:15 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id o13sf796161ljp.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838015; cv=pass;
        d=google.com; s=arc-20160816;
        b=X6VTYKWsPXim1bIRiCgBLbgoUV8O67uBShBsyl6Bbw5HvEf1b4qManYjEoe1XKc0t7
         GnOXtO6vJtuY9Dte0UFaUQk/lPnOG4onUlSP8rAmJ8qISpfK2OoWYopGitIXamc+VYpX
         +qHMFri/hLcIf/BVc6w5dHe30uLlwCvOrbsxQgHOydj2qce4jZg8y8Rn1EjBmCNLS6iQ
         8sfPbzySWhUxBkhqQ1y92yxyGXDRCRUeWywVT5tiEgl9fAy7pQpMvZplLIDEynIBHx5g
         1IO/rLLcoMQcWyA13Q3MnG96bcVjteRogmgyOiRtjI/p/lOM6XR7W25ZqUo7Y5FNs0my
         P5xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=V63e4kad8apuindjWPNOFhcsl6jOviB3eLG8uo4EKBE=;
        b=PekIiSEAqtRcmAroYWjVa2tozmjHyje4cWo2Fm5REMFzvKbiUPb89pFyDT7GDE/uoP
         bDEmyJzUm0SeluU/F1Y49GrpnShIwiMxLu+L/f29B8uEGlcheTjxHif4z9HQ95uMX5cj
         9TyPGeyrxlogt5cZKJSPMhd55eOO3PI4keUPynOLbWH4JTJYFdm24lS8y7vUFUnkLhar
         0RKUgu9Hm4vuvAjS8DXhEFXn8iGbWLCmq24PetRZMPiiefFh+QtCGbHaVeDNS1MYpcd5
         MvFnpK11haE2EUiAxdi4+d1aiymedlQojt5VbULIpenS+5leBsS06Y2rVMvzyc254B0j
         wBsA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V63e4kad8apuindjWPNOFhcsl6jOviB3eLG8uo4EKBE=;
        b=FIsoF3Dc0D4InBqSX0K4jW4ENtVvxXcl7dXIaqARycEShlLpBvZW6M+p+sc3xGIp/x
         fdZSmocV+dcPq1oE5OQhFIWqP63Igz5WX0Guoz52+L879+pYyU0oVoMTEIHdlmfMh3IL
         m4Ryn+lI4Hqh8HUDGs8A6U7nh34jRSKpZ/t0nt40Zx8tYM9U+GM5pWleaXbLKAnh/5oR
         9w7DWvd2PEomBExPnklkXed/wCfHvi9dW1g7MXPMqaxazIPui9B6IdU4Jhb2QuQIOVZd
         yr9PcSSUQxwAqd1nfSqqyaXfHTxQs2gGWOHh8VRmDaGIU7C50r/kVoQUjnCfuTo62W7r
         9Drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V63e4kad8apuindjWPNOFhcsl6jOviB3eLG8uo4EKBE=;
        b=VKFHy6xfTFDjqZn8bnDwI7TqtgTcdXLyljBuMP/XPny5aWVwXgGWNkLSI7foMwMN6S
         K9B3Sl2hjaYoGRU2ixUkE5AZ6t9NH8nmwlgmG/BJC82ApUs7QZTtQxQWbsKhZAl7HFom
         /+Z6NzkFXmW6wmIjIgCJHHeU5cEkdX6VDS85cFzQfQY4SL0T6pblKVyS4Tk5PcHir6NC
         jyb5PGgOkBGu75CnvEruV7ExzcCkq6rQkWfLr8wVkD+8NINUmWhxbQVBHvRWkGazLMha
         q1pVvaIaJ+Pr8mp/D4FdGWAx5bY8De7mqf+0YDCzsdjfgaPrF8Q+CfdeNFu13IJ+GszO
         /hMA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530JzOIRG5T83secy9TcksQaDaJ3H4LUm0YHhOomcpBuVYSZ2nhg
	uR4TJUaxji0tj9OeL5BKxp0=
X-Google-Smtp-Source: ABdhPJxn6onaorNVzfU83W9nmoZF4/jfckhItUEgtPiiy6yQMhfan/BQUpAZ0819H6J5QO5HnFFy7w==
X-Received: by 2002:a2e:99cc:: with SMTP id l12mr927399ljj.370.1601838015247;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:804f:: with SMTP id p15ls88959ljg.2.gmail; Sun, 04 Oct
 2020 12:00:14 -0700 (PDT)
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr3413321ljn.211.1601838014005;
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838014; cv=none;
        d=google.com; s=arc-20160816;
        b=rWDnPCweYK7SO1njUtsuIACvyng62R2uQBFwq/DeFMgVqd55Bvi/BhMVDsDml5/nV0
         M24c0Sxi5+U5Gcx3684ByzJw/SUKnP0RZcdsGzs3P6hNWw5ZVfxSWSFcERKGLRPazpKV
         62wb+H2faMzO2fMvQ/0fFW0DJkUXYl9Cfpu5Pga4+8GaQie6CCYIyPmWkrEBYV0JHT9A
         Sjw4qXhhIvZ3vVUXX/T28xVj7QRXpz2WGNTHAg9jEzOvNAi3wm2W3BjoczWzLrBpL9SG
         CcHYC/mVV6pitf5ZFoDl4Qo/BKop//45MSQK7ppkyYzOTo9kzihLjDylujl0/UZE23Bj
         gs/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=puBFcwPXUalcyYcDukewaKNUtjZB2bjXoDOwl+DZMrY=;
        b=1H5I6k8zKowoQlvqEl1cbiTQVtRRWmWbxLQ+ts2sBVZpfl2lpPn+Fdq/bNSKfNcG3T
         zSZSejHFpfIpgi0Inig1tyOfcHJ9LCy7Wfc6jeoTkCv7+v2OPR+NgeSLdu3+rnwqQGfX
         MH5Yk0iSMCo46rgIsfEHMu/dgOYYabyITT9HvEC+ZX16k/VhKQ0FNPUTlWStOcjnrEzH
         IMeDN27XRSaRyUmD+Vcvhj3ZLVuehkkX24WtKgfJZRwxbCHUIWPzVWPG3PaWrXxblyOp
         oqTVcaU9LnUisQQDuewz4eovzrm5gwPeYhhZsFss3p/TS5hL5VVWAMfcSthm4g9AKfgL
         iHCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y17si250407lfg.2.2020.10.04.12.00.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0DMU020458
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060b017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:13 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 25/45] arm64: smmu: Drop coherency reporting
Date: Sun,  4 Oct 2020 20:59:46 +0200
Message-Id: <39f26537be470a31c9f7cd000cffcdac3393f731.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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

We don't do anything with this because we always flush TLBs after
changing the mappings.
---
 hypervisor/arch/arm64/smmu.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index ca86eed5..6abaa52a 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -17,7 +17,6 @@
 
 #include <jailhouse/cell-config.h>
 
-#define ARM_SMMU_FEAT_COHERENT_WALK	(1 << 0)
 #define ARM_SMMU_FEAT_STREAM_MATCH	(1 << 1)
 /* unused bits 2 and 3 */
 #define ARM_SMMU_FEAT_VMID16		(1 << 6)
@@ -426,7 +425,6 @@ static int arm_smmu_id_size_to_bits(int size)
 
 static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 {
-	bool cttw_reg, cttw_fw = smmu->features & ARM_SMMU_FEAT_COHERENT_WALK;
 	void *gr0_base = ARM_SMMU_GR0(smmu);
 	unsigned long size;
 	u32 id;
@@ -440,18 +438,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	if (!(id & ID0_S2TS))
 		return trace_error(-EIO);
 
-	/*
-	 * In order for DMA API calls to work properly, we must defer to what
-	 * the FW says about coherency, regardless of what the hardware claims.
-	 * Fortunately, this also opens up a workaround for systems where the
-	 * ID register value has ended up configured incorrectly.
-	 */
-	cttw_reg = !!(id & ID0_CTTW);
-	if (cttw_fw || cttw_reg)
-		printk(" %scoherent translation table walks\n", cttw_fw ? "" : "non-");
-	if (cttw_fw != cttw_reg)
-		printk(" (IDR0.CTTW is overridden by FW configuration)\n");
-
 	size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
 	smmu->streamid_mask = size - 1;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/39f26537be470a31c9f7cd000cffcdac3393f731.1601838005.git.jan.kiszka%40siemens.com.
