Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBVFHZP5QKGQE454GFYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1F27BD1D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Sep 2020 08:27:33 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id l17sf1292553wrw.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 23:27:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601360852; cv=pass;
        d=google.com; s=arc-20160816;
        b=HWWnc1A6zR3TYxvnZGA+BTy1d1l2VMp3rNOdMouvOmHZwmc2SZoko5CEwV3bVShDfb
         +Nu30P7HFC7QvrZ0R4aKrM7Gu/hI8Aj5O/FDTOIgDaeI5Qyac4NApROAMuTd+S5T53jD
         05MPgediyP+P+hM4vyZiozal9qKPdIKa/6kZYaemk/C2i4IKz2PP9w9K/qq0IQdt8Fs7
         /YhCDVVQoVfjxGwIfyOgVrgH8ee+2K+UdUC7lMgp5BYJmCDpFVI45CKdGbLq1YVZPrSz
         S3oXhfWY8UOg7+zMoDKm2rCPUYK/sUj6bJAVMyLLICm2NF1G9TaUGJFRSN/L5hEE9Eq7
         0G0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=XIkfZk06RX1I39AQFWayK9/hsDUqhKpI98B9FeBxD3U=;
        b=ixFRf0SdOJHZ8S7fS2or0zOeVPh2RfrTs7YNJ/pFZUhp61zAW6ihgig5JzenrUqQuv
         N+aPfADUrO43e3/iLuLp/wl5FlrasI4TYhfhF6o6c9cph42KP/itwyz9XRAKSlEVZD3Q
         P4/qaInXSwuic3unwhlwYbNX17ECaqWZLBAdUWxSBsk2sE1aI8Rzql7cizwiB404Fr+o
         NWEjlRS2K+TCSjL0QozX0l7YbH7Q/756VO0+DVGXI35MfG/IC2dMcKOcWyWyPEWTkB4q
         /Z384Mc9YCPV+3rycX3Rwk0fmDcVUiSu+2S6dFpjuvmrNEHvROkDMuyX3/kCGepoYKaS
         wx2g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="GaGU/BZp";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XIkfZk06RX1I39AQFWayK9/hsDUqhKpI98B9FeBxD3U=;
        b=HPJTXBcE3roD4t5b+SCgLXvvLODvLUP18W/UlXvAYU2NwzwERYUPURngouaQ/IvdDv
         NjEsnJgVt4RznnGCbqhPXFuCPx6vJ9FQ0N99l4VziOgIGOGZRCgrIB9Zg3fpOA56ex6v
         KeZ0QWaAjTcY3IOJZve5lEr2Nn3ugMqPKA2jVCa1LqIcXVzQcxCMmNYGFYtL0Cxdc/jE
         OSxfhTFpHwbxg7eM6vVwLTv+Z0JxBGGeadnm1eB+TtSbpGZHn9CM9DOOjdxS1WPbcIAP
         IsMkUIA3DimIjd0D9p2W82aDU6ToRyyZRT1ja4Some3wMLN4nmUdZeaDLPrPGSsBsMvL
         KcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XIkfZk06RX1I39AQFWayK9/hsDUqhKpI98B9FeBxD3U=;
        b=P5uaHRA937vz20WP8CElIpRhmMV+oyXu7sdIhqgE5dTkpETcTfuU8SknQJwlq3dZGS
         wtxLvEp2mBM3pKQDkMer0TOe2Cm5CNvnhE0zfEb1gwH3H57ojgtMR+TcBgZ0di9eNj0+
         TaZajVJMcdClZ7/Ohs1PIGoV4e/VXibAGkmqdEVfeq+1XpxKpW3aS2gB2LVYCABo6ce/
         Vcrgqc+p9/wCtgJ2nNI8rOh4v2PFffdlwMYE9LrpOt85/8l1CHT40yYwH+jE/Ta7HNjs
         SPeg29KuinCsXnqcAPOj7wSgw5lYGU1OFg1Zpd6hCPL1z9FevN4qSXi6C2frgcyZOrCw
         eaIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530JN6xNh3lAE0VFghIbMY8+sFuC021Ico/LInTUpqdiPD2YObxO
	QT40Se9x1ek3skV6TgDUyGI=
