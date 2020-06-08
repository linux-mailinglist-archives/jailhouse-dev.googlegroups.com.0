Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBDNJ7D3AKGQELIR45FQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83f.google.com (mail-qt1-x83f.google.com [IPv6:2607:f8b0:4864:20::83f])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E31F16C9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:35:58 +0200 (CEST)
Received: by mail-qt1-x83f.google.com with SMTP id w14sf15021572qtv.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:35:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612557; cv=pass;
        d=google.com; s=arc-20160816;
        b=FqNOfMHt7aJI9XgzOY2ie2UtchUuECBjTZvIjtI9h8kezz5hAkMSYl0a93RF21zH1L
         iMT0d1/N4DGNvPRIHutrH9XOPQvNsoJM8EJXCHvmOpw8V2oFqhxLJ/PCbDJFy/lAavQG
         WPKAVwRvwluat5uXlsQb23CTSKlV068H+28t46H0X1QtB/L7AJmDtZ/Ef/Ok0bLe1ZLu
         O6hzP42jUxNvVVRFsMfS5VeLK1zOlrTlMvktiiXuL9j6qalUj0BsmiF3layU0a35soBf
         Yxqz8aPi8F8kJZeNYwO6x7pDLL0kWp4sknYeXd4qeCgpZs4GdfnmJO3EgZzRgLAJV+/l
         APfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zNbQZnOnglI2lRXCWtI12Iet97K4oG8ljZ9FUsooygA=;
        b=NHRTf42tSPMW+EzhOmqNmmVICOYisnlWikhnyT1Z6qvdVoxqOfz/mwnF/ML+CE3D9S
         7SugnMV9JZvgFdUEkjLOzsDyKQAtFEgB6a0uRy8lo3+vutFryK+Zt46aMXnSF55wl/ee
         Iou7puOImL9KVNA5nvF9WyZPJVuEq7LVCUe7d3hykqXEhMGgIQoSXSeQPleMTUsRuu3L
         E5nRgkrCHCx3x8PsHhz8Iwnc83oKuelN99Cd/21tVtLaNt6ziryTHmMlapaG2RcRCoJ+
         oBYkF/ef+uPVl8Ju77C/wc9bVXiiu77U6ufijC7XhP0CbsQkQYVL1uGnoOriO87L2IUa
         1slg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=evXFLv1J;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zNbQZnOnglI2lRXCWtI12Iet97K4oG8ljZ9FUsooygA=;
        b=JeV+/RPXSqyt6IjsZMBCV2kAHUChY5gNM7Q3ChK/4pfOxJqMXtRpMFVlyuwntCfjtd
         QwGVZFOwwojN+mCuGuTe5Z9lgWRUQ3ywzjxiEQUFkju4S545ayFES4mhiMVZW4j25m5G
         LvQX4mB7B6Wbb178Ec/0qoNINgbcQQgwKwSDioFGe5MuXmTjmzTf1Za+obta8tWKeJRb
         z3Atz3bPwl4tGzPLt8QO28I09EEQs632nBwjLOJga6CG4ZOe9khtJgikXxSCEKOc7UOH
         OOnpnW3IwNOg4JpDz1h/ImYzYcLseAB0K8aapddvuJXoILOvYBUCbCly5cXFlxox9UTQ
         DFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zNbQZnOnglI2lRXCWtI12Iet97K4oG8ljZ9FUsooygA=;
        b=Oy+42QbtABsUnsn1fBWR+73ZVzYju1DDbXKamin9iyoF2Hp9O9ibIjD2sxl1p0XUGo
         t9/nTZadUMQilTISkLbY1AU2b7gbR3S1MeozFMz1W+Nz8EQKiH9qlRR1imNLJxPJbwLb
         G+67VjogtSN0gFG0eBtHvS8scV5Au+rXpPJM7UOC3QkHNciqzcmVmuXtRUgbISFRoVye
         rCgWuR53sZqNiHsagFfjUsybiWQuIp5XE3Xm1QMaOPWyfvUASAxLJxndv1sMEQBCxlKH
         IGw3rIKrw0k0pSgZejSiLwT3JsPvyXNX6CZeHPvVLhP41han4CkxhjY5+2VAJZxOLky3
         1TSQ==
X-Gm-Message-State: AOAM533FhWZzoZbF4LyirEDilQRjjgxdkLnDs4lCquRBJB4lf9l+/Y1F
	qxRn4y/Ix50qyRElN2F4O+I=
