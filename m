Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGUXYH6AKGQENUAHRCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DFD294F24
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id f28sf1295052lfq.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292059; cv=pass;
        d=google.com; s=arc-20160816;
        b=v3xVgkOEpv9W2ZwztfmUnOemB0dVygvYO01nObSH0bj69HfSLKJRJ3WwXQkosEnTRR
         i9Aih6kRoPeyHr0R9BN6JPeRzSbMoeuee8NBQFVsb/opEWJz3o5teXlN4cJ07vuW0sgw
         I5eWt6mi4wHI3Xhg5MX4FlLX07jA7sgihDvT8eup+jjLVhxs+RGeTPWgj3dOJf0EKD5i
         1dgcogrlvNWY81j3jxPwTRv63MBZ3+H0smt5Ivboe6vXspnPnsaL/iK8G2DCpsj+DQxJ
         FE84Nck259B8OOQoxzN12Uk2vsRIZyTzYw9fWR/2dqxgq957O6GP35+lLVLz2m07e+U+
         ugVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=XHYgOJUf78XDfs3MBnlWfjOhgcDS2nL2ps2twoWnrAc=;
        b=H38rBOMuFLIzCYvGH/QMTdkFM+Qzq4fBFis8uY4pID2I+Mvb2hFRAR5q+uyQfzMiC/
         b9GFzHj9JrTWGxRbSj4uApOuSldjjmjeaqST27Rr36m7EbYS606Ic7dSuZDlMMGfpvdK
         5Pj9IZrKaOM27kmy9IEs+MlX/xEucgVkvEKywxu0Es9kQGlM0G79Fse1PVe+PFmhdPDU
         NBmZNjEmtijCzhjbLFOtGgz79abC70r9hxkFjCeeiVM7I87Y51stk3Z4OX1uhxV2YWtD
         XSwrDc5JCH6PkTRHT4VqT0lpEhiM1YjW0ZjgJY3rOEgi5xnqdc3tYWG/PY7SM2UqPPx+
         XM+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=fBjByqbY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XHYgOJUf78XDfs3MBnlWfjOhgcDS2nL2ps2twoWnrAc=;
        b=Sf2wYZhFBxwRpVrRFaWzoRM1nH1KdU8vJ2YSL5tnOUMNOFf8l06MM494jmnCuV4y+n
         s2jZ1Lbjly4Kkmkz3QhbhWoGSMs0kw3Em54NWQJdectOZMcSD8gYx3kG9Z270gab4VM7
         QKstK2aFIhN13KBIDkqbc6gmPco5A2ghZhYPlNuDkdoVf3xzR5LpeTfOSHChmr5ieFWR
         jsqDSVWy1NKSnt4MWt5/KQKzd9eYkxoOb5i4MRoF9GF00f0T7SEnDgyOdF5+bYwfGwap
         epUYfZ9Vy5Y9UX2OLhu2qZbMk/FtwSKKMCiMVROYBdxcXPIascKvw7AOffdpaq1GO4iN
         Xx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XHYgOJUf78XDfs3MBnlWfjOhgcDS2nL2ps2twoWnrAc=;
        b=s00b4+LQGhNNMTHZbNBsTWyk3s524lclxjpoCpAB1BP8VGA2ybD1a/zIYilqD7/dkv
         6auNvTLYxhYTfd4rgCb4wU+iQLKmO7xNfcEgFi274ofuEbQzcRcWelXsxjbMCndi7PcN
         CO38ND2VivWseNRJmh5u0+Wl9XqBX9efUP4fG0p6G9FVqvA3jyBP3bFp5Oab3B2KXu+H
         Wm8mr5yrBfzcBvMwjmrmI2T5/yt4VQZ1zHhluZt8qFqXTBtgEo76IgVVkS4pjHXrPQeR
         ey1ZetDqOcmMVtj7Y3FdANKCihyeGdOr7TVee3eZwnLwp1a4Vadyd30apYsjOTzBN7ME
         gzeA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533cnUsD+HR3651dKeQOTBPV+LU6QpKzC7Bjq1Wz5/c5h8eInGZA
	WDaF3AtbTza7hImraYkW50Q=
X-Google-Smtp-Source: ABdhPJwhCE6BVD8b4Cj/UAkcOrp+5GFc9tm28bd17HM7d1AfhoE7xBN2QMQ+Pm59qFa+Rar4OKuGwQ==
X-Received: by 2002:a19:fc1c:: with SMTP id a28mr1514129lfi.517.1603292058814;
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls122815lfr.2.gmail; Wed, 21 Oct
 2020 07:54:16 -0700 (PDT)
