Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP5X5D5QKGQE3FK25RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C41282CC8
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:16 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id z19sf233787ljk.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838016; cv=pass;
        d=google.com; s=arc-20160816;
        b=kBcVeULmW/XdtvSpH+O5G3fQlMSMUasOTMrTtUN37cVeIVkSiZKa1GAkrV3DTNNbDZ
         RX0yYJf5Tzd6IqTc1mUMFNdt2s8gcRqAAiOj5kjqpJUc0XP6pwvnJ3f7U6wGm/QNOqQ4
         i1S98As0fY57WVCyPsn5Mk88mdwy5/vkS1YXvxaEkw45T6nreqL+LVfmdHIg0PlKdoCs
         YLO66mKQLYTJH1wbnOApiJJ8/+mgcUPx1EVuE0pZu2WXDhJtSFEqP1zBfC8w2XHzQ0ZZ
         cICZ+Dcjbpp/dQm/9Q+DajTrTiVN9qj1JDHB4RCpWMTq09o+eDrWdBBAqhDA2ieq2G4x
         B9Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=q6HiWAlrk9XoGfK/kSZU8wkJ+2ygsvdsnNfRGXhpBdY=;
        b=Hk6oEmozCHbSTWXHufiI3igFrnjUylBlukHQQPNCQsP7cow4oKTRAEOAMRmi1+3KsO
         haOcuc26V1/elWJvDv93xGaqt0dvB4Gkhg+mp4wbMhSK9SXmNfTi8DGrT16O8RIIKrKu
         LCcVRNPeLf3MRFEiqrKdmvRZE/7bNszekZuR+Y4qdNW5HWr/UnTu4b6lIVDzWw5sGAfa
         vI+z2YuRF6fD045nbDgSS0C3OnaSarDY/hh63U0N6c+j4v9ISib7yVeP9xbB4qmtCWIf
         qshdot3suvZxdMEtF9OsYfHPbGMaEHvjhARa0wWze26YVuUfGjGkJAbzYcDScYW26p7w
         dZdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=q6HiWAlrk9XoGfK/kSZU8wkJ+2ygsvdsnNfRGXhpBdY=;
        b=j0IHHjSSKMfzp2i+ADPGi5GpLVckJttZw4AznfbL8NjsaWMi4XXYTZpuJ+DY5V/36r
         2vY4KKDRXlw4B2nStycj7Zak9DpGTLTUSZQFopzCZrdvCFzned+oZw+HJSSa6mf1sUjX
         v4XqVuYlFmTGmjRvQkQFdfQ2q3irdO63yhAvnlru97OyjM8RWNbP4PflqlXiMq6ogoIR
         XP1mePOR9illi2j8nkDuLRzM4uzMLEI8njDD5a4j4VryxgpLl5z+FY0qbHyxHRp+w66S
         cTxfxhixLnSgQhPgDGwYstHsoW8/SJC5g439jXf5oq6TjZYciqNtooULuqOTsqhsmCDp
         ty8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=q6HiWAlrk9XoGfK/kSZU8wkJ+2ygsvdsnNfRGXhpBdY=;
        b=aHwK1kFzFwtDIpqzv04nAg2eaiQkCPFPpZuP1WyQ6o6s4Wswh6d5lswp4qjFIBNClF
         evAhLFGKLVbRcOGJVBP48Jpvd86yv6lb4S8Fi/NgEFk4RedNHnb5Xx6SYBzfKmhgPaoX
         WM0s8HfZSJjnLySEgpBFyMN3Nh+JGS2KxvfaUwipSdJPzUrWqttSnZ7wQKofXu/M6Hic
         IVK1BeLilonPlqSejAv7CHnv+R1+qs0DacN3rRvlQZ0/wA1hpn6AZxFgEkgo3GtAxzuS
         jdMCgjYqapZAXO8m2iOi2pV6cTOVnVv1CrQ6Bj8yYRJUuUf0h/1H6GUd/bJk4eeMcCtR
         fLAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Mq4rLclQ/AqySJjpBBl0xeRooksNPJtTSmTQA5SegKVhgO+F8
	tUKcNQpsS28DeHBMTmBuJOA=
X-Google-Smtp-Source: ABdhPJyoCqHS0RpUeEXzXvBUljkDPqAL6J4/F+5bvz+qHeKg7xEVREIeciJWJYWPiXSPoDyKfEfA/g==
X-Received: by 2002:a19:4344:: with SMTP id m4mr4701878lfj.181.1601838015993;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:555:: with SMTP id q21ls749366ljp.3.gmail; Sun, 04
 Oct 2020 12:00:14 -0700 (PDT)
