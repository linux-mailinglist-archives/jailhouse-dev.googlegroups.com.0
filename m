Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBAPNQWIQMGQEUYAZTWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E54CCBA0
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 03:16:35 +0100 (CET)
Received: by mail-ej1-x63f.google.com with SMTP id hq34-20020a1709073f2200b006d677c94909sf3721007ejc.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 18:16:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646360194; cv=pass;
        d=google.com; s=arc-20160816;
        b=P5VviBRTVSnGaZxRCyeGxTGk11RITWroE2n9T0xlpIV1xva5YpQ0H4XYRDtEjsWJlw
         uEGlkS5Mx8Q4Tc8yMvBXcQBlo4bHthUZAlo2rZ6iK/P7lDQ1VqS83S0Lv5AV6KsCCusR
         CyxaNTi6jkN/PCkcI+NJ83LH0DuysNJwSkf28hNVdyChJe3r6RJhXFO2V7RSidpD4a0G
         3hPguOITsa9rXBJjOeYfFn0fiDgXaxFzbJGaH0+3Vvm4VG8gHFHzbreCMqyprCPc7qfO
         1n2+G4X4kyADXT6EaJ5QWceDGnqA2UDs9Kl19Sp0wMZ83RUwbqnp5jyymzJM0uHgvF6K
         9KDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=TM1QGZm7eCMEU70EGIvEGHARti7QFWUpBuZ+nz3Vi6I=;
        b=BSIixhJ6GGM09tkh7yr/sLoKvUkiBZ58aF6APjRYVah9LffVOereM/yBzt8lNHM4Qd
         NnjRKO21U7eWY7GOgTWiJSOsqaMZ4DEmDt3Ag59JJY3CMFtceBlB0OkYkSiRszIEFiXq
         YxTgtl53pXwp4uy9b0Aa++eq8NriEv4P8/9gZ/FLx1gG0U5jLVCXn60pd7LzEkMvgRit
         nL6JTTMGc0Jjte0/aztPuL5cgxJju9xnJ+zX4U3c1w2Y/WldSwPXe8eDngsBUIXXbRzi
         t3wAhoTfyuu+UlI08HtBlWIUf3tzjFQV8X9w6lyu19AT9ymmLOCnHfyORKfy9CsQ2AFQ
         vIsg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=G40QTWQn;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TM1QGZm7eCMEU70EGIvEGHARti7QFWUpBuZ+nz3Vi6I=;
        b=Oj+Z/BaZ2bhUXyEho6dWO5Hoj4hy3PHpo1TgjYUJ/4PtiuGaLXQXGrXcziyjaeIAk1
         +S+/3TQcvCRmrCD31O1MdvH1FcqWmQ0rDrQ/fKR38uN8hxyLfEvZn5CBJsf0OKeeQ+F3
         XfCbNzQXmysjZr5Gt5FK6xyN376LT0iEyNfIt+r3P96EfPNsNNsywTXqdoYC/fJjftwI
         klex8zq3cDN4ntxWyKzxjTPK1BjQUJ2pW+9R2RvW5oo/aOq03vv6Ph2bFaTGne0lLU9D
         o2rvHTXj6u8ETBZjhFqABEIC2XVEET14amG+7Iqt5/c3x/z1NobyWQMEUmIQB7sk0QI/
         AYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TM1QGZm7eCMEU70EGIvEGHARti7QFWUpBuZ+nz3Vi6I=;
        b=Y1Q2sdL7mvzRaPnlwD5Aa6X+aOuQD0JI19SANTW+bONDXkGFdRwDWSG0i/EP6Ar5/q
         AuhOzd+emN1ug+ul5nyo1qiRJrMey1IYGldtFVPPTjJrmEjtbcbr3oHcI7F+L3jJ+bHV
         K2egDS4X/NYgPSy/ex+LpoErpqf06M8wIdVpfZF8UU84BhAFEsB9ymDXMpbVYN8mZUGX
         GG336rYHUuAqrNChTP37NVNw6hlcuy3aDmicI5I1FQOpfN5h5vYAGJKZLYmwt27kwANx
         /puTbFXjDLGzBVu+tErGI+zbjbdM66qLzbSBQ+VmxOEUoHCiSXz4m8cvnLBeYQPZCPwV
         zugg==
X-Gm-Message-State: AOAM533SxbyQXl7Vqool5Ru5U0JP1CFgtPcJIdi2qD5BSXXnsfUjNsUs
	W8VoKbUnjWIy5toVsJy3biU=
X-Google-Smtp-Source: ABdhPJxanhYBwS8jxRQ0rbw7CUId0z8XEfbv14+n87BFIydOfV/yeO/vBAR3WPUE+JhPHhU/ZtEM6A==
X-Received: by 2002:a17:906:4fd2:b0:6d6:f920:f121 with SMTP id i18-20020a1709064fd200b006d6f920f121mr11680971ejw.467.1646360194616;
        Thu, 03 Mar 2022 18:16:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d302:0:b0:40b:657:ac46 with SMTP id p2-20020aa7d302000000b0040b0657ac46ls260180edq.3.gmail;
 Thu, 03 Mar 2022 18:16:33 -0800 (PST)
