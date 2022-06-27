Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBLXB42KQMGQEWOHLNFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2989355B9E7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id l17-20020a05600c4f1100b0039c860db521sf5607697wmq.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336559; cv=pass;
        d=google.com; s=arc-20160816;
        b=e5zpChxLsoKoVdVGtGebmLxoF4aUtd9ppW5B+tYBD67N2Q/NTjKOdt2mTU6HyIKKxN
         MjBK6LLOQvQo294AXtzSEAKb6Skdh9p7ncpIu5DAwg82WY8WDMpSWIeR+W7gD2SEY+Ev
         lMjunxOo6hUZv9gUg9rgPGEv3BDDjwMQ62UAlCB84//awpEmFNTFWsKJZo7FvPlJkYkt
         0GNbAdZXXUO/Xz8AQCv1dHDMp4iqDmd7o7i7osfwR+wRTYd/8ZzFaaPsB22Wcz58LJdQ
         4INA76PkSGvbHn6JtLNUNQdIcdjOmxST9vaHUom17ZBzPM4Gis2PRm4zOPHcxCYM+sXB
         V/4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=rxbiEc42OU/VXcW0H7YSytb7txUB9h8yj+RJaVaMtWs=;
        b=vvuXz22cAzhgOTz2is0VRRRj0x55Mu6J77JwjGvFDGhz+Ov7NUjTiwQ26u6DqAsUku
         HihUvUmK86Vj36WMhAiDuFRDwPtU+NN8ZNU4R0OYRojMSvb7grPGSZb8nY1oBTRLH3bL
         KN8u4G2anfgi0/fNk19eG4xszUTSqqmJ/+k9cdUt3xR8oCe6EEWZQ952ewZ7JtJ7c2hE
         MoLDzouDNji1N+rrVKNxdQoJYh+Eqsnn43Bg0aa5tu5OU8R6B8jP3+bZ3nUYI2zHZZ7v
         7xydVsNrB6ZbvP41Wrt671hEtwN6TWofZFWs9t0Zddqvshr2cEWgTVOG7V72fAOW4Ca6
         LPlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QUS9LxIz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rxbiEc42OU/VXcW0H7YSytb7txUB9h8yj+RJaVaMtWs=;
        b=oAzRIL+y70K5bVS1sB6auS14RXqrkhhxodC+AbX4HzSNeoP0JgFMrJ657Ypy/rFKEE
         FTIY4+zef/nGOKVmf4p65TuZZW/VUf2EJn5jOhNJkMf4pX0gUI17kDk2ems0jY+JxmqV
         oPw8rg9zmIVijW1e0HGneweUSyxmJHgKpcEtLSQo2oGXSDjyVCVp5ZBNF80rFCmprMzH
         ZzCffOhqrVCN6NrYRSvhNxpbSmyU0OjrY+eX4JqmX+GETKokew5dNLr5B5TbhevdSgEH
         2bPpCl233KDjYZyjRRSbo3lD53Zuy/2m5CoPNwwNgJ8lU/TIX5Nz1FySThk0TePr1IPq
         Oi+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rxbiEc42OU/VXcW0H7YSytb7txUB9h8yj+RJaVaMtWs=;
        b=hjCBkhdeQh9F4sjtLNv6rYeBu2KRGLD/g+xkdNiirpfe0CVGpjaBPosyfsqu2Q1mlw
         i2MHkQKoC1aZEIVDQlGi3uFJoAQNzMhXaP7xBlEdHQxARb7zdlgZovwMLqQHoJp83UC0
         FUr0IGy5eS8nge7WYPgYHse4whoHTf4HmF3PZjR614mrw5YRLWBVphhj9iZ3cErW7fZg
         pmGMUWMgOSwXddi75+hSuIaui8sF4H0W0ZetuhdY+F/zB7NXQlX5u/9CoPgH2sCJ7wGs
         KsbLZcp4X4Hfi5gzmByggZcXbVPSl4jvjt/q6ZFYxwSMJtcuuwQHLz1kCJ/OLMtPCUXe
         75rw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/soXb1QRTZyu+FecdSVoR7L10kzC2+Ya4fQNziFu9U9yiD3qOe
	kj2ajhqMkumM5oNooJDqHFA=
X-Google-Smtp-Source: AGRyM1te6Wd32Ba5wvR70+4M7wXF/9sJ+5VxsP+Ir1ihpR4wvNq2/gX29WbbRk6M/dANyQrTqTdDhg==
X-Received: by 2002:a5d:51d2:0:b0:21b:bd52:c9c9 with SMTP id n18-20020a5d51d2000000b0021bbd52c9c9mr11803759wrv.498.1656336558697;
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5848:0:b0:219:b7ea:18e1 with SMTP id i8-20020a5d5848000000b00219b7ea18e1ls26793104wrf.2.gmail;
 Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