X-Received: by 2002:a2e:965a:: with SMTP id z26mr3432684ljh.88.1601838014888;
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838014; cv=none;
        d=google.com; s=arc-20160816;
        b=KpXgvSV5nQ5MTQzubdwXhOWIwm5c7/u/wZyekM5ovQ75mIPFcL3F27Dxsp6B37kefk
         SQ9Af1T1oGBbinBY4IcSIv0F/YePzpmUhVuOpsuUuT2kD7T9/SEZMjoeELN6NzPzw0B5
         C8k8uTGlguPGKQIv9vbKesQDGKvu/2U8dIfMbyNKCxFGXjLtoWpDos7O4Y9lVpyJtld8
         UoFwy4UHXWhEyjaxdjSa+fBpMg/I2rbwfJTZwRSYLteO44qn1xlvDCJF7JNgO2xxDyh8
         bmlIpe2RestT+m6t2tEsUP3X5NyO1nFqs7qi7HuAWyj5b4tJsbWiXsSpKZEsBRcg5HkA
         cOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=egRpVl+fg6FwsKbKWFEVvdvBFTf9XuXGSHYMBzyQI/g=;
        b=D0Z+NNGRtAadZz9Pon5QjYwIQ//+QY7cns4QhDP/DiCjohOsV8KD8hUnQQaqllFDz7
         isGg0+XVSBcgHJZ2ogQ88ZKPm/IIlAeTntwa0CT+SIM4N96Tw3ShRflZSWM0VEHxxDdg
         BfNjs2uO7kgx9TMJCEyr6KZnPHzBVbRNhhhhdFgN7fy4f9X0KcTSppzIfLI2C3ytuD6A
         QCrRXXnrMWWIe6liKBLsUEhNdubn7AbHdCRNlk0FUm1bmNipWJgpVJghKhI8S1wVNuYz
         ED63HdnfuplM/2blN4Xk/PGGipsu2H4+NCefYPpyXe6v6MxSeLR8pmKYlasRpR56i+WD
         pZFw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 11si181094lfl.4.2020.10.04.12.00.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0EAU020494
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060f017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 29/45] arm64: smmu: Drop dead arm_smmu_test_smr_masks
Date: Sun,  4 Oct 2020 20:59:50 +0200
Message-Id: <cdcd368a564360e1df98a78b4a8a7306c7bf3b28.1601838005.git.jan.kiszka@siemens.com>
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

Nothing was done with the results.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 5becec19..95d45148 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -179,9 +179,7 @@ struct arm_smmu_device {
 	u32				num_s2_context_banks;
 	struct arm_smmu_cb		*cbs;
 	u32				num_mapping_groups;
-	u16				streamid_mask;
 	u16				arm_sid_mask;
-	u16				smr_mask_mask;
 	struct arm_smmu_smr		*smrs;
 	struct arm_smmu_cfg		*cfgs;
 	unsigned long			ipa_size;
@@ -406,7 +404,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		return trace_error(-EIO);
 
 	size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
-	smmu->streamid_mask = size - 1;
 
 	if (id & ID0_SMS) {
 		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
@@ -471,30 +468,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
-{
-	void *gr0_base = ARM_SMMU_GR0(smmu);
-	u32 smr;
-
-	if (!smmu->smrs)
-		return;
-
-	/*
-	 * SMR.ID bits may not be preserved if the corresponding MASK
-	 * bits are set, so check each one separately. We can reject
-	 * masters later if they try to claim IDs outside these masks.
-	 */
-	smr = smmu->streamid_mask << SMR_ID_SHIFT;
-	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
-	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
-	smmu->streamid_mask = smr >> SMR_ID_SHIFT;
-
-	smr = smmu->streamid_mask << SMR_MASK_SHIFT;
-	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
-	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
-	smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
-}
-
 static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_smr *smrs = smmu->smrs;
@@ -677,8 +650,6 @@ static int arm_smmu_init(void)
 		if (err)
 			goto error;
 
-		arm_smmu_test_smr_masks(smmu);
-
 		num_smmu_devices++;
 	}
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cdcd368a564360e1df98a78b4a8a7306c7bf3b28.1601838005.git.jan.kiszka%40siemens.com.
