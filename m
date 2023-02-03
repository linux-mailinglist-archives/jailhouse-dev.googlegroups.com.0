Return-Path: <jailhouse-dev+bncBC4ILIEFEIINVYPVTYDBUBDPRKCBK@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3b.google.com (mail-oo1-xc3b.google.com [IPv6:2607:f8b0:4864:20::c3b])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C7E68A3AA
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Feb 2023 21:38:51 +0100 (CET)
Received: by mail-oo1-xc3b.google.com with SMTP id z14-20020a4ad58e000000b005137826d392sf2297040oos.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Feb 2023 12:38:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675456730; cv=pass;
        d=google.com; s=arc-20160816;
        b=WsWl/7b2WeBMpyrJ7d5z+G0PoWdNYd0rVrwrijeQBcGTrbQA3eqVs+BRPnu+Li6xsu
         5x0dFATsOB1rZhE0iDXjuU0dOieb7mfTs5wivH35qxB+fBg0eGaCCJn5KLvrcwZrEom2
         CuCMil+bM81zdu3bNmX88xAdQve6wdLQUjq/Oifbto6Oankhzm8BUQ1pHH3qsbVdRv2W
         JJxjo5zzAQZwuDiofaJhuofqpq2q5UTr58oVL+VLK9osGKPusW5tFv2zl5B3DUReRfpA
         vNf3GoQPIzTMTWPZN/k37QWiqeZuJyW7k787uKLzzabp/ifHRt/o2I0y7g18a3DtV3Vd
         J94Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=g+ifxhvvFRhhWFJtohp/RhedGjBJn8HWnn5a1/Z3AbU=;
        b=Rl13a8RVCdsXefQ5AEo4UBITjrbA5+H8IolPkfwIWm+j6DE4mqDiR90yJuqFpNlAKt
         U22AWFqeSHgYLse2EhSZnMnbVbwkYgK227PP7oIck0XAEpkdQKIfmM8hBhYUv0jKb51O
         3pHyn5eHvwuPYH+DPBk/gWVVAEtfDF7dLMWIsN6HMgbstl+bZldBGixbWXDTSetGVlE+
         7SvQ2a+zxCRtYhfUeVXD/FG8S913zvyTPMeCg9w5Vloars3XDqyOC8fdB0fhR+YWCRF+
         Rb0w2BrhXCXXZFTqzs4kxA4DGiLzoij8BK8j4UHseNgPioejndTam8v9ZAhKk3MpXD2M
         vAsw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=J2ZZpf2v;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::2a as permitted sender) smtp.mailfrom=ricardo@foundries.io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+ifxhvvFRhhWFJtohp/RhedGjBJn8HWnn5a1/Z3AbU=;
        b=liaEJ52V/jJmLMGwikbj0S0rn0/Pi5SCoEr/w5MrJcG/NsfyuCS/TTBDtaCN0EFSKm
         t5lj5jabzCUZA57w06+HKn/b0yoSLXEhTTCZm9hWwvBYRcMHmP738cxcGY1EQocigZn7
         LFZHaQ98CGEOs3r5w/BqTwZA05W7ZLcR0EoC437WOQbJanBpgXroUvNOsSct3PtwAtd5
         z2cYsRahirJXa9gKnzde6idjfDbPBD9/18DKOXHV85hSodchCAES5l4kPRVaO5IsOgHp
         OBUaATXMJ6vA3cC1aZ7cDk2N3JBVzPn5oOMCwAf6j4xJl0PlScUMX5ycgZMxhz0cZi9h
         hCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+ifxhvvFRhhWFJtohp/RhedGjBJn8HWnn5a1/Z3AbU=;
        b=Jju6rHcQubLZ/uzBO4QAG/zTGCQEk/W7X/Af/8jjNyNGIFJab5uXTyvVJndbTiJssG
         iUg7f/1bzNVG6UnBkSLPzApIw0DtgyocvI9vyV3fKpu+jfuddBEcGm0jEJyrO8tLaaYV
         So21HDmuTtrU2mDAJkFfl6tju/kjw9DLQrYZIRhzo2ImwWFxuDBRhn2bBIck6IR5pbJo
         j46dH8/WQ5WVVd9w2EUpAdosmuU9kwHF0TCOU6p+yhoFU4zaxlwbkaQv2SKJ+pycNn7L
         1UabYGmaNwmycYXp4oBS9bKcEBlIOEAfJffs/YoSpzVZW1wjywd6QW7hCOucYem1Wm9j
         AsqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUJZs3hhGbs102sq9mjYT9Pc038JZ0PKMSPBOgx3vnx2dpWp1fm
	cLffqKUsKDlIULX6/U+8MeU=
X-Google-Smtp-Source: AK7set84faDZOenNJSPHhItfDo2Ku+6Oxf5RbwYoFwoFqEe0RmtlwskKGF51q6LGShTPDhyQCwTBhg==
X-Received: by 2002:a05:6870:1681:b0:163:ce19:4435 with SMTP id j1-20020a056870168100b00163ce194435mr985386oae.229.1675456730429;
        Fri, 03 Feb 2023 12:38:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:6289:b0:66d:a9f3:4e75 with SMTP id
 ce9-20020a056830628900b0066da9f34e75ls844677otb.9.-pod-prod-gmail; Fri, 03
 Feb 2023 12:38:49 -0800 (PST)
