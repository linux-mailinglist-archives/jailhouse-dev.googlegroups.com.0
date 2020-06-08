Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBO5M7D3AKGQEXDMFYUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13c.google.com (mail-il1-x13c.google.com [IPv6:2607:f8b0:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 119531F16E0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:09 +0200 (CEST)
Received: by mail-il1-x13c.google.com with SMTP id c29sf11617482ilf.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612988; cv=pass;
        d=google.com; s=arc-20160816;
        b=LbO9EdlhIhNPDnU19MXTsonEWS2tUsZ2TlSKH5knxwe46FDJk8ceRKseCtwl0fYqdm
         y6fviD2JBqARQvgbQdCKcWU6laAu6f+gEtLfjLDGAeJ5hAu2AGznOImpi6YyY3hxy+SL
         Qer8LL0BIdWp0doP30LbaRAbFJIlnIKqI5rdDMh7DwWew34n6TuIuq3gvhFMuDNW7BO6
         OHBOz/mJQ+u9FN9mTXxNgkOoyVCBjtgVt1nhi62HvuVZAeP1TqKrr3o3/csyYeFZBvO7
         YSs3NZQi+DXrXdWuEHMOQYqy7Nea25Bnuoxylm4/T0ixNKe1UaqXoeYKaTaqaRkUx62b
         zitQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=g3imEzjotKIX/xwA0cXKmOzd6Fwl9m6r3x20T3sG6XE=;
        b=Dk2ipdLNaBqTJtnztrEyWjD64r9nfbOTYJ1vOQDMBkmSVs8e8Tpuxd92a00/GDVNzr
         HoOWxDxmDDEjnME0P5s9WmfJNNidpQHAT/ZyE8hcJoQq0O+KXuTFEwghCsrPFWkDM4BC
         hGiVJVR5vjMUhKLcd8BIXx8H+lwDSk7cY6eAt5kwgXztWiyQDVhNcU9p9MuZ9oT8JSmO
         g1CD/ey5OEZ20dITq3e1/00LKiYhHvD5DnJf+F2RFe9U9dwz/QZJMZNwGKAcWrtyXjSt
         sRpXx98tgvPdp3qr2VnOvZBGPEmEEpBjQE6jnICQGEoGsdUgRCgtcm65uYYHK3/en3Uk
         lz4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j61K0VHT;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=g3imEzjotKIX/xwA0cXKmOzd6Fwl9m6r3x20T3sG6XE=;
        b=tVYZAkzZNTV9ra+H3E7x+zsQ69J6OgBn1nKacje+qaPzaxCK7eP6LnugwH2SkNl/7v
         l1X7cyZJIez9V/85ZdEevafaCSL7ENOOyA3+6Sta9d1D9bnxjz/EGwE0dn6yPHjHLArI
         LQzEmnriHZCMjk4vQIqETe4Dw+pAItcAy7M6zYfAVmnsJjut2h85o+MUXiTcpcHeEH71
         wNFRJxs6KyXqiFAOn8kx4KYcxtyQ3W5JzdDcHa3TsZV+LHDAToDELguuUZIWaEHzEY4f
         Mgr9Q6PzcvuKo8Fe7hFUspu984AQLbW6aNy8c6mkx0OK2Oy3F6K6xv6O0MxEdRYBU9a1
         mNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g3imEzjotKIX/xwA0cXKmOzd6Fwl9m6r3x20T3sG6XE=;
        b=oaibNGICpkhHlEfXDDREB+PJe58HDGFyym6d9GeajmQPhsFcyihfDS6WE8LUtrsXmW
         6d6vP+t6u8QfH0gB8oreLlvjryUuAIuNbpVN1fZvojwPgqDba4hF1EoSBMmGj/zqjO96
         5TrsIJ5O/ojySRdoDWUQl5GkBWYlpbor6hfEumq87wzjLqky8SO48bZmex2+bmUi4Z70
         6lo68z7vgTeRtFZ3CloISsfd4QpyOu1ZMxygs2EnqMQS6qPi+mDqIb2odd7W/HmokSk3
         B8OgzCYjveRpGnj/Qz/lu4S5q0gWsXn6pQmDhkXxIyFt581l9Ex5AajRMqu63jDmx5TQ
         E48w==
X-Gm-Message-State: AOAM530Sg/OX0MODqDA81FGiqvuD6sRsh7GG1ZgRo8oVRDa0pqS4Snp5
	RBlXpbHw+/qw+XwxVZ1QOBg=
X-Google-Smtp-Source: ABdhPJzQq3IvCptc6NwnFEzLNuX0PpAwrYUaeSkEMRsXa9Dw9+QNg8e4aOxG9DmDjM5/Hgc3ngEl7A==
X-Received: by 2002:a05:6e02:584:: with SMTP id c4mr20701717ils.304.1591612987987;
        Mon, 08 Jun 2020 03:43:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:3007:: with SMTP id q7ls2064067jaq.4.gmail; Mon, 08 Jun
 2020 03:43:07 -0700 (PDT)
X-Received: by 2002:a02:5448:: with SMTP id t69mr21634566jaa.37.1591612987439;
        Mon, 08 Jun 2020 03:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612987; cv=none;
        d=google.com; s=arc-20160816;
        b=gNGcSWuaSUkiIs29ca2+NB/Txb/lBdY/GVWQZhdSUVO9uHwOeRRHPPmHJ/YZnC+lXp
         1kO01vYMW8QVP6gEUpI0gdT7X0623NU9eD8RDcFcZXt7EZ4MuSJwQ9gWNZ20ebYOoxMn
         0ylQ+PB/Db4uNNIj4mZ+GUZWikZUS7F7VMrjSmla7ZLV3HJUY9RmXm931YvV1N5zEOnZ
         iHaC2Q/1woX7ss8YAwGpmmxdt5d5+o7fF722r78Rvi9Y5Q9D+8YEe0y2i/gWn4vocR9Q
         SpSL4pS6ypa/WBkL+XoxYTEzBE8iev88RIlBrISUNB/AXB2OBUCTd1+Ezk4gE1oSxw30
         4B6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V05CZ5lTM4zOtqx7e2JohGtaQm5dUejWrE6+LL7CAo0=;
        b=VouOP3nJgKLmn5CF60frlsVSlK61ArJM9MFcL+sRCQAcFGlG2w4Ivw5XVqDwDlVymG
         1t2HITr76lgJ9Q+DJtXaU2FBOGSoyujrJqzhio/F7nVymxeBpa+3/scqrv94NwDzYcVX
         YAQZI0eGLJpnqhUDuTqSDzQzAObd1kroQaGEOyLzytG9EDKhaj3qVWrWAQuwSkwhPB3p
         WEBH9fSyGYtL6oqeutoM9gevjykHCFBZ8nFJjr34KOVx+1HUi1vH+GGijplKtT/w4YYi
         Qa43hNPWNY6zsmGBsaTmfZNh7/v2fk93b7ZEqgkH/d5xIWULGWtcS6e4krPK/GAV3S4P
         3a4A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j61K0VHT;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id n16si635791iog.4.2020.06.08.03.43.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058Ah7Ga085113;
	Mon, 8 Jun 2020 05:43:07 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058Ah6Ds009253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:43:06 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:43:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:43:06 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Aguh6012229;
	Mon, 8 Jun 2020 05:43:05 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 5/9] configs: k3-j721e-evm-inmate-demo: Add ivshmem capability
Date: Mon, 8 Jun 2020 16:12:51 +0530
Message-ID: <20200608104255.18358-6-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608104255.18358-1-nikhil.nd@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=j61K0VHT;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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

Add a virtual PCI device with IVSHMEM type (id = 1)
Create IVSHMEM regions for 2 peer communication
Enable the vpci_irq for doorbell interrupt

This allows to run the ivshmem-demo baremetal inmate
inside this cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-inmate-demo.c | 64 ++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
index 7440a258..39c6c414 100644
--- a/configs/arm64/k3-j721e-evm-inmate-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -20,7 +20,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[3];
+	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_irqchip irqchips[1];
+	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -30,8 +32,9 @@ struct {
 
 		.cpu_set_size = sizeof(config.cpus),
 		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = 0,
-		.num_pci_devices = 0,
+		.num_irqchips = 1,
+		.num_pci_devices = 1,
+		.vpci_irq_base = 195 -32,
 
 		.console = {
 			.address = 0x02810000,
@@ -48,6 +51,33 @@ struct {
 	},
 
 	.mem_regions = {
+		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
+		{
+			.phys_start = 0x89fe00000,
+			.virt_start = 0x89fe00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe10000,
+			.virt_start = 0x89fe10000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE ,
+		},
+		{
+			.phys_start = 0x89fe20000,
+			.virt_start = 0x89fe20000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x89fe30000,
+			.virt_start = 0x89fe30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
+				 JAILHOUSE_MEM_WRITE ,
+		},
 		/* main_uart1 */ {
 			.phys_start = 0x02810000,
 			.virt_start = 0x02810000,
@@ -68,5 +98,31 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_COMM_REGION,
 		},
-	}
+	},
+
+	.irqchips = {
+		{
+			.address = 0x01800000,
+			.pin_base = 160,
+			/*
+			 * virtual PCI SPI_163		=> idx 1 bit [3]
+			 */
+			.pin_bitmap = {
+				0x00000000, 0x00000008, 0x00000000, 0x00000000,
+			},
+		},
+	},
+
+	.pci_devices = {
+		/* 00:00.0 (demo) */ {
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 4,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
 };
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-6-nikhil.nd%40ti.com.