X-Google-Smtp-Source: ABdhPJxeBl5Mh+YX7DmKFcKa0NAK43NutbQYYy/kOsgN2GUKCALg/AIt00GPXycmRfELAZX+xEVgJA==
X-Received: by 2002:a37:63d3:: with SMTP id x202mr18212871qkb.97.1591612557426;
        Mon, 08 Jun 2020 03:35:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:21d0:: with SMTP id m16ls6181634qtc.11.gmail; Mon, 08
 Jun 2020 03:35:57 -0700 (PDT)
X-Received: by 2002:ac8:f79:: with SMTP id l54mr22857547qtk.79.1591612556982;
        Mon, 08 Jun 2020 03:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612556; cv=none;
        d=google.com; s=arc-20160816;
        b=M21yWDKJSWDN4vSX5DHNiR+JGjdxQX1i+PFvIXugq6RnZKt8Br4vmgw7OtzuU8MNXL
         ebw1vEpqxq+ufXBp55eUDu+D5EY2wiCdtx5TwVdN86gMKev6r9+QMXn90X4SEuVpTn9/
         3XDjLNwt/yvtqLaliVMPpkkzkL/90+hFWIc5WJCLPRs0KbHKsa6Fdwt64NmEmCkkgkv0
         2ZxyiwYIO7LzBtrwvVfho0jFl4VM3R7UmP2h01VWg5ZuUvfV2HYuC1aUe9+C+kHXCfHP
         VihMAVqUcojLCBeWQO1xXFZBiX2c+Q5bwT54me7Vr6iBH0QYL3QQ6RNNqZy2HlWU+2bC
         fEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=n7THMKtnwN7wd2UNTkkeFrnGP6WTE9Zlm/bPBdd5XKE=;
        b=xcp7EnkbHzaUD+ThyJzp78/bF8b6PbU0TMn0hp0mVYuwEhdV6rDFYVKhegsKdhrwCG
         82hGH4ROM3w3Zdboi/b5xJve6M3+7ezzt4+ZqY3Eo66nx18mCkzZs/XbTl15nQVFiHbB
         VAM95+Ou/fg8r67kYzbQWdiHSP1GxWDsMUgO4NabvxBKDtNknDTtf8cmRlOdy4eErVW4
         4OEyGl8WHOihQn5TS+jn4KvCyfqYgiuaiu87Bnscn09BOxtSc9jsdyregxltnWxWeUPe
         ZRUqZgF6fhHlTppPIQZ9pAL0GE0Ulwq7Bfrt3Ev/L7BitOUWxIhQ4eahaCZFTwe25pnt
         078A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=evXFLv1J;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id v16si360702qtb.3.2020.06.08.03.35.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058AZurP039485;
	Mon, 8 Jun 2020 05:35:56 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058AZu7L130146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:35:56 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:35:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:35:56 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058AZnoU122340;
	Mon, 8 Jun 2020 05:35:54 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 3/3] configs: k3-j721e-evm-linux-demo: Remove unsupported device partitioning
Date: Mon, 8 Jun 2020 16:05:48 +0530
Message-ID: <20200608103548.9040-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608103548.9040-1-nikhil.nd@ti.com>
References: <20200608103548.9040-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=evXFLv1J;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

In kernel 5.4, support for following is not available:
* D5520 decoder
* GPU virtualization
* DSS display virtualization
Remove these from cell config

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c | 65 +------------------------
 1 file changed, 1 insertion(+), 64 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 4a5aa3d9..cda1614a 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[27];
+	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[2];
@@ -135,69 +135,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* D552 decoder */ {
-			.phys_start = 0x4300000,
-			.virt_start = 0x4300000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* GPU */ {
-			.phys_start = 0x4e20000000,
-			.virt_start = 0x4e20000000,
-			.size = 0x80000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* dss.common_s1 */ {
-			.phys_start = 0x4B00000,
-			.virt_start = 0x4B00000,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* dss.vidl1 */ {
-			.phys_start = 0x4A20000,
-			.virt_start = 0x4A20000,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* dss.ovr1 */ {
-			.phys_start = 0x4A70000,
-			.virt_start = 0x4A70000,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* dss.vp1 */ {
-			.phys_start = 0x4A80000,
-			.virt_start = 0x4A80000,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* serdes 10G */ {
-			.phys_start = 0x05050000,
-			.virt_start = 0x05050000,
-			.size = 0x10000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* DSS_EDP0_V2A_CORE_VP_REGS_AP */ {
-			.phys_start = 0x0A000000,
-			.virt_start = 0x0A000000,
-			.size = 0x31000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* DSS_EDP0_INTG_CFG_VP */ {
-			.phys_start = 0x04F40000,
-			.virt_start = 0x04F40000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
 		/* linux-loader space */ {
 			.phys_start = 0x89ff00000,
 			.virt_start = 0x0,
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608103548.9040-4-nikhil.nd%40ti.com.
