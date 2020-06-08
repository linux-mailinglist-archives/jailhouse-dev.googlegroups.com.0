Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBNFM7D3AKGQE3CY65FA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0E51F16DC
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:01 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id z6sf7660266otq.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612980; cv=pass;
        d=google.com; s=arc-20160816;
        b=ba9VdnXZHY4cX2JWOs+/hOfxIp9hJle7fvX6nJSevBHhzqk9CZbiLifX34ukFo5Ag6
         zClX4frd6k/S2yML0cGrg5Tq/Agky7Rnpm3yhisk0ehuE9cF+T2PuWWujB4o7Im4tyLY
         WKGh9Doyi9chNHqvz7Mi34U9Bh6hid6Dn74nf5ysedZo7okF+YVFvDq+gWS6LYG4WD9v
         iricFQwOU+PV3oOYHk9mtD04xonpwABTAA+9wsUDLRZEin4dzoKaGf6Y0jJ70hR2HIzc
         3Vqktp+Ynq17edyVJYSinvd02O2PYG3zXuoUezbMEBmUdHPj44WC5Ct64gicSFEX3Rcj
         R2tA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ecwHA2LOwyqr3Myd4EH9BPAnAUC03qG5GlDL9qp/a7k=;
        b=slQ34zlfoiVkNmdE2m4rMUeARF7Cw8jqDoKnxw57LKF+qY02gDiGRa9G23kny+ufZ5
         SfGs32sHJzaOp1/qA2lJn3Jl6Ou+YbjoPxm4NGHsGd9WW28Fran7zyjdFnrv3JWpZB0Q
         An+XSDuqwobraPFysVrX71NTqQ7Fcg/lRz8/GzlqNqd6qx7JQEZ1DYz2IwghBJtMxSu1
         zvmLXRwT3KTo+UTMWpFqLjV17Igw+dYncDUon6/2PBy4H3vfAXGfJYqxSeTfyJAEjlbm
         xyfYEwOUw7K09kbhYfc3ydYcJ00eRoo764fMNvm1aMSqQ5dV/JXyH/uF5pBDZvYRPIKd
         XoyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M18uiwj8;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ecwHA2LOwyqr3Myd4EH9BPAnAUC03qG5GlDL9qp/a7k=;
        b=tjzI3F2yNeMLIx+8VhSSJ50wz1ZzkZx+3gMfB8J1JplR9T/0V5P3w2SJrtG7A/pJqJ
         G8xAllHEGABkcw4+0ZRlABwHaUt+5lrMv8LLLhRRC1zrP7yILgKCI4o1jUNIrqGz+HGg
         I5ULHR2OOpJKiCJ1n93MiUOQlgq82mejN/KNgyrH//nu3RUv3Xm3uQ4r6KIb5MqSLDzn
         zrtvQR1jcud4NiPM+jGEqrWzVUnioVkwqLzfU0J3zgKVgWneXFN9HZwYad44Cfxnkn/N
         in4/wIYfR9PU9IUOULRF05f+8+htTM2MeI8kll5bpxABiEyh9bKRo7SdwBBurIAsra+t
         nnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ecwHA2LOwyqr3Myd4EH9BPAnAUC03qG5GlDL9qp/a7k=;
        b=iWvc7znDbTV+U0DvJye7hhKG8zVRN2qW5j720+CHTWhP4mApGlMe7juG7So/KkWaCw
         mZRgiJzYo7XjQOmbI7sa2JY1oWDQCcBnc7EnxfJJrZTPI7sLv7ZFES8MP3VE/IIXfilX
         N1KaATmtGQqNB975cYjOpbG/3kwpNcqs0iSyUlHuj+ZTuZPAwhTGIwXoG/Kf+idt5te6
         mToC0NoW4COz7XkOsQ4DKM2NoZSuiF3/BYbaTtJm4YPZrz+szlxyXtrGUw0JzVHEGZo7
         s3nw1LLzRxIJQt5EQ+RXIVz99hV56GVV4qIOoWSWmxuBuzozqG8YjF9PAHbaY2zlUddu
         XFNg==
X-Gm-Message-State: AOAM532QgKZMQ/lC2drVm7uxRT7i7TCbyOuWfbS2LMmlWd6dgJFcRGCr
	Xv3+tdAyeyrttjDqDe/fmX0=
