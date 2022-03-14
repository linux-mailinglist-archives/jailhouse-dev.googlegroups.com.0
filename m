Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBNF3XWIQMGQEUF3BERA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd37.google.com (mail-io1-xd37.google.com [IPv6:2607:f8b0:4864:20::d37])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1574D87F7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Mar 2022 16:22:29 +0100 (CET)
Received: by mail-io1-xd37.google.com with SMTP id e11-20020a5d8e0b000000b006412cf3f627sf12477013iod.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Mar 2022 08:22:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647271348; cv=pass;
        d=google.com; s=arc-20160816;
        b=p1ZHIjNR1SEEctiS/TX9OKtZty7gGCSX6INIMBB74sqPpspFjk3bAaAKEgsBNTg+DN
         rddCq4jeY468bdBNWtBkVlgChuUppDNAKUvfzuLm7xpkNbQfVhIm0bJnC5Rv6ZNLbuBg
         7srUQesiFuiYzpOzpSkMAg4GjzUUnO13FRmSt7w/0NhYxC37xojOen8GIPXFv1sRep+i
         75yTdtr4SXLf+4XPSYmTSdjsbZXd/rai/1ZIDEEykR7AlosLrJPkKbu9KvuB3GYBZmsT
         agie4m4ZSVVMvZ3UMa56tBOX7B5wICvuISJLjMrFkekhfA4yp9tqhgW1X6Z7iVqMIzof
         0XDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=3FrDTCUD7tWjhMaKWKdDh3xlewHct/eyJIa1cPr4DXY=;
        b=yjSNzL30iLICus7leE+NXxFjvo3T2a6xTV+SSlYfoBPvhWRXfIX6ko71PxVntpSz49
         v0FfWLj25GREnux62794u80Jy2chAir5hBi4EetMp6PjPvrG5Cz73QzxCrJ54V3kua0b
         rxensrqLTnF/ezNv6/bcRqRj2FQ0omEY05IbdQDz8Pu8vN8h4yBHJGL79typAuj8PM58
         tj4FflespBO58N/R54zKc9mqAy94sneFOg3PvUnR45i71LyNsWONUtQ8aeP18YbG8knr
         1ukthd5rmod1RWgknTpoYRUuVbX0J3jZvGT1fh7Y6K2CEdwGDF3iYOlG5OgK9h5Zekti
         Ox7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="XV/swQC4";
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=3FrDTCUD7tWjhMaKWKdDh3xlewHct/eyJIa1cPr4DXY=;
        b=AE6T09WmWq+ZXUv3rcLXGIQdMTuqJAMxURakhsJSypbZ2MFI/ICwZkR5hMKM96kPjZ
         CFfIy69M7QM5ENhB7m/uLlMbB5h1hn8hF8FabTPkugCHpslNJxkN27L4+M4qJ9SyPFYC
         aQ7W8+jc2lSkaA1in8Z3Hs0BdB664C80SezR1aXYAZhqh4KgwAJTTUsr85Ayp+hD7oy8
         jaTwiaQQqsF4jGu6I2z0K94oGnjWm1SyMgSspcT8toNxKiVDwG8EjIBvslHsJfdaO+NG
         DiUupC6nwHUSDbTl/gE+lEssr8At93DF0DWGVOwV+3Dqo51YysqK6wMK9S+MKesAP3o5
         XLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3FrDTCUD7tWjhMaKWKdDh3xlewHct/eyJIa1cPr4DXY=;
        b=Gohk8zyHpmc1iiFupTGXK84EiEy5VDy0NFeAYZL04ONKTzydcRiTq2y0xIdh58Z/bu
         g/78y+C0lJZqDVr7EXNX5OEo7/E+ZwDzMb9y5L0gxku4r/hf97kQK/Pl6fh1kYZZTb6S
         9BXS8amfChSduDWqSyPwV+ylYQ78w2OlIXuUNi3T/eNbl8/wfSgA3fuDMtsZqK0K/Nzt
         7e82fraTWXAKRViTo824GsW6M0cOy37SeLsFcvaJKfo7gqaPOlPqmaJesUG9otTIKup/
         EF+mKUeoJ8KulNVgf9pN9dPG6XCniULqsR6nOvNURIkxChmVFAx67YmNeVF1ZKynN70H
         5Uag==
