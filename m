Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB2NXXH3AKGQE7CZMP3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id D39961E41FF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:24:10 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id w24sf14932937pfq.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:24:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582249; cv=pass;
        d=google.com; s=arc-20160816;
        b=ADUwqzJmRu1Eg8HgbcUW4JdX6DJNlB95g/c/Mok7oYBSQBH0ZXenVmdxu4hvAnlWl5
         qPomHzShs6dI1kzeoO9GOXSFIZYw61AW6SRS/gZciK/3LR1VCSwzgsFbY/K/LDbzRX02
         saN29v1N4FLJ6iUVnZbti7jZy3DW2Cpq8QrWIt0ZOI71Xc+XuRsZQZfxL+9nak/jyfsj
         TlR2C3Of4pna300tzQhrZgDLXS2G6gE0qnh/9yuNSW5KPHTamtuX4Et9hLLFdQmpJPaD
         oRvxhoxdUEK/9Ng2aJT5FGEgSyt8OQsNYZdUkDUu4GtwvXmVR0vz8ckFitPm1KD+DI0O
         Uyvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=A/eYfJzn+v+SC4vDQCkIVIMbdg8JiHsde5kg3Fyad7Y=;
        b=l42zDD2ckUAWxcvZojMBMRx6q2HLBn3Lpp9nuOj8oUfLN9kyWFQnkFC21JbZO1cvE4
         IT8CkoWUy+VhBs+0++x6mCiJboGFpFNDlrRpNzt4q6GuMfb/cO7VEPu+AIZTD0nP4bbT
         JuoDx9ZpXFVvfUDLVUi/pP6RsK8D+0NuDyxHPYYuGK+lVRtak7aRwZyi/q+1ssID7lr4
         R8jZgVjVmJWJnn6kq0fx5oUKlkXGgEyTa9Hg8++mh2Tn3GVthvvi/M9qOer9K9G1S5YZ
         FekbwPZoFybCQAgETBcDNsYNCTbcU7OqAKOp975lsd1NfBmn6jO+KaT1kPb+gv37mGBM
         1U2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=An+S6kLo;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=A/eYfJzn+v+SC4vDQCkIVIMbdg8JiHsde5kg3Fyad7Y=;
        b=W97vanAMwPEzCJ7CSICE5V0/aUWaLxPUQOIVdqk7dnS+NJYgeq3P83jBKeCoi0+Brx
         31yueCjsH4Mq0rmcA5dEiw08f8gSiYK/WrZgM5lUS/AxUy0jIk82Xbe1CmYiTtUYlvLS
         MF4r2olsX2PldBQtu4k+LJycKMBnHn2Aj3bVvlyhDCM+vrQD0c9hpxQAQjN9218VozTx
         T0NZJT+LbVnKj3CNGjSAp158ATmrWWToHf2qZAN4lv1bt6Zqz6pwgvCwn4hho1l54Dwt
         a90PwA7TjcadTdSqofHDgzrcde2T0MS1AnPQFAIpt+dThH8C3kE2yn2Z455M0baw2NlF
         imXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=A/eYfJzn+v+SC4vDQCkIVIMbdg8JiHsde5kg3Fyad7Y=;
        b=Kdw6HUgxNpXYPEfVGSzKl6EwzJDtgCV/WQ+0oFc6yLCBWriRr/Ve8SzI9/O8dPwqOB
         UUzLMHVTpLXe/Rbl+ft5Q+JLbacmnB5/ZX8KiluqJ4Bwu+YZvHETb7xcaCHeHLKkD0Y7
         XhNdE1UwQG6NF9CnO+VqtqJN+haFndyLi6aHYEfiQf29VE01aOnhBIjaDB9zugJ0uFlN
         WPJR9xm1TBSuL9OhbR4sLXFug0J9xbbGHbQ5WfS99RtLBspIZ21bbWycegi2fhK7gJSv
         ApBpiFV8aMP4dl1nXxxeOtVH7fZL7ntNNKW81wRtvA91VfQtcI5NfrhUHg2ZtJuJP7GM
         YqXw==
