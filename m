Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBTOYXPYQKGQEDUPYIGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FE114A587
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:57:34 +0100 (CET)
Received: by mail-pf1-x43c.google.com with SMTP id z19sf6513448pfn.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:57:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580133453; cv=pass;
        d=google.com; s=arc-20160816;
        b=A0BhdQYsJUvg3IO383mxuhwVu1aiC0Brh5U8YAnm2E7NfcRB6WjkRow8BMiTpJz3KD
         1npjE4N22tDI+7ZWfvcEgJTLyymCHD4xN1wMjZBD8tNvi7zOf+lap1q5NU0cvVJ2qUoj
         /dqQXk9TmYwRZQVOXLJQZoWpIWXgrv9Q6UcZRhWAty3SrECciW5eBtSr+IiJDvZNxLGS
         0JO4xKIvp4TUXtrC4fRZ/+ERK08XQGZ0V4DgZu3IFjkZY0jlp4fwKemPZ2BemJsh5Ihu
         ywQaKVCwo1WXdvCRURs8W7O5pTNX3Cqbkjn9556GUeDuc//o5dJIYXtEPpBiufBUYhui
         fkyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=wjgpgJ7OjAUIpMsIoQTNzujbpnJNW/Nbv9K0BaCk1co=;
        b=EYoZp/aFc3s2YN9vJ+tyQavJ/Ta4PXGk49HiCe3dVyoL8CS6L8wR2MelQQZ7I42zHS
         ld2IKb5mjn0FRINQBnfu22ABfS2MJ6CO4rsoSMcWlrQaXB9LnC58qbO7+wUyC01C+/L8
         ATFsvu6HmJlE8kejGYYZvvPfhVdrsvRLW3cD5vCeBoDRnDIloz4A+jvcfn8WEYGVjpL/
         Iph48kmk7kY2lyqsZR//JtUrBJd7yeNRIF+svPIig1EW+LTaymVcE3C6c8thLjgoUUJG
         fCFq1lVxgeRcxfwxerMsQ9Qjq9CVm+ILm7prQLpUkSnUYE29m5UdgJYh/g0vcOGfneQS
         3NEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MrB9gJQE;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wjgpgJ7OjAUIpMsIoQTNzujbpnJNW/Nbv9K0BaCk1co=;
        b=IWpDC7espHvxAX8v5XWVk9GYch5uyPghnH3EKF/WZIgW2tfNwSOslkPofclRXQler6
         kBX6bt9kz4fSbeLt3mzvwI765McZAbDW2qjS6VRoN6kblxzqI010awZjj6h9DPj3frO7
         IqSEwXwh/A90T9zxQEt5zT6eZjR5qZ0+mcSXEzEQQqbjgd8oxH21e1mGVy8GghzZvAj2
         bVosZsOUWaVbRh8DcDo3o/IR+mFz7EQw3c1ySW2LecZ+VDw6EIAF8SGFDrKLZeQd1Tr6
         8eBil6shumTywNLhpkerEcgU6HT//5UoI7z5YVGjQEsCeYTKX1yUU0n7Tjm8kisjM4aj
         gTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wjgpgJ7OjAUIpMsIoQTNzujbpnJNW/Nbv9K0BaCk1co=;
        b=b4Mah5kelJ5EGaafJMzX/GTUPMsk/nsmmfrRCkS9NU3G13f+caFR2ixnQWLBe0hWL9
         N3CoZsAxCYui6KeikcpZRBDOhzjIfSdaIhGYhtH46p5yi9TpVz9ku/6lXNp0/qMfYBUL
         Q+vtzG131IcrMGFZTO44jt16xKZvH5JZObNY9HEQYoZSp/mx8pW/JnaY3WlGjkX5mY2W
         J6tbxFm/3GBqmHAE1kxA0h2nMEK5hRG2HwlzG/s5oNdwHxCL2xMiMJ1X4kpkzigr5+GT
         cGK0Cso8vAd5M+x7Lthu2mnnyV4fTRw//bIZlRpi+0R1n0wdX72RgiNfiTS4hmz4PIRV
         FI+w==
