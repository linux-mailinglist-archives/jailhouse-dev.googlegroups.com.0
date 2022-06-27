Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBA6242KQMGQE6LRRJYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B2355B9BB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:40 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id k32-20020a05600c1ca000b0039c4cf75023sf7289467wms.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335619; cv=pass;
        d=google.com; s=arc-20160816;
        b=f2GAh3KhZf9RQwlQeWdjmYyoctApyj+veqAECjfaS+aA2ASQTWW/PucUF9qPdbTBOA
         nCTzR3CJNX4v7VQ61owguhhSMALowaDkzQ4yMriz1bGBpifSMWcJL07iAV3sOsxJ6cbv
         So/DOqxU4L7YVEIZX9AkAe1+r9Iuv1TOPvtKjBJEy4FVCK19PGm/7GwTwSE64yROoLlX
         CsOedVe+MISrqXONY0pq32Fkvkvx9KSWLqSgRmvfIM5aumh+svno9iQF1+U+lUWv4kpV
         K/DPtHnX4LKg0ro5p1hSRzzugkHatjjG18FmeqjeUAyxqy0BrorcEkZVE4RTqZAEp0mD
         sm+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=BCEaBrx3Ud6IhDN2NEFzt/ddAOxmKKqW0I1sIj4An14=;
        b=FRJNn/6gZI3IiZP3ZUfTVqeGff9gxDrtfZzXGOLt2Y9vdXD66WE+sZED+wWPYreeQ4
         rqd9qXX7VcZkYX+kMxDeCfHlz+UGaZedl5wj5y3PsBK21yTCz2R8MpNJS8x5IRSLEjNG
         EmFxaiMyj7Cjg9W+PoI5MIwTx/57NsKlrR7DwtyUKy05CUk+CnXKkolQcPOlJrGYblDX
         P8Dyow41LwQmQIlPh0p8GBbhRPlldWf4dIesf0/sTN8CoqBSMOjU3FhIYEpyk9b/vWdE
         lfX9kha0CC4g41AUsk4tkrwCegWrOpJGY8Nj6DSZMfX281KmRWm2PIKIYm9Wl+9vnMxH
         FqQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=OobAPwAB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BCEaBrx3Ud6IhDN2NEFzt/ddAOxmKKqW0I1sIj4An14=;
        b=SnaG87SyTx8mwusbeGr41g5g0dsinkKKylRrwE26SgIU31WNUNwoxNiQqa12o3/5BS
         84hk/hsrS7zYUoNirUJzlfe5Ej3cZrLIrwkOkreYU5kjGT3tRSP4hotQzc0dWj3oCGgv
         blxis1keMe/LlK6S8nxBr+qEIo2wULoY527WvKvUFjS/3Uk5DayXqkOKkghVKS5d49fh
         K6og/9OnJN3BLcGmMt66JFLo+nsfowPX4jlaUOhdI4TYv3jEYROL52yjv00AA02u7tmo
         KHz9CjU412SH+Pdgr3hrlXcy5RFAGWVJ5LoBfBJZqkk86/nLHFNMEP89Vlsa86ShNQ4X
         bskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BCEaBrx3Ud6IhDN2NEFzt/ddAOxmKKqW0I1sIj4An14=;
        b=1yGGIHYhVZ0AYEOKbzYgeZPiWkuga3QNph+NNK9TzntmZ9cAZeAitLsFWlCOyTQaXs
         ePcjRCUGixtqT1PLFgM4CdD/UJ1wwSg6fKhegQ2lEMHoeW+bpPR8lI1GuWfgAcnqJVdF
         N8aPs+qwhzggcRpDpgGsaxbHy8XyAtI1XfdkhFJpNXjyZYZstkPyzL1+HfIZXY/Jo4oK
         gyhGRawugMsUSDAqWLrbzNh5akPdsU4l0bLo0SreMhTTnpjG6heTEKhiCp5bpqXd0OTA
         dSkEfVK0//ghkS0Z/0VuHA+o+0XquSRXHjG0GeZIyBdS2AE447ogZdsVI3yDdXLlV5RM
         P+yw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora//KESoGQtyI7WFeWVY/3cjeirFahg6qmWzAm1kIPbfvMNKQe0w
	f2Mvsz7qGr6hgH1kL6uPs6w=