X-Gm-Message-State: AOAM533pFcY/wbKM/6cKhVUrQgPsUZn9GGyp/E8o55KSCES6Zkf8ARVM
	O27Jbw3i4NlPMYq4JXTkwF4=
X-Google-Smtp-Source: ABdhPJwucV9zkyAHhRJwTAhrzZDecr6w6VbfT1uoTIjIbsWYRgGMttl1vBdr93H7MWqshtds/C1i+A==
X-Received: by 2002:a92:d68c:0:b0:2c6:24a7:5017 with SMTP id p12-20020a92d68c000000b002c624a75017mr20179817iln.216.1647271348520;
        Mon, 14 Mar 2022 08:22:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:ced2:0:b0:2c6:4aaa:95d3 with SMTP id z18-20020a92ced2000000b002c64aaa95d3ls1552707ilq.9.gmail;
 Mon, 14 Mar 2022 08:22:28 -0700 (PDT)
X-Received: by 2002:a05:6e02:12c4:b0:2c6:5533:1e66 with SMTP id i4-20020a056e0212c400b002c655331e66mr19216366ilm.73.1647271347926;
        Mon, 14 Mar 2022 08:22:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647271347; cv=none;
        d=google.com; s=arc-20160816;
        b=IXT2gY0/Pc5L4l0yJnOPQUPeWaUr82zuRDTQOolINIEDuHaR7hZClmo1/jo5oeKdM0
         258KuQ+J41ttVcSgSpoNif1ml8af2VJvsCf2pAiwvgcfMFkTsY65EjZIRFSUMwMAPJ7W
         eKhZY87XrpN3+0lD9S+p8sx8TsR6c7mSN2NVFVBa2sNqnwZ/1jl7BrpHPfb/PvFoj51/
         mlA5NE3OZMemSitHYA9fQFhdwY4H5z54XUMSeiphzLOJgabtf/KCvBiwQ9mbwC820HKX
         4Li3DY00KflAWWEqj3KXMbJ6XRdshV3qpFzuuP4aTnD5QJYLZMMfgZmh7FircPs2ZPMy
         6e3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=/F7SrBeBbaGHcOlOpskXftHcPM3gRMXhOkWab+ccsaE=;
        b=x7+Z2phdsHAyXI8DL0R5evCq1Ux57ryX0Xb7kP7aMcGWeloEVGxi2x+L7EEg1BfoCs
         5m9kudPpcTkE+cDyEnSyRmDQgITRI1qxG9MjTDvsh9aW426JcWhtsCLHl7y1e51yezFj
         MtH7VsRnpzf6gP8nOYyvPc1qhTDj2Rgd53C7YmoEEcoZq4QNcL8p/OvxH+tFGHMVwXrB
         sycUle4BawQ/SLTeON9s11WYVEENCTtr1ndvJVEVXVLfS2/jfabRYSpxu5p7Pl3e9KQs
         QCJei00Ht/wW3jDDk6b4s8hYUpROtvEKJnR6VTPrxoGF37M8TWu/SK+9s7GyvBwRkUer
         2L/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="XV/swQC4";
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id u25-20020a5d8199000000b0064066eda410si1753114ion.2.2022.03.14.08.22.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Mar 2022 08:22:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22EFMRkK041451
	for <jailhouse-dev@googlegroups.com>; Mon, 14 Mar 2022 10:22:27 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22EFMRw4117721
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Mon, 14 Mar 2022 10:22:27 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 14
 Mar 2022 10:22:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 14 Mar 2022 10:22:27 -0500
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22EFMMLi066469;
	Mon, 14 Mar 2022 10:22:23 -0500
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v4] configs: arm64: add emmc inmate configuration for k3-am654-idk
Date: Mon, 14 Mar 2022 08:22:09 -0700
Message-ID: <20220314152209.5859-1-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="XV/swQC4";       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

