Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBTOPUX6QKGQEHM2BMLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5442AC060
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Nov 2020 17:01:19 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id m17sf3512070ljb.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Nov 2020 08:01:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604937677; cv=pass;
        d=google.com; s=arc-20160816;
        b=QWElMThScJTkrKVb2CXjWG8CvX3gupwdM2QasOVXTRbKk4uINJQxn5tjb1HA+KTqz6
         XGIM5b/hyYJl4+Ppmz5AVp7vwmN8zDm3QF/eFNELpPzQVTzNJiw/d8FWomEU0aakawiH
         qtkuiJqSA2C1N+3b1TxOAw+lWmbQrB3tM629CmWr/gHpfY/fc/oEaJzIxxOd0kQq8Cwk
         2b73F/ayJQAyDtEWrbuHBQyVYG9ihESv8TuWoP/EoNqwXw99SPCjQx5rKByHIGnS2f3L
         QuyivJAiYX7U7gFr/4xEoEiIVISqkCfs1SRDYCQNFcFpURVulh4aiYqUHD+O0E7jsM05
         XQ4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=ANmH6juM1HWMQHwyP92VeIJ23eIUcwE78d7NGWTmTXc=;
        b=D/fqxIHN7S0VxUWj2yvo7z3pK7m2PbCgBdZh43n6ynZIKWeEGPELW+sFeIBw9R3c2Q
         o2GqS541pHLus7eMMRFhsV+xa5Mmsz1z3M1S5HYdIuAEG/sl/aVTpq04vrm4MaP/J4dj
         sALeWQ2k2AImuc9pOKXEmcqp9H4XHsbA1hTlwBxA3dxTF6gCCaWL6RVyVylMmymSMkK7
         ihBTrbDW+EvbB9+mfJPrOCtrU/ojZk00h4omgl+c7FHwi3SGgNXMyRUuL67RDNzXDLQc
         gjSsAm89BR/2Bqw8rDXUpUSYGxrj5aN06dasB2dleq6C9NQldeRbz26jPCdwm0Qy9Z+U
         o+Nw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=x+38X4Xq;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ANmH6juM1HWMQHwyP92VeIJ23eIUcwE78d7NGWTmTXc=;
        b=oXfJdG0gDfZjKQuoHbiOlZdw6122h+yNgXzNK5B0AysKfx0MbFJhZrQ9XiwIWo7nzp
         ozVd6RD2iJ6+lgisX0bF1eHcgBX/UxwlFkhv6Un1vwi2hxiM7ijCTIG8AJgOF936KePY
         ONAagz9ccMe8SvybVqqcD9TS32mzW4txWRT2HO5pwh7lQqOOauPAlsYHXrJf/+DXEogi
         DJxBn3KyHME4QVVueAmZ0nNjiIGF+wcBd1IPoI4cGxnP5d+B58UwfPkL1TQ+3b7guFor
         /7uksMNPvOsAw1iE6YZemooKYRVUFbtF2+ke9egbXQVJ54wk9mSoEqxKppHRpMNjm/EJ
         U2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ANmH6juM1HWMQHwyP92VeIJ23eIUcwE78d7NGWTmTXc=;
        b=BxpeZPQj7K2HmpaHvKAUb46kbx49ow/R68oK4K3s8QAjlkQWVlra6HuJlo+jX0r/03
         D+E5QKlgzfqQKc61bmEQfVDUPmrDQInkSf1M2aufFBZNpRBB84VTERAkgg2cTO37vbdr
         +r33Ybs8jXKd3lfN576lA72Y3vutHmUt0Q35ieZTPi7EcUZBKFMmVC70rGAcHM6aGgiN
         l0SmZke9ASqazSaGZE9ejVF+xTWdBHOYDtmsdxUnMtb+xzbmptO4tfH2KoeT+drvCwCs
         +eSn0fLqksj/T82QUmpQO2+2CEogEEY8kvyUW4hBfSxA1F7qE1lNbAr1sfrrzYasBVfq
         n0VQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cBT6I6KVBJN5sYo5LgXVcZCHld4Hs0m4hY5L/lo6Z7Gg97fjT
	VvQGCBO3MdOYsX1c+BeXANQ=
