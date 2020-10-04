Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPVX5D5QKGQEF5JMHJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EB7282CC2
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:15 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id o6sf3126830wrp.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838015; cv=pass;
        d=google.com; s=arc-20160816;
        b=GPJHA6Wuc3m7PzhC30cdllFz5KFaGhzvt9g/krScKYO0k1tSFCqbvV0yhDpiKfB5Wk
         55nIOxnyiNZC6iDP1T5vRrf8gxVzPqYNFQFBqkhYPztjunyUOrxyC1COSbXkYXmuPjBq
         VLGs5m24G8AIAAL6KoETiuIAmWweRgb8skw8WYjDB3+2Q6KntBVca257JHVgC86pOwLO
         zjbV+TwL1abxueOC+6vtjcuE1QHdUQGYIc8wZTXUEsfH+YGXGUKLa+IDV78GN4OTTK6m
         1HujSeIOe5cmkGi4tYsuWxCSdNqFvTfCskOTNtl9FSL1o2zLRSKvJbx4gcdYa2B70q2V
         mRjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=zpm8mvf8sW3JcwQWDrC/zP56jZnG1pD72zVEr6ynkrA=;
        b=ueDQkyPQVwjhf6FK/aJCaCguzuegoJMJdYB3GOFxlKOqt+cGoE8TAt4+sBXqXer6Z6
         TMdfsVxCPmDjnY4N3wezEJco5iS0x0HO9j6IZR8zdtpeNBwuJSKOk4YtWb3LhYbr+BX8
         HJNwFP+hpwRnF3nzRQXdc+o3yTSAsyaHFr/14Tp4mbrNpzN2+ViNyj9dGMs3EQf15o17
         NIwjnjEQgBhsU+Ink2+O4BO4oOD73nkjnetBZfI83n/htEdGdMN8Ok+eKguzk3a0SXIZ
         +7rQETtH7OodozY+XLaewrDgbygT/3iMQSIVR/Cve0rt7HUfXwYgstEOkIDSEMqfCSew
         W3NQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zpm8mvf8sW3JcwQWDrC/zP56jZnG1pD72zVEr6ynkrA=;
        b=qyvZoCLS2Odvbxb2t6YkGH+vam1DGy+vUaQAJSgcVduHP8Gq1nzce1Lm0fwOrAQ6BQ
         D7oXCHYWnab0Vtg29aDMoptce3Ww7sM18sDQkxmQfBqInRoVz7gCSnJTVe4sGBja0BvL
         bMyI7ZdghR2jaqSXjWRRqD/TJW3d1J4oTiB6KItjC1TUkcJf+wU9dJQhhiy0TqCPYMgk
         z0STl2lnUonWnx57PaKaC+K8TBYzyjkrz25wNUJaLdlVdgfkSa7wAodUbd3DfcINeJi1
         YjN03Akf3JUjnZ9BLVaz+nazjNBgDYUfc/5XrhIXEvP8vtA6lRTxy+EcWfKdOddk3DAv
         OUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zpm8mvf8sW3JcwQWDrC/zP56jZnG1pD72zVEr6ynkrA=;
        b=b1dsss7xkeCy9/e6kDC85wOJATlKjCmkOAvNmHEPOgv+bgTtKOO5VcHmB9fU0ekQuj
         mGuEQ1SqG8BHhOcLpwqx4oMtaJmnzyg6ySYobHpiXIi5a+1rp9PR5YpJdbWz8k/I88c3
         JRoadhgj+L6EoZIdvs4oswAzwsNlUG8BaKCPE7P9xVHWKMJ+NsunHDZbpLAuCljxZJNJ
         WmltmqYOBs7noR5MRyyELzJlA8StKioqzFcLgor7h7K8Grd0WgzrSXWpp3rcOhU+bh4K
         nPl3jOC7JPyHSlXBpXVs5JQKcVacw4FxhKP++sIk/HOWSB/yXRx30PE9MRQa9ZGEMm0w
         9CQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WtQY5j7zwQ39RZkI6jKQZkWVOXyzsQA44FWLBhGONvqS87gnR
	E8HDAWcVJlPqe1VV5aS5w0s=
