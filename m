Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBEGTRD3QKGQEDNHI3CA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F311F6859
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:41 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id y3sf6514104ybf.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880080; cv=pass;
        d=google.com; s=arc-20160816;
        b=K+s3GGQ1KgPtSjTd0puuxoyZU+wVbP59U1BWMidx1NAZ1JfKf5M8c9/2a5DmD7E7JD
         o93MwdmVjpw0GGrlw8E0VgURyep6C4OP8lhpfZa8bnBDLAx24jt3Iwq4eo6UwWCWVPdb
         Dw3SxR0Hzn2nq9l1539h5qfjMDTANv7SnU0/J9IV0rW8uoTDuZXfe4agJJvI4IIKCYCC
         IV0gofAh5oi8FWde6P2MyuOiEu6jcsQt7j2IdDqcDs/H4v4czYNKFUrqk4S07hVzveWa
         yQIDsyfePjiCjRo7pnNIMZlhLXTC5rgr18/H+bJYjJb9GcAeNVpxFOo0t88FFzIdehQv
         ZMiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=APTLuKc544JbVh9xqS078NM417ltPg3BWDcryldUvjA=;
        b=lhwAqTvTOwCRGJBA0dQmGhSqOy4H9CdARqxfcuZ32QJTFJ0mmqDxZ5OmYeIUPsH+Mo
         rr0WgPhu2RX0Y1JQfJeOLhWz7OgV1Yh5+R1VDdUQzfuBhso77+uhUgFqq+begq+5xWGg
         A1WeqtUq6BzVX7fNtCxhtI4o1fYxOOUMh3mhD4qiM5FaNxu8GYknIczLP7hi1d/XVaXn
         U3Pg/0BLl5BGZnVkx3lRfmNe3QaBNsPvYI34e6+KCqYAaFwgAdxNdJ3cKm6Y4Tc/hMG3
         KtHvm5Xh+kwUyA8snT01iv1WfudtoKoO0AdnC8TrXSMIYMRFsQiIatVqX1f0iiV0BZwp
         q2jA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y2oAShwT;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=APTLuKc544JbVh9xqS078NM417ltPg3BWDcryldUvjA=;
        b=bWDthXVK6Lt5tt6YTZKzk1yh2WAkOiy9HQcZl1sv4FUDYye41jKGpWlc5yV70v+KX4
         8zru2W362YTysNO5CaqkIZdYqQ3cymO0xhB/DDfKvhSnQh/03SUmlJwmjLWvj0IKZ1Df
         75723B/AHiw0b8p1jGhOVzh50VIUURibZQJoKzXxDduwwIpcb6+3cxhvoNucKtXu4z27
         cvkO3SLTB600uriwIYSvz1eKPO3GtBrWJZYv/AfqAkjx5Ax3rCYgDXM1sv1Z7wm2jOUu
         AKRr3NqJmnhArI9ZwIH1oXJtZCERssNrSk0yvZPqQ8FYziv4ETuge3Uma4IeHypDP615
         f2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=APTLuKc544JbVh9xqS078NM417ltPg3BWDcryldUvjA=;
        b=dbBRe+Me1IHjUWT41ToD2SazAoKcXDiURVRmsHFhBzL6uQdfcKh01x5pSJBpxuhgjC
         YL/fW+kxlu0MtCTBr3gmRO9ueDgZrjZZsO9WjvVbx/03uVeB2B7jdNCg2mFWFgR7bLDR
         xpjjQlBPk4XIWkFFlKDkp21VdMqcJtF/7gHJuwudjZgDtxrbGfqbMtj5yGO1nrkCOrxW
         4X5yf8sSyerI/gjJ5A0WyIhIztC2fwWp/ek5VkbFrWjo+w+NJ4+OirLx6bdaX2lycmS9
         j2ghQUvTp7ThXbOMoGyT8WwIQAgqR1StZmz0J40ZX/c2EgqP9shBEV2ekV/zgMi1hles
         dIgQ==
X-Gm-Message-State: AOAM530tfOZ7Jqr/DVIwDW5tNQe/7FINXX3J5jLFyMocsZ02ACNOh9aH
	keFCrTkyw1tOjqlO8kK402A=
X-Google-Smtp-Source: ABdhPJynObWSPZ36TLiqMjrLLo6dM2I8YjjsLOMFQxE9qPZOI06W3HYzhEyWyOovfcijfDUUeOUqQA==
X-Received: by 2002:a25:c683:: with SMTP id k125mr14431877ybf.305.1591880080434;
        Thu, 11 Jun 2020 05:54:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:4707:: with SMTP id u7ls842906yba.5.gmail; Thu, 11 Jun
 2020 05:54:40 -0700 (PDT)
