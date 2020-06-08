Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBQFM7D3AKGQEZLAXFAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE5D1F16E3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:13 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id e6sf8693247oib.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612992; cv=pass;
        d=google.com; s=arc-20160816;
        b=BrJvXdiGc4GBq5HHg+NFGLEQoZSuNNmSGN61pxrpYcDrLBYnrothSN/+QPAjfa/QmP
         64haE+xwnyotnmB/hEYcW/xntEScPEe1hOXiprJgLNUxwdF3S9TCtcf201fT+mUrJar8
         k6tYy1vuXDvu2zA/yz6naTZB86g41gJwWOGX0/uHYXgutv0Jgy/sM2C+LuGKACMuGjyt
         zEwfKV8HjYLlne4k33+bM/H94rzLfY4hAwV/t8a2zpq/lKCPaF+h+Sd7eBLqlwXLlsOB
         oFMnZGYpAglg2wXIf0mQhCXvplrfV+GIqSkgTv1W2jQhRO76NvFjPxK3c9I9GQvcszYm
         bfSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=+6lriRLOaakuSyM+1tBOwUAnCoex54wG2Z75AtpxEAI=;
        b=G9yw2E/EvwigrgBmboywVN38ZnswBShWNFj0hUkbkG4IBNCt/doJesUubJ8ycZKf41
         YVg0w+AHegNlVGOBZnX5JF6dOeuGJBH75JN3PAkix0zHjDmAZV4S0kd+faMmKbAXI+5I
         65a/yL3+QzP3k7yQ/HkgoW2A+Y7CkfjEmZpT6HThdFAMVNtJO2YWuwvO7duZ/zs15AhB
         BpRQ1ZaI/OiuLI3sDKPh8bna3OsVx260OAFxkJNSijuzzir20h+scPXfDB9kuIvuvGH1
         XWJvbthqcyjKAJHwGOz7qPcZ98s5FM4qwCpM7iqFpMfXTUNVtmE2f7x3YcRO7CpW7kKj
         J4hQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rLDGk5n5;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+6lriRLOaakuSyM+1tBOwUAnCoex54wG2Z75AtpxEAI=;
        b=Z3Og/6OeoDzGVZ53QkKyqIPV+VtfRP3Z3wa4bpwpqf86FN7ZEudR1ILX4WGNp7Xk18
         Av8s+g44hII2UKluJGyGLU8hGsGRjQGE1jkH1cUisSJEZmBWCtfGBHrUpJ/aCHG9IrZ6
         HFKzg0PLl5CyScepuiglgmAagOYWFq9mF4gy5ubtrxGYC+dgu82/hqQTEOd1Z0dOZift
         lyP/lrcj0rySAO8ON8p4rUBg/B3dk+n10tYTW4kHTPr7bb9N4y6RJ3F0bf4XkAwMPo2i
         A+Q0i3LWW7Vce7psAgATjWR47xrPMe1zq/9slNMfu5Z7xG4tv+r6X+wskNaohLcjKl79
         GxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+6lriRLOaakuSyM+1tBOwUAnCoex54wG2Z75AtpxEAI=;
        b=cyZhwUQ09efTecYTq30H1VfJHeyj4Lx08pj1JIJkpL45F87onuazxT7uN5MpNIluZQ
         lvnusVAVK14B7BU7JghHycT0UmpQCE6KohN5f1VbESFGYr2vYY+sQefj3ukadzyff6Nv
         pludgsi0X5eQscWdz++BlizHipLK18HPDWQAJaOnAMx6BCrEdtlEtr/aln2zC8iYwQLJ
         d46r9lRUFbwuQczyNrePT+C7GdqrAYlzU0zE1mRMVY+rpcfjwh9pMihpJr1Cktb1iaKB
         Cqzt2WpUIrVvH4USzb3fBx2KGwhcBeKAKQMnkK7Kod/G9q0tDl8GlZBj1CaFPEmXrdCN
         lnDw==
X-Gm-Message-State: AOAM532CeQRl1pv6OGxtsG64oO3Favltsbt71jjuP5MX74/rZdS2eHEY
	O9FgUQ3r/QSUdMLaYz5fSeA=
X-Google-Smtp-Source: ABdhPJzDxTOoZy/xotVYI7UatjIpUwOSye2zk6DtqcFU41JBZpE4htaA1Y7qtUbkU1tg/3wJJ1UrLw==
X-Received: by 2002:aca:60c5:: with SMTP id u188mr4923477oib.129.1591612992471;
        Mon, 08 Jun 2020 03:43:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:4fc3:: with SMTP id d186ls3049398oib.1.gmail; Mon, 08
 Jun 2020 03:43:12 -0700 (PDT)