X-Google-Smtp-Source: ABdhPJxNoRhV+7b5WIZC8OZYB0u7TQBR4II3g5FDky1W+pQBJv1ADqcDQ+R2SJRuNkyy/omhHwwfyw==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr6324697lfg.251.1604937677737;
        Mon, 09 Nov 2020 08:01:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:998f:: with SMTP id w15ls1521264lji.4.gmail; Mon, 09 Nov
 2020 08:01:16 -0800 (PST)
X-Received: by 2002:a2e:a317:: with SMTP id l23mr3841875lje.302.1604937676243;
        Mon, 09 Nov 2020 08:01:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604937676; cv=none;
        d=google.com; s=arc-20160816;
        b=yvfwqe6LfxFecSdiBxe7yMQlltTm7W4XRtUXwVY/8Fh8Ycii7VK5o98yHj21J89gwG
         wJcHvzCM5ui52gIMEw+X/kLD4N7k9pwK2fNlrfbCN64G0K+kLo0q9rPL5FYl4buR9e2x
         EpOVs27bYmHcx4owJ+5/vLxXKMDX3dPtfn1C1PzOPSw6tSE+aDSBSCwrt6Y2W1xu5C8Q
         Pr7HVL5TjozuEq16LVbY8+p2urw/hAlcQhwxlt+kgIODr57efIv1x7ZzW6fLi3rLoo6i
         DQByASkyTTXUCvi/e6XzB7oZaI6n9At2u66nEBjGMIz8ZJwt5xCXzjaKYMGbGoSLNWsD
         YAZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=qBW0Mws6GXOm0ZHPI2tmYhub/SiyoSMdVgjJN4A8pw0=;
        b=ufWY7w9nb834mzhP9FlUELUj9GLjtFzBaCPpYFXz3aNcuH7RoqMm+Bd3GTFf8qG3U2
         vASyy0fl5CmRlqG9FUa6quSxs7X+3RivCQRcr/BWI2qekfPZcqfATYmVdyzwRjtYMLkR
         HndbZexMr5/sygkXMPQ2zkSA7M6OyppKh/J/MVj0j8Fk7UIXAWaM+PjLOTqy1OZ7+/kL
         WrN67NEm9c0RgdUHU44ZVRp4P1KgDzkB80tMfepK+yin7jcgAkkQVR2ec4ARpwOvMMsm
         HilUwoonr+K0KShOFn0ERhic8CqwaTtB/MIGntG3k+AwB2PPGORnZD4BabgutvXgBWLp
         /ybA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=x+38X4Xq;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id h19si188350ljh.7.2020.11.09.08.01.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 08:01:16 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CVG234TBkzyWq;
	Mon,  9 Nov 2020 17:01:15 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_TO_SHORT=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id AZ8fsDQIo7g0; Mon,  9 Nov 2020 17:01:15 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CVG226ZLkzyRL;
	Mon,  9 Nov 2020 17:01:14 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2 1/3] arm64: SMMUv2: Separate stream ID's mask and id
Date: Mon,  9 Nov 2020 17:00:58 +0100
Message-Id: <20201109160100.103095-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=x+38X4Xq;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

The SMMUv2 allows filtering bits when matching stream IDs before they're
passed to the TCU. In this way multiple streams legally get the same
translation.

On boards such as the ZCU Ultrascale+, the master ID needed to identify
the corresponding SMMU stream ID may be dependent on a specific AXI ID
that is set by the PL (and could be IP specific).

