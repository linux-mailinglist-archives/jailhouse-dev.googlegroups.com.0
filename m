Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU5I2GBAMGQELYUAONI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id DB35C3416B5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:35:47 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id f3sf21381183wrt.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:35:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139347; cv=pass;
        d=google.com; s=arc-20160816;
        b=0tOW+70Wl37JwTzo/yD/U2kl5JFVmbitYFBWaPZ4qRDaJ2MZa2rpy7b4wTohlBEkvz
         2S+7trffwOZT1hAISojNxnUQUgiLFq13B9E78p8EZeW5tgduVh6LG7+gAsShX8Aj+VB1
         Uz6PbXSNHaCiXS/TbafDeCEP6cNNkA1i+PTEA1zTaRavwLOto7GxYQZRRVtuFzNNu7Pq
         NDqKD0KSjq+EE+IXtP2ZpjAJgbXb2UrdlHGM+3uVXYwzrqBX5RVW0++G1hdJPEuHHsgd
         jiwW2+Epep0UGvrbky4FYo1BjFbz0n+X6vA/dcSmlZfHlxvivov+pdonx5ImiEFeRW11
         8pVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=rSyPeuYz+Xcev7jaEm0ycM0+WvLASxTGL5ot4uP0spA=;
        b=AiIf8uF0h+Md4YNjOw2dJNEQn8bbJ/uiXGgCEkXa+M9b1cCMQ5bnnVAkESwta67AHZ
         7ubF7vGuL+3K9Mt9kQo9JaQVup66K4bBobwv3fjXzw8xvF5zT7rjN2LadkO0PJUB9Nfr
         PJLSr/Lt74egXCcU9ZKSaT1GOvlrSLmnAtsBHhUSKYur06dmYE9gT21KFJIcXLueK1Ee
         VSkxJ1k9mY68ilBnacGwP3QvgkF224GPGYyLwcY2d+V3dvKkk5JmA4121rGh/Dq5O6u6
         6ksrHdAv00zq2JkMwQHXAXUcQ8I5YNhDCaNgyD74E86+ve5F+tRzPA15twHRbxCBVGH8
         vOkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rSyPeuYz+Xcev7jaEm0ycM0+WvLASxTGL5ot4uP0spA=;
        b=XlNUm30N+T6l+tLYo69lvHO2WCN7zdIsn7YKwOI2gKOjk2w9QjbK7FBGmgPWk3KSba
         HzcHQKRCMKtwG6rzFeGFrQ76qUJuYrNxtkL96mPW3XzqQgY4m/7+Y58UeCNn8lmJ/dLp
         0ldP06+vQEng6fD+5SlOEo5LehE9eGOktfjz3uViOT5F/cJD42Y3QpijZhbqAxuCW0Wu
         GYEin6Pmtej3WGRrO06jVWOZsKVWClYUSJVA54WwpOVzo0XTclxShpibRf0XFLKxL6DH
         toC9If9SEIJPa3jfBaOAaluhxsSE0nwJWoLWeSJmLjJxGW9CQThvlNV/MXWABw7ASFHr
         lGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rSyPeuYz+Xcev7jaEm0ycM0+WvLASxTGL5ot4uP0spA=;
        b=UavTC7NCGrFxscfW7o7kdrmIBMDn9GWRaiZjpR3KKT56PhTFMp0Ql4cKCV88iv/8+j
         lx25lCsNKSOWjFyq0kY9A8o/nwq+TZX0Oi7T9cqFkms1SxSnBOm4K7Ry/zvHHlgru89D
         RU0LJh3KxO5TjRoA/Q+AraGrZdhQMl73iCe1pYdRMZciIj83NLUvxrd4/pwgaePWoGUd
         eO+JQNet92L79nH7fs71Wmuu2lqrQS29PhxkUMHv9sRhFpZsA8qf4fK9CCuMiAZWAA5+
         S9P2pKv+9/So5ObbkmxakwuCG9fqduAmbtis7IWHGkhoNfwz/YkTCVkhEYnlL+TNDrHG
         NA9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531BDuGtbmRYD2dUzVnuQhnyjbip/8V6hRxrMMGG+aZZjN3g4Nuh
	I2uodQdzGllHdZbEcEgt6gE=
X-Google-Smtp-Source: ABdhPJyTAvp9AUyCOuJoMAo5YfZFOgSFJx6ivw/SinwI/qTQiPLPDTYzi+V2sBIeiexVXKRCfoAOLw==
X-Received: by 2002:a1c:4d09:: with SMTP id o9mr2404060wmh.15.1616139347665;
        Fri, 19 Mar 2021 00:35:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:bd84:: with SMTP id n126ls2154045wmf.2.canary-gmail;
 Fri, 19 Mar 2021 00:35:46 -0700 (PDT)