X-Google-Smtp-Source: AGRyM1sf4r4CxpGoYFUntnCIRyGZEQRK5JxdgSDmPpGI/DKofWH9rh9iA9Ro4FG0/V8AJJiHGyX0ug==
X-Received: by 2002:adf:efc2:0:b0:21b:adf4:b4d4 with SMTP id i2-20020adfefc2000000b0021badf4b4d4mr12273333wrp.287.1656335619802;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6dab:0:b0:212:d9db:a98 with SMTP id u11-20020a5d6dab000000b00212d9db0a98ls26720243wrs.3.gmail;
 Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-Received: by 2002:a5d:6045:0:b0:21b:9397:41aa with SMTP id j5-20020a5d6045000000b0021b939741aamr12555341wrt.713.1656335618273;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335618; cv=none;
        d=google.com; s=arc-20160816;
        b=j3SkMXJQ7eOJ5l3DUjMsDAyDZTZfKw3tsEsjAUCF+3Vl3zsjzQe7ngkQXwV0DJ5j42
         U1DLmOqh5Lnw6ZxdE7dDkAziSRR++GfoYj4RZEH8GAWzZPJzp95GKbn6S2oyesswkSYv
         qcSq9TAm0H3a66FOA6NRyTKHP/DTE32MfM7EVpGhQxb14QHoXixcXf4qtshsuFUB1WqK
         pxF6wtTBHWJyvjDnZKI8krKuQjLPZ72JMzqtIlckM0DsBl1JfVYoyQZtNpSy5qkg1XQ4
         fmm97FH4hINF2aDaowUNWv145NXiiA9FSKBxN539Dulx7iqnTAksFPuy2Kjp7airO7Wk
         fjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5fVA2GJ6j2bqDgZFxMe/x9LeIiOPW1falvGFJ57Lnuk=;
        b=KtUugi5zAwkpD+Y2SIZi1Cr4MXDsWqAoolGJgBJyKoY/UQ5CUkgM5dwXzWkAD8npLl
         dHtaU36KRklBcS3JvSsFRcZBAUt07gMkQ+4VkoKgFY/DoZoZed4B9iHfWi0HxrepHzlR
         vVbGP1wKxed/HOkFf8fDqrmdWgZo+U+cBiuls6Loff5qiQYKEsDhugCqdfElLsYiIW3y
         aRZDV8yH3cc6WqFU4MsZ0IDrzH8SydZavIxghnVL632pkjVjVu2thnFaDk8lS7dALpIW
         3WP6V+5nOqvgMDxz/SYLZ5c3nWJTaUVZcIocxTHbwQvkK5Y5ciLsV7oGoAJuR71fyGDn
         nobg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=OobAPwAB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id w15-20020adff9cf000000b0021b95bcfb2asi409488wrr.0.2022.06.27.06.13.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp816wt8zxxQ;
	Mon, 27 Jun 2022 15:13:37 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:37 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 12/20] core: Change CPU configuration to an array of structures
Date: Mon, 27 Jun 2022 15:13:21 +0200
Message-ID: <20220627131329.3659-13-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=OobAPwAB;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Switch from a bitmap-based way to an array of structures for describing
cell CPUs. This has the advantage that we can decouple Jailhouse from
CPU enumeration of Linux and pass the physical CPUs to the hypervisor.
Furthermore, the structure can be extended later on to associate
configuration information such as cache partitions with a specific CPU.
To avoid breaking the config parser more than needed, 8 bytes are
already reserved in the new structure.

Note that this commit breaks the build in order to break-up the
upcoming changes into smaller logical pieces.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/cell-config.h | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6b54e34b..124373d5 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2016
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update formats and HEADER_REVISION in pyjailhouse/config_parser.py.
  */
-#define JAILHOUSE_CONFIG_REVISION	13
+#define JAILHOUSE_CONFIG_REVISION	14
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -89,7 +89,7 @@ struct jailhouse_cell_desc {
 	__u32 id; /* set by the driver */
 	__u32 flags;
 
-	__u32 cpu_set_size;
+	__u32 num_cpus;
 	__u32 num_memory_regions;
 	__u32 num_cache_regions;
 	__u32 num_irqchips;
@@ -106,6 +106,11 @@ struct jailhouse_cell_desc {
 	struct jailhouse_console console;
 } __attribute__((packed));
 
+struct jailhouse_cpu {
+	__u64 phys_id;
+	__u8 padding[8];
+} __attribute__((packed));
+
 #define JAILHOUSE_MEM_READ		0x0001
 #define JAILHOUSE_MEM_WRITE		0x0002
 #define JAILHOUSE_MEM_EXECUTE		0x0004
@@ -361,7 +366,7 @@ static inline __u32
 jailhouse_cell_config_size(struct jailhouse_cell_desc *cell)
 {
 	return sizeof(struct jailhouse_cell_desc) +
-		cell->cpu_set_size +
+		cell->num_cpus * sizeof(struct jailhouse_cpu) +
 		cell->num_memory_regions * sizeof(struct jailhouse_memory) +
 		cell->num_cache_regions * sizeof(struct jailhouse_cache) +
 		cell->num_irqchips * sizeof(struct jailhouse_irqchip) +
@@ -378,10 +383,10 @@ jailhouse_system_config_size(struct jailhouse_system *system)
 		jailhouse_cell_config_size(&system->root_cell);
 }
 
-static inline const unsigned long *
-jailhouse_cell_cpu_set(const struct jailhouse_cell_desc *cell)
+static inline const struct jailhouse_cpu *
+jailhouse_cell_cpus(const struct jailhouse_cell_desc *cell)
 {
-	return (const unsigned long *)((const void *)cell +
+	return (const struct jailhouse_cpu *)((const void *)cell +
 		sizeof(struct jailhouse_cell_desc));
 }
 
@@ -389,7 +394,8 @@ static inline const struct jailhouse_memory *
 jailhouse_cell_mem_regions(const struct jailhouse_cell_desc *cell)
 {
 	return (const struct jailhouse_memory *)
-		((void *)jailhouse_cell_cpu_set(cell) + cell->cpu_set_size);
+		((void *)jailhouse_cell_cpus(cell) +
+		 cell->num_cpus * sizeof(struct jailhouse_cpu));
 }
 
 static inline const struct jailhouse_cache *
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-13-ralf.ramsauer%40oth-regensburg.de.
