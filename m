Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNPB42KQMGQELDM5QZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7FD55BA0D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:26 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id a1-20020adfbc41000000b0021b90d6d69asf1191574wrh.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336566; cv=pass;
        d=google.com; s=arc-20160816;
        b=OnSxoI4W7r4N6G6P/MbJTITyaPChtMK+d89Fx+UQX7xtFlUW1rSMGRNHLqxSJ+0GVN
         9eFL34sniKfa6PnubpVZadb956w3BZxkXJ57dJeADuuGuF27YtcUXlgpuAoAzb1Zxvx3
         jr4er4v8eEsK11oVtPoDITHZg6w759JIPWL8JA4luCjt+cdAXCHEtPiepLGSg66bvAjP
         fp4BiOZx2sMhquR5WDQufEGcCkE4BDnZfOHQI1KqXCfA37b7WB1tP5Yg3hmds4OatwEu
         9rRs03VgjivGQFE/GIa9ipO+dYZ5w8FQYzrLnBmYFBRxtaLLfZiyMTflBknHEqO9Xp3c
         Xilg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ntY6HGU7X9m5/gkW6ceqIzd4AtMGJAmbmRIWcS28YdM=;
        b=uDTmu7bwWgYN+eIxwB0I3z3s2cWZ6cJuAalsueYGolA6UKMXT8snC96sF/jBZqCSej
         YOwFdCxmb3Lacc5Zcbq7Vrr6VjY6U7epZeiYOLWBzSLZIP6qY9R7Tw+LUJdIK3rcSHzJ
         zUUdG1TX50UL4GYaK7T8osiqlt6esAj3H/pVL7tha47/U8FtI03IiY9RSF0sHUHRQH9H
         dYA+mh1ka7HZpLMA05HAnktxM9UtaS5L7kWi5jOtov+PS6yAI/GO5qGfnffvxUV3xsHt
         cUoZ6gsU1NImZBaQeAGCh/HfizS1yJKxgSjPlMlVZtyRKohOimZgBUy1MB9mYcx82KLP
         vQIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=R1ko9OnO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ntY6HGU7X9m5/gkW6ceqIzd4AtMGJAmbmRIWcS28YdM=;
        b=bPFXLwkgWajWiJUqe64bVbIRXe4dvdDZ8pyWSY1jdqeSlanXPddU2mbrg6H1MS7hpf
         luGzjMVEIIFuuhHx6wMIwhrFLHDnAFTchABqbcmWppsMSPdVsiu/EFCEFzawztt4WEiV
         ikq0RrxDM7lkzJf2i2QrtOZLlRXDgkQ7z3Fqf8WywmPSBYEb70BDDBH1Bai0Kp1hzWMw
         xmkY3h6dfg0YVLCYmq0Rny6kFbQ2gQhNTv56p4sXGhqJSyfQNbBj/MQHZadirlbtSnaG
         CnJVgWx8+4Mafcoz0FJNZ15Onk4aqKW5CZOkDriEVT2WtGEQnQ/CRWLKldD+49uSHqKA
         PBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ntY6HGU7X9m5/gkW6ceqIzd4AtMGJAmbmRIWcS28YdM=;
        b=GtOiqyUe8vhYdYB09KPAoKHY7FCkeR+1bqruYmHhWWOBpejhDhG2nEP0s8cdKTeSkn
         iBzFF/F+AJKcyq6JYmWgdRkv6xDEw22+eCnfdkaEziOJVCQC6vQUVYLHYNNN02/ol/QZ
         8DTC5BPJnNcWsN2AiUcs6C9K4RP2K0uD8yAjYmEauAg2pq2sZEzPeubWtFA0tHQT+efF
         v1hlGeWO3VapFRRutdvQGrmKoO0Q2RiAL+lXIUogVjHsGXTWin3ae3Tfkt2uBhFHR+4r
         loUI0QiyxEaOiKwQggI45REHc35xdd/j7gEHVRLha0tcNDd7wSHE4h8z913RoVrfNgGw
         f2yw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8rKpBh2FNuwL5k9O5z75QQ99OWOmOErQkEZNGRDLrkLd2P/8YA
	bDgO54U724Wy8Y2W+tCnoZo=
