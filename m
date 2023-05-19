Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYF5T6RQMGQEL7ONLQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 5481970A0EF
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:05 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id 2adb3069b0e04-4f0176dcc1esf790968e87.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528865; cv=pass;
        d=google.com; s=arc-20160816;
        b=cCgpXZJg9lejNRh0UzdDOMkUngT8FqfAmY7jjEprPrWkdeiO/LT5vdTpiFWd+Bxsyw
         CdqohiiPl2beSF1M49JJUKpQ92IEqpKRihulP4Re5uybMaAUpyzOZ0AsiwKGg1GCg86c
         ArsiY/s4/dJ8dGPylTr2EWfV7rnen4VOxFo6MvPgFhyV6GUBz5u05z8bFp1HZYAfxxbq
         /ekKVnXr6Ol0776otPpLSHgEL7OtGkuSooNwEGIpEk3SI64ofjTz3T28QTIbiiPaAeCT
         CwGEFI8w84doS7dvmyG1AbGv3XSZyw5t/2py1ZGUVZcaPXWkYVIbMDtnNHaWHKtile+S
         RasQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ZR44l6M14VMT87JV+0RLddP1foqMMf6hZcchYZpmdX0=;
        b=loGeVLKr7b821rzgUGCPP3iMzwBjJjOK4mjQ51251undH89Umsmqb7A/qSDLe8ezmc
         sFP0O2Co0TA816liepkM31CohdTk6/kJy2mfkCRR+T7vqLaubS4EipFw0VFhHjRKlsnq
         sowE8avkOLpVSYMyde2dxTWkHk2tVBBGqgDamzCmFHzTPh0DTkVdKOJ8HYEta1N7LnCX
         GyWjO9TOfS8NtkqfxIys+GjO2wO44bRH7p/NbNvj39Tjm3Z4XTSlH7w9LERuBYaBkFs4
         t0up/8YzpZXKsOavSWPYZbeOLZ5j1mdalFNbLY4EdBMSo6lyK4+Zsxy/3LFVCd2+Uaso
         yncw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528865; x=1687120865;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZR44l6M14VMT87JV+0RLddP1foqMMf6hZcchYZpmdX0=;
        b=a6x6mgDChvDvlKaY0CvOeI9jUjulRpmBXuyxSVC2adXn5rwhFlRwZ1E6xGc2qYBdDe
         BPh8ursZbOpG5Qpmj3X4q0FwFofWK2tH6bek65vJlDbBsRgwL/SlfeU2W30FHIDsuaff
         WN7ezWJHbCWV07yPNyjqxgixcKBj1kF6liUF97Qf4GHVqfo6wDBH56uy6kFhy6lp1MhG
         h1t0xKaMkTKPj7FVGXK+2pEQiG6XlTvKL53NUXAE82sWgsAtBLf0qcSHOZ5o+Qp/4Ez/
         CZ9t3qSAJhMTJlAvKm57If1IjIFXvxaZ+aoj/WqQBSDFtr/wZSYPSIL1ETRo5M27oCRs
         Focw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528865; x=1687120865;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZR44l6M14VMT87JV+0RLddP1foqMMf6hZcchYZpmdX0=;
        b=Vp8OjyiiRucH0sBOCvsLQVSGzJ+cOSqZMsvkTZMFBofaFK78DV7NPTAVzBbtGnD1rz
         WOFpFNpIRMtzx0TL0Fk2KiXSXwaeEuPiWjLW9nyrD6xU9hLKS0ILp9uLm23R0GZO0bJ+
         RYu2KOBfIfb32qjwdKy50Lhof8YfAezLh2giMgeyr1/ehVnu+uNPRQNWlWIUyNT7iCV+
         CVfrDDtYQ39LnY9ZjfMNh1gtJSR2gl0qXBsYtUUjEReD4CSQh5RpWBvkCMC76elOj21v
         gMWOyvooLYXSgak1Z4erYVneXJVknAXqvlZKTkxdc0ePx7WjW9EnzTvw3uyrLoQCo2bQ
         bZ+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDz2nbcxASv5Zr1Lh3kBFAiG+GI+sLxp2z1VcCv+dpQbf8e0I1gy
	718Fk7opv+Qu76LJx2zUbd8=
X-Google-Smtp-Source: ACHHUZ6qScm/pOIrDhGOmvkbW2gsMX8betd+gsuzDLRD9Tzp34MKqoEIC9WIiR2mPgPJrvMMN4qqVg==
X-Received: by 2002:a05:6512:23a5:b0:4f3:a46c:6daa with SMTP id c37-20020a05651223a500b004f3a46c6daamr1486727lfv.4.1684528864547;
        Fri, 19 May 2023 13:41:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7807:0:b0:2af:16a2:fb05 with SMTP id t7-20020a2e7807000000b002af16a2fb05ls370194ljc.1.-pod-prod-05-eu;
 Fri, 19 May 2023 13:41:02 -0700 (PDT)
