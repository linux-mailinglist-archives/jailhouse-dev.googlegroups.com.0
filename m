Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBIEVRP6QKGQEQJJQAZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEFD2A67D1
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Nov 2020 16:37:05 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id o5sf4617529ljg.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Nov 2020 07:37:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604504225; cv=pass;
        d=google.com; s=arc-20160816;
        b=T0j5YU8vI9MpbVaAvAYF2oysyHwQY1S1+I0L3dRAGbT6Y1+Zi7B+fXx6u0OS7QaMGF
         2L6es5qdweRFCSWukAOxUKZ0YMpOZa+Efj5EGWJdxlQeYxJVFz5VYRGUPmPxawIeTMuD
         /E+FhkooI/j5agc0EblJfuEOwUBYO0hO0zk6oPmnTvYdLeuLwWkUGPPAlqCCHXIlz8HB
         Mv4GrgJ2R9lsOgadnAvdeJfCaFWJGJRtcyCABu3p6lpiDmNdZx333T0lPMqMPjbIXq/2
         grYB+6g/WkIZoGzXwofQ+Gxp7fhLKMHydkcC1ukMlXfsdOQUy5IlH34aXC3y9FNj1aUP
         jPIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=w778EwZvLPbRqQiDaHx5I7vBB9veK3IKT+elQAGTMJI=;
        b=s2PF06Uy3L0906W6VdzaOKcaaCwE/sr2xYeTPRmVC3AQ5ay4sqVznK7NTK3KE+cvuP
         z4PNKSBa3d8NZeDCX5zE1ezzf8Hcx/1uMBeJ9ZFallJr8ggdbJmPKJXM7yuuD+zhEMFI
         0NWg7Ick+EgJ1HWZC9qTXc2qLme0in2/2h3y+Xs9SvOJF7a0uVFoc8Wa6Lmwp2hWWg0h
         1PB9UU17ayyGkB3x7leySe9f7NBA8S5DsIwkvb36EMKM7bOmel8ufNwsXBYmepdXPstt
         ZvmJDIFG0XBjJOGBMX5Dzbei/5XzVF9kYYBC+9HMnxCGhsWFDj3aGUolhBzBlnCgpCjo
         0Lig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=eOc2lnDx;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w778EwZvLPbRqQiDaHx5I7vBB9veK3IKT+elQAGTMJI=;
        b=GArjSTmuvS2rTjp1Edv1IZdZzK1CK8VCLcASuUtuSEI5bR050f+m//8QNveJ+vO0xT
         YXTFXGxfJ7rBuZ5c0BG775ZOFMkIyoWLyYakVnkNB0Dead9nYrvV+AOu2x5rrPiQxVGR
         cW5upamrqxyEG60s9KlI6ZIgw81XA3D143PMKeDllN1r+itdHHoI6mhYjap49lc21SJ6
         82Syd3acEs4KM7jiPCXKTSaWr5AK3WOzHmPz6G96d7cDH2l5EBYrdvdnKOlcXF96GlVf
         a80DGWpWr3V3ZnpGNPWBGUb9UYOy+b1FwDLysOESgfDkirnv+s5dt8WH/Cu9ADyElOYd
         iy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w778EwZvLPbRqQiDaHx5I7vBB9veK3IKT+elQAGTMJI=;
        b=Po5aNcrWTIGATpYBSkpl/eXpxypxrPF6yn55DiCx2n7QQi/moUUszOmolgFwfrAu8e
         0Cy0btvvMLeQOUk+kkLz+NHrMZZeA/XIRfWXCG8LN52WELhSXLOKCHTuVtWQjUj675iu
         uop8sUIUtR5mzNgck6bzb0a18ntLd13K+uInek1QOUNcRpa2I+6GghganENC8S5XJ2Zw
         Ov4uqkussgtzYC9btqQe48KzRzWCNayDxcO3moU0Gm937vb0a3BKP29OK44wRF4mT8Pv
         wGQ1b6JqdavfO9qHgp8TBMMbHd7/OV2xwCuWvwUpuomP1PzPPGge6kBXk717w5LPN4BN
         gkxA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530pK6fa7ZslEijTg54tBNgYxw0LHyjjxN9+RE9mJ/73XOJXX6tj
	Twfu60yMEKVFIVJHIVO24FA=
