Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNHB42KQMGQEM6YNP6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20455BA07
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:25 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id k32-20020a05600c1ca000b0039c4cf75023sf7307029wms.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336565; cv=pass;
        d=google.com; s=arc-20160816;
        b=nfFV6h92CP9b4ViVvvlLxFCMLQPIDZRH0sD8irt1hih+u1abXyOCZocdCVZ6UtlRE8
         19B1rNHBcftpxe97rdbpJ9YBAG+7I1Mq9wQVywCC/uI0H9SPpxh07J67k+X30qN95/f9
         cT9ROWV/U+TpGZmNLCL/A0JRoVxXpS+9/SKOyqPBQBnCgCEOpFjgYtup/bVtoSDmMxso
         HRJTN774hy+iEceSgb4TsNGBmIX8VkLVQsbtlJRHSyf275CMYn6SDjRWLjmvoMu2HvZC
         Dn/uigQpFnFlFz9tOuvMuJ3J9stQqiwJQYpicIhVfsArPTv+YeOwFSyu5pr5Jcv2FhBX
         jOdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Quapdn9LgVsUpPS7u91v5TlQQnpWNVoEXPV04Q9EfAg=;
        b=SaCnQeWW+MahTSPMFsfXp/JRs0a2KUjAVj9F2TAtuMyyL9Qhe1QRVHEH2vhBetM/hh
         czm3H5m3QYtUCCSblWutrkl9nFiLREeDthzj/BlmWgJUsc/tBXqfvDoe6UOsHv3b+5Rz
         u9oXvVI5SjJ+2SvKNlg4IKP+a6GP/3K5PiHFaTf3UabtEpPN9dQRRmffUNQWT52uu1ha
         ZHAavyvBLKEmVNm/Q/0AD+FPawlz+W23k5MzoFpJEcdxEFITmNbKvtvN+pGGLpPGpaKl
         mjcFpsp4pJU1d8kUqBI3hS+qAxGQfNaQlcZ6pMUfGSEeUQX3Xe3OsFLk8xM/d4BZnrSA
         FlhA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=NWckMObs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Quapdn9LgVsUpPS7u91v5TlQQnpWNVoEXPV04Q9EfAg=;
        b=jpCv5m2ccjP9e2T+qRhZVUbW1XPJOdLlBpPldVvckkNH9VFyYiwP+2MTFfBSDSmHay
         BWE5CHYGn9a4mHhnZYvxomhPcCCg015Y0NvqS2Cm8FB87D5J4day68bbNNE29Js9cT+m
         hfJhHTiXhl/CGfdBKDAUkh0GoYTIxI3s6QbIvA4aOol2LpDjBNXqv8Bt9QNs4+KAmUZX
         JAF4J9NB04W2GKHIYqPw72v92AFYqkndjFoIIV7eV32Xh/5JQhA64txJEdRCElUJMEtp
         xde+QTVm8rwOqVJGCurCsdcemyTM8pLCskXffrDEsgwcBOndKidZjEPQTBitG/5RNe2c
         P58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Quapdn9LgVsUpPS7u91v5TlQQnpWNVoEXPV04Q9EfAg=;
        b=sn1ntR4OtxRmeEG+d45+/tcuu2QycsBNCcIPgYjRT2dJ2m2wIihyptbrO0qocCgCnC
         Cz+d7jdu1gfYlL3DzygkP5A+PXJw/BznoR7lNQ9vUVnmV7z05fn00jDtT1JH5TskirWI
         m2mJHcpdOBfV/ulb1L6gWx+qPLp9bRd0dJXVd6BDiL4Zyzy70TUyPVFKZckOLoEnhKzk
         xRB0pEQwm2tADd6ZsXY9BTUM4sTqZ/s7rdOg4SbeP3kfoEKDUpnmIbBF4Lt6VKAvqWtZ
         FDbmFLX5d8Bc0WhAMUAS17l+jwFWacd96X2HpLjFpxg/WvtoudzvPQYCvr+U4Db838nS
         0CZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9lDPKhlPv8Im7VankXymsW1qiaOfwMuNbNG2gdtsMYkStNpC2f
	SL/RblEhCswicP5HAKMRQpk=