X-Google-Smtp-Source: ABdhPJzUCcaPE6kVijff5kCwiWhdZo37U8pEI8kBibEVd+7CX5hYQWPRv3j5Tu2OxEDoPvd9Jj1v5w==
X-Received: by 2002:a9d:4507:: with SMTP id w7mr16776424ote.335.1591612980824;
        Mon, 08 Jun 2020 03:43:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4549:: with SMTP id p9ls1029019oti.11.gmail; Mon, 08 Jun
 2020 03:43:00 -0700 (PDT)
X-Received: by 2002:a9d:36d:: with SMTP id 100mr16821633otv.328.1591612980314;
        Mon, 08 Jun 2020 03:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612980; cv=none;
        d=google.com; s=arc-20160816;
        b=UrUm4yGH4Hzfpu7BcUZHSPljAlcMpSpy23cXkybGApTVRzzFglq9Wdn5BliBHQ2Mcz
         MFW58rzPTFyL3hG57OkYsdY7+y+iyXCPzNbQk3vC3FFBBhCSBO2L7s9/MTsb0jSbdt9D
         O8t1GIckELKN5JzPivdiVFL1HcvjnKDaud9gAAsDTZ615VT/2CmJ45bwcC2ASijw+AsK
         2ChALFQs2OeRFfREShx8exTkL5iu6MeHxzB33lzICWBVgX5QEy9yrob1Nobqf0cPvaKg
         EwYxtCAjkC/58LWO8BTjT61MDaq8T4o1b1Ba+K3rEoSOs00ZEgKqlLZvU15WHqU80zxw
         I6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eJzbmuRcYy1p1enZtkbkAziLfFtIUN6wyKWxa3K3nDs=;
        b=nlF0pGqtzc8NexbzQ9Q9DzAbRznB2MDygWAZLu53C8KCUwzZ9bhsvVSLIEhGr8Vsjf
         jyRVNiU85Cx1u58kV9/RZLHZ0texIt1kdBHkw1F4quuMohlUflbI3iyet3pvgBjz8x7o
         Y3hR1H+qlgEb8fkLby07WM+vvrdHZvYYn+UT0nw48B5gtBfZDWEpkXKwbY4MGb5OlEIS
         Wtz4ADc5aI8R2mo9TEiC49B+qtJnrFVFyhloQKBoDGU0WfKJqxQhm80JReuXjzFM+/Od
         UD+PDA+3bVbGlw8ih+6YKRI9W0Bad5HHknATicsd3HG9nT+z1mzSbHyhIqTinvAc8rSc
         QjiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M18uiwj8;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id k69si686711oih.3.2020.06.08.03.43.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058Ah01M041566;
	Mon, 8 Jun 2020 05:43:00 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058Ah012046385
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:43:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:42:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:42:59 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Aguh2012229;
	Mon, 8 Jun 2020 05:42:58 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 1/9] include: cell-config: Add new macros for 64K aigned BAR
Date: Mon, 8 Jun 2020 16:12:47 +0530
Message-ID: <20200608104255.18358-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608104255.18358-1-nikhil.nd@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=M18uiwj8;       spf=pass
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

When working with a kernel using 64k page sizes, the BARs
used for enumerating the IVSHMEM PCIe device should be
aligned with 64k page size.

Add new macros which describe 64k aligned BAR sizes.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 include/jailhouse/cell-config.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 47fc251f..6df4a745 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -226,6 +226,18 @@ struct jailhouse_pci_device {
 		0x00000000, 0x00000000, 0x00000000,	\
 	}
 
+#define JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K		\
+	{						\
+		0xffff0000, 0x00000000, 0x00000000,	\
+		0x00000000, 0x00000000, 0x00000000,	\
+	}
+
+#define JAILHOUSE_IVSHMEM_BAR_MASK_MSIX_64K		\
+	{						\
+		0xffff0000, 0xfffffe00, 0x00000000,	\
+		0x00000000, 0x00000000, 0x00000000,	\
+	}
+
 #define JAILHOUSE_PCI_EXT_CAP		0x8000
 
 #define JAILHOUSE_PCICAPS_WRITE		0x0001
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-2-nikhil.nd%40ti.com.
