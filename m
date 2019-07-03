Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA7P6PUAKGQEQLRIDYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D35EBCD
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 20:44:19 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id c27sf2286775edn.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 11:44:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562179459; cv=pass;
        d=google.com; s=arc-20160816;
        b=dgG/VxZFyBDxqvFMZdGDNqFPiabZfUUx7Ihi9vnJ1g4vICKoqH75csoZV6A7MWl9ff
         jaxrw/0j8JozvlKCP6viuKVQ2S3sVidr27hZoP1QaLu05k7ldZy9ppcIpmKoas1fCR6B
         WDy2Le9gJaMQ6qkkp9eA4KcH1ZcGQ8l4ojfz54Gms6F3NAU04gOHwvN3Y8orvO41E4h0
         /S9jAFKYSh9M41JkkIWQHsZkn6U19AHK5/LhvsBVIT6yH6H8SwcJHybw2z+ofM+rHLk8
         pNsNvRlEfBCFsRvSYpIfgo+mdUoc+cCWD6ud1Xr5YxVayFsS42+iMWY86IxslGUSMKgj
         /OIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=FNh6GQGuvrjIApJvqAO034gJc9kOLOR1z78Ds0UrN4U=;
        b=nAj0+ke7oFGVQFjAT1lDhZ6RGvjtmy97B6lGOPiVatmAwzi9qsHFprkHyIpdlriDZr
         /rzEdXh13TT1SyvWz+bmwahzgPpC7KzCjEqvO1bA0nDOWyiQSntQMYtf7jMz4FJWSNso
         VzEYbUPufeced7YuRGn7MF+Dh8Y8Ci0FmnweiaPasgXwKNZu0d9qyKrTQ4EAAtB+Rzw0
         hCz+x5BqNiPZSf0NGz/WZ2qXgQEEYmO7f2IhvFg92X3jcz+Ij9fFJ4NyYTba+BeFU6U5
         vqfrS81hE+hfHZJCIF2dDjV/sqwsSd4fnOTwXqFFkdtMAYxzF8XHaFevQ4T56QHTTBKM
         c4FQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FNh6GQGuvrjIApJvqAO034gJc9kOLOR1z78Ds0UrN4U=;
        b=NvQxL1XMdRBMCb4cvOTAF8TlJoWyKZyMdSrr3N5LZoSMYxOoS4pMzeG7zQ+2s1EQ6u
         vfMfFLb4h9cO0EkREyARP+osNKhr+eVaPVBqFNqd9s8dEP2gJlYhEay9lFBldw9KDhne
         TmYx6An1/jF2dLJQ+F5WYUK2Nx3T+5yYlsUIIbtI15ImpzzcHJgPG2mF594/arIhJCEZ
         vABCprnPcbHzcSBRZHrI07npMycPwxxgk4j1dY4Qb1ZrvIorVaM+6WCF1IVEa4nKpg3W
         8Sq6QmpkxcWCAB9oLhW4QTTyiAlzmEh83+tuoPy50IrXs19uQHhYZ09kCoQcSQElKkh/
         WBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FNh6GQGuvrjIApJvqAO034gJc9kOLOR1z78Ds0UrN4U=;
        b=aEwN/zeBh5Casf4b4a8EdOj8SI38KLNNVsWAiZekChafyZ+5/7WzoPvpT4I8Tma0oT
         twzNzxaIVB8azA5G6dr5rKJW2hRziiIg2qRzEmNJYluv6cdcIJWw9s2x8RnUhSsH7hgt
         FXWkjlpGFYpPn3FKttiHBDjtnr/f8MAc2oEcmS61tNg4XRoIr2QT+hioTiheQwPXRCSq
         elCkWihZc0HBiJcROsrP6Rm9ugAeP6H4QhqKaUb7wo4pA4MucWyBq3jKpoWYFwE29VBv
         nNOIRwWnKHTJC0iVe0HHG1ICHCOUOVEGKYCWt/IfR83jyvuhrNcuNbJSg4JeSHa+Wo62
         BKug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU0eeVFHdbK4Ftb8VNrS3Xx5OPhhtD8y1MQN/gqCckMumOsMTHU
	qdBcjoLja8N+ujkDChxq5Js=
X-Google-Smtp-Source: APXvYqz33bw3qcEjFL4K+E6ISusjmHoIbzhOY0Z2lK+yQxSjlrz2/Bi9XDvPkecilgeswt7Hl05nFw==
X-Received: by 2002:a17:906:7013:: with SMTP id n19mr15404928ejj.65.1562179459095;
        Wed, 03 Jul 2019 11:44:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:620f:: with SMTP id s15ls660581ejk.15.gmail; Wed, 03
 Jul 2019 11:44:18 -0700 (PDT)