X-Received: by 2002:adf:d1ea:0:b0:21b:a6cb:fcf6 with SMTP id g10-20020adfd1ea000000b0021ba6cbfcf6mr12245776wrd.477.1656336557240;
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336557; cv=none;
        d=google.com; s=arc-20160816;
        b=Ue6ynyYISo+DVxUJO2nJNTVPF1phvsLCnFuayVz+6GoLHVV8G1keKH7WMGilKJHzIJ
         H5v7eoNzFzGYjb+qX/S+lwB9U4IO7nDBxKFPj8uoIPtB/9hJS2uhTB1nDRFJAeFSC7YI
         87657CyUaMxoXUWT71rPBIyyJaBaVy7inKkIbATtS6JvBePLEpvKlYjovt+41RpYrwUJ
         oL+AghdiuJ7facs3ukZ2e143qEiiLJH47/s2U3tA43SXwg+KmDGU7kxslBifCEnuXxJD
         FcKFYBV8g34lCkZexSVeQhl1fRwjssrxieXo9KoKLqAn2IFsNnxEGc+iP8l98wRn105E
         sgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5ejG8QMg1sse+taGNFojCa8PJEXGhKoA3wQCfktgXcc=;
        b=HexkhCj2LkfLoJ8dnwT3zGXsWMGTz4JfHhrUkN+RcH3mXiPRYXhgkOkWOpK5MrP8Gp
         +oSpuqQM66WrLfZNMZK2K3tGbQHUfr3M4/i117tsD9JbnWL8mijIerIBYUNNtTGeONAq
         6d0wLBCz8wVyU/VnMY1f3yzzOvvgzjWhgMXk+J4DadBUlVaOOIYyCR7bqoofVIimH8iT
         52KtapJI5eu/i4vxamorm2Yv18QSruVIOAeREDmx8IPzGt9dUapeXLwRoKJ5uCO9fm7I
         rem6k7OWT8UoO2pNKM40iJ/6ykpXsNffyhxT+UwQk6S/wQAL5E+QLQiHRlnMc9SRMspm
         nvUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QUS9LxIz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id n42-20020a05600c3baa00b0039c948d7614si505772wms.3.2022.06.27.06.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV4719gzxxR;
	Mon, 27 Jun 2022 15:29:16 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:16 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 02/42] driver: sysfs: prepare for exit accounting on RISC-V
Date: Mon, 27 Jun 2022 15:28:25 +0200
Message-ID: <20220627132905.4338-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QUS9LxIz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Besides generic traps, we will have a bunch of RISC-V specific traps:

Platform handling:
 - VMEXITS_SBI: Calls from the guest (VS-Mode) to the SBI firmware

IRQ handling:
 - VMEXITS_TIMER: Timers will arrive in S-Mode
 - VMEXITS_IPI: IPIs arrive in S-Mode
 - VMEXITS_VIRQ: external IRQs arrive in S-Mode

Generally, using a simple PLIC, all IRQs will arrive in S-Mode.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/sysfs.c                               | 15 +++++++++++++++
 include/arch/riscv/asm/jailhouse_hypercall.h |  7 ++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/driver/sysfs.c b/driver/sysfs.c
index 61b851cc..5ea1a8b0 100644
--- a/driver/sysfs.c
+++ b/driver/sysfs.c
@@ -163,6 +163,11 @@ JAILHOUSE_CPU_STATS_ATTR(vmexits_smccc, JAILHOUSE_CPU_STAT_VMEXITS_SMCCC);
 #ifdef CONFIG_ARM
 JAILHOUSE_CPU_STATS_ATTR(vmexits_cp15, JAILHOUSE_CPU_STAT_VMEXITS_CP15);
 #endif
+#elif CONFIG_RISCV
+JAILHOUSE_CPU_STATS_ATTR(vmexits_sbi, JAILHOUSE_CPU_STAT_VMEXITS_SBI);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_timer, JAILHOUSE_CPU_STAT_VMEXITS_TIMER);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_ipi, JAILHOUSE_CPU_STAT_VMEXITS_IPI);
+JAILHOUSE_CPU_STATS_ATTR(vmexits_virq, JAILHOUSE_CPU_STAT_VMEXITS_VIRQ);
 #endif
 
 static struct attribute *cell_stats_attrs[] = {
@@ -188,6 +193,11 @@ static struct attribute *cell_stats_attrs[] = {
 #ifdef CONFIG_ARM
 	&vmexits_cp15_cell_attr.kattr.attr,
 #endif
+#elif CONFIG_RISCV
+	&vmexits_sbi_cell_attr.kattr.attr,
+	&vmexits_timer_cell_attr.kattr.attr,
+	&vmexits_ipi_cell_attr.kattr.attr,
+	&vmexits_virq_cell_attr.kattr.attr,
 #endif
 	NULL
 };
@@ -221,6 +231,11 @@ static struct attribute *cpu_stats_attrs[] = {
 #ifdef CONFIG_ARM
 	&vmexits_cp15_cpu_attr.kattr.attr,
 #endif
+#elif CONFIG_RISCV
+	&vmexits_sbi_cpu_attr.kattr.attr,
+	&vmexits_timer_cpu_attr.kattr.attr,
+	&vmexits_ipi_cpu_attr.kattr.attr,
+	&vmexits_virq_cpu_attr.kattr.attr,
 #endif
 	NULL
 };
diff --git a/include/arch/riscv/asm/jailhouse_hypercall.h b/include/arch/riscv/asm/jailhouse_hypercall.h
index 7d54047c..1a76ba2b 100644
--- a/include/arch/riscv/asm/jailhouse_hypercall.h
+++ b/include/arch/riscv/asm/jailhouse_hypercall.h
@@ -36,7 +36,12 @@
  * THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-#define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS
+/* CPU statistics, RISC-V-specific part */
+#define JAILHOUSE_CPU_STAT_VMEXITS_SBI		JAILHOUSE_GENERIC_CPU_STATS
+#define JAILHOUSE_CPU_STAT_VMEXITS_TIMER	JAILHOUSE_GENERIC_CPU_STATS + 1
+#define JAILHOUSE_CPU_STAT_VMEXITS_IPI		JAILHOUSE_GENERIC_CPU_STATS + 2
+#define JAILHOUSE_CPU_STAT_VMEXITS_VIRQ		JAILHOUSE_GENERIC_CPU_STATS + 3
+#define JAILHOUSE_NUM_CPU_STATS			JAILHOUSE_GENERIC_CPU_STATS + 4
 
 #ifndef __ASSEMBLY__
 
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-3-ralf.ramsauer%40oth-regensburg.de.
