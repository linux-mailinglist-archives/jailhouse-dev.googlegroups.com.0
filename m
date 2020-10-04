Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPFX5D5QKGQE3TUQHYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CD313282CB8
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:12 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id d9sf368744lfe.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838012; cv=pass;
        d=google.com; s=arc-20160816;
        b=v//N0O+L1+1b6Apv7OO/4MvpMowTdkvyEIK67EDFeaK4JEvSrpPYmWSffkpWqDV81i
         hx5YwsEgZyu26M02oKfqPaFHXkWA1GwihJXfKFTqPZqp0CJPimGX58brMXrB5KDUljYf
         P5dvYtIyNxDk8lU/6e6370Pkb6gyk4Uc8oi+CYUpzCNlZ3KyrUUBqN56r816GGasi02X
         txF1F1uh2l0gc/f+B09bqc8xEsNf8pY8TS3x7HdiyBYGsF8qFnJLJ+mCNyLrTHTw0KS4
         Z9dAD6fhcj4IobPF7roNHkqA/9yobFYW/OhYVQ1QqcHXqRxGuDNJtPVOUzo5Xcef8nNB
         ldNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=nTdctohyZGKi6ngNuzwcnpdUWodwtC/YBTsBgi+fkgc=;
        b=KuGhAzZzHx3IbZnfFJaJKOI/HSsYOZfP3iNhArPmsQvdo3ABSjXh9eRAvBo/fhNz5c
         bScGg6NiVQoqHVI2yCuDIU3PqaUiROy2yLqChzeFdbZQ4jA4L5AigvnsCQw7B5D96zhB
         VjK2q0D1rYYuLEGNO1UWaYbVxhjYz4yrZMLNWncLkqSfmUwHHWKwEgnS7CSv2pptjy6/
         r3V3apDT7HEU15oBDV7R88ZdLttVYQP37mTUIA6m1vfhROaYT9pZd5oYKUe0lfGrGuAb
         rgZUBt3HBoo5KeM/Fr+rnpHPlt5UBsRZF7DDN+pM+pGvd+eo07qZC3cFjRNmsZ00MZCZ
         Xd2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nTdctohyZGKi6ngNuzwcnpdUWodwtC/YBTsBgi+fkgc=;
        b=WA8QOoXZkFDH4CK/Q0jlAWAfMffu/Xl3FSsJT+foo5+Qp9UslwHcHYMNDXsdtDe1O6
         STzt63TaP/idN1MRpLYNvyJgm3mLjruOF6cefLx+8TkBlmmUq4Vukoyn1JeRQoYA0ATe
         6sr792nTnfhTZqutT17KuzEJli8FZbzBNsze9NPYy7aWJGoEYGMlIwCgC5+T9AuBuTxi
         9QvF4uIRGEH/mZcaY7U+n3BfBei/T6yqftUvMKSOy/mNXqNeX5BDKCHqglLhe9Vkp9OZ
         0kwaExrlGwf3CZRUNkAKyGq8gySFxajRkVcTrTgEwnIDIvWahjXdPE/GCL8rmgLxc/Ep
         neZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nTdctohyZGKi6ngNuzwcnpdUWodwtC/YBTsBgi+fkgc=;
        b=e+n0qzl2RTsrQa9EKzjzpVoWul/nsuA5upEHOe8+7DWUi2ueENFjaOcl1oAQ48R3xU
         I/3nGOlu6R59pOzZLfggxZr7jcM8dRsBOCWqmQrdT5DNw8bmwLvYfrLlOKovVUJe9GgW
         tfGybr5ehLIpxauupNYt5qfPp/7Yb9CucgwX6v/zhn+vDDzvVFf1RK7QSO/p6CXbHONm
         jAMQJv9W4czjDDSqgxrYOpAlCoDwwunk4Ng/xqMyOgHxConOP467h+caoavmV0nWU5Ef
         H/AfATUp6ELaxIeFyE2KY22idpd9JIAPz19fTbRZheHhgTwWdLfl9kT4zogWG2ytTniH
         euXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533kCK2UZw2VbBA74UxPwBG6tUhFiXtRezWkNpdpukJq19BfmOI1
	tqd/yV+MucBobcR20xwQ5fc=
X-Google-Smtp-Source: ABdhPJxN+6gbxD88SKfEDOimgQmqDANDjetxPlT0h47SPkmUVZmEHIOcCSxmFj1nXxkK77b2YZhJig==
X-Received: by 2002:ac2:4d58:: with SMTP id 24mr1183512lfp.32.1601838012333;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:93c7:: with SMTP id p7ls751489ljh.11.gmail; Sun, 04 Oct
 2020 12:00:11 -0700 (PDT)
X-Received: by 2002:a2e:7c14:: with SMTP id x20mr3362018ljc.252.1601838010977;
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838010; cv=none;
        d=google.com; s=arc-20160816;
        b=GxptwrYDOBJzadCsTStKoLUvLLJxN/oWRI0m0wMHtMociO7+7KjOlL3PtueUKPtLnt
         vvyNffppHSBpde+5hhVh2DsJVLostyMbVbw26o2igddSx4lIvDYtTlsMJhKeAbS7GJyh
         f99sSWCEogE0qYCO8wa+rpfgzn2+spAUQy8DJd6Z6wE76lNSUIcnWiD3nvYSyuJuY4Dz
         pnvMOwBzgHl0DYJiJ/o8VGKTz5KrtE/EBCE1UIunNbc+DbvK51UxM44Pk/O0Gonie73n
         ZVa7s7rYy8l4DVQh/8i3bTn9zjvA32UQc7uvgQCNPzhMLxziusG3M0oienqGhj7DfIAq
         w+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=5unJLVj4/Z6H5UCsJykdj2dBeVytOlVwcwqNpsiVh7E=;
        b=0pyKkeQrCvTXXfUC/DJsTFEjGpNc8D7LqQeLAfUwbBMn5twmOMOIMEZnVy8ii885Ub
         53gXFgJH1+NFjqTkfdnLUhYwMgRjEmHjUGnBxrqwmjvr6vhRHRMCN2plZiTTDmhSAxKO
         mxlEuuQpRin5ZgxmR4tRP0cWgZk982IsvzewV2lzkWV59r/TJpsNSy8qVy6PuPjS68PL
         sApUTU702vWD5nolH4v7CqzlRnaw85G/1CWyuK6/zYiiAZ2/Eobo59U1WqA4jDmONf6K
         SL2RjvKb2AivrFnhI9d6TLDlf7NhvKvrCOsOjIQVvd3ERsTqMTX4z5uQjdm4ckfiuKmh
         u5vA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y75si166769lfa.3.2020.10.04.12.00.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0AMg020347
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060M017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 10/45] arm64: smmu: Replace for_each_smmu_sid with for_each_stream_id
Date: Sun,  4 Oct 2020 20:59:31 +0200
Message-Id: <87d9bccf243d0bd094d0d06ed483800cbaa412bc.1601838005.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/87d9bccf243d0bd094d0d06ed483800cbaa412bc.1601838005.git.jan.kiszka%40siemens.com.
