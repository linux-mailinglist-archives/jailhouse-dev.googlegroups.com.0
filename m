Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBMPGXKAAMGQE23JZAMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DAD30249B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:53 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id k14sf1056973lfg.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576113; cv=pass;
        d=google.com; s=arc-20160816;
        b=OuxpX3cRYjVlZyMZ2Q5ZLl/DuyHBhLP43AlPkaUJdeg7tuaNVbNA1LyVHd8Cx/ctxV
         FxWbhie+TR2sxW5tXIi0EKrcmlO1wqVfudCAHj9Dj/7/pdxHKzlAw5CXTrwhd1AFm0Z4
         z/GPPitvNn0EQV4pkSHvKIbWOue7to2N61UiwRQOwD0OHvLm0eKllHjxeQihSj99Xozb
         GfJ+ozLrETgA+NOh7h9OSuK2Hfug/EFOFRsLu5oigRQ+vH9lXHMUcaxunTq51LND2DDt
         qZ0egPTGG1qbxAe3vnMguq0efhBMvWGUuofLKZq46/gSO+gOpe7TFTkZx9ctQA335rKg
         jrvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=POrYttoShPGSOUX+/wj2JphQ4rEysunFsRTE+B33yRQ=;
        b=1IXb//ipYCfwFQIQswARSwpcbpbwMnHE7F0wvUtApWLXFS2MC3ftaVrAPrGk0F3Kzb
         iD5jPkMOMf9X71QKvfKka7G/CU2P0yXPvi0/UuJJTHpQivdOAq+AdamIWt009HiVCRGj
         gvQDniHBc5x0HZqHSNsE7EwqOw9ZSInQH0PwSX7bwEAG6sYIDN7rT8lFmxCLSt6ofjkI
         6wUUDNz5Hwx/5tqtnA11LQTrK0nVdRxSvpDGQ5Upk50/Pozo9myTigBKA41c6XQICSGC
         nUEX7iDta2vfbtlA7I04bQMzEzwA1Bd/xbN9ygaTnj6UuopsYv9W1Pn5sOdoydJAyH/3
         iS6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=eCw3bczu;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=POrYttoShPGSOUX+/wj2JphQ4rEysunFsRTE+B33yRQ=;
        b=G5A8qnokTMinWQ63uBOiICtPmtQQZVcaphvY3qdDMTuptSnoqogZ1gMq9g+ly6ulnX
         KxRhRg1x5qehsPAIGEEaIdmw4K132YlER+LPLycJ7rd50g6QVyTSoD4cnvx5jpTcKCud
         Cxrn+T7cB2kQOZQqOabqxwGh/6mwruO/AAqi8JHSDA2edew3TBlOOiWRr1mPC6+r+SX+
         /q4/2O6U4+TLfx+m3ECd9vZ0hhwxS22XTV/2OGJ4e6h8po87gdpqGLT6nAHNWt4kDjuA
         YtFyNSunqyguPX+/ZIApQx/WU3p62HnuP8hnofJlDKJQygV5cjjqTm7al0xxSot5UtLB
         2LyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=POrYttoShPGSOUX+/wj2JphQ4rEysunFsRTE+B33yRQ=;
        b=do6kDzc0Lpz3H74o6ZnXU3NCiViJWh+0uekTXHOy5xBbnFqvfsxUHHDrsGxGT325AV
         onoDSP2kZrOjlvI9f4egzrN1txPj665oiHT3jBSlqnHzmqWlS70bC+/bV4dmPYjA4q7o
         TxaI9XTshUOUGsJFhEosPCIRUSGPk7dM5nATYiaQw2j89EXqFM9+NLBT0JELjqfh8goI
         SlJyyZtnpIKOqT8PxE7TMDyDk4BNpnARtaYgUNdtnsq0f6J7pWi0XVSdnpDeosM7jzC/
         gr4kPtp02TDH2cn+BiwfMHJHe3tnQZmrX0z9mBocQbKhqUyKM7nFac7jngNF2wW2Kj9N
         zypQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533VpDPE2iZscg0qq2MZQTTBU2GV2xaIxWHsw+fYBhCo8da0yL+s
	Q1QjHan5pUkY1QYzpOF3Ze4=
X-Google-Smtp-Source: ABdhPJw9qsaKUZtDKpaQELmTtIsFjfFOb0qX9zORz6ttG2yVVuisYLUNNETPKYGNOHueGt+xwfvWzg==
X-Received: by 2002:ac2:5fc2:: with SMTP id q2mr123735lfg.338.1611576113341;
        Mon, 25 Jan 2021 04:01:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3614:: with SMTP id d20ls2361536lja.6.gmail; Mon, 25 Jan
 2021 04:01:52 -0800 (PST)
