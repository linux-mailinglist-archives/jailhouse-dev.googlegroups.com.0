Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBEWTRD3QKGQEOPYF4JI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A8D1F685A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:43 +0200 (CEST)
Received: by mail-qk1-x73f.google.com with SMTP id h18sf4974198qkj.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880082; cv=pass;
        d=google.com; s=arc-20160816;
        b=hDYjHHFvPuXFiiUCeT50Wl/s8PrzmEjL4J1xuW0A+6WOBYR5frsX4hI2Zq+h3gtB3Q
         wxa4Kji1oV9mq187RNaLUuodiTK+SE1LPmNopshaxXTiFBpJruyT4aWKJ58ok18P51E+
         ygA6zzISyZk30g/NqeDs0PvwH7r5EARK4BmNv46NhBzAyLGaCfTR7C8UVnKEKOLgDZed
         XU5jRUz4qD20J51+0bzv6LXfJU6mVUybbsvbRISGl+CDn3sg2nphNbBCVHaTfeoHJmYx
         am4zY5cvaYVxsuGz54FRaf60OWD27IZQOsIzv6ozdUn06JxVFDKb1SZCLJW2h/rCOX5v
         vEnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=B98UtT4Cgzy6QjXzAPyOVlVl4JYqUWVSdp1yjkNhGg4=;
        b=n+X+dFVtax3hjeIF+7o+JxcSXrDeu7w0rX5JkoMvEYgPc++/G1WFeJR4i3rRZWRZsx
         4ZtBmuJeeEpk4AN/gnTfJM1hLsuFq4ilLM4wHvX7z0mo6aFcVMyah+lV/H9yvb0g5B/D
         muhvs0qmYI4h/ckevcgGrivq6g6Vfe2bFODY4Oz4pEn2A87D1KRSW7uM+gfmXCBcBmdu
         5MUYYuk7r7E2BOoLgxmdxIKwVJowh8SIlDeziY3pHce8vHLP3T6PnToQFvcc/CL6XYgG
         UG4KJHN2Nye6OUVATe+AmU+3B1KRt1aub8T4AVxai6FVYd36ptjAUDpRIQjQaqwFx3I4
         I3mQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cP2KoLsy;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=B98UtT4Cgzy6QjXzAPyOVlVl4JYqUWVSdp1yjkNhGg4=;
        b=VLrYN8cpJ60h/yulaX2+dpNia2ybaVjOI90BDX50TCUqpWBQUdB8cUPYPrsF1JKQk9
         Faqiuc9UjPrHNkZcZ89RKuWDcjN7bKqsHVuGWRtWLLN18Nkj6R92wMcl6AV97Zc8NRd2
         3WF2khPxxRUwgqhZXtijhzDafmjoVGUVQvMR9HXS3EIlref4pev5zra03FMYZUwplWt6
         NUDOhfzKv2FM9+oCNn7MA0PGMuDmBv9P5vOW/1wZ6s4hQhxvUFHCYnJuIrEMDUmR0EUn
         BaTWm6vmgU3mFaAtoDV/KWPR35cPSULSowQ+bx56pTQTiWprW+sPyGopAkPUwPYDNz2t
         qk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B98UtT4Cgzy6QjXzAPyOVlVl4JYqUWVSdp1yjkNhGg4=;
        b=JacOkE9fwjBn/6Uw4/ksf2qjSjLc8HqxJZhCl651Dubh/OcwZ+Ee8hLjEcdX8XegRp
         hLnjENcy9z5rue0aSPmxbfcAcNneKfmJNr1D4POBmeoq91UhJSA4MYv1RdE8dUjLGCUp
         JzxXzssdgvWEMnUCj4R04gFBQakUzGsDknWWtpsv6ScmjFnobhXkhpcsPCSeH/S5lG+D
         Y4tMvusflLP2TfXvlSdEv6wyaUKqOzSksXSbjjFYoOyPvra3rB6HizAcmU8Gl1N2kFl8
         O7nJ2NlqxqQHAV5OBCz3ml8OtDH39k2gaFT2XrR5ZAcqAMMPuBLIn8zSvlYGQTCa8fd/
         k+GQ==
X-Gm-Message-State: AOAM531ErWRMbFSHB0roNbMN0wYQ/+9lqmTWEdzMx6XR2GmWO1JXN2re
	yH0kz99ukRujhWFsP+KB8go=
X-Google-Smtp-Source: ABdhPJwCwVa3lLUsPsFbaoo+x+QfiVzm2cRXvHD+W5Vnb9gMI4+l8z0RtL/eAZVjsFpm2LJuqypkCg==
X-Received: by 2002:a37:812:: with SMTP id 18mr8461075qki.296.1591880082243;
        Thu, 11 Jun 2020 05:54:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:488a:: with SMTP id i10ls876329qtq.2.gmail; Thu, 11 Jun
 2020 05:54:41 -0700 (PDT)