X-Received: by 2002:ac2:491a:0:b0:4f2:6387:e1fe with SMTP id n26-20020ac2491a000000b004f26387e1femr1187344lfi.7.1684528862768;
        Fri, 19 May 2023 13:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528862; cv=none;
        d=google.com; s=arc-20160816;
        b=z12DmVk7z0D+mdsQPSi+zlirrIOthHkcnXVNhCfXDjonO1yV+js1lhrW8NsDRxWwIR
         U3mRsH1iEl3VFkTmZ5dA9qErvgLBxjyZY9NrP4/nWOqpkpsbXVmv4aIOLj1gdkVMGTcn
         7vsJwBTXNQ0FStoUuoJSJV8JiaMX3QvcgDFu8FHJZvey7I1TxRtP7E9H3JTJALHgxRaR
         W03/tpDh8by1rNUaW7faoeaXbDe8+pbnsY3oFZx3rNwBmOeAdq1bjJuwUNVBcvV4kBxs
         i9vA1iFz2Fvhb6XXbjfc/hv+bLsOUuUaFSvgTMqNkiaeZJrw6sQnP2xbJPoEoGkuaIEt
         9EWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=d2ZYAY3tH0RmW3Fonv9yxyFJgwysjjqShVwzshB7B0k=;
        b=KTYcaxXPLEnzwBxk1ErCdWUA3brtM1b8CMg0XDzQXwqbgjRgUWKel220z62MY1rZ2V
         fsrF2dy/EYTbBrMvyjlMXgWyLCvPUisE8bYYgNQ3BbsgBh6CLO38y19UPBU3QZf3jADW
         3mDgSsDkhl0zIGkrFefW/70AaV9IR1AyCVGTWmSrlP+dYhGh+llPv5c9qucaZO4b/+Ux
         zw7yT309m7BOlwEEGXZ+XPdWZR56BD0HtNjc/HufTAv1qRzFg/RENJRkt8XHGQIZ7nsL
         qlxeolILrJaLnFpvLuVCTRrwQC9JV2VzDjv+g66KhL67wzeX+wMgD8Urc7K+29Gv+BaU
         Hkkg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id h16-20020a056512221000b004f3b2f0559asi11430lfu.5.2023.05.19.13.41.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdn6BpjzyLN;
	Fri, 19 May 2023 22:41:01 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 61/73] driver: riscv: Add vPCI support
Date: Fri, 19 May 2023 22:40:21 +0200
Message-Id: <20230519204033.643200-62-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

For demonstration purposes only.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/pci.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/driver/pci.c b/driver/pci.c
index da516479..4f52eba8 100644
--- a/driver/pci.c
+++ b/driver/pci.c
@@ -292,19 +292,21 @@ static unsigned int count_ivshmem_devices(struct cell *cell)
 	return count;
 }
 
-static const struct of_device_id gic_of_match[] = {
+static const struct of_device_id irqchip_of_match[] = {
 	{ .compatible = "arm,cortex-a15-gic", },
 	{ .compatible = "arm,cortex-a7-gic", },
 	{ .compatible = "arm,gic-400", },
 	{ .compatible = "arm,gic-v3", },
+	{ .compatible = "riscv,plic0", },
+	{ .compatible = "sifive,plic-1.0.0", },
 	{},
 };
 
 static bool create_vpci_of_overlay(struct jailhouse_system *config)
 {
-	u32 address_cells, size_cells, gic_address_cells, gic_phandle;
+	u32 address_cells, size_cells, irqchip_address_cells, irqchip_phandle;
 	struct device_node *vpci_node = NULL;
-	struct device_node *root, *gic;
+	struct device_node *root, *irqchip;
 	struct property *prop = NULL;
 	unsigned int n, cell;
 	u64 base_addr;
@@ -322,15 +324,16 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
 
 	of_node_put(root);
 
-	gic = of_find_matching_node(NULL, gic_of_match);
-	if (!gic)
+	irqchip= of_find_matching_node(NULL, irqchip_of_match);
+	if (!irqchip)
 		return false;
 
-	if (of_property_read_u32(gic, "#address-cells", &gic_address_cells) < 0)
-		gic_address_cells = 0;
-	gic_phandle = gic->phandle;
+	if (of_property_read_u32(irqchip, "#address-cells",
+				 &irqchip_address_cells) < 0)
+		irqchip_address_cells = 0;
+	irqchip_phandle = irqchip->phandle;
 
-	of_node_put(gic);
+	of_node_put(irqchip);
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(4,17,0)
 	if (of_overlay_fdt_apply(__dtb_vpci_template_begin,
@@ -386,7 +389,7 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
 	}
 
 	prop = alloc_prop("interrupt-map",
-			  sizeof(u32) * (8 + gic_address_cells) * 4);
+			  sizeof(u32) * (8 + irqchip_address_cells) * 4);
 	if (!prop)
 		goto out;
 
@@ -394,12 +397,18 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
 	for (n = 0, cell = 0; n < 4; n++) {
 		cell += 3;				/* match addr (0) */
 		prop_val[cell++] = cpu_to_be32(n + 1);	/* match addr */
-		prop_val[cell++] = cpu_to_be32(gic_phandle);
-		cell += gic_address_cells;		/* parent addr (0) */
+		prop_val[cell++] = cpu_to_be32(irqchip_phandle);
+		cell += irqchip_address_cells;		/* parent addr (0) */
+#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 		prop_val[cell++] = cpu_to_be32(GIC_SPI);
 		prop_val[cell++] =
 			cpu_to_be32(config->root_cell.vpci_irq_base + n);
 		prop_val[cell++] = cpu_to_be32(IRQ_TYPE_EDGE_RISING);
+#elif defined(CONFIG_RISCV)
+		prop_val[cell++] =
+			cpu_to_be32(config->root_cell.vpci_irq_base + n);
+		prop_val[cell++] = 0;
+#endif
 	}
 
 	if (of_changeset_add_property(&overlay_changeset, vpci_node, prop) < 0)
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-62-ralf.ramsauer%40oth-regensburg.de.