X-Received: by 2002:aca:55d2:: with SMTP id j201mr5774156oib.88.1591612992135;
        Mon, 08 Jun 2020 03:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612992; cv=none;
        d=google.com; s=arc-20160816;
        b=THTm78Sjys8LFOzHRaFyCAG7Oo0rXwR5iGSrO4PsNIkE8O2k7sq7Uu330uQtAThoOl
         +RqyzfQwHWOjlGGQa9dfsPZBVFJSzYhC1BJN9m5myb5TTY7VgsX839wGVFdCWOFk2Ol9
         KErM0PXJTgT0Ys7au8WOrJ0Ps1BhKOXneo04qyk48X6dQUnNwtmuFnRf3Fd5yXaL3vcy
         mzUI5ySVuFMcqktstp04P51JI1C0QDuEtKuZ+PhKkfEO5CHrFGTrod3I24k0+EN5323v
         DmglywU426SzF1woTXOeq6PPJcbclD/+PFM0/a+gpo9gqE+jsKg/mwCM0oWzW9m+bakC
         nnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FLOJl/2Z/D3CXrxmqovlQ+Ey2xGR7kCXVc0xm/qU68U=;
        b=mMAgUhljJBiRiL3vs+hthSEZjgiegFXEZViAs1e9Y0/AAQHFwHR29Rdzwr44LJnBx5
         3rMAXhg1Y6IyDk3UX3Iu5Tu6b0qIaDyXSiwS68lwbGLKp2AuYFQJ2jb9zSOFHHJpP+7/
         hSR6v+MUdYOfOVc9+o349FmecTuiyiL7Yd27DjpKOPkwUp2/1X3bOPFnBHEiZmILiqX8
         0TSWaOdpS8vOgTPDcy8bjqZTZDWzxIiM+iR9oOtE5cuFz5XWn4ZQou6muDYkDAqQw1PD
         Z27A5j2TgSf1OOylZbziGtmhGaiBNzukNB0R070fRQLPhzrl0SermTz4dchCnjELvYlF
         5KdQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rLDGk5n5;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id d2si658583oig.4.2020.06.08.03.43.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058AhBKr085151;
	Mon, 8 Jun 2020 05:43:11 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058AhBoH047211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:43:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:43:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:43:11 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Aguh9012229;
	Mon, 8 Jun 2020 05:43:10 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 8/9] inmates: ivshmem-demo: Parse target from cmdline
Date: Mon, 8 Jun 2020 16:12:54 +0530
Message-ID: <20200608104255.18358-9-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608104255.18358-1-nikhil.nd@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=rLDGk5n5;       spf=pass
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

Generalize the ivshmem-demo to work on different platforms
with different number of peers.

Parse the target interrupt number from command line to allow
to launch the demo with capability to select the target interrupt.
Default value for target = 0 since root cell is always available.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 inmates/demos/ivshmem-demo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/inmates/demos/ivshmem-demo.c b/inmates/demos/ivshmem-demo.c
index e7a7f711..188c8af3 100644
--- a/inmates/demos/ivshmem-demo.c
+++ b/inmates/demos/ivshmem-demo.c
@@ -36,7 +36,7 @@
 
 static int irq_counter[MAX_VECTORS];
 static struct ivshmem_dev_data dev;
-static unsigned int irq_base, vectors;
+static unsigned int irq_base, vectors, target;
 
 struct ivshm_regs {
 	u32 id;
@@ -173,7 +173,6 @@ static void init_device(struct ivshmem_dev_data *d)
 static void send_irq(struct ivshmem_dev_data *d)
 {
 	u32 int_no = d->msix_cap > 0 ? (d->id + 1) : 0;
-	u32 target = d->id < 2 ? (d->id + 1) : 0;
 
 	disable_irqs();
 	printk("\nIVSHMEM: sending IRQ %d to peer %d\n", int_no, target);
@@ -187,6 +186,7 @@ void inmate_main(void)
 	int bdf;
 
 	irq_base = cmdline_parse_int("irq_base", DEFAULT_IRQ_BASE);
+	target = cmdline_parse_int("target", 0);
 
 	irq_init(irq_handler);
 	pci_init();
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-9-nikhil.nd%40ti.com.
