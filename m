Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW7NTL6AKGQEC54ASDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id E757328DB54
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:15 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 14sf1035819lju.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664155; cv=pass;
        d=google.com; s=arc-20160816;
        b=A5hpA9vJQmtIqkZeibF8pCeiu99FVW8xCQ3keyWdYE8jYqic13UVuxirNYZCkfUQR0
         XUSQMWUNbzuok9dn026CrIuUVw5Pvhm31s35YwzDJziuL3De+MSO/7ELm15hTI92E6ea
         Ak3BszF4Oh/Ww+G4FD8Urhqr+Cl8+mJ9oBMSW3SJBlMary65heSdKMJXqgHgW/sq1iA2
         rcqO+qBN54LP44Qyn5/yKc2dzOfoG3yFej7OgQi1mjqNku8sJL9ZGaAiVARfU2ru8tHC
         oXH4PdsWHNhdCi3nFm7T5uYtXR0vcsmM/70zwDlmdAJ4CJyqU21Q29ndEJEyx2sz2HDe
         x6QQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Avj2/fOMnnodbOwTnb7WSrZYfcuo0qXr/j+PqkkXTUE=;
        b=tpHWC1e8t5MTORguL5p579XFcp7b1AmaZM7iLBAvuvEIs2R7NAIVRuY74boc59glQw
         yAAde3BOOhZZdV/ZK9wQwOk+rJ7cTreeR1sf9lD/Ga6O7Ee5UCQfs0fOaRsRLo72sVyA
         e9TFmySR3kvz5xZ+wVsdpcs/CfmyqzkX9kO6RwJHIj+xSvIGrItW9we2nF52T7UsGllT
         pSPHFuiepkSItFPd1rx/r6vr6ByYw4iYOWa3ApM0mqDKFeFZkXjjVuAX/yqnEKYCS6Ed
         wLB+rPbfS0S68CDwetE05MZdIRSCdJGQElTYLim8rSPY06wLFSDD8EyAOj6brBp/jEiQ
         /DMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Avj2/fOMnnodbOwTnb7WSrZYfcuo0qXr/j+PqkkXTUE=;
        b=H3lmIalg9+kSONEfNp3mOHs8mpQYskdkdfnE3eTSp+P9Rc011kojp3pAckcURvAJN/
         swpZrnFzeusQsdxCc5jv0qXPQPA1okhO/pz5yWRRBU8qDe+EGdB02UECD+v2HK7A49BN
         W8NfoHQoj9JmzkXvDeF9C5ChQhbzlxGlT85SSWYDB0OceMWf1Ty1mAflgfIzdSO0JRMG
         HIzBWzJBYmptZM93LuRWBhleJQhET+/CLJwEfPo0KAFPJA+LsHHboy+ga7A5cyE/K17/
         FF8nxc/sZugTHkh2K8FAW64GLgDXYOCqYObzi+IAAhVh4LYPcagVpkKdLX3NqlSl/i5r
         qYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Avj2/fOMnnodbOwTnb7WSrZYfcuo0qXr/j+PqkkXTUE=;
        b=OW0sIqOY9t2CPt4U891rkUXdTDuFeG5WD9U1tTrf5kFOduOifMFbkNgrM60dqCM+IO
         loCu5hLzM4Ia0D337x99U+seHVNXpeSCrlu+89S6ywcPmiIXBrSH0OQWtmtrduuDEkg0
         ao7tOn8I0eZwtmO6T4nDFj2Zy+r6GuH8cgdiDpDPvgnM50IzE8k98EBGIH1F/hNfXKov
         yInaxDhdYRz4IIwvz0CIu8Tw3yzgArI3HdZtQ/aaJ9LYKLVFdzFlSxaLxrLxDX1rvA8L
         FqkOH2zB2FpBrR2EuiCy5Ijp/UHFoNMa6ur5er+KIwkbPh3kXzTYPCG2vKODQLxVgjG8
         uKOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533fxr1bn6kxdsvXU4A1x4lUcCwqQccHcULXmNcoHgvOKZGoTyHI
	qGfXCpN5V7W9lz5Kyb08n74=
X-Google-Smtp-Source: ABdhPJxkaYDhUA9rjyK+yU0IuAeJ2o/5Pw3gZGu7ajStfnZRZRtKJXtt1x2mihbyRiuy0kN1wuj0xw==
X-Received: by 2002:a05:651c:130d:: with SMTP id u13mr1482540lja.265.1602664155495;
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b6d4:: with SMTP id m20ls492754ljo.1.gmail; Wed, 14 Oct
 2020 01:29:14 -0700 (PDT)