X-Google-Smtp-Source: ABdhPJxwyoqHNMav11fxQI1OPKcyX2SaWlI4Nte5wxERRV9Bxk7ru4R4od/3eWgaeRuF1+WN5LUfPQ==
X-Received: by 2002:a5d:522d:: with SMTP id i13mr2425330wra.296.1601360852709;
        Mon, 28 Sep 2020 23:27:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls327623wrm.1.gmail; Mon, 28 Sep
 2020 23:27:31 -0700 (PDT)
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr2354418wrx.18.1601360851649;
        Mon, 28 Sep 2020 23:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601360851; cv=none;
        d=google.com; s=arc-20160816;
        b=qs3hxyR5QPrLJowLLKrkciaZS6oBS6v0n/uKqLP6InuE9o6DyqdYqDVQNdUjhJwhWM
         12mcfd3cZHGIJ6CGKUXWodrNZ7yNvyLrizhUF8Dsm716bhrHyAjUBAc+vuIQS5UspQX1
         zV21GQN5FNsi34DN3HbrRKgPJ/2ZTaVjcntrc6kjOUkJwpu7vAMLZR7BGVEI6YEggTU5
         fB4qD0pUX5W8DyK/sN+Vue+kCkqJQAT/sewIUXZuaKmjY5OOc37EsNf6zMc5cRSs8959
         3gpcqv2IMuKWKuAMVXlEn7FzwPLfx+fI5P5bwyPmjfAc4DDF/yRz+xsbCxBq2n7TlLZx
         +B0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=IyQq4lih4RfJJx6xCBxigWHzSVhApqMldqaXdavUlgI=;
        b=c4DT4nVaVLEeJLmJ1NVhyrZp6jCMDQkKn0ZWGU6/W2xLmnj0PeP3PCOca5omZQmLxe
         WGdx+H2CVw+AvqqZ/Vc5IvLjCaMuLzoaJ5lT1Mhwa1bS25R0Kth4cnPGC//GRWOm5g+z
         iPYIDwktoO+5iQNGb2sSyPk6GWwmOBOioL9/Qa2eznJP0xdrGZ7ovx521KMKDpXVqh9/
         MK9qFEPxWQvCPDsrRq39PtvcPDxPfXUCjxRt68l39yRN7RdhUZ4/2+tNoNMr8d/VdiKm
         d2TulLJZL2ET22coDGx+vJa4melTzLvGmkaruu6RwxLpqg3BcWrLR808uD8AP6gIO5xD
         Xtvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="GaGU/BZp";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id w10si110125wma.1.2020.09.28.23.27.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 23:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MGicf-1kAEoU1A8X-00DZQB for <jailhouse-dev@googlegroups.com>; Tue, 29 Sep
 2020 08:27:31 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/3] arm-common: Drop return code from irqchip_send_sgi
Date: Tue, 29 Sep 2020 08:27:07 +0200
Message-Id: <42f0f9dfff8dd09c5fa200495110c7093b9c8dfb.1601360827.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601360827.git.jan.kiszka@web.de>
References: <cover.1601360827.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:b9M+f47rbmPRnqIdeL6SZLxPNDqglVPqpX4jqYNNcAb9j04Tu1C
 nodPGwsrK2mY0wVMyB8mVBOGDGoRFvd55ml7rKh2ekZVys9zKHePlVsy1ms24m6fwTKUBBK
 mI4PPeGqhITsAs/jhpHkT/p1JeAJoZ0I7yePyy7ogVb7ChQG02SdmSNFXN46c+EaExh+T+N
 qkSp1+TY+LFHVf7ynpjTg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4BKfWybog3o=:fFLkJZboDvNqZpL0sN9nBv
 m3tFCXUeZr4cxLVTGhA0PPbWd1h1azNbVIdLi0PJUKquVWsqDwo2R0vQpXsWaIetnjqBfY+qp
 hhJN+ch6YyMA1p4nk6vd2wELg3pZIJBrjb3+3Q/DCdzaEhZaDr4xfT8QxonfxwhSbLNFlh8I/
 d5CnQp+V8q2fgieKuCVENcpYtab39UGLjcDeAO4rUUXoyFefx6CZD4m0gmR2BzTWkzOumTy3Y
 U4tqLo5vmafjJ12RDmx8/RU8Azi540FDfz63Sssk29JouHsQ3qs8QQoIljZrf09rJ3g0uxLtW
 YmDAj7KKSx8pcHDH9ijCSafnylzJajaHqgcfhxT34sJLoKofi7T24JE5jjua1SXdAsslSRiHG
 Y1XADDM3bYjVnVfp0uDlYHI4Onv83poWLNjfTZub3p1aKDcsxWw6AWf1Mobo6tHeRV1x42YQD
 l7LlOnqhQj2QuEaXppW1EfmIGLiPhksC0hYPBcTCmwXjRWeGL3bnK3mebHS1m3UXUrbtKW7wy
 NGTDFyQYnox55CaQ8yz90IzDIfT6xYwSHlM68Y8stir9f7er0PNIZ/9GjiffVFg+GjsxX/hr4
 0VOqXM6TlFgljzkXP2jsbTOCdAFLzKGvu0boM1YIg37lkqkqkSjS7UEDVHFkD77oFR4FuQzYn
 G3ByuULiurAM2sQXLHiKEfThWAyYcXjc5+IFWi9OsGV+szPI8FPq/G59qf29sxaxutp8mLXU2
 45mxYTO7lh0gXR13CDUDUbICS1V3Meji2dD9PdPTPlFeNmKLbaHp9/uOVmrDDbdASQGn41Vnu
 CWd1AcpkUt6m0hTXKpvbeunH0xRxyx7XEQPG0ZDdiBiAZ837PNH8TYRZVcB9WQAaCxncWu/in
 7wKErL2pGGVgKF/1qdZEKlbvBosBmSzDLPbYd8fWP8NU5EiRbhoDoXalR92YoVWlR7wBXTWJY
 8HIKhBL21+m4FF27TAcebBp1t0P/zrCcjyeWtIaWH4srWa3HbhE5xoV0woQ/kHLKseU1HxG5T
 CKc8ywnWuP27xKCz28ZyV/Au0Ssh3nXwhnbf4aHWaCRFBuA8ajzuUeSOHtTQsIViALHdAv28O
 3rn1ExXCP5+aPQ1hfjIKCMsiMpXFIGHT5+n5ZKrtEusFNeos6t5SPR68/lwpSA7Luwrs7YwxL
 Id6EImOS72wEaKNEF1WHu4LztCSSX6s9oJ+yT6bnQ4lESlmbXWrpT3pWiKZCY852S1rFG/JCw
 ax9a24mwCkmcbUckLnL8BdkBx6v8y+g5p3tW70w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="GaGU/BZp";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