X-Received: by 2002:a17:906:7d12:: with SMTP id u18mr25010179ejo.24.1562179458517;
        Wed, 03 Jul 2019 11:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562179458; cv=none;
        d=google.com; s=arc-20160816;
        b=sZsW/UUCqencfj4tpVa/2H2XOTZu35q0L8JHqVvxEBFRp/m/J61P/8yrAL2ATIM5Ll
         Eq+LVwIKMeXw3wXwheCB5gR7fXBmZmaIpKzTHFwwV75FUvVOOKUG7Oq9sphKlHst0WAP
         ASQvF9Njct6LKInklgWV9ZeSaiBVyuQ5DPc6ccW8GwD6SjBqAyQI9fFwDKyo+rrLZx3M
         by6LFTpUnOr9v1vHJrf1UGFl6swsO12Y9D7idkCiM3sAAJwbAcbA/GrlY9Bok3GbSWbT
         2H/AgI6yz+VFboZ9gYNbIgnt1VcH8osTEusIQOFIGPCvt5Q26uHtFkuDRHt2okXWqDHO
         Ghzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=JzsqMWjhof5qMZzepE8DckGcmTzXFrEK66loDD+TTe4=;
        b=i49d/p3RA+8r8htTl9+/+Lcm9ieVwktgPl5F6GrixCne3rOK1IgwsbDw3yKIf07z4v
         mAbSlEhjUEYlqPUV2CoyjrZzmcWOZSxk3H+XGNe57/YPk6ctapO0/rPPEB7vZ0J9audn
         y3hCtWI4BfibzU0g6GZaVEGGtspzxZAZHE+8LpZpUtXZ55QAwxQwuGPW/F14vhHE31oj
         3gxqLYLZiMV2Z8t7vGZmTinlSvaZf4IdSOAnHKMDlgjBbsm1k3+HvvDpcYY2X1qdqPIV
         lvCS+brxLPkIz84gbHnIkjUI073RO6hYyM0H3Eu8ArxcM6/XVR+VqKlxvzHnvAY8+ZeV
         K1Qg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a41si150398edc.5.2019.07.03.11.44.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 11:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x63IiII9000368
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:18 +0200
Received: from md1f2u6c.ad001.siemens.net (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x63IiHF9023455
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/4] driver: Adjust vpci overlay to new DT overlay rules
Date: Wed,  3 Jul 2019 20:44:14 +0200
Message-Id: <e06e6e12b6873d054347d628361bcf446022f5d9.1562179456.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562179456.git.jan.kiszka@siemens.com>
References: <cover.1562179456.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562179456.git.jan.kiszka@siemens.com>
References: <cover.1562179456.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Recent kernels reject our root-level address-cells and size-cells
presetting - and they are right: We were overruling the the settings of
the base DT which only worked by chance.

But if we cannot set those values anymore, dtc will start complaining
about us relying on undefined cells values - nice. So we need to remove
the ranges property in order to avoid that. Then dtc complains about
that this PCI host controller node is incomplete. So we also remove the
device_type from the static overlay. Even nicer.

Now we only need to add the missing pieces to the dynamic part and
account for the possible address-cells and size-cells values.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/pci.c             | 62 ++++++++++++++++++++++++++++++++++--------------
 driver/vpci_template.dts | 14 +++++++----
 2 files changed, 53 insertions(+), 23 deletions(-)

