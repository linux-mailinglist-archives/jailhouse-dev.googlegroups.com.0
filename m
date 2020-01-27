Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBUOYXPYQKGQE3PWOJUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd39.google.com (mail-io1-xd39.google.com [IPv6:2607:f8b0:4864:20::d39])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6F914A58B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:57:39 +0100 (CET)
Received: by mail-io1-xd39.google.com with SMTP id v15sf6155785iol.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:57:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580133458; cv=pass;
        d=google.com; s=arc-20160816;
        b=dIGGq3YruBHN4VisVLsAstp7SKBfK5AYxvZQVNr2SrflKhecRUV9mdkxQ2VJqsdgGT
         mZjRglbfj3yK/FrxoJcRo+SocdGRt/O4M9jE5BQmfDfT3wc9I7N+/fo6LxsVliwJffrf
         YyaVWU2Z1Hw5mokRmEUaXBK7+sHaDQU7Q0w0eQEoiJCQgjl+2Q/IbZsYK2jwGX5livMz
         hvhesjWw0BBGix+6mnmFHHqYE8Pw6jppWnKUWH0m6SVZwFyLOn0KbFsO+168ZLzTc2JS
         vMze7I+KegGjWxTbMCwB2NPxSxDFtB3hvl8/5nfYhZVWsoDpi8e0B5UWJ+1HpB8WHSgk
         Em0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=90h8gaYJP2J6EVMOWLxED+ikuCy06KwaGAeUYgN1IZI=;
        b=DdazZ7iltL19huulWBAx1aksM2KlKxQbz5VFE8nd9hbqOjszCJuSDbPYP3qKrgUoNJ
         zSCqqNqEe20AcQF1UzOBX4W/EKSjn8PJnFgdvOjgLOBp059H2TIv1Emn9kJJeqMg1ZOL
         jl6KL1dcybQkt0O9OEIjwdEow/IapOrHA3scnzGz9yGOK7eshg9yc4pXgWzkl55ujFVe
         tpAwaJaJqdfOhKH7Xa8xi1qNbZ7OuuEuMtAb0EayOUXXsiMnK2ctSe6ZbFyBq0udNhaT
         W3GLbs8mm+Ix/0AeTE/bkfxRJtd9JN+WPW2IGuaixtqlwwFtubogfWZyVZXs2+d8O1gl
         WrAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="g+8Pdg/A";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=90h8gaYJP2J6EVMOWLxED+ikuCy06KwaGAeUYgN1IZI=;
        b=Nhm4D2jb5pA6+eZIKLSx2TDGY+Yno8ytNugR1KU4SF3KspHZ5HZRs91VgGfN5r7Bq8
         aEVJYaR8s+vFX2xAF757EYXzIA5pqjjqMKHdhQg8rsxFsg5ye7gAZA6yI3OuM5DnnxLf
         0pXD8n2QItVRSzB3DtfCuzSt98Xp2Hd5a0nY499U9dy1Ci/77o47pZiR1md0fb6d1Bib
         vOVdVgZluBo9KLCVNPTDEYZIyYBMLWGkeFd6Isk0GArih3j99M6mD1/nLAcNUye2TBem
         ThYaqF6WYhbitHwc95iD+xh/6aiOBi7bgdr+U1FApVErsXydmh4yqBfJvI6r6P75VMJf
         ZePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=90h8gaYJP2J6EVMOWLxED+ikuCy06KwaGAeUYgN1IZI=;
        b=jd7EUX7EvM3x6UpMs4OtTYAloHhFcj4jc6HROLJ95rBZvEmQ0OoOozJDqd0YjhvSUa
         FvN8pHAw0MweQJGJTB1HPc5uFphyqOWCUOgUMwCPJBDIR6H1bs7h5pt9iVoaYo1Ok9ix
         /C+fhpEBSkz4iuM9DtRagqFV5N8Z+njM7pIpQw39SYZa7wypIoakhPwtozklhkFaY08e
         dDbUJgG995XQS5ykGajySMyL2tl8MziiFrugZFJOTytKiTEK5luoZzV2Jw/kynkZFHvt
         8LeGSQD7nLOoC1RsE5jiVacgSHWRWBKWhaSNv8/DkUftN2wBX55U00NBfcPxrEBBYYBQ
         d0TQ==
X-Gm-Message-State: APjAAAXs3gToOJe1puTRQXoB/aDlCLVuOWcFEmVu+QuvQMuL+PqM4pfF
	Gf2ETGkRCW5JmFNyL6TFyKs=
X-Google-Smtp-Source: APXvYqy9qGQJqESvqF4jeNF99AVATEunHW0Io/gvBZgJsig37v1BIH7zgj5HAHvZUlnDDEQMSorydw==
X-Received: by 2002:a5e:8402:: with SMTP id h2mr12127150ioj.30.1580133458188;
        Mon, 27 Jan 2020 05:57:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:5f17:: with SMTP id t23ls1721269iob.10.gmail; Mon, 27
 Jan 2020 05:57:37 -0800 (PST)
