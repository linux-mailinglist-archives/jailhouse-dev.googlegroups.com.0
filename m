Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBBN5XOIQMGQE5VMGJDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7464A4D7AB9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Mar 2022 07:19:51 +0100 (CET)
Received: by mail-pf1-x43e.google.com with SMTP id t134-20020a62788c000000b004e1367caccasf8920569pfc.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 23:19:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647238790; cv=pass;
        d=google.com; s=arc-20160816;
        b=oXG4dzcwNFufWCbiyRV55Fh+KiQLDR0L/Z3XFh0ldi/m05GuEJLa8My34TydF+nqBY
         GjlLR+JPuxcSDff1YgxhswyYgL8PzBs9tR6fUVrA+M9raNZDSOwA8VoJmod7kIY4rq6V
         odOru68+x9v84YU3d0eLG5+lHsTWySDtWgWIeJCFZp4hNpL9P+Lz+j86VX4gXDawx4Xu
         g5oiEDjM52aMJvbj+RBBzcd3m7sy4Y9MclVq7jSgsHqRHFZFeub9JTZJ2O2TeJb/SvyI
         gETMRkFQX6PysMPsywhhS1E289hxjpCkALLDodJ81cs4pIXhHV+5GGyU2sVkiVTVdXxX
         DjFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=YI7w+eK5RVTqlgdidsFfayxGsJ3yDt1K9jC8SpfQssw=;
        b=ov4Of/AoAKL6x6fw0KNuKd7/P6F7v8qlwIA90R3yETIxXZnjecZdOg0uclN7K1ggTQ
         w9M7WOKoBw8sMIQgyc+11mWauPT1pFvWxXY05NmovSknw3ddCcqNXZ9NQPfE/0yr8gOg
         glOWjZsqDogDEMQkCoMRSi1A4GLgLgWIzEGTTDOJZxIErEAxi0NF80iNPnWTn30NrCai
         A+Q6pEMTazX9Oqn1ns98o1LVl6ztqgYunV/zw8TD2zrLMZlAyIhZBHfenDMp9/Uwvo24
         oj+CUjFOMeiqvRbtFOu8gZMoOwjugrLpbDYFO8f5QpTsRKTCXF7zfgVlV7J9QAyU2dM6
         oKng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CSYL4FEX;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=YI7w+eK5RVTqlgdidsFfayxGsJ3yDt1K9jC8SpfQssw=;
        b=M0P+zHuJ8VWV2PG9yoV0fP6omJ88sO1UOE2TTFc2OYDWtR/NSvtROiV3wWmaZPjr4z
         RPcLl//+sgopcZI5aqQNeOlNTyifMfWq6d2PRrQXJB8dncAqw1D5SOEoNRnuL3iIwt/0
         fzy8MyIRYOkpcPxaPGP89M/t40Fr65E1cy3cI/9Ex3OQ/AE78g6iwwb/69A/TRS0pVmL
         FHnXbD8Oex+W2sdkPNO/AG5QeMCmwQQWqw37f19EXSIbiAb2kW2YACK6XlbVYy7Caiyn
         QVcQtExuOFr9VkZysQboweFzv9HTOLJiFe2W/wbIPa1/i6CW/ezbQCZyWIvCQBO3aMOX
         JdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YI7w+eK5RVTqlgdidsFfayxGsJ3yDt1K9jC8SpfQssw=;
        b=by8mv95wOFwSUelHwz8t4Y7kk1/LbJLFbq/bI2Ic+2xRzSxR1ZAwFzh8OBcc6kKYWo
         H1GonsOIQ9MFQUtWnawaZFUI92j/D7i23ztqmnNdxLfHO2n4YiHDcoguhZ7kMRgzbmgZ
         3aDcEQ4KNmGngzlfRgQOIIlUOOnsVuaFHDpCh7I9iFWu0YVOelwreVS3oy7ZiuUwRRNl
         MA6XetdPv7LmfnqV5JrYuSe82issxpbcVsJun2gC27LKOB6P8uCJ3q8hsVV0/RZWZNYE
         8olJCVHtG5EgV71QXG03ppVO9mzBP6Ww5jKntJW5gKCjtNx0a0NbjXNFtau4z02v5UqO
         psIQ==