X-Gm-Message-State: AOAM533fvzt7Mjs/EjORQPPbL/psRq/k0e1+EY2a0JnT0dPcRUW/WNxn
	RaG90T7IM05OMPGYeVNbIjs=
X-Google-Smtp-Source: ABdhPJyBdwNewfOpt2AK4Tod0M6gy63qKxoPJ20BVVgtD+CKf/h63mxoMWszm5fEUFbjfY1gKzH38Q==
X-Received: by 2002:a17:902:9f97:: with SMTP id g23mr5901642plq.30.1590582249559;
        Wed, 27 May 2020 05:24:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:c38e:: with SMTP id h14ls1446406pjt.1.canary-gmail;
 Wed, 27 May 2020 05:24:09 -0700 (PDT)
X-Received: by 2002:a17:90b:193:: with SMTP id t19mr5025705pjs.47.1590582249103;
        Wed, 27 May 2020 05:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582249; cv=none;
        d=google.com; s=arc-20160816;
        b=tbdM+B1/6NGbvkCE74HB/cIaqF82FW5E+Fz+qVhSAwu2NT1GwK/+RJkxQsn9fGSdSa
         Y7dsunrcLBQvsr6SR4Ciyhqfb3u0g4w6g2wlCBDiB4ZeJWsYRI0jyS5kB84+aCBjq/uA
         pY3ZmolVndJb+bKqAXQxR7b2rRuZWcQxq/gULg6entN47qiKqgT2FbhN881/vT0lndFS
         esK69WIjkifdjJpkis7SwIcjfBldTgRxOxZFQTQUf8O2HCTTOMrrbqd8ZIvXquCgFnp/
         FCeZ19IdxNxLNHIgNC7arhQXvMw1c7yZVS6kQBARUsawPIB8fh+FLLSYRObE4OO6gVFn
         pctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h1bevWoFCwYcR1Lhx3xoiuWw1+xcxgeMJ7D5HVHVlcE=;
        b=k+5jI5CPJRRtVFrtkfCJj6+PVbeMRJOGi8QP27Vs0AyHO9HNTEq6ZQX3lSmthE46Oh
         gwmGrhR8XLiLiBVqYM3GjYtOQrxexGtO7Y9lead8G9g6rZ7cw0nGiyhkfLh2mmouXeSt
         pwkzDXyzv7FxPw+6SFffZFqQRSbxQbXlki6kuTfMHwNJWf+YJ7+1Hz3YV7pAYv1LtRDc
         f/ipU+2y78Eo9ipMBqJXOTT+1F05yw9fnfJOWq+AfZT5X/pfVLcXJCgC9eTNCGl+7WZl
         NN0ppvOQBopcXARxp7nV3oSKORNx2fdK+RQ/Jf5sn7OmfoxQ7v7EPxp3XzA9UG1yTlAR
         iiIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=An+S6kLo;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id e6si192052pgr.1.2020.05.27.05.24.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCO8U6078735;
	Wed, 27 May 2020 07:24:08 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RCO8dD129942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 07:24:08 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:08 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCNxM4076356;
	Wed, 27 May 2020 07:24:06 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 4/5] configs: arm64: k3-j721e-linux: Add GIC ITS Mem region
Date: Wed, 27 May 2020 17:53:57 +0530
Message-ID: <20200527122358.14723-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527122358.14723-1-nikhil.nd@ti.com>
References: <20200527122358.14723-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=An+S6kLo;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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

From: Kishon Vijay Abraham I <kishon@ti.com>

Define the jailhouse_memory region for GIC ITS so that PCIe master
(RC mode) can write to GIC ITS for raising MSI/MSI-X interrupt.

This fixes the crash when GIC ITS is being used by root cell.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 2b67ac8e..578caf02 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[38];
+	struct jailhouse_memory mem_regions[39];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[30];
@@ -328,6 +328,13 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
+		/* GIC ITS Region */ {
+			.phys_start = 0x1000000,
+			.virt_start = 0x1000000,
+			.size = 0x400000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_DMA,
+		},
 		/* RAM - reserved for ivshmem and baremetal apps */ {
 			.phys_start = 0x89fe00000,
 			.virt_start = 0x89fe00000,
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527122358.14723-5-nikhil.nd%40ti.com.