X-Google-Smtp-Source: AGRyM1tK3UeMwcFmwl96P4lGj05rQa1DSHRLigclXKDNv/A2ZZTuIzSkE9R7m0jkbuoAhLS/8DUPXA==
X-Received: by 2002:adf:e60c:0:b0:21b:8bac:70ff with SMTP id p12-20020adfe60c000000b0021b8bac70ffmr12292269wrm.467.1656336565254;
        Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1887:b0:218:5c3b:1a23 with SMTP id
 a7-20020a056000188700b002185c3b1a23ls5783721wri.0.gmail; Mon, 27 Jun 2022
 06:29:23 -0700 (PDT)
X-Received: by 2002:a05:6000:2a4:b0:21d:187c:c50 with SMTP id l4-20020a05600002a400b0021d187c0c50mr493084wry.5.1656336563824;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336563; cv=none;
        d=google.com; s=arc-20160816;
        b=XwS7g66Nuyttrg4wSCzYr/Fqo8VHMQMiJdTHXWl8cOJLmL1oM5cQFLrNxMmVL5E2cI
         q+MVifqB+A4L/px/HAcoRUVGqyDOLoW/DWx5kf/JebK3N8tsyoxs2vRlZrLmVhDX3hV+
         WEpJ/++RDBEKj9WKG5MVcmyQkFDAlnIwu/qkmOnQzH1Vzg662tz9PcxtySChgQHNML+2
         /iT71/gtwIbhoNatwZH6Hmn4aKkVzLC0V7dnOSlg8bS9jaMrZI7D2F5FI/Xm77Zs5cEu
         j52ESfC4FYhnts3ua4BIrOdQ1yfil4a3Eg2hvyrA52tMVTaCbSEgRiyCf9luzNTdKMRZ
         cq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QceJpBQhO0+8TqsvaoRszxDpwm1KWXZpJHOth/Ac/qM=;
        b=iikVbr0IHvc5gRhTNjdx3helYWWVwZn/trMjlD3OgZCIItKtwStVtb/Px7eQmI/3im
         9BCghhEHqKjAe0sXalGrQ4BBq1JVeKxatGKpqCRb4qkwtzD7HYPj1hm5fGlf+VXSB7QK
         B8xeREpTuXhSrOOwNz94XM7EoG6wJw0MJWMuef/O1RGAJhkQzTkErOZ/PCBtkUodt04n
         5qnUJ4WRvD6e62xz5yHAshPXCSNavth7Kh2F9GwSd70EzZ4ZYaeFrwdPH7jYIArYAEty
         PlwiTrhHMKpqfTXBHLodLCIyJ4qDftZVHI6/BU5/sfbSTMgmRt4cK/t60n4GOm6ouiH3
         KXpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=NWckMObs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id p127-20020a1c2985000000b003a045967b2asi220752wmp.4.2022.06.27.06.29.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVC3x2bzxpy;
	Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:23 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 38/42] configs: riscv: noelv: add tiny demo
Date: Mon, 27 Jun 2022 15:29:01 +0200
Message-ID: <20220627132905.4338-39-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=NWckMObs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

---
 configs/riscv/noelv-tiny-demo.c | 63 +++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 configs/riscv/noelv-tiny-demo.c

diff --git a/configs/riscv/noelv-tiny-demo.c b/configs/riscv/noelv-tiny-demo.c
new file mode 100644
index 00000000..4eedbed2
--- /dev/null
+++ b/configs/riscv/noelv-tiny-demo.c
@@ -0,0 +1,63 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Minimal configuration for RISCV demo inmate, 1 CPU, 1MiB RAM
+ *
+ * Copyright (c) OTH Regensburg 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	struct jailhouse_cpu cpus[1];
+	struct jailhouse_memory mem_regions[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "tiny-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
+			JAILHOUSE_CELL_TEST_DEVICE |
+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED |
+			JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,
+
+		.num_cpus = ARRAY_SIZE(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.type = JAILHOUSE_CON_TYPE_RISCV_SBI,
+		},
+	},
+
+	.cpus = {
+		{
+			.phys_id = 1,
+		},
+	},
+
+	.mem_regions = {
+		/* RAM */ {
+			.phys_start = 0x3fa00000,
+			.virt_start = 0x0,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x00100000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+};
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-39-ralf.ramsauer%40oth-regensburg.de.
