Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQUCXDVQKGQET7JVKFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C4A60F4
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:31 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id c11sf3881883wml.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490371; cv=pass;
        d=google.com; s=arc-20160816;
        b=u9fkgI0DG8HjrLy2S2duilxNEceqA52clZNXwDKAT36Y72qpA/tDe2RyauBud10YQ4
         OgkDMUnTaSxIXqp3HVHZFIoV8LPk0j6to0XQF7eFR7TwD6kOCzhGKZKBiaPCyf5oqnd8
         qIGhCcUsn+Xh3c2lFMI1A3Z0a0Ty8aKqTaVqf1pAje56FhKWeIlGKePS5SoYSGHz6o60
         bysEv6ufJAIoNIT9804/zhLjoqO/FdJJYXvw3D+7+OOGSFI72hwe6MSJe4EXnsrB45GA
         u4e92/E1Ht4/2RXVVA9Kh4uUpbc2P0y+phJH/rdWzHhJr76LxcPW08K6AOUepiPAAgz+
         ldWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=p/rPjoKAyCpCWNuL25TpMkcmwKW+XFUeFLULq7ewn/0=;
        b=FtDgxnT6EI2RgAgUJ16E0zFYmaIN76gG8VUjWMVgJDebqNJFcJkHkYZG8T86Ff+HP/
         eU0veKDyHjsvqO5++I1qi8tqkDaM+6VFLRcNiFMd9Ey0h6RBFHXihEftUGI9e0hv4/k+
         5f9gLs+MG2Fps2gEYEn2+LZWi/wjmSboB39oNZc70zZlexwtJn79Cy88EiR6WS7L3B6a
         lFjdufDAW0BeQo2hisCKcboL72yXkEEi+HNbmQbovgWnCQTvYqBjCLHvmxlqYY4BOaq4
         CU8O+Aw4036b8B/KhyrDPIgw0KW8eLKwoAGcjmBsJgpHDd9PQ7sNM1bdWaH1PevNP0qQ
         5Uwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=p/rPjoKAyCpCWNuL25TpMkcmwKW+XFUeFLULq7ewn/0=;
        b=PgB0xq9dkAerlZUi0mU4frsPG2rsyjsm4J8BlTyHwl62P5Vb5EmnTyOu4gj7lLhTwQ
         eZ40coCg8lsIX6k0InGRF78AsD7dyg4b121szDIoT3v9vfI9f4KVc7dR92NgQMtYR0ZC
         s+/NprkA1bIrApYZL+dgYxP8OYmIlZljfkmX67UHG184Cj1A3MVt6rFlWrieKy5Ad4Oh
         oWFLCwtykW7SQY992uUNlvHwLRZy8dHNWCUnADlF9BOCZgrXc7rjDgCVuZntX+AM5FQe
         f75H7IDwrkzwbISui00qKSC00zNw0aSOZHkz7LarZ5P5thiw76MMYUhN3MsI8lfhbS2H
         jNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=p/rPjoKAyCpCWNuL25TpMkcmwKW+XFUeFLULq7ewn/0=;
        b=UfORvv7ukQi/zlBPaSB3OIqBnLUCjDI/PZArfHh8qS45ozW6T1VaqlxVXHqhTDJMEp
         ZDBqDBo4J/6ug1bmVKAMDwpYyKQ1EvpRw5iMptC5iIilqkTldDKFz90p6GWNau6iTfK7
         9+MAaRAHfQo/C2egzwa+sdbBQdKxAQ2Xj6ln/cOssV3wHtMvyCiZUSCqC6da9XCTAcUw
         L7KpROztWuAR63ftzehBuicA+zGGg86DJfMnxy8lDDp2u+tB51KmoV2mdZzvVoof3Fd1
         ad7mZrU9BXIZQ94BKkPdz61Lkkj3UJ5BAP4ZblPJtGfGmbFdroXmqEumt+hHE/b6Uvqh
         4d9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUu6sRmLywXSY+iaeD+3uODOZreNB9JObji4VlxKPOwvZiS76Qk
	WxSXPCf36BoZwacsuutlW8E=
X-Google-Smtp-Source: APXvYqyonSsSYXnOjN8xHdW3Zd+NuyabVTjsl6ADaQtRbmA0cY1O9cvezIkTAk6UJP0EQxxZLZ2/eg==
X-Received: by 2002:a1c:7009:: with SMTP id l9mr40191574wmc.159.1567490370880;
        Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f3c4:: with SMTP id g4ls3989089wrp.4.gmail; Mon, 02 Sep
 2019 22:59:30 -0700 (PDT)