diff --git a/driver/pci.c b/driver/pci.c
index bc02629d..601e2d96 100644
--- a/driver/pci.c
+++ b/driver/pci.c
@@ -302,14 +302,26 @@ static const struct of_device_id gic_of_match[] = {
 
 static bool create_vpci_of_overlay(struct jailhouse_system *config)
 {
+	u32 address_cells, size_cells, gic_address_cells, gic_phandle;
 	struct device_node *vpci_node = NULL;
-	u32 gic_address_cells, gic_phandle;
-	struct device_node *gic;
-	struct property *prop;
+	struct device_node *root, *gic;
+	struct property *prop = NULL;
 	unsigned int n, cell;
 	u64 base_addr;
 	u32 *prop_val;
 
+	root = of_find_node_by_path("/");
+	if (!root)
+		return false;
+
+	if (of_property_read_u32(root, "#address-cells", &address_cells) < 0 ||
+	    of_property_read_u32(root, "#size-cells", &size_cells) < 0) {
+		of_node_put(root);
+		return false;
+	}
+
+	of_node_put(root);
+
 	gic = of_find_matching_node(NULL, gic_of_match);
 	if (!gic)
 		return false;
@@ -348,6 +360,18 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
 	if (!vpci_node)
 		goto out;
 
+	/*
+	 * Set only here to suppress warnings of dtc when compiling the
+	 * incomplete overlay.
+	 */
+	prop = alloc_prop("device_type", 4);
+	if (!prop)
+		goto out;
+	strcpy(prop->value, "pci");
+
+	if (of_changeset_add_property(&overlay_changeset, vpci_node, prop) < 0)
+		goto out;
+
 	if (config->platform_info.pci_domain != (u16)-1) {
 		prop = alloc_prop("linux,pci-domain", sizeof(u32));
 		if (!prop)
@@ -381,22 +405,24 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
 	if (of_changeset_add_property(&overlay_changeset, vpci_node, prop) < 0)
 		goto out;
 
-	prop = alloc_prop("reg", sizeof(u32) * 4);
+	prop = alloc_prop("reg", sizeof(u32) * (address_cells + size_cells));
 	if (!prop)
 		goto out;
 
 	/* Set the MMCONFIG base address of the host controller. */
 	base_addr = config->platform_info.pci_mmconfig_base;
 	prop_val = prop->value;
-	prop_val[0] = cpu_to_be32(base_addr >> 32);
-	prop_val[1] = cpu_to_be32(base_addr);
-	prop_val[2] = 0;
-	prop_val[3] = cpu_to_be32(0x100000);
+	if (address_cells > 1)
+		*prop_val++ = cpu_to_be32(base_addr >> 32);
+	*prop_val++ = cpu_to_be32(base_addr);
+	if (size_cells > 1)
+		*prop_val++ = 0;
+	*prop_val = cpu_to_be32(0x100000);
 
 	if (of_changeset_add_property(&overlay_changeset, vpci_node, prop) < 0)
 		goto out;
 
-	prop = alloc_prop("ranges", sizeof(u32) * 7);
+	prop = alloc_prop("ranges", sizeof(u32) * (5 + address_cells));
 	if (!prop)
 		goto out;
 
@@ -406,16 +432,16 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
 	 */
 	base_addr += 0x100000;
 	prop_val = prop->value;
-	prop_val[0] = cpu_to_be32(0x02000000);
-	prop_val[1] = cpu_to_be32(base_addr >> 32);
-	prop_val[2] = cpu_to_be32(base_addr);
-	prop_val[3] = cpu_to_be32(base_addr >> 32);
-	prop_val[4] = cpu_to_be32(base_addr);
-	prop_val[5] = 0;
-	prop_val[6] = cpu_to_be32(count_ivshmem_devices(root_cell) * 0x2000);
+	*prop_val++ = cpu_to_be32(0x02000000);
+	*prop_val++ = cpu_to_be32(base_addr >> 32);
+	*prop_val++ = cpu_to_be32(base_addr);
+	if (address_cells > 1)
+		*prop_val++ = cpu_to_be32(base_addr >> 32);
+	*prop_val++ = cpu_to_be32(base_addr);
+	*prop_val++ = 0;
+	*prop_val = cpu_to_be32(count_ivshmem_devices(root_cell) * 0x2000);
 
-	if (of_changeset_update_property(&overlay_changeset, vpci_node,
-					 prop) < 0)
+	if (of_changeset_add_property(&overlay_changeset, vpci_node, prop) < 0)
 		goto out;
 
 	prop = alloc_prop("status", 3);
diff --git a/driver/vpci_template.dts b/driver/vpci_template.dts
index c900dd3a..01f816ae 100644
--- a/driver/vpci_template.dts
+++ b/driver/vpci_template.dts
@@ -3,18 +3,22 @@
 	fragment {
 		target-path = "/";
 		__overlay__ {
-			#address-cells = <2>;
-			#size-cells = <2>;
-
 			pci@0 {
 				compatible = "pci-host-ecam-generic";
-				device_type = "pci";
+				/*
+				 * added dynamically:
+				 * - device_type = "pci"
+				 * - linux,pci-domain = <...>
+				 * - reg = <...>
+				 * - ranges = <...>
+				 * - interrupt-map = <...>
+				 */
 				bus-range = <0 0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 7>;
-				ranges = <0 0 0 0 0 0 0>;
+				/* set to "ok" during dynamic update */
 				status = "disabled";
 			};
 		};
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e06e6e12b6873d054347d628361bcf446022f5d9.1562179456.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
