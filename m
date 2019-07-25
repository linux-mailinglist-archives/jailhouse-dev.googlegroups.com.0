Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBR4L4XUQKGQEVXXQGXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id EC608746B4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 25 Jul 2019 08:01:43 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id m25sf4904197lfh.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Jul 2019 23:01:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564034503; cv=pass;
        d=google.com; s=arc-20160816;
        b=rHrtPelq1jfdZsRLHzkTHVdiIrLFMzeptgEa54SgrB2y9gBeFKscTmROoYAOWM4bM1
         lNeS8RNawX1g/hDnfyRpnVOQb3C5cfNYd8e0IrZTkpmbhlwlgKkVeYqQGCwRwRmCPb+L
         eSFdulGr/65DI/0FzvvAmmZDDKXozfPZmKaivnFARaXzAZ5bVSOo/qZDLBOEkvzVzQDy
         RKcy3rThzztW9syaEu+CldJ1+nBk0F7eWi2yMNxheJAJN8WBzRkT6U0Pn4bhs6jZYN4U
         /6kZZKVOrifRy0683C8VOmRfz+ILdZQIP+7VlJbqSSjwSf9C/x2NAvJJFNedtkp2GdK6
         KI9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:to:sender:dkim-signature;
        bh=uZNxXiIMBO552UE7i6gPXrXF+b1HRiY6SaV79ty0Cws=;
        b=jduXr+E0r/KgBberOxU17tK0r3yk/Lq2HX3ptGSTHJGU3HoRsnPN6ZFKtz5FPGAuQZ
         xjNBI8z1z8uDdoPPn2QlP9841TgDJ+DkSg7lsYyRgovwgiVeZkAP3iO8CMaKegLUExXJ
         m1yFmMXyirASo2YFG7chlPNDNb7uLfpCyYhZ+xmzpyDN99lwSmnxfDhCriTrMyqHWPgq
         CzOAofm58eTfNtbnAz+xQbRnrHt2uOGEyl0cx/b/B3aooSeWalq+CrdHQBlve/HEE+7Z
         Rqp7Cx1Bs1IfnRrKIyHnMDC35WWl/3bDyo8zFqSghyweTpag8lDgEA4bu0qBcW2Sc/KM
         muJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uZNxXiIMBO552UE7i6gPXrXF+b1HRiY6SaV79ty0Cws=;
        b=g3lNBp07NX6K6E6XZMm+9pBAUex4dW8ufvSBaNJ9/q5cAY5S8tWRMT2CshKdLzlZUe
         uzgDdXj7V44Q86RTk5aOWSGkNM8u75FtaqJKm/DvhKreVyY+p17v89bx14mu+E9/mKx9
         7o2IRB3okkUFFIH/OpkuSxpBtmB+2XitWC4wDYHJWNJRj+69VS1kZVgChimK0Tl8ik5s
         YMAwlV5iplnDjYLUPaD5X9A/Lqb9RqEhVSdxWZMhCUh8n6VN13fos9xjhbFYpPwYr45A
         WoXEic87v0rb/I7dyk+3LDAIc1RzHlJvoTbIFhEiksmddsAm+fRihb6FZ8c8sqha6AoJ
         HTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uZNxXiIMBO552UE7i6gPXrXF+b1HRiY6SaV79ty0Cws=;
        b=MbD8CNtMCf4wu/3q3l9PmvVdYZriPDdTiMzAVtPJjVo6BdQAkt2rPfTuZXdM4uHZpz
         nfFTvZ9d3GbpOENoyOb9C03KLR8ANEfFWgIrPQ8SL2hBswU/Ati3dts06PhTNUfRfjtm
         efiGnyJ2CcbQ4Akhf06nC0/5TyRQIYiOyJp0jZriCUVoqzgWFpvs1ukF4pOkoaKW8kRd
         jSbfFveDhT3BcblUFWi72DOkmq9xBS6QR/I6zt89I6j0h/6xNoIkKMGd8BEE2W+vAiXP
         p/ajdf1a6zyC9wGWmUC1Lk37huBXg9Covq3yWqGhbya3B2C75jvzr51QLUgGXO9Upr/R
         6SJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVzbqycpnp99LeDeCpdAZpgZevBhTOyAA1K4F7Jx6s8txtKZ7IH
	gqDeFvuZcMhjhgEcBA59WhU=