One single fixed mask to pass to the SMR to compact multiple stream IDs
before they "hit" the TCU is not flexible enough. The use-case is to
compact similar PL-originating masters and have the SMMU behaving the
same for them (e.g., they're assigned to the same inmate). At the
same time, one needs a full stream_id to assign e.g., different GEM
ethernets to different inmates.

For the MMU-500, provide an explicit mask + id in the configuration and
update the implementation accordingly.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu.c    | 73 ++++++++++++++++++++++-----------
 include/jailhouse/cell-config.h | 15 +++++--
 2 files changed, 61 insertions(+), 27 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index df92fb7a..9b824782 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -84,6 +84,10 @@
 #define SMR_VALID			(1 << 31)
 #define SMR_MASK_SHIFT			16
 #define SMR_ID_SHIFT			0
+/* Ignore upper bit in ID and MASK */
+#define SMR_GET_ID(smr)			((smr) & 0x7fff)
+/* Mask is already specified from bit 0 in the configuration */
+#define SMR_GET_MASK(smr)		((smr) & 0x7fff)
 
 /* Stream-to-Context Register */
 #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
@@ -152,7 +156,6 @@ struct arm_smmu_device {
 	unsigned long			pgshift;
 	u32				num_context_banks;
 	u32				num_mapping_groups;
-	u16				arm_sid_mask;
 	struct arm_smmu_smr		*smrs;
 };
 
@@ -164,6 +167,15 @@ static unsigned int num_smmu_devices;
 	     (counter) < num_smmu_devices;			\
 	     (smmu)++, (counter)++)
 
+#define for_each_mmu500_sid(sid, config, counter)	\
+	u32 __stub_iter; \
+	for ((__stub_iter) = (jailhouse_cell_stream_ids(config)[0]), \
+		(counter) = 0, \
+		(sid) = (union jailhouse_stream_id)(__stub_iter); \
+	     (counter) < (config)->num_stream_ids; \
+	     (__stub_iter) = (jailhouse_cell_stream_ids(config)[++(counter)]), \
+		(sid) = (union jailhouse_stream_id)(__stub_iter))
+
 static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
 {
 	struct arm_smmu_smr *smr = smmu->smrs + idx;
@@ -360,7 +372,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
+static int arm_smmu_find_sme(u16 id, u16 mask, struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_smr *smrs = smmu->smrs;
 	int free_idx = -EINVAL;
@@ -388,7 +400,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 		 * expect simply identical entries for this case, but there's
 		 * no harm in accommodating the generalisation.
 		 */
-		if ((smmu->arm_sid_mask & smrs[n].mask) == smmu->arm_sid_mask &&
+		if ((mask & smrs[n].mask) == mask &&
 		    !((id ^ smrs[n].id) & ~smrs[n].mask)) {
 			return n;
 		}
@@ -397,7 +409,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 		 * though, then there always exists at least one stream ID
 		 * which would cause a conflict, and we can't allow that risk.
 		 */
-		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | smmu->arm_sid_mask)))
+		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | mask)))
 			return -EINVAL;
 	}
 
@@ -409,7 +421,9 @@ static int arm_smmu_cell_init(struct cell *cell)
 	unsigned int vmid = cell->config->id;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_smr *smr;
-	unsigned int dev, n, sid;
+	unsigned int dev, n;
+	u16 sid, smask;
+	union jailhouse_stream_id fsid;
 	int ret, idx;
 
 	/* If no sids, ignore */
@@ -421,19 +435,22 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 		smr = smmu->smrs;
 
-		for_each_stream_id(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(sid, smmu);
+		for_each_mmu500_sid(fsid, cell->config, n) {
+			sid = SMR_GET_ID(fsid.mmu500.id);
+			smask = SMR_GET_MASK(fsid.mmu500.mask);
+
+			ret = arm_smmu_find_sme(sid, smask, smmu);
 			if (ret < 0)
 				return trace_error(ret);
 			idx = ret;
 
-			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
-			       sid, cell->config->name);
+			printk("Assigning SID 0x%x, Mask 0x%x to cell \"%s\"\n",
+			       sid, smask, cell->config->name);
 
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS, vmid);
 
 			smr[idx].id = sid;
-			smr[idx].mask = smmu->arm_sid_mask;
+			smr[idx].mask = smask;
 			smr[idx].valid = true;
 
 			arm_smmu_write_smr(smmu, idx);
