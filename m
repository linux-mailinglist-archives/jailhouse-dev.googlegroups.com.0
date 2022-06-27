Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNXB42KQMGQENG5DUWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C8955BA0E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:26 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id e8-20020ac24e08000000b0047fad5770d2sf4729842lfr.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336566; cv=pass;
        d=google.com; s=arc-20160816;
        b=jmpJMpau75rfTrTTpugI4imVwiNyF2+KGiPSDeD/HQJ4snmfjH0QXqhWHJt54ZP4tN
         xLEQ3kBrGldnD+MVmuw5twxqAiU7QT2SbrwmaovPaisPcm2DwvUfynmeb1LiS0iHxKxh
         mBOpwhFcqsuYrRrrAL5kj4HZ+LVjSVzHLCsiwUaTPlCX5BcdsEmr9T0BsjpOBRAH7qYf
         ndEy4tCq4fiiXXFOKXxnizeVl+zHyFSLsx5XBDExA3t/00lM9B+4seEswPA3ZwrP0vUK
         eAkDj9yjMdahOGC6glsHotT8QHdZUSnefDjSPaFqSKrA5JS+W/FCPCZoIjlKLATZf9OG
         KaHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Ohuap8phoxCCK5oAPl0L5580rg1/xDYSpodcBX6CTUQ=;
        b=MXKqAnrrkfOUSAqSDtN/phdhidIGKHQ4unoBLjah/x7DCrPlwYOM8Tnb14SG8VVGti
         qkwXzO4Rx/IUYplokOdH6iozi0xmA49WR3RfDXRNcF+8N58/lhHGVDsPAQoGQ8GXkXZY
         HYx/t7qrxBzIazkxtbw/UwK1rLw4DnlIh/39YG/Zx+yGvQSQZ7RMN8yZO1m/F069Il3O
         /7hBE4IEfQ3bORS1/dS1Ak2xJcP8aMgb1T6Lg4jQYAKEVHJtnQk9Wvro1J5YFDgBFTxW
         by2AKm7neHEcAMPpcx4S1EmlpfczjazFDu++YNWcyiw6SEkuyvSewIp3LDa3RW7GClVw
         Dkfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=axTqjChs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ohuap8phoxCCK5oAPl0L5580rg1/xDYSpodcBX6CTUQ=;
        b=S7g3Eu/XKS6Cc5O5KI6pUExSLf5tSc0NnmK54Rd6IIlSEucEkJHZlq7Q9YFmB08aBN
         cKm8MEcvEP3ITehDxSQ8VZFanCdKSUh/Aqja9gT05c25vBaVYWxCm189NulYo0CtCYrd
         cIv/4d99CFhRtC32GapVSD+FLdvoJgE0l/DgsFrdggN6UF+NpNgf89khkv6LuvzRX9hR
         ZQLN3e01NsIVJVq0Li7U3xamIFuRKK5q69Ss0Y96KWiMKzq4y4LD2lRnoLuaxBjhIFSY
         cpsMJIyxCgLmCm1GQWXGiC4J6BV6E6A06yu49QQ7pT1ekvvEcL8r+kxRFKYHAEqRjrxW
         L09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ohuap8phoxCCK5oAPl0L5580rg1/xDYSpodcBX6CTUQ=;
        b=cRyHKc5InDNkwFCACdu91wIw1CJwDA0wijoIfh5SRII9pmLeCrPp71ogGYtEm3ekYj
         uoUpS5QImW812b23MfjiMA/PhPc5NwObQCRUEAFpIxL18fnvVudoA7nsHYZha4ueeGoh
         Yoduk/KEqF8LjgMxYIxgR9reAdRfj4JT6W+yMK4joIDDPD7631dTEvSBFNjNYdyTNIwK
         BBubU6hBvHn6KpOwbr3GcKA2J+cAEi1CRgUCaCELd9oUoL7d6/MZxUhI8o6+Sr6HJ8eS
         ERJj6OywUeamCbUM0i1vpbE+FI4wuIQEZQ/bIc1lP3DcEOzO1tELZwYiN6ESAiXjNjCl
         df1A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/qe8N0HxEnxjKSK666pgPaqLMFXuVwcuv+AfYknjH2uqooBxkS
	409NgudHljVc+SUsKOJiTVA=
X-Google-Smtp-Source: AGRyM1s7BaXemBQR2DXDWUziUG4HN3hNdI1GgJ5OvgsvD5nHghhu2LShi7inuKyIqzUvk3DvRYohRA==
X-Received: by 2002:a2e:91c4:0:b0:25a:7256:a7aa with SMTP id u4-20020a2e91c4000000b0025a7256a7aamr6745359ljg.344.1656336566502;
        Mon, 27 Jun 2022 06:29:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3b0c:b0:47f:9907:2b50 with SMTP id
 f12-20020a0565123b0c00b0047f99072b50ls214568lfv.3.gmail; Mon, 27 Jun 2022
 06:29:25 -0700 (PDT)
X-Received: by 2002:a05:6512:3d08:b0:47f:79a9:66f0 with SMTP id d8-20020a0565123d0800b0047f79a966f0mr8472025lfv.576.1656336564936;
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336564; cv=none;
        d=google.com; s=arc-20160816;
        b=Ia7OTdnnwuYlsw2dlfqLJwKLf1LDyVhP30nWZBBZTGy+wfEWmQ/1go9qelGqbKGMNS
         uQuDyZdmXhcJE+D7l0ZYZJ5K6DjDNM++2aJ0WnwO8PYSPiHcK/2DBrMosxxW27ZfiWiz
         fZ/5y0kFxEKapIjYf4IFs3MjOsJ1p8CQwyazWgtYHxviwtPY8gb0kZ2PJjckdKTsUAt4
         /ihN/dixZYdydDzHmhk/zsDhMaitmLDgWLJQHs4252A1llfzA2sTGJQPNuas3XCDNDvF
         JTJH/isHU1UaMrZ2LBny3KO3nWpTViCe3i4sTBh6yGiIWBragzuoJk3ShzQ90v/QpIvp
         44sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kWhde31QhLhE1z+J2GSiHLsrD0hqYjaTdDyA83Wx5ug=;
        b=rCOFKCb9BQRwQrE3zSXNiiFmFjljf8Bk2sds6m+p29WLpKiIoAO9Y/T3PGFGa8nTgx
         SN5tbo9PlHmr/fkKes/Lb1BWnSVmrHCtwvS3sulS1w0dHcISWI61Zvlv+YuCx+SoOhl/
         T881aEKbWE8K9RubnnglqFOSBixQahXt5rznHabdGiNNHaGOHs2eQf7dRcXpAIL4lCJm
         cntn6sMFi58JAfp0+sb4824NQ5+kaIKVhmYWSAERrKv2mgCoHd0IMx8HpIVX1/YX4eMZ
         VmI8fF0hM7m567UTQWDiG5ToU54KHDJM2aUhDx9I871BSMSON/U413+wYOP7lql+/AGQ
         GAww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=axTqjChs;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id o9-20020ac25e29000000b0047f8e0add59si488960lfg.10.2022.06.27.06.29.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVD2qqqzy4t;
	Mon, 27 Jun 2022 15:29:24 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:24 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 42/42] driver: riscv: Add vPCI support
Date: Mon, 27 Jun 2022 15:29:05 +0200
Message-ID: <20220627132905.4338-43-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=axTqjChs;
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
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-43-ralf.ramsauer%40oth-regensburg.de.