Add eMMC support for k3-am654-idk in a linux inmate cell using
CONFIG_AM654_INMATE_CELL_EMMC macro, and respective device tree
changes.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---

Changes from v1:
* Split out eMMC enablement to its own inmate configuration

Changes from v2:
* Recombined eMMC enablement to one configuration that is enabled
  with ENABLE_INMATE_CELL_EMMC define
* Dropped patches that were already merged

Changes from v3:
* Rename ENABLE_INMATE_CELL_EMMC to CONFIG_AM654_INMATE_CELL_EMMC

 .../arm64/dts/inmate-k3-am654-idk-emmc.dts    | 45 +++++++++++++++++++
 configs/arm64/k3-am654-idk-linux-demo.c       | 22 ++++++++-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 configs/arm64/dts/inmate-k3-am654-idk-emmc.dts

diff --git a/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
new file mode 100644
index 00000000..150e31fe
--- /dev/null
+++ b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
@@ -0,0 +1,45 @@
+/dts-v1/;
+
+#include "inmate-k3-am654-idk.dts"
+
+/ {
+	sdhci0: mmc@4f80000 {
+		compatible = "ti,am654-sdhci-5.1";
+		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
+		power-domains = <&k3_pds 47 1>;
+		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
+		clock-names = "clk_ahb", "clk_xin";
+		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
+		ti,otap-del-sel-legacy = <0x0>;
+		ti,otap-del-sel-mmc-hs = <0x0>;
+		ti,otap-del-sel-sd-hs = <0x0>;
+		ti,otap-del-sel-sdr12 = <0x0>;
+		ti,otap-del-sel-sdr25 = <0x0>;
+		ti,otap-del-sel-sdr50 = <0x8>;
+		ti,otap-del-sel-sdr104 = <0x7>;
+		ti,otap-del-sel-ddr50 = <0x5>;
+		ti,otap-del-sel-ddr52 = <0x5>;
+		ti,otap-del-sel-hs200 = <0x5>;
+		ti,otap-del-sel-hs400 = <0x0>;
+		ti,trm-icp = <0x8>;
+		dma-coherent;
+	};
+};
+
+&mcu_uart0 {
+	power-domains = <&k3_pds 149 1>;
+};
+
+&k3_pds {
+	#power-domain-cells = <2>;
+};
+
+&sdhci0 {
+	/* eMMC */
+	non-removable;
+	ti,driver-strength-ohm = <50>;
+	bus-width = <8>;
+	disable-wp;
+};
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index fdf5fea8..3937dff3 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -23,7 +23,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[17];
+	struct jailhouse_memory mem_regions[19];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -112,6 +112,22 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
+#ifdef CONFIG_AM654_INMATE_CELL_EMMC
+		/* sdhci0 */ {
+			.phys_start = 0x4f80000,
+			.virt_start = 0x4f80000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sdhci0 */ {
+			.phys_start = 0x4f90000,
+			.virt_start = 0x4f90000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+#endif
 		/* main sproxy target_data host_id=A53_3 */ {
 			.phys_start = 0x3240f000,
 			.virt_start = 0x3240f000,
@@ -153,6 +169,10 @@ struct {
 			.address = 0x01800000,
 			.pin_base = 160,
 			.pin_bitmap = {
+#ifdef CONFIG_AM654_INMATE_CELL_EMMC
+			/* sdhc */
+			1 << (168 - 160) |
+#endif
 			/* vpci */
 			1 << (189 - 160) |
 			1 << (190 - 160),
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220314152209.5859-1-mranostay%40ti.com.