None of the callers checks it, and all of the callers ensure that only
SGI IDs are passed.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/gic-v2.c              | 7 +------
 hypervisor/arch/arm-common/gic-v3.c              | 7 +------
 hypervisor/arch/arm-common/include/asm/irqchip.h | 4 ++--
 hypervisor/arch/arm-common/irqchip.c             | 4 ++--
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index b63b0fbc..c5ad0607 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -264,20 +264,15 @@ static void gicv2_adjust_irq_target(struct cell *cell, u16 irq_id)
 	mmio_write32(itargetsr, targets);
 }

-static int gicv2_send_sgi(struct sgi *sgi)
+static void gicv2_send_sgi(struct sgi *sgi)
 {
 	u32 val;

-	if (!is_sgi(sgi->id))
-		return -EINVAL;
-
 	val = (sgi->routing_mode & 0x3) << 24
 		| (sgi->targets & 0xff) << 16
 		| (sgi->id & 0xf);

 	mmio_write32(gicd_base + GICD_SGIR, val);
-
-	return 0;
 }

 static int gicv2_inject_irq(u16 irq_id, u16 sender)
diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 584c2c79..949c4598 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -414,14 +414,11 @@ static int gicv3_cell_init(struct cell *cell)
 	(MPIDR_AFFINITY_LEVEL((cluster_id), (level)) \
 	<< ICC_SGIR_AFF## level ##_SHIFT)

-static int gicv3_send_sgi(struct sgi *sgi)
+static void gicv3_send_sgi(struct sgi *sgi)
 {
 	u64 val;
 	u16 targets = sgi->targets;

-	if (!is_sgi(sgi->id))
-		return -EINVAL;
-
 	if (sgi->routing_mode == 2)
 		targets = 1 << phys_processor_id();

@@ -442,8 +439,6 @@ static int gicv3_send_sgi(struct sgi *sgi)

 	arm_write_sysreg(ICC_SGI1R_EL1, val);
 	isb();
-
-	return 0;
 }

 #define SGIR_TO_AFFINITY(sgir, level)	\
diff --git a/hypervisor/arch/arm-common/include/asm/irqchip.h b/hypervisor/arch/arm-common/include/asm/irqchip.h
index 20e65b62..06401f91 100644
--- a/hypervisor/arch/arm-common/include/asm/irqchip.h
+++ b/hypervisor/arch/arm-common/include/asm/irqchip.h
@@ -46,7 +46,7 @@ struct irqchip {
 	void	(*cell_exit)(struct cell *cell);
 	void	(*adjust_irq_target)(struct cell *cell, u16 irq_id);

-	int	(*send_sgi)(struct sgi *sgi);
+	void	(*send_sgi)(struct sgi *sgi);
 	u32	(*read_iar_irqn)(void);
 	void	(*eoi_irq)(u32 irqn, bool deactivate);
 	int	(*inject_irq)(u16 irq_id, u16 sender);
@@ -89,7 +89,7 @@ void irqchip_cell_reset(struct cell *cell);

 void irqchip_config_commit(struct cell *cell_added_removed);

-int irqchip_send_sgi(unsigned int cpu_id, u16 sgi_id);
+void irqchip_send_sgi(unsigned int cpu_id, u16 sgi_id);
 void irqchip_handle_irq(void);

 bool irqchip_has_pending_irqs(void);
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index c50ea18a..eb9ac40f 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -304,7 +304,7 @@ void irqchip_trigger_external_irq(u16 irq_id)
 		     1 << (irq_id % 32));
 }

-int irqchip_send_sgi(unsigned int cpu_id, u16 sgi_id)
+void irqchip_send_sgi(unsigned int cpu_id, u16 sgi_id)
 {
 	struct sgi sgi;

@@ -312,7 +312,7 @@ int irqchip_send_sgi(unsigned int cpu_id, u16 sgi_id)
 	sgi.cluster_id = irqchip_get_cluster_target(cpu_id);
 	sgi.routing_mode = 0;
 	sgi.id = sgi_id;
-	return irqchip.send_sgi(&sgi);
+	irqchip.send_sgi(&sgi);
 }

 int irqchip_cpu_init(struct per_cpu *cpu_data)
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/42f0f9dfff8dd09c5fa200495110c7093b9c8dfb.1601360827.git.jan.kiszka%40web.de.