X-Google-Smtp-Source: AGRyM1utgsUGfywUtwrn1+s+KOqpHmSYOySXSgJpXljJPen3NVoeKr7/dZZMHxGIklBqDzyDubSGUg==
X-Received: by 2002:a05:6000:1a88:b0:21b:ca70:f622 with SMTP id f8-20020a0560001a8800b0021bca70f622mr6995110wry.330.1656336566072;
        Mon, 27 Jun 2022 06:29:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c23:b0:3a0:48aa:51f2 with SMTP id
 j35-20020a05600c1c2300b003a048aa51f2ls1875400wms.0.gmail; Mon, 27 Jun 2022
 06:29:24 -0700 (PDT)
X-Received: by 2002:a7b:c7d0:0:b0:3a0:4c65:a790 with SMTP id z16-20020a7bc7d0000000b003a04c65a790mr3497144wmk.118.1656336564581;
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336564; cv=none;
        d=google.com; s=arc-20160816;
        b=qD8PLgTOSBpWGMp0868x2wjoNjOlxDDaH+YBiozC2RwDspd7BZ3XSODLiZ1Y4SrMT3
         LhgzesGI7/1IY/AbJZKGtawnQ0AKJBwLzHSqtwQjhSek5htISetbpP6uecttM4lTVNSE
         /vEKPHf+3zsx6f0tn7rJ2mT83EB7Nhl5+Nk78Yma5qHyJ3/UiYZP+xCIpxRHZwuXAFNy
         bTBKKgdgXBvVgb2X6tSfSm0gFi0N064QYbga41xGGuqW4MW1z8Jc4FlzieV4VH5wUV7s
         gWexehJ/3x4l5/9IcGcFOw/eeWEM3By8GoycGrvlGit0sB3ul0nLD2fE8rbxuymT0veo
         afLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CgFTwKD7qxM+P2XbijUkH0H8C5To1e/EfoR8RaB0ZGc=;
        b=mE+RhIMRZR9NPt6M7flJa+UhvEWvPcNHQufj8xI7ziXGhizD5hZpvSSnI3ukesQGD7
         GmiinCwIZTVeRt9oAC2M8WaEDiWCv4oeN389YxQApdt5cOXpCN2bA3QrfV4ZE3MyQIwK
         PyDDw72oLdbk2wjp8NW2JClMXJ+t3Kpy+hAOewmBCLNXY82ihOh5rPUpOQRGhzCA6V3b
         csY12TZZnYmNzbTKdXMccVJvlhUbY++QBEunhX3FldXNuZQgn8fPpZELMjZFrmBMFnZk
         QfV4uw3vw83+1eRgaVR/U2cuVopPmsx36WprbVxZk6ImJL0Rvb+DXw7y65CBOAq5tot1
         tJJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=R1ko9OnO;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id i17-20020a7bc951000000b0039c903985c6si603691wml.2.2022.06.27.06.29.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVD23Lzzy2F;
	Mon, 27 Jun 2022 15:29:24 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:23 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 41/42] configs: riscv: add ivshmem-net devices
Date: Mon, 27 Jun 2022 15:29:04 +0200
Message-ID: <20220627132905.4338-42-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=R1ko9OnO;
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
 configs/riscv/dts/noelv-linux-inmate.dts | 17 +++++++++++++++++
 configs/riscv/noelv-linux-demo.c         | 12 +++++++++++-
 configs/riscv/noelv.c                    | 12 +++++++++++-
 configs/riscv/qemu-linux-demo.c          | 12 +++++++++++-
 configs/riscv/qemu-riscv64.c             | 12 +++++++++++-
 5 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/configs/riscv/dts/noelv-linux-inmate.dts b/configs/riscv/dts/noelv-linux-inmate.dts