X-Received: by 2002:aa7:c7c4:0:b0:407:52cc:3b32 with SMTP id o4-20020aa7c7c4000000b0040752cc3b32mr36750857eds.397.1646360193180;
        Thu, 03 Mar 2022 18:16:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646360193; cv=none;
        d=google.com; s=arc-20160816;
        b=K9mFT/dlOV7PjyGuCKRpO8Q5As+/hB0dQkdynQRgSJAXdhMv7qmc0+Q2swSZJslckW
         60dbqA4KWw17nYygElgH1NUL7RD+t6PyghixC7jrxfOuglXN3sMGqECJJqCRf6p939dc
         sm3tG1YxXbZjOfrlx6kbsvoz3f33Kdc97/oNxDaZFDVHZ218acjytgPAnFhLM3Cqxb42
         YGOhlal+Zwwy6qhj0BTrRc53/6NHCedNNxWsfhhu985XYPG4IuBdinXFyNWAoDvPRAkY
         Ek3QyQClALShQq+zL5dfd7ZlFN9ZyKLJ0eXXK1D95YO9tKSFcRIN9ls66SGgmTY6jkVR
         ZifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wv/2hR6CfBKarrH00hJUENHf16rDrYiAd3dyGoWjv+w=;
        b=Nt1mBso0VOMs5/RCcyY8Cw6VtMFl6m4E192knKO56h366Jbxva6QHHJqhceKx8qv9X
         Bl/GAZMUZQgrhwuEj6Fk8wCb5QbgkpokGHFEUWh7NCKeW80Vtvbu2RYSQv+T/O2JFiGS
         x7oerGVVl8n4SW90gEBNpy8hhbJXDga4iNQw1obma3oL0MlkCS455fxkjSgoeM03k3nl
         Z1NStDNtwTPC5dhVvhdd7Eu0r0KUdQsf4oKCU4bKWoU8D1lSThPaRBp8KLoducwqI4MA
         jlvoglA3wCTnAazH+VDBFKbN8k0hpVZXuKgY6xA1c+ZXad0cu77yDJ/GQ65LOZGEMicX
         MAEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=G40QTWQn;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id et1-20020a170907294100b006ce69d31a32si264331ejc.2.2022.03.03.18.16.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 18:16:33 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2242GVrD016282
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:31 -0600
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2242GVQ8033505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Thu, 3 Mar 2022 20:16:31 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 3
 Mar 2022 20:16:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 3 Mar 2022 20:16:31 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2242GOig018363;
	Thu, 3 Mar 2022 20:16:29 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH 1/4] configs: arm64: add eMMC support to k3-am654-idk linux demo inmate
Date: Thu, 3 Mar 2022 18:16:12 -0800
Message-ID: <20220304021615.2862-2-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304021615.2862-1-mranostay@ti.com>
References: <20220304021615.2862-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=G40QTWQn;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted
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

Add eMMC support to k3-am654-idk-linux-demo inmate which requires
several device tree changes, and addition memory mappings open

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 configs/arm64/dts/inmate-k3-am654-idk.dts | 36 +++++++++++++++++++++--
 configs/arm64/k3-am654-idk-linux-demo.c   | 18 ++++++++++--
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/configs/arm64/dts/inmate-k3-am654-idk.dts b/configs/arm64/dts/inmate-k3-am654-idk.dts
index 8e5066d3..a419d8d5 100644
--- a/configs/arm64/dts/inmate-k3-am654-idk.dts
+++ b/configs/arm64/dts/inmate-k3-am654-idk.dts
@@ -64,6 +64,30 @@
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
 	};
 
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
+
 	cbass_main: interconnect@100000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -122,7 +146,7 @@
 				interrupts = <GIC_SPI 565 IRQ_TYPE_LEVEL_HIGH>;
 				clock-frequency = <96000000>;
 				current-speed = <115200>;
-				power-domains = <&k3_pds 149>;
+				power-domains = <&k3_pds 149 1>;
 			};
 
 			cbass_wakeup: interconnect@42040000 {
@@ -145,7 +169,7 @@
 
 					k3_pds: power-controller {
 						compatible = "ti,sci-pm-domain";
-						#power-domain-cells = <1>;
+						#power-domain-cells = <2>;
 					};
 
 					k3_clks: clocks {
@@ -162,3 +186,11 @@
 		};
 	};
 };
+
+&sdhci0 {
+	/* eMMC */
+	non-removable;
+	ti,driver-strength-ohm = <50>;
+	bus-width = <8>;
+	disable-wp;
+};
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index d03fd4cd..4fc23e0b 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -23,7 +23,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -79,6 +79,20 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
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
 		/* main sproxy target_data host_id=A53_3 */ {
 			.phys_start = 0x3240f000,
 			.virt_start = 0x3240f000,
@@ -120,7 +134,7 @@ struct {
 			.address = 0x01800000,
 			.pin_base = 160,
 			.pin_bitmap = {
-			1 << (190 - 160), 0x0, 0x00, 0,
+			1 << (168 - 160) | 1 << (190 - 160), 0x00, 0x00, 0,
 			},
 		},
 		{
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220304021615.2862-2-mranostay%40ti.com.