X-Received: by 2002:a05:600c:20d3:: with SMTP id y19mr2466928wmm.146.1616139346688;
        Fri, 19 Mar 2021 00:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139346; cv=none;
        d=google.com; s=arc-20160816;
        b=vsSCutO5ZHe1abyDb/ddmC+B3j+DX6Gdria0/uNaftYgMZtAtNraPXg1KQrdbntLMg
         QAQ49yvZW55fgM8E5xZ392davyRaIVZDfBmvvcdwi4zJhNWlnkzJsxWipIMX9nIZkxEd
         v0ZcA08mm6/ehrRtVMHpA/v3x1ALVkHufsAMVb19JhfPHgCL99wi0ZXad+BPvTii7Uwy
         aCiMG/2MEg3qSEpEzsoiRiIs52UVMJ3Jx0sMTKoGWIGfL1k4P0XCLG7zewvGkkAGcEKP
         sjqREUx8f9wfWCg7EEM0yoWHoM738gtE3VVm1/ZFW9xBlTz5NdUuASrlvu53gDVBxVxq
         Cu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zwP10w02Dwm3r/UVrQ4pVd+YfOqvAiXUmOb0q406ZWE=;
        b=pXxm8Qwov6Xc2r8eAkUL6nYso+b+5Vpmt5UW6LHvE/iHInDrvZVceMpxV90y5lx/sD
         VY07JsRLsPUSENv355oikD4rHjjEjPXRYrBw0GOOL76CbbrVyECUmRTeSLvicmxQPlSp
         fhvN+TOtWuGGXMZ5gtQF8o7ZT1sTrsWkmgaCTPBzw+6Q2+yj0H2m8JInc9VsfhL1U3O6
         yhTQHS36W9TnQjXwOqSwu9qDumQRG9xRENlKW5IkdZEQmUDuX4GeyX7WajxBgbydhcQ4
         ICorzlXjiwgzCVwdhxvANhBf9RbO3K4xGtjwYSqsiGzV6o1FZF2zCS/DVTJ9KAIkYJr9
         MBIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i22si240959wml.2.2021.03.19.00.35.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:35:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7Zknn019616
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:35:46 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC0004384;
	Fri, 19 Mar 2021 08:30:46 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 02/11] arm/arm64: Expand return type of smc helpers to long
Date: Fri, 19 Mar 2021 08:30:36 +0100
Message-Id: <68e592b1f315172b707e41ec3c6ac1ca86419771.1616139045.git.jan.kiszka@siemens.com>
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

This allows to evaluate all 64 bits on arm64. Will be needed for SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/smccc.c      | 2 +-
 hypervisor/arch/arm/include/asm/smc.h   | 2 +-
 hypervisor/arch/arm64/include/asm/smc.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index 0f80ac9e..6bffcfb1 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -20,7 +20,7 @@
 void smccc_discover(void)
 {
 	struct per_cpu *cpu_data = this_cpu_data();
-	int ret;
+	long ret;
 
 	cpu_data->smccc_feat_workaround_1 = ARM_SMCCC_NOT_SUPPORTED;
 	cpu_data->smccc_feat_workaround_2 = ARM_SMCCC_NOT_SUPPORTED;
diff --git a/hypervisor/arch/arm/include/asm/smc.h b/hypervisor/arch/arm/include/asm/smc.h
index 0f5e857f..b70af8be 100644
--- a/hypervisor/arch/arm/include/asm/smc.h
+++ b/hypervisor/arch/arm/include/asm/smc.h
@@ -13,7 +13,7 @@
 /* for gcc < 5 */
 asm (".arch_extension sec\n");
 
-static inline int smc(unsigned long id)
+static inline long smc(unsigned long id)
 {
 	register unsigned long __id asm("r0") = id;
 
diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/arm64/include/asm/smc.h
index 9c7bc6ab..27e5397b 100644
--- a/hypervisor/arch/arm64/include/asm/smc.h
+++ b/hypervisor/arch/arm64/include/asm/smc.h
@@ -10,7 +10,7 @@
  * the COPYING file in the top-level directory.
  */
 
-static inline int smc(unsigned long id)
+static inline long smc(unsigned long id)
 {
 	register unsigned long __id asm("r0") = id;
 
@@ -21,7 +21,7 @@ static inline int smc(unsigned long id)
 	return __id;
 }
 
-static inline int smc_arg1(unsigned long id, unsigned long par1)
+static inline long smc_arg1(unsigned long id, unsigned long par1)
 {
 	register unsigned long __id asm("r0") = id;
 	register unsigned long __par1 asm("r1") = par1;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/68e592b1f315172b707e41ec3c6ac1ca86419771.1616139045.git.jan.kiszka%40siemens.com.
