Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBY4CTLYQKGQEXM6X6UA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FDA14364F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jan 2020 05:43:15 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id u18sf748066wrn.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 20:43:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579581795; cv=pass;
        d=google.com; s=arc-20160816;
        b=cmpr8WeMIA5M03uEA6aHcKxOWc9lTxOqKxpZz/hkOSNOHD0TYgBxh++h7VHoes8EOA
         VBelxqIW4feWS71i0hFkIqRfoaF8xnW1jQgBwtkQ2eWSg2REh0R5MukgO28u/iEwnac/
         D25kokXu99ZMuk6HuddtaSDdFT+zF+NMa0t32eil+j2A+pqogGrqcGjNtJL0Dt1067dz
         KS2RiwmEmfOt5TRdy7d9w0f7ObEt0S28m+I9W785ebPFs+rS8fM5zqj9J889DyZGDSmb
         X+t/EP3XCTRm8hYqHdHnlp7P/qtbbmXOesCSGoSrtMOX6SkvljGe8wLY5GImwtAqX4LJ
         8kcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=3jbl6tesbnieUqgbQ99HiQbMr/3UY9De0VLx26yA6C4=;
        b=d9sdzO1jVNaTwXXVappYZierk2ajhKVMr0Zct/te8cJAyY9fUZEYnNV7FAXhOk+7x+
         8WcuFdaRjer5bI2+daM+O3jekTi2xKn+dspS87nrITETONVq698+mlkM/8t3hlMe3UK/
         4ay9DIgT+Opt8NuBsIrvie/BXBk8//rKUu4wX9oohoWWtYEedhKQ+4XKkmvPYVqMdUKs
         xM2agsJxzT4K0y1zxX8s9F1moQWak152Iv8ZBIFfAlVwoNHdSD7+KXSivMjVrOM+7Qtt
         cpYsHQFGwtsYhW/qj6iZdM5EfbugG3JI7Q1ARDh5ZnyjVUMNMl4tZ2yKZXCb0PHnnC5F
         a29Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eeq9u2wI;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3jbl6tesbnieUqgbQ99HiQbMr/3UY9De0VLx26yA6C4=;
        b=sr4/EJ4lpfxBWmvF9gV1wh4i2D5aZVn+HijylNNJrnuBN5krrn5Txx9LFcB05MDE8d
         ego3+TXlupDoJF69DN+We5LtIUmfL204MBBFfjb8ukCNGT8MTHFh7oBVnQh7/1tDcft8
         c9QvPoPDxi+ugVDHTkrZHLOMGmu3uU0Tr7QtN7vRULwp2frboWK64tqJFalqRPQNKrNC
         qfQiGYTxfkNiZAwF3J/0dvf2u3FQPH9hBxLR8TFg8C/TJS9ojAOsDxrDfHnBYA1co1m8
         Y4WaHipgaWuqRNNF80mCj53rilRiIGAnWOAEIltKyvMxjHdYMEwNC0fbFMdt+yDMGWkT
         mgUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3jbl6tesbnieUqgbQ99HiQbMr/3UY9De0VLx26yA6C4=;
        b=ZT6s9TNwi2xu9T66Vow2vnxEuzwJd2/brpMifb3dRNbcKxOmHPjY30HSmqstJ/6s8g
         LIoUyeoSyJY8obrUGLpe1abJf+DqWzvjKopyTYYHyVwDPDDOzloJeUpCGqoY0/fBHk/B
         DKznXBGHQjPb4Erjj5/lPLMETvJyIdZRM/VG6z7kIimYQUFYW8HGh+Evht1Y337MT+Q6
         9MANbgiCh5broemmM64rXjfqiDG8Bfi3JOSwCjbFzLR8REE4ERBi6EgEgwPZeztOhzpo
         GtWwlFM+Z1o17O0Iv+HL1OaL/j6cDUsM3kRqH7llARkGawNzo/aLk1YTMplHiK68/MqO
         53kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3jbl6tesbnieUqgbQ99HiQbMr/3UY9De0VLx26yA6C4=;
        b=ZWjfvjzCck1CupmQ+ybXcACeaCAVXRw1jSWG+9gBET0Ppb1Qr6YCLTjtlyZ400kuPN
         szVw0mQ1HR2mTLxe3iGHSX5VaFdl4r32401YeV2wJOLThFUlPGOynlR5fxkL4J9VgQrr
         //iNrw185Zei2xsZqyR5cDmXGGt17eekBx97hfsN9X2UhJqKPnHdPud91Jobcx5yH5yx
         MKTZNs/wJDKmR5lDRdtRstE/Sz7q3Hw9gUey2n4l/jK5MAjvtLqSYVNxOgOwr+gUyebM
         e3HR7cKoCBus2T+Wpf3MymJNT6PByI8j00I7U1VkkJpOX2Dtr3D0qqE/TtjNqsvENICu
         6rEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6UCrQAYZnds7a/y/8Y+opU7S4FX/NT5akVFn668EUsoedTUlp
	EAq5dZCZMrCaGRwmVtgZJSA=
