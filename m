Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJV4476AKGQEVSUPISI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D2A29D242
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:58 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id 91sf331194wrk.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919398; cv=pass;
        d=google.com; s=arc-20160816;
        b=s9iE5FFtGE8ppdG4O2GNxK6EDrOiUlKgM69Wmpd3Z5ryNLYAoyQPG1PDKrPDOft3Po
         YmBCV37IWTEUWB9O6ZCd6KrQHB6dUjgjEvyGDA6JO+6Oq6lXj2jbDceKmHRpzPXJrPXs
         olD9A87TQomTUEYSkyFrjDZv9yNWAJK7UKUpfahnIrrXcfNAGj5e6emz3ajMvMWIPvD/
         VpO6CvVJLBzTwtWxxzcfNcAmUwssN6D5JTeOA6x1UNCfN09z4aNwc7WdBzqp2yW9n+ne
         Yns5sX+QHIB5HFVAYktIjzy8cf1ZsIg9xXGXTZW6XcL620KMXD8Ifw/NMfRJi93WXzhH
         1b7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=dO+RwhDWyIUcdrGXnlbWOG92CJCwrAnFa+yJ5uGQPyo=;
        b=FHtCs6IwRy2kHeNiKo4xxnbBejybWdumamEtZcNb6q9Xeaq165DJpmq5mCoCF0HM2R
         9sLvRPczxGWvKXX7wtx+OizZ8cRm8wC2gmUL1Y6Oj7W0fxlnIiQcAEPpGKR8lK3LyxEU
         bbjsDClEXt/JPepoPxuflgAIf/Cpjhgf6jGVDqJlkdGOT/2ijBZsntTEmRk9RRoLM9M5
         GRBoekB/tMOOrmrb7wFZCCZl79HtDD9pSgEGVkK6+fy0oUriaLKj4VuxlDqfm+TZrjo5
         ueL04fJJQAbFvafyv5UD8e2LrMOh1YY86AMasGfxLCG0czVAS/IHpMYgwQmVLw7fSOL3
         /Y9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ao5d1ItN;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dO+RwhDWyIUcdrGXnlbWOG92CJCwrAnFa+yJ5uGQPyo=;
        b=CgVWeZwqKy7gFXDmcbZ3gbIquSvl/dov8mP0BI2rxMMs+jIlmpPBRFKHD6ZA3c7JQY
         gqFzwqnHXwaUYSLBcuHiMTVisPVpLCsvhE1Oc0PEanPG6XOVpG14E9Zm3UeUY2+sOIgD
         yFXp4167UEYO09x4UTVIAFaMaiNDkh0ooqrYte8viqG6djLvg9LIEFjC3uAjgDO0IDYa
         UvEuMYFTi2/6k4Aq0gPFDRkpOmlxLqCLVZaeGQbpVZcf5tC1BYdl0VQRddJmBrKBxjiT
         M9LBb27w4dSBP/5TSnELfGMeKayOtv5QAEILoXTFjqL69itMwS0YU+GIC1cZ99V2t25o
         ILzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dO+RwhDWyIUcdrGXnlbWOG92CJCwrAnFa+yJ5uGQPyo=;
        b=jWOuP000oqf9IqzJpKmgqGc4jLzR5WxMlpojlAoZVQMH5CFsplo9cFylCxTxTsKXmP
         chj7TkTesDsMsE/gwrLqZL9vSC3YhJVmhFpR6bLWOpJJ87nx4UZ/Ne4iWd/xZUUDjoZX
         xGGAAJ+b22EFuPB3Lom+dcwj8XUqBgf/EiJ4Zogs41rwXbnhoL168pgq7vMn6M8uVW2Y
         MDLAHzdTcH9os+fJNWt3orfDoP3w6H1R8BvaBsMNO4s0SYeg2+AEKZSzZx5tRxC9oq+G
         nil0ROzwE62jw+N1rmCcSVMLbYJwXyOCRSW00E7/2YDPNcw8exLIJjyieD7LPhkBknVb
         ACeA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ewjeoiWeWs+JqrGZDWLpCeGLKtfDlfExGcazxHuMbvDdobQbR
	7x5dZZlh/nzArl7zO907VvM=
