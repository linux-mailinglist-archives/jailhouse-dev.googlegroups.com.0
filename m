Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB24GRGPQMGQEO2WT3ZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A468D69B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:19 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id l15-20020a056512110f00b004b6fe4513b7sf6304936lfg.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772779; cv=pass;
        d=google.com; s=arc-20160816;
        b=N3e67HNv9PKjMy1rXuCTq1Xq1XCU7HP2pgW+TEwER/rUMK3P303a79smVrkXA7DYQv
         TZhlq21YhZOD3OyCes2ybSYsCHtLkbwGdNV185zGd2u+PxfC9z/3GKPXivNjW7NllrP/
         AztP5Z7p4HkpFZeYd1LncntEjgBBLtY6OPJkw7q4KN6Y8/xqhirBoAvR4hweK5ExrUjs
         1RX8xTAed1MoYxmogK6461sM8Fduu+zit29Pv4WK0BcYDOaH9yb2kHwh6BcTqLutEkHT
         qyxrL4DPEjAqI3zt8vHc3eU7w6pulTN181bTuRAewkaZLLTF7PHkD64LamXICgHtahB4
         XOrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=rl91LRZfXaBBbLf4IfTfKCWEK4qFDvqSlxQM8ZnjYxQ=;
        b=YJiop9WHDSzI6JC19CghxeRF2S5VGSP6B6hvr7U4P9PYCv++qiKH9EueSmkqT/ZRO9
         OXBrTAIi3+ZS3zAezCAzDmjr6Q/xI2w+1Zp6DyAukTo7bnuD1kd4qSGvEoKKypHKrizv
         owGcCNroADBqZwXTbVOlQAZNHBNOUuKAYHMQMt0/Kk4BZZISpseFn9Iw86riMfejINoy
         W/wzKBeZh7hPu7HFuJ+HKwuMkTxYot6lE5W2FnMz6WAPChimzrXr33UtuRz1tjRbTU5Q
         /hxR81D7SIsS3WnPWRF0A8nJY1gjsE3wjvYVZdLxH9j2c0qcxmTEKF8XHKi5/1Dt9yVh
         XKDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rl91LRZfXaBBbLf4IfTfKCWEK4qFDvqSlxQM8ZnjYxQ=;
        b=TSVXEfYJ8J4klw7Nu8L0obJ9znTLd4OfG/PPXZOfAx21Uwld99noIfE3hx1Ldr27eo
         q38EpDAWgoMuMfkYL+n/LekrdxV+Snag35FUUXvpu560Wr7mk4bezMLersCbBNUSidoK
         P2jCAdEBHYwZXAC71iz41EeckJOeQ/RifmPYKkUHVwzco0Y92Ck9QY0L3DeeaWnM+JMC
         SD8+YiGO/nxubbZ0BNHvPOoTIg/nF8EbIbxKp3LBQxef/15yxOi0GE6tK+jZoEleSRhy
         l3I+m3Tv+45ILGx++LyS2diINo5rd9n//EkvJAbztfu01bB0f7ybowOcI99xWjmCsnb5
         M94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rl91LRZfXaBBbLf4IfTfKCWEK4qFDvqSlxQM8ZnjYxQ=;
        b=xIxnQPTd3arVcIKHBktFir5twjRxr1qx0lPndaGExUopdA4goVBvJgP5Ync8p3up/s
         fjKxVmOOPgd/fZYF0FBGwNaUCJpYhV4NKTDW+TZ0D8pyRN6JqSmsBFRwK0UVxvwUPdUW
         KMInsrvrh8UtTbEK6FPckYeOkSdzZeBfnWZz5+EYChreK4/rs26d35dRnmkE4jcU9Zio
         DhFIlak6wRmjqVi1noa3xEmamvi0UkTJ6TirfhDgVOf7hTua8Cy5nOq2qwrDRfFy1NEA
         sR84MKQiT1p9TwlauwquQl85ersTwsFmInES9y6zXSc+HKRcBNogkzLu3FE+PDBTnodg
         W4Tg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKUysIYZWEMbF3tW8rkXlb524H+AEz+VxbSH77AEbwLXF69d5EC/
	4Z8sTreozIla+ZSPWD9umjU=
X-Google-Smtp-Source: AK7set/uQaRftzSMne0FT3apcwI5H7cDa721F3pycmCUnL9tDILuqkJ9C6afAxcct67xxxS5y+1Rlw==
X-Received: by 2002:a2e:9798:0:b0:293:1b75:d74e with SMTP id y24-20020a2e9798000000b002931b75d74emr241553lji.205.1675772779625;
        Tue, 07 Feb 2023 04:26:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:221e:b0:28b:d53d:2e29 with SMTP id
 y30-20020a05651c221e00b0028bd53d2e29ls2092604ljq.2.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:17 -0800 (PST)
X-Received: by 2002:a2e:5359:0:b0:290:6cff:257a with SMTP id t25-20020a2e5359000000b002906cff257amr777816ljd.25.1675772777747;
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772777; cv=none;
        d=google.com; s=arc-20160816;
        b=fAE0uDq4rDjMaGkwpOG7rRuPeDrGAakj+1UP436AtPERvlQoZ5FzMepMVY2/TRh6xm
         c1UT4Syvt1xMZByijUrECl9o8dwtVq2HhxE12T29/1nfaJO0jjkrFz8FmJ1Hs0iyUIyg
         hBEwH/e/44o+G96xtVghFDA2iMtF9MonH3pfu3IJ9aiRt9S3NrPNjA/97d0SJrWyENpK
         Pzw+YWKyYSZnhcFY3/XMlM4SK/UQI19Yg9QDIxEWj7GjBkjehuPkSdqeF9WnnSYTiuhS
         dOCJbbPW9ncA5Hjk3LaZMHpsAppHNzNOCDao/yfS1LbIG580QyeOmuzf9CWOECf09lE0
         rVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=opXrAe9bW/hYYpNsB6ztd1c+l2OsLmrDUbxyB1udr0U=;
        b=Nr32cAy4FDme7rqpHkZzjxo5bTEk+xkkJJ1/AqefXosb/hNmvr+CfQBpIBKSCOcZya
         AvPnJ7xECmI894CKYGkdUK/+WKOC8Tzr8HB0Vs+B6+MzxfnTiVY9tKyHzF3HlgmbpYAM
         wTZgpFl9qqTOSeku/HBkWacOw9IwTkH2LROgzCPsBMG1kZkP9Wm9IeXUJVFkH0hBadip
         sme65OvnAVBpIjmn+2/9jQIawidYLYlZoCuGIL/9cO8Ux9XiuJC3ZddVdGnfvzHLdhNF
         3mqzjK37TCuSksI8ttzR7v3Fa3Ay7zemk4lszH0r1u43na3r8xUqrfsx1u76dwRqjvz5
         0lVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id i8-20020a0565123e0800b004d5e038aba2si609567lfv.7.2023.02.07.04.26.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RX75Wbz1081;
	Tue,  7 Feb 2023 13:26:16 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 42/47] driver: riscv: Add vPCI support
Date: Tue,  7 Feb 2023 13:25:38 +0100
Message-Id: <20230207122543.1128638-43-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0,
 __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-43-ralf.ramsauer%40oth-regensburg.de.