X-Received: by 2002:ac8:44b3:: with SMTP id a19mr8355172qto.285.1591880081713;
        Thu, 11 Jun 2020 05:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880081; cv=none;
        d=google.com; s=arc-20160816;
        b=oH7/uTUvWWEzyNiNa0Txck3a+VTGXMt8sJFlMCZEsfM9IF/6QLDSXVIKqGyEcZKCFb
         qDQ0P4JIw/M2pO6Iaf/nDmrE0zfkzZ6j5HqLBCrqSeSWQvr0lCEZ3k+8tG6F+7gSbfCP
         yjdbgfd8ITqZekCI8YdEPDCm7avDPJLO4yRaivUw6n9wwDyq18+3lSHAGbUBJT18BMPH
         axzaCEn83j5hdR1NJpS+Hthnyj34dIWXYQIIvNi8dRNNDdVhKaov3rWeiNA9mrBWvvxu
         mDsaJQjQpW8JBhA2ieWxWbJ4kueILvWZqI3ToBD+WNCTRA/LnWNlhV6c7PzbcucMZUdE
         0qNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SFnHqZafiFmgmzmVLI9iLh/x0NK8iawzFkLgZ1YI49Y=;
        b=LxBKxch/utfxf1Q5zrVtuZp3Sl7k7cni2rbbF+M7UySMrPLVoyfsi7myvie4FNE0va
         WYnz0Vbr4WDxFFm7b/vG3ndTRlERpJTLcI3tT+VJeCC6mv0caFWZcJx4Ylz7QQFUIj+e
         Y2DDE3r/XKVUAqUhk+OtWrhbunifSclEgkuIG7pWG5G6KwFuN4tGA/l1QMNBvO8CrLLT
         JED0BQ2R65s6bU6atHzmpCjmfLVci8HNiQCV+WBl4R7JhFqSMJJpgOE7PY2WI6oAGIV/
         FxYIZn/Jdt1nuI0CDItZhU7YPItXXiMs8qAdtg+9ITAczvt0BiPJ9o1UgolWyUU9pOY2
         D1wg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cP2KoLsy;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id y21si247285qka.2.2020.06.11.05.54.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsftf081436;
	Thu, 11 Jun 2020 07:54:41 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BCsf21038926
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2020 07:54:41 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:40 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:40 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2m062138;
	Thu, 11 Jun 2020 07:54:39 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 9/9] configs: k3-j721e-evm: Fix memory overlaps
Date: Thu, 11 Jun 2020 18:24:23 +0530
Message-ID: <20200611125423.16770-10-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
References: <20200611125423.16770-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=cP2KoLsy;       spf=pass
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

Fix errors reported by jailhouse-config-check
Fix overlap of baremetal demos with IVSHMEM.
Remove regions of memory which is already covered as part of
some other memory region.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-inmate-demo.c |  2 +-
 configs/arm64/k3-j721e-evm-linux-demo.c  |  2 +-
 configs/arm64/k3-j721e-evm.c             | 31 ++++--------------------
 3 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
index 39c6c414..45a9202f 100644
--- a/configs/arm64/k3-j721e-evm-inmate-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -86,7 +86,7 @@ struct {
 				JAILHOUSE_MEM_IO,
 		},
 		/* RAM */ {
-			.phys_start = 0x89ff00000,
+			.phys_start = 0x89ff40000,
 			.virt_start = 0,
 			.size = 0x00010000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 05517751..5b6aa82e 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -163,7 +163,7 @@ struct {
 				JAILHOUSE_MEM_IO,
 		},
 		/* linux-loader space */ {
-			.phys_start = 0x89ff00000,
+			.phys_start = 0x89ff40000,
 			.virt_start = 0x0,
 			.size = 0x10000,	/* 64KB */
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 41f4c456..ab13fedd 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -152,20 +152,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* usbss0 */ {
-			.phys_start = 0x06000000,
-			.virt_start = 0x06000000,
-			.size = 0x00400000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* usbss1 */ {
-			.phys_start = 0x06400000,
-			.virt_start = 0x06400000,
-			.size = 0x00400000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
 		/* Most peripherals */ {
 			.phys_start = 0x01000000,
 			.virt_start = 0x01000000,
@@ -222,13 +208,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* MSMC SRAM */ {
-			.phys_start = 0x4E20000000,
-			.virt_start = 0x4E20000000,
-			.size = 0x00080000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_DMA,
-		},
 
 		/* MCU NAVSS */ {
 			.phys_start = 0x28380000,
@@ -275,7 +254,7 @@ struct {
 		/* MCU WKUP peripheral window */ {
 			.phys_start = 0x42040000,
 			.virt_start = 0x42040000,
-			.size = 0x03ac3000,
+			.size = 0x030c0000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
@@ -338,10 +317,10 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* RAM - reserved for ivshmem and baremetal apps */ {
-			.phys_start = 0x89fe00000,
-			.virt_start = 0x89fe00000,
-			.size = 0x200000,
+		/* RAM - reserved for baremetal apps */ {
+			.phys_start = 0x89ff40000,
+			.virt_start = 0x89ff40000,
+			.size = 0x10000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 		},
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-10-nikhil.nd%40ti.com.
