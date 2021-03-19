Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVNI2GBAMGQEOLCRYSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4023416BB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:35:50 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id a24sf17552686ljp.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:35:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139350; cv=pass;
        d=google.com; s=arc-20160816;
        b=oGqS166c1bgOUjyvaQxo1tL2x5lkKvejfYsPea7j6tJPy+YLfpPVXiD9Gcx8V6fRol
         3rSvvdi//l8V2ZqZvogiiGnXQfX7fjW9Tf6uV9CJZ9vstwEPfznnncsO787hF4i9X/kY
         tYGs4Atz/41F9EhA7T5zxg5yryE5IXM7AEr15OEeaHCtBwE6Oo0oZNbWZyotG5OS/G8Y
         bFwMzIF81ZdrtO8Ieg3qxYL8EX0me8l6Zo6BUrHadCB/xHiDlOELlbfHKxhA1HkeaoPV
         WcOR4tdH3eQOL8nU3N41NPK/JhhGsae2U6ps3Ojq/kcWl29vI2nLh0bH7uzL6DTF15aF
         YPqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=uMASe1qDIvvaRl/F7KNGPgBtYwzVUAJ6GULJ/Po9V2U=;
        b=d2gFLtQU0yX+uvoP5oQ5jwUPNqD8y0LyK1QmWYy/mxyLHDJ//O0MX3FrfaaQW3jogz
         SQR/3T8Nx5cs/KLYGbgYIrLlI0QamQKenTqZWTfPumu5aipoI2mHJc46ZD2I2cjQyB0g
         naMAcKPJ6ps4m3wKN/Phwe2i1H8v+W/5IxYxu7CyOV+QZEaoi2laUR/P1y4QJ6gXe1f0
         3b849H6cGLUyTBZxrsv8qk4YuFuqq3b2rvWTq5j7AXprnmZOeKXZVxEbSKwC8tlnZEy5
         /XAKQUIc6xfWx4qYkA1kClcLzjnAqxWY2sRNVMM7fq71OncxFNn0JLjlkqD4VtcChQOA
         oj9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uMASe1qDIvvaRl/F7KNGPgBtYwzVUAJ6GULJ/Po9V2U=;
        b=OpkysEGre7hxmCy5Rm4MpfMtJ8a9KP/bOt78SRt07Yo+K4iDyTZZAN20WysiqEWAZg
         Tj7gFmokeyXYkSFR+qpPbHi1d6nBpI8UBwbxkCnfkDvIvZa5Ssa79NIgB2xgjLBAm5/V
         Sow7GpNP1p8leykxgNg+hE50HKme7yIl0TXfYm2uYiWzHR/CbntZmOwIgoNcc50D6rJ6
         in2L4sXZYL8ieyUZtLX0a6gfCBljxMMDxnzLwZ+cpjQHqjnm0B3tdjDhELj07vZ2mgmr
         3O/IrVNinpyp5DAeuDhtB5xc2dEj+CCttQah0z/xdsHKAfWfhozzAMDD67ULYUGBqgTu
         UwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uMASe1qDIvvaRl/F7KNGPgBtYwzVUAJ6GULJ/Po9V2U=;
        b=nod1jU2Y4YALnn4kFnD9qUVXUqlVRReicruAZJ3IlejrY/Bjn6M+daZ9Jqy066b+Xg
         U1mY54MmuD+uj99x06EFi0VvQ4HGCF1L1wg6GgHz6RX4uALfH+1AlmgzWCnjpzwA70gq
         DDeQ/iZWX/hscPAvhB11KPqomNTXRtHoiJBLOrHb9MygTfYNGL0iZIPXb5KM0ypMiJv3
         r9F2UQ/tV1xrCFQc4bnQKdwemTwKcD9+uNpp5z6z4vuE1LKEDlcW4E4CeLMhzsc8ikch
         gyHHZ4pDZRX/0Bo44tYvzpn4jsAaAraJBuAW5haX6r5iTOmvyEwcgBNuSP97UVc26/PX
         xjpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NyJcIRdwKl9bczKsajtAy6Hbhq0ovVROXD8eOyA/oQibEbRCk
	Ouit8098/q50LKvHspEo55Y=