X-Google-Smtp-Source: ABdhPJzqWVA21qGhaS9lSm2kmhb8lz5qQnMN+GbfKhO2Nwjrqodu+Vz7w6DMEe5PuQy1TamMbLJEig==
X-Received: by 2002:a5d:6a85:: with SMTP id s5mr1520776wru.90.1603919398698;
        Wed, 28 Oct 2020 14:09:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f7c4:: with SMTP id a4ls417213wrq.1.gmail; Wed, 28 Oct
 2020 14:09:57 -0700 (PDT)
X-Received: by 2002:a5d:688c:: with SMTP id h12mr1521742wru.92.1603919397922;
        Wed, 28 Oct 2020 14:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919397; cv=none;
        d=google.com; s=arc-20160816;
        b=CX4ZMW9Jj4y81xBWfmGnb6Ylar/ONbvgVwbY3Ubhq7f636V9cY6LkvHm2KhC0Q3oFX
         38BDplfqICY9aRKsjaWKvHNMJ3yTjBUo33fisg8vLA3B0uzbEk+5Ftep4hEYWLdZrjFC
         ML8+S3VPOrnpxcaaO2B6QySDMtLeR78/90gSv92Vt+LLEfrD/Sm0aiezYgQiGzBJ+kzI
         63V9WrTai+GcWINVJo3q/T9qwBthvPXzcQsYxMd+ivezHhGf5/kg0lXuVYl7dmC7d/Hu
         s6okVfngv6NOccbasrIQj/WtYYBgxxzSI/X/x0njo+dlII06DvkILTKtAikL1gxVq1+T
         eOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=hM68HDVPi+czWC9bIWMP4iAko79K08VTpfouJoeY99c=;
        b=DTg+aVF/9lvIwYwmSywkr17vTkyLenl4b1oMgrXYHgiXdvCC94Z0Il6+7YbsSrU/DH
         4nzXoMGSokvg9ym+/w1pV508iDzpxhDrWTliiHwOIso58OYC65jhRaMoL4VFmzW3Sx7h
         IdRdPvOlygpO6YofGzf3WI8vxZ+1iIZrsBxzGzcFtIlmx7C9o9eU/VuziEF7IQrdQLcO
         V8e5m5zH6HO7FxBFbxLDpAENpkDRfVAHJfSsY3hiEneR9qwWujPUN3G55Y9UZFxE8/iq
         4+f8tUb0Q4zocKvtlYK2EKerykODM45i6uH+qPywhzIKRrjm/vLJMWOjrR1/FMjDPwlR
         c20w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Ao5d1ItN;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id f131si28188wme.1.2020.10.28.14.09.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CM1Rn59vszyZ4
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:57 +0100 (CET)
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
	with LMTP id CwO4v59wNp62 for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:57 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rn2JNrzySy
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:57 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 12/22] arm64: smmu-v3: use uint instead of int when needed (Wsign-compare)
Date: Wed, 28 Oct 2020 22:09:23 +0100
Message-Id: <20201028210933.138379-13-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Ao5d1ItN;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/smmu-v3.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index 5f75e862..4551c512 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -405,7 +405,7 @@ static void queue_inc_prod(struct arm_smmu_queue *q)
 
 static void queue_write(u64 *dst, u64 *src, u32 n_dwords)
 {
-	int i;
+	u32 i;
 
 	for (i = 0; i < n_dwords; ++i)
 		*dst++ = *src++;
@@ -1045,7 +1045,8 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
-	int ret, i, j, sid;
+	int ret, sid;
+	unsigned int i, j;
 
 	if (!iommu_count_units())
 		return 0;
@@ -1075,7 +1076,8 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
-	int i, j, sid;
+	int sid;
+	unsigned int i, j;
 
 	if (!iommu_count_units())
 		return;
@@ -1100,7 +1102,8 @@ static int arm_smmuv3_init(void)
 {
 	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
-	int ret, i;
+	int ret;
+	unsigned int i;
 
 	iommu = &system_config->platform_info.iommu_units[0];
 	for (i = 0; i < iommu_count_units(); iommu++, smmu++, i++) {
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-13-andrea.bastoni%40tum.de.