X-Gm-Message-State: AOAM533Ro6Q1+y6KGpprQSVBsHMg7E1sLWw/KlFfsvhXryBpgvCLxfVA
	vF2MXaHZPruDLkiOW5tUykg=
X-Google-Smtp-Source: ABdhPJxUpyaIhfnvcl+wQPupobkOGpBq6LFiij8zW99uwdX5QlG21VRsFu6wZME4ojuy+w+rixdqDw==
X-Received: by 2002:a17:902:6b8b:b0:14d:66c4:f704 with SMTP id p11-20020a1709026b8b00b0014d66c4f704mr22192699plk.53.1647238790154;
        Sun, 13 Mar 2022 23:19:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:1684:b0:4e1:b713:eb10 with SMTP id
 k4-20020a056a00168400b004e1b713eb10ls3807796pfc.9.gmail; Sun, 13 Mar 2022
 23:19:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:1894:b0:4f7:288:9844 with SMTP id x20-20020a056a00189400b004f702889844mr21967278pfh.28.1647238789379;
        Sun, 13 Mar 2022 23:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647238789; cv=none;
        d=google.com; s=arc-20160816;
        b=V6dr2EEZPF5rJqpbpqYpxzxA5mJVNJkQN+NOImzExNshpsQHx5ft2syex/aUcSRk16
         ki67w86YLZ9Q4GP5oel9TtCbrPTUn783tVNsOLKV46kEKJ3v2BjITj6PQEofvzgxrvXE
         oF9BqlZIewYTkYwhXoaID1coLnDFs7v3KoWfvJpWEDFsH8N6bL/oldPoKVwCIolO0oLa
         uUWqmrQw80FrcEAATiZx0BNJRCROxnroCm5VXQ2htFI7XJ6ZT9oyfc90c6mmojzOdMve
         AcTY8OGI5xyIY3JzhorfD8AKFK8x+OV1wCeMYmEJUMD7+cWxerTacOfkJklGPRtBSmJD
         xOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=W4ygTb8jJf8FrvhWU61Ye9wkL0xnS54BdbLORYnUR70=;
        b=Q71hHTunxsKVhtb7TKEafIhcwCjInPosXuaA/WoNgqRw2jjzdpQSJZ4A2Sta3pj3OS
         8dbgvJ79UYbKq3GhhAcIUl3lHQBItZCpPJvcQSCqNnf8H3DgW8gAyxF3p7D2BmcNUk1a
         +NghJoKXekWX3s6GEz4u8UL7eYGOKscO4tHDcfTtgrAIA34lcxe1edYag6B1g5EonTd8
         9XpFOzREyD1Tvsk8FmNh6Rnd1ruT3bMZYPg/LFwK5lP163ttVY+Ssgzdkw2HamjXcCe1
         1qbwJUO12xUIb1Xk845w01H2eLpSm3nawoaZDejzJEdAy/jT0oT0xCgb4LmP7eHKtAVG
         nz7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CSYL4FEX;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id m12-20020a170902bb8c00b0015016b90616si1037801pls.11.2022.03.13.23.19.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Mar 2022 23:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22E6Jmev030532
	for <jailhouse-dev@googlegroups.com>; Mon, 14 Mar 2022 01:19:48 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22E6Jmi2002384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Mon, 14 Mar 2022 01:19:48 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 14
 Mar 2022 01:19:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 14 Mar 2022 01:19:48 -0500
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22E6Jjtd094441;
	Mon, 14 Mar 2022 01:19:46 -0500
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v3] configs: arm64: add emmc inmate configuration for k3-am654-idk
Date: Sun, 13 Mar 2022 23:19:38 -0700
Message-ID: <20220314061938.3304-1-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=CSYL4FEX;       spf=pass
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
ENABLE_INMATE_CELL_EMMC macro, and respective device tree changes

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
Changes from v1:
* Split out eMMC enablement to its own inmate configuration

Changes from v2:
* Recombined eMMC enablement to one configuration that is enabled
  with ENABLE_INMATE_CELL_EMMC define
* Dropped patches that were already merged

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
index fdf5fea8..844554a7 100644
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
+#ifdef ENABLE_INMATE_CELL_EMMC
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
+#ifdef ENABLE_INMATE_CELL_EMMC
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220314061938.3304-1-mranostay%40ti.com.