X-Received: by 2002:a5d:5387:: with SMTP id d7mr24295449wrv.312.1567490370155;
        Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490370; cv=none;
        d=google.com; s=arc-20160816;
        b=luyeSDeb/6V21VfBoG2NDONWB9xCqc24Grx1TI2W4prp61DsMXOu+hwMh7MzSjvlOw
         92RQ2QmXfNOuslXAjWaffgyoge+pTrcB9N9ygpIkVGJq1TKVLjz8qw7bl88GgVVpQ6AD
         5219rBLZCC8SQSG+WNADwOfoWQFygw5wZTzIH0xPZhR3icFDVyuvYQ/9dC0IwsFYxlsO
         caclPWfKRxbRC02X6BVt3oD7/dJjsDPf5YiG9IVdZLV3oLOtiHPjYFLkoZPgJ1YuRC9W
         hlWnXjPfTffp7AybA3toUr8+Auaoh+C3MVgWqFwYHyjhS/3oIJLKix+XyWTpWxixcLJ4
         aRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=4MQKAMBL3yQ/g+OlwDBooVI0NJczivzgHaYRddAt+vQ=;
        b=v1g2iMV5SDcL+6KoXULtCvEtZzU81qeIekgGdrYFDdxT/TWKTlPC3peTEZVVr/pwyb
         t6JXi0JxEK6yrntURfBVCylY+R0cQkIio81BxxuSeB2U6aSw1SLcatIA03AKIu7YIaWo
         VjyJ12kk49CwwhNvJyo9Sm5px9icRzmuPJQ53YfvRtJuL4R+2CVfzB9aol7Nq6govniy
         KqEpWUVztxZeES/4x9GnuqhqtkWx68ydqauo1wCGudtP7Pb6wUuvUTAqrEVFu6BA1flY
         uRmpbtION97nHV6Ft2X8oo8gvp81n2gNK5hBJQbWUA8bmcJ59yf0TqSgga/KI/E79jXJ
         A/Jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id g7si1521874wmk.0.2019.09.02.22.59.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xTgO029699
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:29 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkZ010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:29 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 12/13] u-boot-macchiatobin: Add build fix for mv-ddr-marvell
Date: Tue,  3 Sep 2019 07:59:24 +0200
Message-Id: <bff2837ee280adff24e3ee4f0d697430fa3c7ab9.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Required with upcoming gcc 8.3.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...ining-fix-gcc-warning-about-uninitialized.patch | 40 ++++++++++++++++++++++
 .../u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-bsp/u-boot/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch

diff --git a/recipes-bsp/u-boot/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch b/recipes-bsp/u-boot/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
new file mode 100644
index 0000000..9daa485
--- /dev/null
+++ b/recipes-bsp/u-boot/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
@@ -0,0 +1,40 @@
+From 1e4cd057a61000cf7d29f7047b68c2cade604465 Mon Sep 17 00:00:00 2001
+From: philhofer <phofer@umich.edu>
+Date: Mon, 1 Jul 2019 16:09:28 -0700
+Subject: [PATCH] mv_ddr4_training: fix gcc warning about uninitialized data
+
+ATF builds with -Wuninitialized -Werror, which causes a build
+failure with gcc 8.3.0 on line 455 of mv_ddr4_training_leveling.c
+
+Also, fix some nearby inconsistent indentation.
+
+Signed-off-by: philhofer <phofer@umich.edu>
+---
+ mv_ddr4_training_leveling.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mv_ddr4_training_leveling.c b/mv_ddr4_training_leveling.c
+index 144e21a..4c0c0ab 100644
+--- a/mv_ddr4_training_leveling.c
++++ b/mv_ddr4_training_leveling.c
+@@ -368,7 +368,7 @@ static int mv_ddr4_dynamic_pb_wl_supp(u32 dev_num, enum mv_wl_supp_mode ecc_mode
+ 	u32 subphy_num = ddr3_tip_dev_attr_get(dev_num, MV_ATTR_OCTET_PER_INTERFACE);
+ 	u8 compare_result = 0;
+ 	u32 orig_phase;
+-	u32 rd_data, wr_data;
++	u32 rd_data, wr_data = 0;
+ 	u32 flag, step;
+ 	struct mv_ddr_topology_map *tm = mv_ddr_topology_map_get();
+ 	u32 ecc_phy_access_id;
+@@ -450,7 +450,7 @@ static int mv_ddr4_dynamic_pb_wl_supp(u32 dev_num, enum mv_wl_supp_mode ecc_mode
+ 						if (orig_phase > 1)
+ 							wr_data = (rd_data & ~0x1c0) | ((orig_phase - 2) << 6);
+ 						else if (orig_phase == 1)
+-								wr_data = (rd_data & ~0x1df);
++							wr_data = (rd_data & ~0x1df);
+ 						if (orig_phase >= 1)
+ 							ddr3_tip_bus_write(dev_num, ACCESS_TYPE_UNICAST, if_id,
+ 									   ACCESS_TYPE_UNICAST, subphy_num,
+-- 
+2.16.4
+
diff --git a/recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb
index 37b41f9..81ac2d7 100644
--- a/recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb
+++ b/recipes-bsp/u-boot/u-boot-macchiatobin_2019.07-atf2.1.bb
@@ -19,6 +19,7 @@ SRC_URI += " \
     ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
     git://github.com/MarvellEmbeddedProcessors/mv-ddr-marvell;protocol=https;branch=mv_ddr-armada-atf-mainline;rev=${MV_DDR_REV};destsuffix=mv-ddr-marvell \
     git://github.com/MarvellEmbeddedProcessors/binaries-marvell;protocol=https;branch=${MV_BIN_BRANCH};rev=${MV_BIN_REV};destsuffix=binaries-marvell \
+    file://0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch;patchdir=${WORKDIR}/mv-ddr-marvell \
     file://macchiatobin-rules \
     "
 SRC_URI[u-boot.sha256sum] = "bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bff2837ee280adff24e3ee4f0d697430fa3c7ab9.1567490365.git.jan.kiszka%40siemens.com.
