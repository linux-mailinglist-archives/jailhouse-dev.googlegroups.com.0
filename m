Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNHB42KQMGQEM6YNP6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D68055BA08
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:25 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id o23-20020ac24357000000b0047f95f582c6sf4694416lfl.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336565; cv=pass;
        d=google.com; s=arc-20160816;
        b=atl+oOeiUl1d3N9QMWHFIaGmqI+xns4MUn5GJgwXlWHVPMLfpq+yiuqVzUti/t0Mlv
         JGy1bgMudlh6olVqcwUyLZp67I6k8gz2XGqXPrRB+rPZr++MqDKid4h/tdCLSCAH1ATa
         QeQhUt17bfYoCpLHVHm12ba3AtFcoKzb4f5aN09RWEU6c9qC9wHHEXdwJqJ43xfo0D5F
         0lc66BgRR8xdmq3QPp+SlqlXwj9ZflV6yZ4VmIaX0f9DYsnvr5Vbk2QoC/xm4MIi+S0l
         Qk3LaJGmDMbo067SR8+sYy3BUKlNOBjrWzHjCCV2xn5oe68XiWCavbL7GVsWMObJp4Wd
         rVzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=YAoRcozculJMofKEeZ2jiWbt1fFrEGenS8EqWPJEfDY=;
        b=oD017oHEOaNu9CWJ+m/1uwDHj/qIdhgmv/4KtdU+Thn5CJN0LjajigP2Ja5UMqY6/D
         H/ajBNA9hVxY5zdGQuWKbraWzM2iLN2WMsIR3l8r+mRAupSEbZMgmBhMIbXLeEABwKZi
         v7aKS/fAwhdKDfh9/0P3IgvZgJsIdQH/zziDBeN5Z3/+HbWhgByz57dAOTH3XZSrECg5
         9vtB9wIiHSzq0TVXupYAt7baoYzpZvVIbRU3uBke+wFyCi+LWzogUIM+LQq/cKV3p1kf
         /UnOZFhuB9oOkbs2XxvZ4tl/+z+Tf2FIjjFquR8SPJLWKp1AVXIRIXMQIZJDfvR6g+3y
         Y6Ww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=rMVHZaCf;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YAoRcozculJMofKEeZ2jiWbt1fFrEGenS8EqWPJEfDY=;
        b=dqEnNowzgHqIafa30kH+9AGIzIuT9xzO5EltrAk7YPzPetRdTOkn9llaPFcAhlIuoy
         6qRhOkPGSSBF0IHGZK7SWOlm7qWc5S25tJvQ7HtVekiYd5GQQRXyCjBK3c0mY1QM6eE4
         torbBOqKLXM6ztj2m1u2nLDCEsCp/rkPXb40ZdBzLuJhr2kJvKObNexf09RoZTAhu/WM
         bLXEFqVVDB/EytHCNHuNX6nImktLLpRljy7PznY4Zy5d2CntFU3RGoml4NKjmSD5rla2
         8S1SghAXyQ9xxI2fGI/dvhRM4Tqldbs2W1xezW+wsu/Gmhv843w+7D/IoHFupuv0V+J6
         7aGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YAoRcozculJMofKEeZ2jiWbt1fFrEGenS8EqWPJEfDY=;
        b=0ZM/z1sKXhqYcEGecgfBFZS2dnPFAETvl9/cUNbVcQrZSBSllbzk0fzC0d4xxjoo9/
         +i6oeIzsjhYmUpDSNsG67T6NNtmz/zxmihu1YCQ74/fMge8JwRWphymEfK4okJkijTRF
         A2JfetIHmq8ZjudEEn4HV8Z6L5dwfZ7iuAVuGq4gAhzIE3E16BUPRaQYcIK90OL5dWFx
         NtLYb1BJv4Ty4X8+5qZmRFnCCboV3F7DNyCdYDeDJFh04CZUUiqTPXfX50QoJrJqUNJ/
         3VVc/0LjZ9mi6UgC/5l3F6pv5lgTmXJnnlfuoBV5yV2N31mCOiAdsk1DHsz6T35i5VNr
         jReQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9iH3rqTO5Y2kL1wVMZeQJCf3F6YdqAQqAGC0DUPleU0n/Q//Xa
	3w78C3onT9tQzfam0AgXeSU=