X-Received: by 2002:a19:becf:: with SMTP id o198mr1521444lff.519.1603292056366;
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292056; cv=none;
        d=google.com; s=arc-20160816;
        b=IxS/AUPsDqalv0FdBoG7bhRr7gIkBpRHODNk2iprwQULSbWlKXRxh0s6aEiaf34sH5
         +gR48jlEXVxZ8dzv77DEeC9eaXiA0oQU/QaotTWdU67b1gQs2Wc5KmjbeGie/K6vm9C5
         rjETHI2zmSGN04AdfE3ltQLE7cvoqTjz3pQnNysZBiRQ0gS7lfeoDSRZMV8+gC9xm904
         kXvzfO+e+v/ruTRCpneU0V6eiVPzp3zuvhFVYmcKrcfqYVrb45h6AYzgyk3yphqTigFw
         SzUzJ+jrQtvhvMjTP9vhre9LN7uPImLz3sYMDlY/ziGsKxbHwE/Pst/a7ZBTSHInXcxE
         uVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=QDxakeRoecIdbuc9z5Ss+s+ZxvQMHem49fHxcjrkktM=;
        b=nm4ixm0sHyJdb5Oh0gKec4NQxyC3UkDebI3YV+Iu/0whOQySVhC9BqT6xXic1KXGmL
         IW0f0bl6LogJU3WDuDZgKPwABDVDvVg07a/XMrICeIeNDrSRxiX1hOlYFClJwiocaqWZ
         LbXYAbS5cxvqWHMyBA8BTTVc7ST/X3mmraHuMq98nvq/ASa5efrj15g9CefLD0ruzGX7
         cmyaAhcSWWmXvYkR4dFSAwoj2ADidxvWndmDWDhJXcVQEuf9MvbLQe+cn6fgBrMAlyl+
         x5pUDe7zi57NkGktkdnzjMT/dxQo1rtCme+s/Wl1kakV82Ux+L5PzaYxvyytbhLVvCiO
         QDKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=fBjByqbY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id h4si73787ljl.1.2020.10.21.07.54.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRW54PJzyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:15 +0200 (CEST)
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id dv4g4SHlt1aT for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:15 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRW1vknzySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:15 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 07/26] arm64: smmu-v3: avoid shadowing smmu and fix sign-comparison
Date: Wed, 21 Oct 2020 16:53:45 +0200
Message-Id: <20201021145404.100463-8-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=fBjByqbY;       spf=pass
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

The symbol "smmu" is declared and defined only in this compilation unit.
It makes either no sense to pass it as a parameter to functions only
used here (Wshadow was complaining), or it can be properly passed as
parameter to preserve the generality of the accessor funcitons.

As there, fix sign-compare warnings.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu-v3.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index 2f57868d..45b7186c 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -360,7 +360,9 @@ struct arm_smmu_device {
 	struct arm_smmu_evtq		evtq;
 	unsigned int			sid_bits;
 	struct arm_smmu_strtab_cfg	strtab_cfg;
-} smmu[JAILHOUSE_MAX_IOMMU_UNITS];
+};
+
+static struct arm_smmu_device the_smmu[JAILHOUSE_MAX_IOMMU_UNITS];
 
 /* Low-level queue manipulation functions */
 static bool queue_full(struct arm_smmu_queue *q)
@@ -403,7 +405,7 @@ static void queue_inc_prod(struct arm_smmu_queue *q)
 
 static void queue_write(u64 *dst, u64 *src, u32 n_dwords)
 {
-	int i;
+	u32 i;
 
 	for (i = 0; i < n_dwords; ++i)
 		*dst++ = *src++;
@@ -574,6 +576,7 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
 {
 	struct paging_structures *pg_structs = &this_cell()->arch.mm;
 	u64 val, vttbr;
+	(void)guest_ste;
 
 	val = 0;
 
@@ -1042,7 +1045,9 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 {
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
-	int ret, i, j, sid;
+	int ret, sid;
+	unsigned int i,j;
+	struct arm_smmu_device *smmu = the_smmu;
 
 	if (!iommu_count_units())
 		return 0;
@@ -1071,7 +1076,9 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 {
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
-	int i, j, sid;
+	int sid;
+	unsigned int i,j;
+	struct arm_smmu_device *smmu = the_smmu;
 
 	if (!iommu_count_units())
 		return;
@@ -1095,7 +1102,9 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 static int arm_smmuv3_init(void)
 {
 	struct jailhouse_iommu *iommu;
-	int ret, i;
+	int ret;
+	unsigned int i;
+	struct arm_smmu_device *smmu = the_smmu;
 
 	iommu = &system_config->platform_info.iommu_units[0];
 	for (i = 0; i < iommu_count_units(); iommu++, i++) {
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-8-andrea.bastoni%40tum.de.