X-Google-Smtp-Source: ABdhPJyCGoYNqu48H+QAaB2Xye6PKyV8Pub3s1l0knRlBZ2kw8edJ6/Yjz0ucc6n9z9GBOWaiY+txA==
X-Received: by 2002:a2e:9a16:: with SMTP id o22mr11575961lji.395.1604504225014;
        Wed, 04 Nov 2020 07:37:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1516068lfd.3.gmail; Wed, 04
 Nov 2020 07:37:03 -0800 (PST)
X-Received: by 2002:a19:f20a:: with SMTP id q10mr3831575lfh.338.1604504223608;
        Wed, 04 Nov 2020 07:37:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604504223; cv=none;
        d=google.com; s=arc-20160816;
        b=IwFRAygI6CWdxzXy9t5CKmycl+I4rOw9EOyAonYw0TUeFLeT7T0K/e5cZ21ARRtrPh
         AHWmLRjOymFBhWFxmAf2kExXB/GFPI16Z1m6ZO6OjKe8Q3AnnsKNI6C6XlvoafHIkltD
         9vmp4/VdgKJ9BD879GCOO+fpR0RIzXCxzomynvt3LPJ2rMZLDshPsmnpS/arFKjcOg+m
         Nhgd5pycpE+vvt1eh/iI5VcnlLHirz7pPq2s0FVb1PfGDwBWH3MTa4BRVwrL2qrKxNRi
         78bzKdQtCEGBjT8Jw/GjMuKb0QE8mky471zCdy2HDxIXXq4URvprZmBWswxXnzARsetz
         IRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5VafCvPQe4fczU+QixX3pbycybind4HzUHcOq4JbeTU=;
        b=iU3POfwbmJMdQzie0zHO5aYNprxkkcvU/6spU5TqoMH3sYp589VV3osM7Bih5DCTKK
         vSvQw7aFQWC3md6FrVs78f7ivi0ZJ8pxMtyhld1rQpVIq5HPU2nx+9WejkS5WQW+JYsE
         w/uarwtnQ+P+UOT4HjKPqyOXg1DaqpBbmYwLh0tQ+607Msm4SbjvwE0hfqq20lkDMd0B
         zjvKNe7NDgM1TjOXLEHNBazxLO3NuX0dPAY91NqEcn7clKvtpyEJ7lPJhtScHLLojqO7
         poK3VmGaoXuKAq3o2tm4jWepkhdhub/Fs+KwG91gqDXolQrwhvNsqGEG0iF3PEG5IGVj
         7XHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=eOc2lnDx;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id i17si104188ljn.4.2020.11.04.07.37.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 07:37:03 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CR9kR0b9JzySx;
	Wed,  4 Nov 2020 16:37:03 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id AXMfMnKEO6EB; Wed,  4 Nov 2020 16:37:02 +0100 (CET)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CR9kQ2vl0zySh;
	Wed,  4 Nov 2020 16:37:02 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	jan.kiszka@siemens.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 1/3] arm64: SMMUv2: Directly encode mask and id into a configuration stream_id
Date: Wed,  4 Nov 2020 16:36:46 +0100
Message-Id: <20201104153648.35076-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104153648.35076-1-andrea.bastoni@tum.de>
References: <20201104153648.35076-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=eOc2lnDx;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
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

On boards such as the ZCU Ultrascale+, the master ID needed to identify
the corresponding SMMU stream ID may be dependent on a specific AXI ID
that is set by the PL (and could be IP specific).