X-Google-Smtp-Source: ABdhPJw8pcCFBee8Z6SAstbsYHt58ToiTLah7JOY6Ua7iTZMCsKiNHZv/YBLDOaeSs9juMhyhqq1Zg==
X-Received: by 2002:ac2:51dc:: with SMTP id u28mr59970lfm.322.1616139349962;
        Fri, 19 Mar 2021 00:35:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8915:: with SMTP id d21ls1021608lji.1.gmail; Fri, 19 Mar
 2021 00:35:48 -0700 (PDT)
X-Received: by 2002:a2e:730b:: with SMTP id o11mr50769ljc.221.1616139348781;
        Fri, 19 Mar 2021 00:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139348; cv=none;
        d=google.com; s=arc-20160816;
        b=mxUtZEeCaE0UrW5J8ZISdwNrHAQonhevGojuoLa4cEzOdNLoVurHhbdVAHpUC1y0Pp
         HZdJxt86m2Cy9ScvY0I84tg1/z2q8Hsgmt0n1Xx5vgvp7WVt7ejHzvnudKiPbjNSA9Rf
         Ymm2KhhNNUfaC2iQb6NU6J9t8sfdyzQZcQWS8WX4MXjQa9CimsUJuk4qIII0RIAzC6+F
         zueOAyZ9B/5v9Or5Hj21SIYScjWdD0gz3YILNvA4pbdo4gO4l9w9b/a3oXAgwTTYezGm
         0hqsaTVLHg813T1mqRewKV5IzzsCXz5VjLD7Y/9wA/DH44k8CgvpjknQZPiCib4k5YXe
         drhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=rJi8wK9+0kcbCj6Y+RV7f9wQonDfHkpjzmYcCnVvdLs=;
        b=H1G9ActlobsGBHUyXeFJZAnRaICnf0RVUmu5wFcfvDNC/MOTuockQ51poqqLm7LgOA
         3aHZYCjPPb78pGSf4wZAENL0JljIovYhGEVLHnRkk159zKN46tYK8lVG298Xp4jjXclF
         myAMP8LU7REe0v2dQhjj7OeB+4M0fJVFUb/1ZMTneCaEj01/hX33bJ6gfbJN0JRs84pv
         zTN+wC4vd7wGuBLZoSMi/b/MURUzOmiT6UQP+PQZSDXS1pbjUU3QOgcQVJopcWU+/jEo
         gbY4OrAfwRdrk+CEKfg5vk7XQ+fLlytr2LYSMg9xXQkjX2XVzPu/ZpQ1Q3NhlL98fjDr
         +xjw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 63si159796lfd.1.2021.03.19.00.35.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:35:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7ZlKA019626
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:35:48 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC7004384;
	Fri, 19 Mar 2021 08:30:47 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 09/11] arm-common: Improve PSCI documentation
Date: Fri, 19 Mar 2021 08:30:43 +0100
Message-Id: <03d07e0f703987b8437969caadc30916aa0f9cbe.1616139045.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616139045.git.jan.kiszka@siemens.com>
References: <cover.1616139045.git.jan.kiszka@siemens.com>
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

Describe what happens around CPU_SUSPEND and use the official symbolic
return code. Also explain what is (not) returned from CPU_OFF.

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/psci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/psci.c b/hypervisor/arch/arm-common/psci.c
index 242cad5b..916a6db9 100644
--- a/hypervisor/arch/arm-common/psci.c
+++ b/hypervisor/arch/arm-common/psci.c
@@ -101,16 +101,21 @@ long psci_dispatch(struct trap_context *ctx)
 
 	case PSCI_0_2_FN_CPU_SUSPEND:
 	case PSCI_0_2_FN64_CPU_SUSPEND:
+		/*
+		 * Note: We ignore the power_state parameter and always perform
+		 * a context-preserving suspend. This is legal according to
+		 * PSCI.
+		 */
 		if (!irqchip_has_pending_irqs()) {
 			asm volatile("wfi" : : : "memory");
 			irqchip_handle_irq();
 		}
-		return 0;
+		return PSCI_SUCCESS;
 
 	case PSCI_0_2_FN_CPU_OFF:
 	case PSCI_CPU_OFF_V0_1_UBOOT:
 		arm_cpu_park();
-		return 0;
+		return 0; /* never returned to the PSCI caller */
 
 	case PSCI_0_2_FN_CPU_ON:
 	case PSCI_0_2_FN64_CPU_ON:
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/03d07e0f703987b8437969caadc30916aa0f9cbe.1616139045.git.jan.kiszka%40siemens.com.