X-Received: by 2002:a5d:9d11:: with SMTP id j17mr12985616ioj.83.1580133457641;
        Mon, 27 Jan 2020 05:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133457; cv=none;
        d=google.com; s=arc-20160816;
        b=w5fKeIMQISZLxL4j3sIcAKW0461hy8rk+rVt8pcLqJ6gf5twssPZ97YTjowcNl5786
         570JSfesPIV8Wx3NVs686up8ynH3dRESMa1CI48Hk6oeifaKcPU3QJiaoIG740kyVNuY
         86hv90u+A+OiQ+BuagOFVdjqIXxwV20Vem7LyvgBFj7xYoaz/4L32RbuAc0XPwTqCcq2
         7QNcTnc5kuCQPahhE93hze+qDQt5aTHkvj7XA1Sw9UZ5th/8q7F1/3kXytdzQd1HL2Wd
         XESoTuPqQGagAdBYshPPUXoBIsmph1WYqPSG5Su4qxdCl7Du1ZpTnR5lkczXblV1J7AO
         7SIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rubqDCN/ycwLlIorDQPdcNC5dLFnBvhHuCgs1/pTYpc=;
        b=s4D7SQDdZtRSKKt/NARlgf/AooOWn9StvvcBhfOYFnmXTqC8SVxIKtt0o0gp+2bSFS
         xxt0pP5JL+rju9TKUZt0vF30lCJkxuNiqMu8HSzvLTYxdKEUCqYry6GuGpf00s5K6hp3
         qtNmgRsGHuFDUzvNK9+6gxdzup4xFO1kdy2sNnzWkHrDlzQDDhE8xWr8o9j0hfcJF0He
         ngujjbLC4As1W47Ow/z2OKrJNX4Y0mPeTjHpf9eVZZSqD1kbY9YMbjipSIOflD3Ax1PE
         rOeMDWvpOaP9D5qnPQczP9Eql/onMwZZ8Fft4v2sjpT06+kVF4D7PaQviWEwy3nskizW
         BQ2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="g+8Pdg/A";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id z7si825817ilz.1.2020.01.27.05.57.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:57:37 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvbRH056583;
	Mon, 27 Jan 2020 07:57:37 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RDvbs7012851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2020 07:57:37 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 07:57:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 07:57:37 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvS1v090460;
	Mon, 27 Jan 2020 07:57:35 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [RFC PATCH v1 4/4] configs: k3-j721e: Add regmaps for PADCONFIG registers
Date: Mon, 27 Jan 2020 19:26:11 +0530
Message-ID: <20200127135611.21302-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127135611.21302-1-nikhil.nd@ti.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="g+8Pdg/A";       spf=pass
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

Add regmaps to cover PADCONFIG registers in CTRL_MMR in J721e.
Describe the ownership for PAD registers in bitmap.
Enable serdes and UART control registers.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c | 25 +++++++++++++++++++++++++
 configs/arm64/k3-j721e-evm.c            | 15 +++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 47ad32ea..40b7aff8 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -28,6 +28,8 @@ struct {
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[2];
+	struct jailhouse_regmap regmaps[1];
+
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -40,6 +42,7 @@ struct {
 		.num_irqchips = ARRAY_SIZE(config.irqchips),
 		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 		.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+		.num_regmaps = ARRAY_SIZE(config.regmaps),
 		.cpu_reset_address = 0x0,
 		.vpci_irq_base = 195 - 32,
 		.console = {
@@ -288,4 +291,26 @@ struct {
 		/* Non PCIe peripherals */
 		0x0003, 0xf003,
 	},
+
+	.regmaps = {
+		/*
+		 * offset = (CTRL_MMR address - reg_base) / 4 / 32
+		 * bit = (CTRL_MMR address - reg_base) / 4 % 32
+		 */
+
+		/* Partition7 */ {
+			.reg_base = 0x11c000,
+			.reg_size = 4,
+			.reg_count = 256,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+			/*
+			 * sw10_button_pins_default	=> 0:[0]
+			 * main_usbss1_pins_default	=> 4:[6]
+			 */
+			.reg_bitmap = {
+				0x00000001, 0x00000000, 0x00000000, 0x00000000,
+				0x00000020, 0x00000000, 0x00000000, 0x00000000,
+			},
+		},
+	},
 };
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 4f9755a8..ac422143 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -23,6 +23,7 @@ struct {
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[30];
+	struct jailhouse_regmap regmaps[1];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -89,6 +90,7 @@ struct {
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
 			.num_stream_ids = ARRAY_SIZE(config.stream_ids),
+			.num_regmaps = ARRAY_SIZE(config.regmaps),
 			.vpci_irq_base = 191 - 32,
 		},
 	},
@@ -398,4 +400,17 @@ struct {
 		/* PCI3 */
 		0x8100, 0x8101, 0x8102, 0x8103, 0x8104, 0x8105,
 	},
+
+	.regmaps = {
+		/* Partition7 */ {
+			.reg_base = 0x11c000,
+			.reg_size = 4,
+			.reg_count = 256,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+			.reg_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
+			},
+		},
+	},
 };
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200127135611.21302-5-nikhil.nd%40ti.com.
