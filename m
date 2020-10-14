Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXXNTL6AKGQEXVI3ILA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F728DB61
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:18 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id j2sf865853ejm.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664158; cv=pass;
        d=google.com; s=arc-20160816;
        b=gF/ags0uFngIxA6F9UpZBM9ZJ7x606xuRmaS4UUJ+dFqWiRlPYXU3iQZn8upc/2gRQ
         6M6ZVoYtb+F2/adxuEtsvSDBzZ0/JxcTkZSUUkn5E5gMe7jktvNXz4gfB4e2A+aZEZSr
         YVC1/YoZHIZ9cFrkc02Sr6lUNWj8wcMOKq76gGPvUpPZ8Vq7GB5EEm4dHrIZCx8UnZWQ
         I+hUxxd4vh6EVivw07SGCYjHk3Q8Whr050pNh/w6d9Bc3LP4PTxaQReWOw8Eg6xR5T4t
         88ZBe72UxrL28ZIHp2WoCBOMOALVOe2O4TTYp6CQJ7WLNICZr4V3PpMR7a/u+BZih3Yi
         4fpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=mxQmR9V7C+gPFaqZ3famrcOOTCDFcqvSB78WxJYzYQU=;
        b=KflgaXfWH+4mt5+jBGkluyPIqAUp62mFCcGUeHb4XVCOTCqUP+exENIkMFKSIBwQbY
         VFe2HM8IOLrfSKqbquQVKoeEhB0IB9CLCXbGMmY011uJBwkCWCYfg+SGnSr+0Fn9nNzt
         MhReo8f2T6BVHllHSR90niz9xmcnwVX8GKy/krM3ChogqWCtQnbLk+a6PUxqvnQ5grsF
         mC0iEfCtyIB5kS84RALzepqXk0FKEp6oUUNIS6kV2hNJEy+RkUtu87bBDpPo94yTuHhG
         olbuKYd/YM9GcBapTFiLd3d6GQvl7LMy4wowfYSmPr1ypB8D5SduDKtqInZ9phdxlPOy
         WtbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mxQmR9V7C+gPFaqZ3famrcOOTCDFcqvSB78WxJYzYQU=;
        b=LzCnYT6B7/w8xt+EgIzdgcTRrtjc8Yw+/whSAEY1MEEx20gcy9f6ZNHgBsu7oAW4qs
         6R988qbm+vG5aUFfWHA3TZjVEfkgo4H+qdSbsoGZ5HA8hDt+/sZg1jhJBtsRasE79sJC
         tDx7rcqN1074ftx31oStfYFA5uGs+LAQG23U8rGaYqqjIhlfiTZtYlTR3IKCeUHYVzml
         o78mPLMBs/ezIVqs8i16bX2o+KWaY1PH9WWYuG489/BPcThfRI5YUnsScoZpKrJroPO9
         XCL2ZTAfziI68B/owJOM08ahR4JdPyeRChBY9FU1mLI+yhm0kQzffgYVu0VGmd/s9Xwv
         yXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mxQmR9V7C+gPFaqZ3famrcOOTCDFcqvSB78WxJYzYQU=;
        b=Mv+3CyAcCkeg3Letzko/uHz9w2p/igSxWyGRq61XNe+JFEWx0QH05CLSFoBmcm6XPX
         EqqH9P++wsDvH+X9oJOwJ0UD2AJj7TIxCZerQUMZzUmQ8Cp7fkhDgnZbTX7qnhO5on24
         Gm63HxbQuRfWgfLvkvE2rD5+9zVChq+++TLTP95TJGe6WIWQwXEtfoxNy3X6Wre+jNIe
         flj8efzpN+Va3Y4Xqi9klNeyMFxLvjDTRhqfbtQeIvmXmUMOlB9vqx9s+iSTTNXwpzFR
         LPvXBzMUj5LSn7RojGVGKpt3EiCM7/KaBm532ie11g6269M8YKUmtauyYaJ9xn2QY706
         p01w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339yxz4yqPsvuLuXiLruTut62f7ehHBh9vEKMVJImujLKRP651i
	thy6rK8ns/2U+UtzCF6rkrw=
X-Google-Smtp-Source: ABdhPJx4ycmR4bYKdz/Yn0lu8K7+4KVJ+hRRWe+NJExeS4irbv1enhmEhLl8rZ5W0Vxn4DJrA29Rzw==
X-Received: by 2002:a50:abc3:: with SMTP id u61mr3940521edc.253.1602664158651;
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:554:: with SMTP id k20ls1238556eja.6.gmail; Wed, 14
 Oct 2020 01:29:17 -0700 (PDT)
X-Received: by 2002:a17:906:fcae:: with SMTP id qw14mr4201533ejb.537.1602664157495;
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664157; cv=none;
        d=google.com; s=arc-20160816;
        b=EftgoD1qjVJErXZj4PRZaHRsUgnZh72IkG19OAZKA8sGqAa246C5G9Q87beqhCCnWt
         I2yYh7aWocAkRFeS64lhjT3msAREOz5b+b5M8mH3Xctnb8lYYJj0vVSAUQKfxufuV4+V
         DB5Xl+MrCMgIbYtBwWr0fjy7c36szDVipeZXgAByJAIfljbn51YzBDB8Manes+8OS39A
         UaMpbVrZD3Dkr8nQ0wR9VCjdBZwZqSJoVOjlkQErY0dJRLUqJjrOJ6G+8XKRUmT1vLyT
         8XBanlss4A2C99ZwBKl5VnSnjwZBSZ/r+GeWa7kPTe0zZ+zkTotuiHQ1TY4JVrLn4Z9w
         xXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=VEgy3Onx1FKd2hui/VA+73tSHtJyiprK4GRf9bsDNRo=;
        b=LlZdEY/GdFSqojWELUuredzA0rtIZrso7TgTx+L6Htg2+ktUn7JwQITl/dsDVpaxYZ
         jV0KhuTZVJjxO2p0zqSnDWF+mKYwuwnMcNINWx2TFs28UC+aH5KcrkFJWdvR3bhgSCRf
         nKYkPY+WaGoZQ9HHObdDm3Nc4ZZUufeQlfCwdUBzi9/yfPAlFcUELtoBhRY9tMFzvnvq
         QMhXvgeEcBHhCF/xPD14FN7vOTAsj6PH5B+8CknNA4bXlW0cCTgWAl0VkP2IM/2Wswav
         ozupXadoCEeDLIJ4rrfVZ/Myo6CyegBK7gj4yk+6V47N88mINPiJF47PuYQn7AcsLHtc
         Rz+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v18si73470edx.4.2020.10.14.01.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TH9m001619
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJD002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 27/46] arm64: smmu: Drop stream-match feature recording
Date: Wed, 14 Oct 2020 10:28:51 +0200
Message-Id: <85c2f1a667965c1461ac546a1c721fed4fb4f524.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/85c2f1a667965c1461ac546a1c721fed4fb4f524.1602664150.git.jan.kiszka%40siemens.com.