X-Received: by 2002:a9d:6498:0:b0:68d:422d:eca6 with SMTP id g24-20020a9d6498000000b0068d422deca6mr4546027otl.2.1675456729747;
        Fri, 03 Feb 2023 12:38:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675456729; cv=none;
        d=google.com; s=arc-20160816;
        b=ydziGaM5oP7n5F2JyDPpnwIhcxygYYzMEinf5UzFLOBzb/1sER4L66jDROAdfDMS8f
         5OGQlANbYrgd5q6J1a1EEITnBT9vOqFEwxnLmLBypav++k/vV1EZxa/cM/i7UHdojCS6
         tIigBdFGU4vPBm1mAbhtH96LUyVvF2s1aGWkEFw3j4UXJz3W3Z4ako+vq1Um/OYPkQ/0
         J+QwLzrb2809N9V9dtY8vYX9eqsCu6VMYgT/xcm2cFX7EKlHOgFeAY1/vTDBAWV2IwqZ
         umsXPL9Erth67cRD5fA4Hv2NLfruY4T3Xw3iaUCRw0H2fKzf60+AVKaFhaxD5UXvPUOS
         MAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zc8PX91zPxtYgplxU4iCS/iz/jUE0k3DwrFPHpSIwpY=;
        b=UbgBsBvuZrco2lNN731dNhwADwhJ3bJdcKrFJKjNrjdmtZd4IM5kfyCbINerfUvUH1
         o2yZModTMq40pDpkb/7sy0NO+WrkzwnrO8dKCqBSUUYvtFdkkD9VFDLLJoPZxRAGmA9t
         tyyllYIyBRSgz9AX9vWj4SBTWc0rWF0q+7Oj1Istc4LRP/nFpk9DkMn7fbHHDyLc7BNP
         F25cybXrdpW47CBmT/QoTPTRk0wMkd91VauHp27XuurVJwXzaJF67xg3x8Ve8X7PJ23/
         XVED9yIY7Wn6759ZxPRMQQGrr6rtcPrnCi5qraME+RxOKF58/ONBC0k0TDtZCixVBlaV
         7Nsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=J2ZZpf2v;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::2a as permitted sender) smtp.mailfrom=ricardo@foundries.io
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com. [2001:4860:4864:20::2a])
        by gmr-mx.google.com with ESMTPS id m13-20020a056830328d00b00686e40e1e0esi301465ott.1.2023.02.03.12.38.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 12:38:49 -0800 (PST)
Received-SPF: pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::2a as permitted sender) client-ip=2001:4860:4864:20::2a;
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-163bd802238so8097898fac.1
        for <jailhouse-dev@googlegroups.com>; Fri, 03 Feb 2023 12:38:49 -0800 (PST)
X-Received: by 2002:a05:6870:b3a8:b0:163:2f2e:1235 with SMTP id w40-20020a056870b3a800b001632f2e1235mr6030512oap.47.1675456728206;
        Fri, 03 Feb 2023 12:38:48 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:badc:845d:dfac:d1f8:a7d2:47ed])
        by smtp.gmail.com with ESMTPSA id k7-20020a056870350700b001631914e41asm1197748oah.33.2023.02.03.12.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 12:38:47 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	dannenberg@ti.com,
	mranostay@ti.com
Subject: [PATCH 3/4] configs: arm64: k3-am625-sk: Add VTM memory node
Date: Fri,  3 Feb 2023 17:38:30 -0300
Message-Id: <20230203203831.46311-4-ricardo@foundries.io>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203203831.46311-1-ricardo@foundries.io>
References: <20230203203831.46311-1-ricardo@foundries.io>
MIME-Version: 1.0
X-Original-Sender: ricardo@foundries.io
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@foundries.io header.s=google header.b=J2ZZpf2v;       spf=pass
 (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::2a
 as permitted sender) smtp.mailfrom=ricardo@foundries.io
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

Add the memory region for VTM to the device-specific config
file. This fixes a runtime exception when the kernel accesses
that memory region:

<snip>
Unhandled data read at 0xb00308(4)

FATAL: unhandled trap (exception class 0x24)
<snip>

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 configs/arm64/k3-am625-sk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
index cfc8dc8d..d6096e8f 100644
--- a/configs/arm64/k3-am625-sk.c
+++ b/configs/arm64/k3-am625-sk.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[32];
+	struct jailhouse_memory mem_regions[33];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -232,6 +232,13 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
+		/* VTM */ {
+			.phys_start = 0x00b00000,
+			.virt_start = 0x00b00000,
+			.size = 0x00002400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_IO_UNALIGNED,
+		},
 		/* CRYPTO */ {
 			.phys_start = 0x40900000,
 			.virt_start = 0x40900000,
-- 
2.34.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230203203831.46311-4-ricardo%40foundries.io.