@@ -449,14 +466,18 @@ static int arm_smmu_cell_init(struct cell *cell)
 }
 
 static bool arm_smmu_return_sid_to_root_cell(struct arm_smmu_device *smmu,
-					     unsigned int sid, int idx)
+					     union jailhouse_stream_id fsid,
+					     int idx)
 {
-	unsigned int root_sid, n;
+	unsigned int n;
+	union jailhouse_stream_id rsid;
 
-	for_each_stream_id(root_sid, root_cell.config, n) {
-		if (sid == root_sid) {
-			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
-			       sid, root_cell.config->name);
+	for_each_mmu500_sid(rsid, root_cell.config, n) {
+		if (fsid.id == rsid.id) {
+			printk("Assigning SID 0x%x Mask: 0x%x to cell \"%s\"\n",
+			       SMR_GET_ID(fsid.mmu500.id),
+			       SMR_GET_MASK(fsid.mmu500.mask),
+			       root_cell.config->name);
 
 			/* We just need to update S2CR, SMR can stay as is. */
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
@@ -471,7 +492,9 @@ static void arm_smmu_cell_exit(struct cell *cell)
 {
 	int id = cell->config->id;
 	struct arm_smmu_device *smmu;
-	unsigned int dev, n, sid;
+	unsigned int dev, n;
+	u16 sid, smask;
+	union jailhouse_stream_id fsid;
 	int idx;
 
 	/* If no sids, ignore */
@@ -479,10 +502,16 @@ static void arm_smmu_cell_exit(struct cell *cell)
 		return;
 
 	for_each_smmu(smmu, dev) {
-		for_each_stream_id(sid, cell->config, n) {
-			idx = arm_smmu_find_sme(sid, smmu);
-			if (idx < 0 ||
-			    arm_smmu_return_sid_to_root_cell(smmu, sid, idx))
+		for_each_mmu500_sid(fsid, cell->config, n) {
+			sid = SMR_GET_ID(fsid.mmu500.id);
+			smask = SMR_GET_MASK(fsid.mmu500.mask);
+
+			idx = arm_smmu_find_sme(sid, smask, smmu);
+			if (idx < 0)
+				continue;
+
+			/* return full stream ids */
+			if (arm_smmu_return_sid_to_root_cell(smmu, fsid, idx))
 				continue;
 
 			if (smmu->smrs) {
@@ -546,8 +575,6 @@ static int arm_smmu_init(void)
 			continue;
 
 		smmu = &smmu_device[num_smmu_devices];
-		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
-
 		smmu->base = paging_map_device(iommu->base, iommu->size);
 		if (!smmu->base) {
 			err = -ENOMEM;
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 472cb4bb..d7a15990 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -279,13 +279,19 @@ struct jailhouse_iommu {
 			__u64 tlb_base;
 			__u32 tlb_size;
 		} __attribute__((packed)) tipvu;
-
-		struct {
-			__u32 sid_mask;
-		} __attribute__((packed)) arm_mmu500;
 	};
 } __attribute__((packed));
 
+union jailhouse_stream_id {
+	/* Note: keep first */
+	__u32 id;
+	struct {
+		/* Note: both mask and id are only 15 bits wide */
+		__u16 mask;
+		__u16 id;
+	} __attribute__((packed)) mmu500;
+} __attribute__((packed));
+
 struct jailhouse_pio {
 	__u16 base;
 	__u16 length;
@@ -427,6 +433,7 @@ jailhouse_cell_pci_caps(const struct jailhouse_cell_desc *cell)
 static inline const __u32 *
 jailhouse_cell_stream_ids(const struct jailhouse_cell_desc *cell)
 {
+	/* Note: deliver the __u32 full id */
 	return (const __u32 *)((void *)jailhouse_cell_pci_caps(cell) +
 		cell->num_pci_caps * sizeof(struct jailhouse_pci_capability));
 }
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201109160100.103095-1-andrea.bastoni%40tum.de.