X-Received: by 2002:a2e:a315:: with SMTP id l21mr1271061lje.31.1602664154215;
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664154; cv=none;
        d=google.com; s=arc-20160816;
        b=gwLD3f6REZ7pgAa1UJBG3w/LAVWG5HvdlwjCQAtGh/xpu9+ATQK9nQtDI6xvc+4kFE
         ZB0q4524lmdKonQ3SeafD+EhevWrAzH/Oqy3fSqCfvJ1FkG5o2uiQiSxy7/GelZMePlv
         kXdd7JjwnxNeN7MsP7WuNKxoaD6M7hJ4chXV4aov66ievf99PoPTTULZoW2A38uJd0KJ
         HQw/7gsmcW0i1rFYKZbkcrboG1M2Cn6ptpym5WX8ncS9rex0NddAFzsm6PtD0frn6gVy
         JMERZAFRkz+Kh9RO85TKTsV+/nqsY/JHZlz9WGAvT0tNuRTEO98V/VQ3pSiNbWuEVSn0
         iL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=5unJLVj4/Z6H5UCsJykdj2dBeVytOlVwcwqNpsiVh7E=;
        b=vDtO/KT9xJOSxQNYdr91KIEWQm6BzltPbfVe427a6khFXYBrY7QbKGl66Q3mcdYV7T
         n7BOz5TFZvcyOlKMqB2xiryVW0bRKugDbZSmgHr2DZHnCj/luyAn7yM/jClm7iK9Om3u
         OVZk04ngAvE5lHtfGd2jWOORE/cGbsLViRskBceRkvNHYxYURLGzr/pw8xgmhgDFRc2q
         8DncWce1XE3GG3JcsZWH7HEEuEYNu+I2tCdBp85Gt9q2fv8NKFSK6V82dGpNf3WR5Unn
         s5M93VTGkWc0RzpjIwXZYmFuw8/0d9nxNjj8rGDDCZXgRVsEV89o4d20QTAQ5ulkzIjm
         9xWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id l28si72317lfp.11.2020.10.14.01.29.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TD02031148
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIv002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:13 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 11/46] arm64: smmu: Replace for_each_smmu_sid with for_each_stream_id
Date: Wed, 14 Oct 2020 10:28:35 +0200
Message-Id: <008449b405c8b38b4c741f5f75c6b89e924c95ca.1602664150.git.jan.kiszka@siemens.com>
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

We already had an iteration macro.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 94f65313..9078fbe9 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -2,6 +2,7 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright 2018-2020 NXP
+ * Copyright Siemens AG, 2020
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -799,11 +800,6 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 	return free_idx;
 }
 
-#define for_each_smmu_sid(sid, config, counter)				\
-	for ((sid) = jailhouse_cell_stream_ids(config), (counter) = 0;	\
-	     (counter) < (config)->num_stream_ids;			\
-	     (sid)++, (counter)++)
-
 static int arm_smmu_cell_init(struct cell *cell)
 {
 	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
@@ -811,8 +807,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 	struct arm_smmu_s2cr *s2cr;
 	struct arm_smmu_cfg *cfg;
 	struct arm_smmu_smr *smr;
-	unsigned int dev, n;
-	const __u32 *sid;
+	unsigned int dev, n, sid;
 	int ret, idx;
 
 	/* If no sids, ignore */
@@ -843,8 +838,8 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 		smr = smmu->smrs;
 
-		for_each_smmu_sid(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(*sid, smmu);
+		for_each_stream_id(sid, cell->config, n) {
+			ret = arm_smmu_find_sme(sid, smmu);
 			if (ret < 0)
 				return trace_error(-ret);
 			idx = ret;
@@ -855,7 +850,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 			arm_smmu_write_s2cr(smmu, idx);
 
-			smr[idx].id = *sid;
+			smr[idx].id = sid;
 			smr[idx].mask = smmu->arm_sid_mask;
 			smr[idx].valid = true;
 
@@ -878,8 +873,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
 {
 	int cbndx = cell->config->id;
 	struct arm_smmu_device *smmu;
-	unsigned int dev, n;
-	const __u32 *sid;
+	unsigned int dev, n, sid;
 	int idx;
 
 	/* If no sids, ignore */
@@ -891,8 +885,8 @@ static void arm_smmu_cell_exit(struct cell *cell)
 					  smmu->cbs[cbndx].cfg->vmid);
 		arm_smmu_tlb_sync_global(smmu);
 
-		for_each_smmu_sid(sid, cell->config, n) {
-			idx = arm_smmu_find_sme(*sid, smmu);
+		for_each_stream_id(sid, cell->config, n) {
+			idx = arm_smmu_find_sme(sid, smmu);
 			if (idx < 0)
 				continue;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/008449b405c8b38b4c741f5f75c6b89e924c95ca.1602664150.git.jan.kiszka%40siemens.com.