X-Received: by 2002:a25:2fc5:: with SMTP id v188mr13635944ybv.130.1591880079913;
        Thu, 11 Jun 2020 05:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880079; cv=none;
        d=google.com; s=arc-20160816;
        b=wXY83qh/knv28VUydXUTpotZnX6r+B1rMPj9ly4NXmDz3010q9ONDJrMmYZnRwSPE2
         ZLA8411ZDmmwlQvJpTCLrcn7/x3VuOCUd7dzxtN2qdOnxdhITc7JEj8JiGgdi4rZl7xV
         qjNUuyX7by/4LDeEJFAr3pCM9scTkWmZJdm6JHW74b42/WNLgEKUD2DrnGfLe4+M1C0a
         Fh+1dNs9HfqrwEoe4iIKkIQlRmd0mPjHrYFtg4s5WgJEVNphwM0gqcV6dxTo4No6Q7i0
         Y4FXM5edHL2Y08Ng4/GVX/8a+ypKDx67gd0Sf/xBE8ccFObz+ffEAqi3amcXl0wY+vX8
         N4gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5ui5N0cQtlzbPLllpMJdkwufxOBJrhNkm4dEfv+fo6A=;
        b=Nv+izVFrL6mhbapHuMlIeE7tv3McmC9teI4S5CNSzf5PmPTSGYh9eosLmac20ju2uB
         oK3pzcZTJxcrOn9FTRaGLppZqjGh51lD+ccJVp9AXGJxRR/q6JUjqlkTKrbVhddr/8rJ
         hIGLcf08dRfiQLezJsnKyMdKlYAE/pEn4f7wLAjrvgvO4oiG1js28fHnPYJiLJNVvL4o
         6n5vaDaLcCGR3vBQRAXw55i5EIj0P77LDfSQQ9+M97r7a0gx5bGFDPPSjFmMOFBdlhX9
         lJceBkwvuZyPawaVW4ci8Uo+o/+q5cNE+rVlyrlRYGcn/zwmV6AhaeDPT3T07Nsa1zNW
         q9Rw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=y2oAShwT;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id n63si229964ybb.1.2020.06.11.05.54.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsd7Z081426;
	Thu, 11 Jun 2020 07:54:39 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BCsdC8038912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2020 07:54:39 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:39 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2l062138;
	Thu, 11 Jun 2020 07:54:37 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 8/9] inmates: ivshmem-demo: Parse target from cmdline
Date: Thu, 11 Jun 2020 18:24:22 +0530
Message-ID: <20200611125423.16770-9-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
References: <20200611125423.16770-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=y2oAShwT;       spf=pass
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

Generalize the ivshmem-demo to work on different platforms
with different number of peers and ability to send interrupt
to any peer.

By default, the demo sends interrupt to next peer in a ring fashion.
Optionally, allow to specify the target peer from commandline.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 inmates/demos/ivshmem-demo.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/inmates/demos/ivshmem-demo.c b/inmates/demos/ivshmem-demo.c
index e7a7f711..37a6ae3a 100644
--- a/inmates/demos/ivshmem-demo.c
+++ b/inmates/demos/ivshmem-demo.c
@@ -36,7 +36,7 @@
 
 static int irq_counter[MAX_VECTORS];
 static struct ivshmem_dev_data dev;
-static unsigned int irq_base, vectors;
+static unsigned int irq_base, vectors, target;
 
 struct ivshm_regs {
 	u32 id;
@@ -132,6 +132,9 @@ static void init_device(struct ivshmem_dev_data *d)
 	max_peers = mmio_read32(&d->registers->max_peers);
 	printk("IVSHMEM: max. peers is %d\n", max_peers);
 
+	target = (d->id + 1) % max_peers;
+	target = cmdline_parse_int("target", target);
+
 	d->state_table_sz =
 		pci_read_config(d->bdf, vndr_cap + IVSHMEM_CFG_STATE_TAB_SZ, 4);
 	d->rw_section_sz =
@@ -173,7 +176,6 @@ static void init_device(struct ivshmem_dev_data *d)
 static void send_irq(struct ivshmem_dev_data *d)
 {
 	u32 int_no = d->msix_cap > 0 ? (d->id + 1) : 0;
-	u32 target = d->id < 2 ? (d->id + 1) : 0;
 
 	disable_irqs();
 	printk("\nIVSHMEM: sending IRQ %d to peer %d\n", int_no, target);
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-9-nikhil.nd%40ti.com.