index 486ea82f..ca11b134 100644
--- a/configs/riscv/dts/noelv-linux-inmate.dts
+++ b/configs/riscv/dts/noelv-linux-inmate.dts
@@ -126,5 +126,22 @@
 			riscv,ndev = <31>;
 			riscv,max-priority = <7>;
 		};
+
+		pci@40000000 {
+		        #address-cells = <3>;
+		        #size-cells = <2>;
+		        #interrupt-cells = <1>;
+
+		        device_type = "pci";
+		        bus-range = <0 0>;
+		        reg = <0x0 0x40000000 0x0 0x100000>;
+		        ranges =  <0x2000000 0x0 0x40100000 0x0 0x40100000  0 0x2000>;
+
+		        interrupt-map-mask = <0>;
+		        interrupt-map = <0 0 0 1 &plic0 28 0>;
+
+		        compatible = "pci-host-ecam-generic";
+			status = "okay";
+		};
 	};
 };
diff --git a/configs/riscv/noelv-linux-demo.c b/configs/riscv/noelv-linux-demo.c
index bd263b78..9e62d6be 100644
--- a/configs/riscv/noelv-linux-demo.c
+++ b/configs/riscv/noelv-linux-demo.c
@@ -20,7 +20,7 @@ struct {
 	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pci_device pci_devices[0];
+	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -84,6 +84,16 @@ struct {
 	},
 
 	.pci_devices = {
+		{ /* IVSHMEM (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0000,
+			.bdf = 0x10 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
 	},
 
 	.irqchips = {
diff --git a/configs/riscv/noelv.c b/configs/riscv/noelv.c
index 08389cb0..5c8b6fa3 100644
--- a/configs/riscv/noelv.c
+++ b/configs/riscv/noelv.c
@@ -25,7 +25,7 @@ struct {
 	struct jailhouse_cpu cpus[6];
 	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pci_device pci_devices[0];
+	struct jailhouse_pci_device pci_devices[1];
 	struct jailhouse_pci_capability pci_caps[0];
 } __attribute__((packed)) config = {
 	.header = {
@@ -139,5 +139,15 @@ struct {
 	},
 
 	.pci_devices = {
+		{ /* IVSHMEM (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0000,
+			.bdf = 0x10 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 3,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
 	},
 };
diff --git a/configs/riscv/qemu-linux-demo.c b/configs/riscv/qemu-linux-demo.c
index e1947125..0ff62549 100644
--- a/configs/riscv/qemu-linux-demo.c
+++ b/configs/riscv/qemu-linux-demo.c
@@ -20,7 +20,7 @@ struct {
 	struct jailhouse_cpu cpus[2];
 	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pci_device pci_devices[0];
+	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -87,6 +87,16 @@ struct {
 	},
 
 	.pci_devices = {
+		{ /* IVSHMEM (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0000,
+			.bdf = 0x10 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
 	},
 
 	.irqchips = {
diff --git a/configs/riscv/qemu-riscv64.c b/configs/riscv/qemu-riscv64.c
index 1ace554b..75102bcc 100644
--- a/configs/riscv/qemu-riscv64.c
+++ b/configs/riscv/qemu-riscv64.c
@@ -36,7 +36,7 @@ struct {
 	struct jailhouse_cpu cpus [6];
 	struct jailhouse_memory mem_regions [20];
 	struct jailhouse_irqchip irqchips [1];
-	struct jailhouse_pci_device pci_devices[1];
+	struct jailhouse_pci_device pci_devices[2];
 	struct jailhouse_pci_capability pci_caps[6];
 } __attribute__((packed)) config = {
 	.header = {
@@ -224,6 +224,16 @@ struct {
 			.msix_region_size = 0x1000,
 			.msix_address = 0x40080000,
 		},
+		{ /* IVSHMEM (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0x0000,
+			.bdf = 0x10 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 16,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
 	},
 
 	.pci_caps = {
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-42-ralf.ramsauer%40oth-regensburg.de.