One single fixed mask to pass to the SMR to compact multiple stream IDs
before they "hit" the TBC is not flexible enough. The use-case is to
compact similar PL-originating masters and have the SMMU behaving the
same for them (e.g., they're assigned to the same inmate). At the
same time, one needs a full stream_id to assign e.g., different GEM
ethernets to different inmates.

This patch encodes the mask and the ID of a stream directly into the
stream_id of the configuration. The encoding is the same as the SMR
encoding.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu.c | 54 ++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index df92fb7a..191ff154 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -84,6 +84,11 @@
 #define SMR_VALID			(1 << 31)
 #define SMR_MASK_SHIFT			16
 #define SMR_ID_SHIFT			0
+/* "Full" Stream IDs in the configuration are the combination of MASK + ID
+ * according to the bit split as defined by ARM SMMU architecture version 2.0.
+ */
+#define SMR_GET_ID(smr)			GET_FIELD((smr), 14, 0)
+#define SMR_GET_MASK(smr)		GET_FIELD((smr), 30, 16)
 
 /* Stream-to-Context Register */
 #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
@@ -360,7 +365,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
+static int arm_smmu_find_sme(u16 id, u16 mask, struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_smr *smrs = smmu->smrs;
 	int free_idx = -EINVAL;
@@ -388,7 +393,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 		 * expect simply identical entries for this case, but there's
 		 * no harm in accommodating the generalisation.
 		 */
-		if ((smmu->arm_sid_mask & smrs[n].mask) == smmu->arm_sid_mask &&
+		if ((mask & smrs[n].mask) == mask &&
 		    !((id ^ smrs[n].id) & ~smrs[n].mask)) {
 			return n;
 		}
@@ -397,7 +402,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 		 * though, then there always exists at least one stream ID
 		 * which would cause a conflict, and we can't allow that risk.
 		 */
-		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | smmu->arm_sid_mask)))
+		if (!((id ^ smrs[n].id) & ~(smrs[n].mask | mask)))
 			return -EINVAL;
 	}
 
@@ -409,7 +414,9 @@ static int arm_smmu_cell_init(struct cell *cell)
 	unsigned int vmid = cell->config->id;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_smr *smr;
-	unsigned int dev, n, sid;
+	unsigned int dev, n;
+	u16 sid, smask;
+	u32 fsid;
 	int ret, idx;
 
 	/* If no sids, ignore */
@@ -421,19 +428,22 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 		smr = smmu->smrs;
 
-		for_each_stream_id(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(sid, smmu);
+		for_each_stream_id(fsid, cell->config, n) {
+			sid = SMR_GET_ID(fsid);
+			smask = SMR_GET_MASK(fsid);
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
@@ -449,14 +459,14 @@ static int arm_smmu_cell_init(struct cell *cell)
 }
 
 static bool arm_smmu_return_sid_to_root_cell(struct arm_smmu_device *smmu,
-					     unsigned int sid, int idx)
+					     unsigned int full_sid, int idx)
 {
 	unsigned int root_sid, n;
 
 	for_each_stream_id(root_sid, root_cell.config, n) {
-		if (sid == root_sid) {
-			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
-			       sid, root_cell.config->name);
+		if (full_sid == root_sid) {
+			printk("Assigning Full StreamID 0x%x to cell \"%s\"\n",
+			       full_sid, root_cell.config->name);
 
 			/* We just need to update S2CR, SMR can stay as is. */
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
@@ -471,7 +481,9 @@ static void arm_smmu_cell_exit(struct cell *cell)
 {
 	int id = cell->config->id;
 	struct arm_smmu_device *smmu;
-	unsigned int dev, n, sid;
+	unsigned int dev, n;
+	u16 sid, smask;
+	u32 fsid;
 	int idx;
 
 	/* If no sids, ignore */
@@ -479,10 +491,16 @@ static void arm_smmu_cell_exit(struct cell *cell)
 		return;
 
 	for_each_smmu(smmu, dev) {
-		for_each_stream_id(sid, cell->config, n) {
-			idx = arm_smmu_find_sme(sid, smmu);
-			if (idx < 0 ||
-			    arm_smmu_return_sid_to_root_cell(smmu, sid, idx))
+		for_each_stream_id(fsid, cell->config, n) {
+			sid = SMR_GET_ID(fsid);
+			smask = SMR_GET_MASK(fsid);
+
+			idx = arm_smmu_find_sme(sid, smask, smmu);
+			if (idx < 0)
+				continue;
+
+			/* return full stream ids */
+			if (arm_smmu_return_sid_to_root_cell(smmu, fsid, idx))
 				continue;
 
 			if (smmu->smrs) {
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201104153648.35076-2-andrea.bastoni%40tum.de.