X-Google-Smtp-Source: APXvYqx4u62UR2eJ3UXvFp+XoK6EMEzBLB16PvPepZ6aaVz43AEp4JK4HzOoUAb4cjz0eu97BiqgOQ==
X-Received: by 2002:adf:df03:: with SMTP id y3mr2935891wrl.260.1579581795180;
        Mon, 20 Jan 2020 20:43:15 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6650:: with SMTP id f16ls3156581wrw.4.gmail; Mon, 20 Jan
 2020 20:43:14 -0800 (PST)
X-Received: by 2002:a05:6000:118e:: with SMTP id g14mr3030233wrx.39.1579581794452;
        Mon, 20 Jan 2020 20:43:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579581794; cv=none;
        d=google.com; s=arc-20160816;
        b=RcAIJOhlD0J7iROlBYtysf1EZcJxo2F+jEolBecohslyPl4qerTDZQkJF/ADNDxciu
         9wkEBtZ9vw8hZtCb9idGEM6o2S7IOI9vyDxOokSdLpX8Vw2Cy1HAJ8taQWxM2cDjAD0L
         bBrxU7y6fBws1nkVGpohW6vLuJzSUWUj3bUEM213dcl/iUCMRCaaAkvtH6XnLULhE8//
         +J8hKRvbxE0nnBeCVsDXxg9OKCXl57WYClS5chyzHMkpMTKu6OUM8coRW08HBNM69CrU
         jbMYj9c57aYgnWQ+0/oR66i8RUxhN7zTFWz7QgXERwDTutW494MYGPLfcmZXpDRsqH1B
         PSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=rbtqEpgebHSDg9xq/qmSI90AuSWhQPYWM8NC1vWWLO0=;
        b=DbPGmICV/FlOJr3h+vMADyBQYgcxOcJ/wOfG0/IpH+iHiXOFK2Vl7suOwrW7QaFBN2
         MxQhjawGGMwlGrkf+cy7Kl1uxxJHVFbPC4muRI3eaz+GV7IhhSandq73b7mo5edal8Dq
         CJlQocK2rX3Xo4icC/pxsWVSocnHQcDteyynJycpSG8vGUxxHI+1tH+/DDjlwUM9TMDk
         +C3xrKuTJ5mV1SYe25nePLszl9BDhWrSFnqOrUz8Tk6Fz+Z0vk/yEYFHfnc+Aang3PFA
         qIkq1xT1bxCLdYGNVUHBo55RMD7M5lzCLy8XQ9dKeNkyRExtGIEePVi6Fedml0lhRNPO
         Wj6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eeq9u2wI;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com. [2a00:1450:4864:20::442])
        by gmr-mx.google.com with ESMTPS id t131si55910wmb.1.2020.01.20.20.43.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2020 20:43:14 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) client-ip=2a00:1450:4864:20::442;
Received: by mail-wr1-x442.google.com with SMTP id c14so1654823wrn.7
        for <jailhouse-dev@googlegroups.com>; Mon, 20 Jan 2020 20:43:14 -0800 (PST)
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr3033365wrp.2.1579581793754;
        Mon, 20 Jan 2020 20:43:13 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id c17sm50446114wrr.87.2020.01.20.20.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 20:43:13 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v2 2/2] configs/arm64: Add gic demo for pine64-plus board
Date: Tue, 21 Jan 2020 10:12:55 +0530
Message-Id: <20200121044255.6924-2-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121044255.6924-1-vijaikumar.kanagarajan@gmail.com>
References: <CALLGG_KzRM+g3+eJf7Y6q7_Bpt-RtFciHSPPr+At96FXakzgBQ@mail.gmail.com>
 <20200121044255.6924-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=eeq9u2wI;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Add GIC demo for Pine64+ Board.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 configs/arm64/pine64-plus-inmate-demo.c | 69 +++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 configs/arm64/pine64-plus-inmate-demo.c

diff --git a/configs/arm64/pine64-plus-inmate-demo.c b/configs/arm64/pine64-plus-inmate-demo.c
new file mode 100644
index 00000000..7f43444c
--- /dev/null
+++ b/configs/arm64/pine64-plus-inmate-demo.c
@@ -0,0 +1,69 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Configuration for gic-demo inmate on Pine64+ board
+ *
+ * Copyright (c) Vijai Kumar K, 2019-2020
+ *
+ * Authors:
+ *  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
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
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "gic-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x1c28000,
+			.type = JAILHOUSE_CON_TYPE_PL011,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_4,
+		},
+	},
+
+	.cpus = {
+		0x1,
+	},
+
+	.mem_regions = {
+		/* UART */ {
+			.phys_start = 0x1c28000,
+			.virt_start = 0x1c28000,
+			.size = 0x400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32 |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
+			.phys_start = 0xbbfe0000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200121044255.6924-2-vijaikumar.kanagarajan%40gmail.com.