X-Gm-Message-State: APjAAAXSuQtGK72vSgFfN6qgkATLc9Ks1BNkS9qk3BCCuOGIdTGJsYH7
	81LdGL16VlaCZ2xMM4SrcHM=
X-Google-Smtp-Source: APXvYqyyPlZxzJuPUJ83iYkN7ZD/6vuGKJdiyy6oacQ34LThRHrVOtZt2kJ1HAqJP9CspO6ym9M/tg==
X-Received: by 2002:aa7:81c7:: with SMTP id c7mr16869132pfn.203.1580133453431;
        Mon, 27 Jan 2020 05:57:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:344d:: with SMTP id lj13ls2921928pjb.0.canary-gmail;
 Mon, 27 Jan 2020 05:57:33 -0800 (PST)
X-Received: by 2002:a17:90a:20c4:: with SMTP id f62mr15032750pjg.70.1580133452925;
        Mon, 27 Jan 2020 05:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580133452; cv=none;
        d=google.com; s=arc-20160816;
        b=Eu5HfthIoeV9N7Ql6FN3dvF7jTRVj5QZMQ2Ma9rUgotvU5ztTGzpawdPA4f1fD6pmj
         yTfZMu40CIKST1oHzeN7N2iD1SW/gPw5LizlXuQ4VFmNu9csU8HhW44FVbuNs8vM9u/O
         r8UOxUjX5IH+5YLkfaWsQZpQAeO1mR6uznGHXhxLWtRdPD5C1fv/2Nbac/ZzkjnWxDWI
         +bgNMM05yPTU9meeK4BCXO5dMyS4IAtpihrtdZNIMHlvcBy5S22KB9JmYdTaXYOLJNUO
         mq+DIqfUM3hrB+Ebu7hZVfoF2S900QoF65V21SMObcLbJLdNqloGpl13AAaYoqm8lAiw
         oKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zbayRDZjVp2NDAmKqzVJCHMGPOtGMS3ML7I21Py02S8=;
        b=U79EaExWY+W9qiEPruhWf82mlACEm4PTt9xe2/yE5H0z3k3jEk73Hl7D5yOB6SboKr
         UcT4jscnezHYkM0E/L9LuhfraoLt506dfmkCM4h5XB+qfVIe/PiT2Vz4wnZJ0h+pDwDO
         eIfrTpsc5ydxTjxEhVundmqH7eC8aFwooh/I0AJxLcjSxgXF5f+ZKfVCGv/OhW3o0ccy
         YCpJq+EpV6lXQmw95QJl92e3DwcVyvuUdy00qH3fUqtkj/bUIcrsc8EO/EugDlsQeJpb
         SY+sACF5O6iqSBEzc2jeD5C9LRyDV/ypDSCKpxwJg7EM7kX0hEULq/qKhMqvYlIKZFlR
         pZ3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MrB9gJQE;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id y3si626368plr.1.2020.01.27.05.57.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:57:32 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvWjx056554;
	Mon, 27 Jan 2020 07:57:32 -0600
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00RDvWtJ047281
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jan 2020 07:57:32 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 27
 Jan 2020 07:57:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 27 Jan 2020 07:57:31 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00RDvS1s090460;
	Mon, 27 Jan 2020 07:57:30 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [RFC PATCH v1 1/4] configs: arm64: k3-j721e-linux: Add USB mem_regions
Date: Mon, 27 Jan 2020 19:26:08 +0530
Message-ID: <20200127135611.21302-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127135611.21302-1-nikhil.nd@ti.com>
References: <20200127135611.21302-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=MrB9gJQE;       spf=pass
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

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 9a853e9a..47ad32ea 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[25];
+	struct jailhouse_memory mem_regions[27];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[2];
@@ -86,6 +86,20 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
 		},
+		/* USBSS1 */ {
+			.phys_start = 0x04114000,
+			.virt_start = 0x04114000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* USB1.USB3 */ {
+			.phys_start = 0x06400000,
+			.virt_start = 0x06400000,
+			.size = 0x30000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
 		/* main_gpio2 */ {
 			.phys_start = 0x00610000,
 			.virt_start = 0x00610000,
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200127135611.21302-2-nikhil.nd%40ti.com.