X-Google-Smtp-Source: ABdhPJyB7cwmWo9Ajp6bzDfqJoNqH7rmH28nkE9CQLWH4nVvtH2zs4PMl7W0WSuvB59Utj4IKecf1g==
X-Received: by 2002:adf:ffca:: with SMTP id x10mr8145863wrs.342.1601838015074;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9986:: with SMTP id b128ls3541075wme.3.canary-gmail;
 Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
X-Received: by 2002:a1c:20ce:: with SMTP id g197mr13462802wmg.72.1601838013955;
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838013; cv=none;
        d=google.com; s=arc-20160816;
        b=FcHZ0uZGHzZ2Yusg4GW4Xog20EM3rFcMdSP6vq78xCUSPZbQAcncIjOp/T2begxjEE
         MC1p5j/OWsGwG2xtkpX5IfDBT6Qqdg6JJihf90socCJFsik+dRbfmeUkF9JolwGoRkMF
         5K948xflBrPpvDoEnAGVYYyZAhYYU71tzzWJgwMRe/9V565pAinjOUlR53q+dqEiyWBA
         WhqKPM+G/KGvhVLlE9kRx6E2cLALNF9q0XIgiG0B7x8NUne5weDb5dAClaXsvdAIXnDR
         jNpFGmHSMZ9pQQiUbjRVZWVwONVImjgHpvQz5HUJkkUbWdcjqb3vF2U8H/+gsjaPytDB
         TNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=VEgy3Onx1FKd2hui/VA+73tSHtJyiprK4GRf9bsDNRo=;
        b=wl9u/vFmy3qbS2U2ZdEXPQByE+hGVkmUSjVuuNX8gP3KIp9n63+1Ojr9GJGR1PaW11
         Mnpmh/F42T4Pi/cLAx0q+h2ZHLdDFJiEBpXxR9cmV+ttGEeA523emxtHsREzi8OC9XAw
         PtDjawE7HoZ/AwBb880+bo9miWpZ98hyZl0nCUHpm5akzv97tFIl3WSi3mjfGGToq/q/
         dekRTesM+Uf78LO8clqzH3tHULfrHP3zzIn2dkyMxvMPFIYAcqTkYKlGABA/LBusfQHh
         1gH1FJYheXX30v+sgKxPHQsXAQ2ZD9eEnD8C9kcDPnYpEyw8YwJckyeZPFu1cs0SG+Ql
         HbIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id p17si60544wre.2.2020.10.04.12.00.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0DG5020467
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:13 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060c017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:13 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 26/45] arm64: smmu: Drop stream-match feature recording
Date: Sun,  4 Oct 2020 20:59:47 +0200
Message-Id: <52c27d9af380e78ca82fa752f3e2533a7d9dc99b.1601838005.git.jan.kiszka@siemens.com>
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

We keep this information via smrs != NULL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 6abaa52a..31e7f4da 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -17,8 +17,6 @@
 
 #include <jailhouse/cell-config.h>
 
-#define ARM_SMMU_FEAT_STREAM_MATCH	(1 << 1)
-/* unused bits 2 and 3 */
 #define ARM_SMMU_FEAT_VMID16		(1 << 6)
 #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
 
@@ -442,8 +440,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	smmu->streamid_mask = size - 1;
 
 	if (id & ID0_SMS) {
-		smmu->features |= ARM_SMMU_FEAT_STREAM_MATCH;
-
 		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
 		if (size == 0)
 			return trace_error(-ENODEV);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/52c27d9af380e78ca82fa752f3e2533a7d9dc99b.1601838005.git.jan.kiszka%40siemens.com.