X-Google-Smtp-Source: AGRyM1sO0LFA213W7Md3MpDBGEnGpXyGZNbtqZXj0DJeORwttXpQReD9PITx34gMKKWYTH8L0VxvOA==
X-Received: by 2002:a05:651c:1a0e:b0:25b:baac:f415 with SMTP id by14-20020a05651c1a0e00b0025bbaacf415mr3951370ljb.480.1656336565126;
        Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls214011lfb.1.gmail; Mon, 27 Jun 2022
 06:29:23 -0700 (PDT)
X-Received: by 2002:a05:6512:3f85:b0:47f:3be3:33b3 with SMTP id x5-20020a0565123f8500b0047f3be333b3mr8196106lfa.309.1656336563610;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336563; cv=none;
        d=google.com; s=arc-20160816;
        b=UA3BDww8ZhWvwKKw87e9wrmJzzQPCHj2Gjm7THZYyvVxRFI2liWmnTlspDPSQ9G/tO
         QKSojJi4fPZ/eQzYf1bH6Uv4M+eGo38+U/QWSYwxUZE3DpFZvGhnPqooxUT8k3GoJOYs
         m2yCWyrlSwanLT3OD7GCGHjnZlX52Wr55VTbu8w9WG7es7X6hoWs9oFkWYV4a9BVk4v4
         SFaXY9KP7lM8C24/pGqguCxq0jWAxs+7ONrr0vP2ub0pZXhy8omG4F4+bIVRvePPRqkt
         SznhkuDFMQx9WDByzusLkrLOHSTkvE5ahoi9ouZgMuHd50hZL9MgWKUnYCYTRtc3fu/p
         hW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rP8ooau0Klgv3oEIqNBOZmTp+bUyUCf6EsJroS3HKsU=;
        b=igStr8p1hK8Fh5sXaWW2731G0bnITEUvvop7bDW4Hs4Pe0ZBh1J4HiE68TGtHTbX7G
         tO/BsekKrnt95jk0zleqB9IaKzLX9Ozke0PCyIfQsI7NFJxA2JYEsnpKTAe2jcY2AYHP
         vhuWpdzp0GWZvVtLEHQ1Qc0E5BMU4Jmjj//YuXRYjvNyq1Zp/fGgPaIFh84sWSDq5XzK
         OyzefAfNrSxb8s+KH8TGztDhMt1bjFRJF9jcpZ11nza9vIdsRSZJSysesM40WlDOfyYX
         Xy68GujMeJGDOOFvzixFamMy1e/yRmd1p7ybkEESvq2Ad/crzjKgxdJUE1GvGZ0ZSq51
         WIpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=rMVHZaCf;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id o19-20020ac24c53000000b004810d3e125csi210217lfk.11.2022.06.27.06.29.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVC0V5Kzy0c;
	Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:22 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 35/42] configs: riscv: qemu: add tiny demo config
Date: Mon, 27 Jun 2022 15:28:58 +0200
Message-ID: <20220627132905.4338-36-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=rMVHZaCf;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/riscv/qemu-riscv64-tiny-demo.c | 63 ++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 configs/riscv/qemu-riscv64-tiny-demo.c

diff --git a/configs/riscv/qemu-riscv64-tiny-demo.c b/configs/riscv/qemu-riscv64-tiny-demo.c
new file mode 100644
index 00000000..076e0ffb
--- /dev/null
+++ b/configs/riscv/qemu-riscv64-tiny-demo.c
@@ -0,0 +1,63 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Minimal configuration for RISC-V demo inmate, 1 CPU, 1MiB RAM
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
+			.phys_start = 0xbf800000,
+			.virt_start = 0x0,
+			.size = 1 * 1024 * 1024,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-36-ralf.ramsauer%40oth-regensburg.de.