X-Received: by 2002:a2e:9943:: with SMTP id r3mr31345ljj.392.1611576112352;
        Mon, 25 Jan 2021 04:01:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576112; cv=none;
        d=google.com; s=arc-20160816;
        b=QfV7zDdze2vNBGXVxNqxlJt+qwjtnZAC9ajcSDsFOsBs0vlGQq14WYm86WnpFrCg9/
         qsyx2T/DmGhGtU7Yt831ue/9oPRbUZ83dLAyGlsuhXAB+B+fVtFUrOOtwDDl0UpCQT5i
         leWbeNM0mgth0h3dXjy4hsQrvyIWWeIkBHEST7B6vqGTXc9bvK6q9M8AsQP91INNK7fG
         NgazGW0GED9KgI2dbcb39gaRDTa0S6q15iXI8oJp6REtSMWLgS/EmlWrh80UrrZBaDQf
         zMGRk0UC3pVCOAe6AijwD/xvb60cR4Gpf+tBRKRRp0dW/znxvY7aKETWP1gWuWHL2PXw
         z1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q3C3habLWaRrayB4+3J4irSZjW4fXMaojIPOSDq/lfs=;
        b=adF39+azLlqz85SpOqwaNMyiqEevKD4JSgV8WcFIwnoVbrxfE4fKS1XJ6k5L1xvwMF
         ZakA3avv9dR/Lyuf70hpx475AVKrLcMw9MUB0J9kSpvToNHeJSXMl+0cNWATF7mB5M/1
         4pDFGhVESNwZixlC0RRRJDhzIlz4RJLWh0zWG9gViJKhcq7/mVQHoxtICOLddreOugjN
         BkRxojEoNQfKcD3byklpgtsIHWSVOtiRxcSCUtIvf9dOzqZ2EGL4eeknm2vYwWSRV2GH
         2om1aQQkePiN/pm0mskGopMPebnpMvGTfr8YVMxyGr3uY7w/MaGsEOxV03/xDfy+n695
         jb9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=eCw3bczu;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id a28si300107lfo.12.2021.01.25.04.01.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:52 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DPT4H61x1z1084;
	Mon, 25 Jan 2021 13:01:51 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id owwYXjI9NpMI; Mon, 25 Jan 2021 13:01:51 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4H0W0zzyjM;
	Mon, 25 Jan 2021 13:01:51 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 19/23] config: always rely on the availability of way_size
Date: Mon, 25 Jan 2021 13:00:40 +0100
Message-Id: <20210125120044.56794-20-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=eCw3bczu;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Remove the debug cache_layout autodetection, which could be moved into
the driver.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/arm64/qemu-arm64.c                    |   4 +-
 configs/arm64/zynqmp-zcu102.c                 |   4 +-
 hypervisor/arch/arm64/Kbuild                  |   4 -
 hypervisor/arch/arm64/cache_layout.c          | 148 ------------------
 .../arch/arm64/include/asm/cache_layout.h     |  21 ---
 hypervisor/arch/arm64/include/asm/coloring.h  |   8 -
 6 files changed, 2 insertions(+), 187 deletions(-)
 delete mode 100644 hypervisor/arch/arm64/cache_layout.c
 delete mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.h

diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index f064c1b0..ff4bcb25 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -45,9 +45,7 @@ struct {
 			.pci_is_virtual =3D 1,
 			.pci_domain =3D 1,
 			.color =3D {
-				/* in debug mode, the way_size is autodetected
-				 * if it is not specified */
-				/* .way_size =3D 0x20000, */
+				.way_size =3D 0x20000,
 				.root_map_offset =3D 0x0C000000000,
 			},
 			.arm =3D {
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index cdff3ef2..0d721e63 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -46,9 +46,7 @@ struct {
 			.pci_is_virtual =3D 1,
 			.pci_domain =3D -1,
 			.color =3D {
-				/* in debug mode, the way_size is autodetected
-				 * if it is not specified */
-				/* .way_size =3D 0x10000, */
+				.way_size =3D 0x10000,
 				.root_map_offset =3D 0x0C000000000,
 			},
 			.iommu_units =3D {
diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index c0705f12..a5525811 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -24,7 +24,3 @@ lib-y +=3D entry.o setup.o control.o mmio.o paging.o cach=
es.o traps.o
 lib-y +=3D iommu.o smmu-v3.o ti-pvu.o
 lib-y +=3D smmu.o
 lib-y +=3D coloring.o
-
-ifdef CONFIG_DEBUG
-lib-y +=3D cache_layout.o
-endif
diff --git a/hypervisor/arch/arm64/cache_layout.c b/hypervisor/arch/arm64/c=
ache_layout.c
deleted file mode 100644
index 0f28a440..00000000
--- a/hypervisor/arch/arm64/cache_layout.c
+++ /dev/null
@@ -1,148 +0,0 @@
-/*
- * Jailhouse Cache Coloring Support
- *
- * Copyright (C) Universit=C3=A0 di Modena e Reggio Emilia, 2018
- * Copyright (C) Boston University, 2020
- * Copyright (C) Technical University of Munich, 2020
- *
- * Authors:
- *  Luca Miccio <lucmiccio@gmail.com>
- *  Renato Mancuso (BU) <rmancuso@bu.edu>
- *  Andrea Bastoni <andrea.bastoni@tum.de>
- *
- * Autodetection of the cache geometry.
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
- * COPYING file in the top-level directory.
- */
-
-#include <jailhouse/printk.h>
-#include <jailhouse/utils.h>
-#include <jailhouse/paging.h>
-#include <asm/cache_layout.h>
-#include <asm/sysregs.h>
-
-#define verb_print(fmt, ...)			\
-	printk("[COL] " fmt, ##__VA_ARGS__)
-
-#define MAX_CACHE_LEVEL		7
-
-#define CLIDR_CTYPE(reg, n)	GET_FIELD((reg), 3*(n)+2, 3*(n))
-#define CLIDR_ICB(reg)		GET_FIELD((reg), 32, 30)
-
-enum clidr_ctype {
-	CLIDR_CTYPE_NOCACHE,
-	CLIDR_CTYPE_IONLY,
-	CLIDR_CTYPE_DONLY,
-	CLIDR_CTYPE_IDSPLIT,
-	CLIDR_CTYPE_UNIFIED,
-};
-
-#define CSSELR_LEVEL(reg)	SET_FIELD((reg), 3, 1)
-#define CSSELR_IND		0x1
-
-/* Assume ARM v8.0, v8.1, v8.2 */
-#define CCSIDR_LINE_SIZE(reg)	GET_FIELD((reg), 2, 0)
-#define CCSIDR_ASSOC(reg)	GET_FIELD((reg), 12, 3)
-#define CCSIDR_NUM_SETS(reg)	GET_FIELD((reg), 27, 13)
-
-const char * cache_types[] =3D {"Not present", "Instr. Only", "Data Only",=
 "I+D Split", "Unified"};
-
-typedef struct cache {
-	/* Total size of the cache in bytes */
-	u64 size;
-	/* Size of a single way in bytes */
-	u64 line_size;
-	/* Size of each cache line in bytes */
-	u64 way_size;
-	/* Associativity */
-	u32 assoc;
-	/* Max number of colors supported by this cache */
-	u64 colors;
-	/* Which level is this cache at */
-	int level;
-} cache_t;
-
-/** Autodetect cache(s) geometry.
- *  Return the size of a way or 0 if no cache was detected.
- */
-u64 arm_cache_layout_detect(void)
-{
-	/* First, parse CLIDR_EL1 to understand how many levels are
-	 * present in the system. */
-	u64 reg, geom;
-	unsigned int max_cache_level;
-
-	unsigned int n;
-	cache_t cache;
-	u64 type, assoc, ls, sets;
-
-	arm_read_sysreg(clidr_el1, reg);
-
-	max_cache_level =3D CLIDR_ICB(reg);
-	if (max_cache_level =3D=3D 0) {
-		max_cache_level =3D MAX_CACHE_LEVEL;
-		verb_print("\tUsing default max cache levels\n");
-	}
-	verb_print("\tmax cache level =3D %u\n", max_cache_level);
-
-	cache.way_size =3D 0;
-	cache.level =3D -1;
-
-	for (n =3D 0; n < max_cache_level; ++n) {
-		type =3D CLIDR_CTYPE(reg, n);
-		verb_print("\tL%d Cache Type: %s\n", n + 1, cache_types[type]);
-
-		if (type =3D=3D CLIDR_CTYPE_NOCACHE)
-			continue;
-
-		/* Fetch additional info about this cache level */
-		arm_write_sysreg(csselr_el1, CSSELR_LEVEL(n));
-		arm_read_sysreg(ccsidr_el1, geom);
-
-		/* Parse info about this level */
-		ls =3D 1 << (4 + CCSIDR_LINE_SIZE(geom));
-		assoc =3D CCSIDR_ASSOC(geom) + 1;
-		sets =3D CCSIDR_NUM_SETS(geom) + 1;
-
-		verb_print("\t\tTotal size: %lld\n", ls * assoc * sets);
-		verb_print("\t\tLine size: %lld\n", ls);
-		verb_print("\t\tAssoc.: %lld\n", assoc);
-		verb_print("\t\tNum. sets: %lld\n", sets);
-
-		if (type =3D=3D CLIDR_CTYPE_IDSPLIT) {
-			arm_write_sysreg(csselr_el1, (CSSELR_LEVEL(n) | CSSELR_IND));
-			arm_read_sysreg(ccsidr_el1, geom);
-
-			ls =3D 1 << (4 + CCSIDR_LINE_SIZE(geom));
-			assoc =3D CCSIDR_ASSOC(geom) + 1;
-			sets =3D CCSIDR_NUM_SETS(geom) + 1;
-
-			verb_print("\t\tTotal size (I): %lld\n", ls * assoc * sets);
-			verb_print("\t\tLine size (I): %lld\n", ls);
-			verb_print("\t\tAssoc. (I): %lld\n", assoc);
-			verb_print("\t\tNum. sets (I): %lld\n", sets);
-
-		}
-
-		/* Perform coloring at the last unified cache level */
-		if (type =3D=3D CLIDR_CTYPE_UNIFIED) {
-			cache.level =3D n + 1;
-
-			cache.size =3D ls * assoc * sets;
-			cache.line_size =3D ls;
-			cache.way_size =3D ls * sets;
-			cache.assoc =3D assoc;
-			cache.colors =3D sets / (PAGE_SIZE / ls);
-
-			/* Compute the max. number of colors */
-			verb_print("\t\tNum. colors: %lld\n", cache.colors);
-		}
-
-	}
-
-	verb_print("\tNOTE: L%d Cache selected for coloring.\n", cache.level);
-
-	return cache.way_size;
-}
-
diff --git a/hypervisor/arch/arm64/include/asm/cache_layout.h b/hypervisor/=
arch/arm64/include/asm/cache_layout.h
deleted file mode 100644
index aad4339d..00000000
--- a/hypervisor/arch/arm64/include/asm/cache_layout.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * Jailhouse Cache Coloring Support
- *
- * Copyright (C) Universit=C3=A0 di Modena e Reggio Emilia, 2018
- * Copyright (C) Boston University, 2020
- * Copyright (C) Technical University of Munich, 2020
- *
- * Authors:
- *  Luca Miccio <lucmiccio@gmail.com>
- *  Renato Mancuso (BU) <rmancuso@bu.edu>
- *  Andrea Bastoni <andrea.bastoni@tum.de>
- *
- * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
- * COPYING file in the top-level directory.
- */
-#ifdef CONFIG_DEBUG
-/** Autodetect cache(s) geometry.
- *  Return the size of a way or 0 if no cache was detected.
- */
-extern u64 arm_cache_layout_detect(void);
-#endif
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch=
/arm64/include/asm/coloring.h
index b2911a4b..9cb50889 100644
--- a/hypervisor/arch/arm64/include/asm/coloring.h
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -22,7 +22,6 @@
 #include <jailhouse/control.h>
 #include <jailhouse/assert.h>
 #include <jailhouse/panic.h>
-#include <asm/cache_layout.h>
=20
 #ifdef CONFIG_DEBUG
 #define col_print(fmt, ...)			\
@@ -73,13 +72,6 @@ static inline void arm_color_dcache_flush_memory_region(
 static inline void arm_color_init(void)
 {
 	coloring_way_size =3D system_config->platform_info.color.way_size;
-#ifdef CONFIG_DEBUG
-	if (coloring_way_size =3D=3D 0) {
-		coloring_way_size =3D arm_cache_layout_detect();
-	}
-#endif
-	coloring_root_map_offset =3D
-		system_config->platform_info.color.root_map_offset;
=20
 	printk("Init Coloring: Way size: 0x%llx, TMP load addr: 0x%llx\n",
 	       coloring_way_size, coloring_root_map_offset);
--=20
2.29.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210125120044.56794-20-andrea.bastoni%40tum.de.