X-Google-Smtp-Source: APXvYqyriy42piTCEuVZI0sORJh3DTiI6rwmr49p6FnBJpyjxcXl4q4LQoZ7kL/8841uMCxPTSm25w==
X-Received: by 2002:a2e:2d12:: with SMTP id t18mr28039327ljt.175.1564034503439;
        Wed, 24 Jul 2019 23:01:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:65da:: with SMTP id e87ls5575447ljf.1.gmail; Wed, 24 Jul
 2019 23:01:42 -0700 (PDT)
X-Received: by 2002:a2e:4794:: with SMTP id u142mr45495416lja.222.1564034502726;
        Wed, 24 Jul 2019 23:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564034502; cv=none;
        d=google.com; s=arc-20160816;
        b=PjW1iUQy7jF6R8SZVJsDtc8zmRmOQwxt+220xQ6xgp6rfMDgAg2FDWCO8syxlIcPcq
         GmW17ybAPiQwenky2t+YAsqOSIF+/s8gq2DBvKEI7SwF0w1bZBoEBZYLVMRsq4dr1Nng
         3AczZk6YXLVjuaIGYL6z6Iyp0sEhYQHdOofF7ZReFAe8rNxJ3KuPL1b3nTDabRJxKSKM
         v4K5TzP/eOm+Sof8uYAdCP23VWJioKIsoS9CoGoFuZwT4HWnqEHWj1Q9QFGoYffDNwIF
         dWk0W157gLhrMxfk7+RaBnt4R7Ox3FumM2JI9zCOrV3rU+R35gGsIp0rVJiXoZQ6qoOJ
         e2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=rjYtlysts8ICQLgHVqy3zz/bpZlqsngEgDCebqCD1Qc=;
        b=gqWuuAaBtc76WB4AxhNzO8wI9HZc6v5Y1DKTEQbeFzPShlMMEre8LWouD3Rt8VIy32
         8eksQChqkNbDSmNrChDpQ/6MBs2Qgw3UoLmTvO3TxKW0yOBSoOdOa7ubz0Nh1ceoKWLC
         308WTQWzqrLHvLUxxKM6F1K4lhlvdvpzjnw7QomtEa89EiPRO/zVFQAr4QjjumtjNKRR
         9xayNFIZWWTez6/e+T2DFoTjKktdOZIV6Z/Clvgs4aP5p0gLwN9rGWq9aCTkvOeQPqdM
         cV6TP5KxhBHI0+6hu4dVyVwpmIW3XXa4bj73GcWtGw3d9Nq9x+NsMh5JWveMRAxBOtEk
         p6tw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v29si2424545lfq.2.2019.07.24.23.01.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 23:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6P61fLM025116
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 25 Jul 2019 08:01:41 +0200
Received: from [167.87.33.114] ([167.87.33.114])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6P61fBO008273
	for <jailhouse-dev@googlegroups.com>; Thu, 25 Jul 2019 08:01:41 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] driver: Account for renaming of lapic_timer_frequency in 5.3
Message-ID: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
Date: Thu, 25 Jul 2019 08:01:41 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

"lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=A4nde=
rt sich
nix."

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/driver/main.c b/driver/main.c
index fe752753..b3896609 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -100,7 +100,10 @@ static struct resource *hypervisor_mem_res;
=20
 static typeof(ioremap_page_range) *ioremap_page_range_sym;
 #ifdef CONFIG_X86
-static typeof(lapic_timer_frequency) *lapic_timer_frequency_sym;
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
+#define lapic_timer_period	lapic_timer_frequency
+#endif
+static typeof(lapic_timer_period) *lapic_timer_period_sym;
 #endif
 #ifdef CONFIG_ARM
 static typeof(__boot_cpu_mode) *__boot_cpu_mode_sym;
@@ -550,7 +553,7 @@ static int jailhouse_cmd_enable(struct jailhouse_system=
 __user *arg)
 		config->platform_info.x86.tsc_khz =3D tsc_khz;
 	if (config->platform_info.x86.apic_khz =3D=3D 0)
 		config->platform_info.x86.apic_khz =3D
-			*lapic_timer_frequency_sym / (1000 / HZ);
+			*lapic_timer_period_sym / (1000 / HZ);
 #endif
=20
 	err =3D jailhouse_cell_prepare_root(&config->root_cell);
@@ -897,7 +900,7 @@ static int __init jailhouse_init(void)
=20
 	RESOLVE_EXTERNAL_SYMBOL(ioremap_page_range);
 #ifdef CONFIG_X86
-	RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
+	RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
 #endif
 #ifdef CONFIG_ARM
 	RESOLVE_EXTERNAL_SYMBOL(__boot_cpu_mode);
--=20
2.16.4

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3ba1c1ff-a96b-bc2f-49d5-86ae7f032528%40siemens.com.
