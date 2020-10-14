Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXXNTL6AKGQEXVI3ILA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 975B028DB63
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:19 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id n25sf289858lfb.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664159; cv=pass;
        d=google.com; s=arc-20160816;
        b=yoUzGL1fZdJw/Xc8FPbbR9RGiFetXUA5eJhQs7zZkK28ZjOcgWHeslhkGUcKchguPc
         7FczK3EjKY175OYSMHOdA8nSJSYuAgWexljexjtblt5k2l5NTZT47Gp66jRuDSMQHxl4
         yCBZ9w3ceQXqvPO7CtP/6G2HMARuh7U6A6PiQWTBiet508uiv4RQ+gH8pCHyfLdo41D2
         BqikLPRZP+Yluou3oTlsd3UDuN6+l1bpYRx00/RwRIV8aUO4vFMm3qS+I/1CAhqgOThE
         065EJkQlUMqcLxnPsw1u5dkPyF+oewRSADOUtxQ7McZFee9QGqmWNRfzD9D+dL49bnDz
         2xZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=xakhaSojLvCiOH5KQKKAmXdlpfF7+rcAK9PoD8GuUT0=;
        b=KUGm/qi5M/WkYkdKu1NyT3OAVhHL07QZeUG4jPyfflabLAFC02NF6Noz/6tZUms+06
         foX1D2qzNE0vebHVSbuHHEy4rj9ow42ZjZcvHJGtGvS47R2x8+Z96dv7dZZ0GeBPdkyd
         GInQDL3eK2mHWQ7GCkJFm4UHRMP4L98TC21h+R9T+U38YU6jind69MkzSmTcov0q+y0o
         kTaO7KCozW5dpA089lUKPhtgZc3nX6PasuH9tgTDh5xaj863vE5bnLT3qhTaVwzDvUbB
         alsfThsOcNO/mQLGCBq5cu+vhetEvqMzcZ38smQj49g1D8s7uQx+Omy0eY/Wx+m5Am9q
         hk9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xakhaSojLvCiOH5KQKKAmXdlpfF7+rcAK9PoD8GuUT0=;
        b=pfzAFNW598sM/2S6YViHcDieUB8pN2/3w6sMEF6VygX917rddrF52H7HWB2DDDAdTy
         5chUJzIGl/NbVYKt2BWiGmBV/yqc0rG2hwm0FiCB9X4/I5gTK5Fnpm+ZdMju4LC7/L1C
         sS/WJDW96z0LhkzTdUms1qQlWHVskGyQLPptd6bVotyfuvYhIBG5+XG6aj03fa0LMX8Y
         dQhZHrHMgGSjZHKGUSB7O8o7KFMgwIdPC/VMibUTgkV8AE9YfwI90YXbaVh/MzoKWCNs
         MXAZs/6sqjihnhXU/36poIViT55G/NZgOfFWia4JnYXjQJVMv/gGuhrp1GAcCcMIjpA1
         opzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xakhaSojLvCiOH5KQKKAmXdlpfF7+rcAK9PoD8GuUT0=;
        b=sHH9rOtk1HLsLyPnzMhxe6FY+uyaZAwLjgLWcTku3INePL1/Z5VVYyrLfBRjkp8WoJ
         wOX6Vi9IEXo91ated5XsVv0H8s47jYMljwUxEiq30Wua3sYPQIOtLF/njUGDd+BBcDU0
         evQUZK94n9+t2XhvAEfnW6wYabNw0YjXw9E1FzLowmif+sizNnWGFH1boibCaXtPBFDB
         Ua24O7zwa40o7fziahv+mdmtmg5wJKObDEPV/wMuK+5gOK37/Y4XRIgtJJQs+SC+FsLP
         QyDDa8M5dfgat2LZItc7yIK3enEjIGxYy5E0SmS5iAK02WnXvSuNp+c5svgHbzCe48+b
         rjpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531RVG02/5O/RP7V/aP24l+QlnaKjL7GBkPRwNK9OieubR0mhcv3
	rRBWa2c5ODexQO8I0T3VLb0=
X-Google-Smtp-Source: ABdhPJxIbbvc/dGGm5RAQCyh7sQx9B2f303J7F4WlJbeR3YeJANxeXFtDBObHSYlTtVGU0uwJAMNnw==
X-Received: by 2002:ac2:5f09:: with SMTP id 9mr958516lfq.407.1602664159148;
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:888a:: with SMTP id k10ls479708lji.10.gmail; Wed, 14 Oct
 2020 01:29:17 -0700 (PDT)
X-Received: by 2002:a2e:9c88:: with SMTP id x8mr1241245lji.251.1602664157678;
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664157; cv=none;
        d=google.com; s=arc-20160816;
        b=NQE5J1zywWsjwkRB4LnEv1FUlxGWRTL7UIWyO3qnG2sABBfeP8T6uUAMOY10G1k40H
         nTQ8Nn12r8S16JYAziDUdKw9bb6PFFWadKtrbiOMLvJ4U9SW5JabLmJgpNWkpXtz2Mye
         mqKJOPalZVE4IYjxm25eq2wLAXUHVyRwKjiq/6DA+TVwRu5yJqSYoI/FJ/J39ofJ9wHH
         UwnWrZ7BmYMvld3ONwQa8q5NbqJWcJn1sd6JDrHnTJcLpsElXxETbSrKjnODAoHCOI01
         xBmlCe9MXpy44n0hJeRxeIWRxAxCIiOgEkc3s8dD1w7isZn5XQwFvCMgK0WEaBDeCu9+
         7wEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=puBFcwPXUalcyYcDukewaKNUtjZB2bjXoDOwl+DZMrY=;
        b=TZsik3csWCRhrTX79u2Mzy4vh/Ou8wWbuQnSSsYlyAwvTgG568h/thvOzUVSszei3G
         CnwWjaj3iJ4NKxirDFG696Fy2Rx/BcmpEm8ncY0/8AVV9y3+JAHtABQ8qXlNIAOdUp8M
         RhNVHaS9kE1AnsoygbYbZu1gPxldp4vTItsecexEy75/DnBdwmIPSdjisQPM7I4W2WDT
         H8vhmzl5RLu73dDU62ghbplx6s9elRnfHSryR1ah9lm1epASq4wcOwkvPAS9NhUnWaOM
         O+rdsrDojm+bqlwhvpAG9xhD3PX4PcEM+Pv3dU2+8TdnKgsK8PdJHf5wDNzevIl+Rns9
         Gx8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id b4si50651lfp.13.2020.10.14.01.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TGgV032765
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJC002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 26/46] arm64: smmu: Drop coherency reporting
Date: Wed, 14 Oct 2020 10:28:50 +0200
Message-Id: <bb3d0db308bd7b84d1440f4f99068b060a15ebcd.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bb3d0db308bd7b84d1440f4f99068b060a15ebcd.1602664150.git.jan.kiszka%40siemens.com.
