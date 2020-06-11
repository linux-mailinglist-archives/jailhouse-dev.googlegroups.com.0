Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBBWTRD3QKGQEYTHF6NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id C834E1F6853
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:31 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id k186sf6421146yba.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880070; cv=pass;
        d=google.com; s=arc-20160816;
        b=VFZuReFM4xAG7y2WsuxDV9mCRYWXp7fbibOaQfH06eAEVf4NdiMTHGZTl50wfJCiV/
         wVJ6wj5UsliAesd3OXfMjWsiy5kNKqyuRqWwXuN4Zmujw3ZtPTBpcJ7OZUAToghdDQay
         TOhNsi+cjkChuQHXHCvFP7YrYteqcz3sQD1YUXfy6HVELsuwYQcU4KuM4aGFhPx+OYyZ
         YFi8BNwZZ4PpRA3B2Owzq0NhGzYsryJqON3TO2OtdfpydcWWkAbvnWMdsqPxw/GBexZb
         oBksGSdm4uDxrhUI4Uq3I58Ys8dr8N08C5dlz57DqBkmrb/LkZkh9/wpRlFc7+4r/YI5
         lzOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=rjiI7qovxjvJctePSFMqcOezK5nCO5l8D6ctuUfAkL8=;
        b=dinXDuFY9znemqQF/HR9s8cjc7xruvOHQSukzkFLNLdNnXhJhu05qMvGKdhrmBR9rH
         aZwZi1SjN/MbWPcV+MDCFMkBghCIsfWKI7y5RrEa+HP4bKpGXqDA3redlHdYDvIM8djF
         D4I4xEVsjwX1IK3er+ZagjhRyz6W7HmHgqgdfGxVMwc3CUnDcP/Gxi58B65ar/B5cwoZ
         +LC4tma6Zb3As1fTODhtaH9UnwdECkAkwbiLwsMDUpdrrcaglsDpwM5KZHUT6NxUwrND
         PzJwIrbfqz2j4Q0jEnu38M7F38L83cKg7bhDJCVGi/TRvtkzWr5bCHWP0B5NB/bHSxfa
         5Kyg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f8hV0tYz;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rjiI7qovxjvJctePSFMqcOezK5nCO5l8D6ctuUfAkL8=;
        b=GGmxXKDwTGPIusrH80yA6sanKH3lDLs7lEkLWku7INzJF7hGwppwHQfrIHehj8tv+P
         PjAMEZ2vxmXtq9HRCXzQPfwi6Q8yQamaIfj74L8/O2tkAY91kUniMLSZr0QVMuQFbLsI
         mGO/Osu4qq7yQhIAXk/XtXbcnXLczyd5Gd6oBYXP8eFl7UR5i0zi1IwYGfkACwop8Gnp
         fdOUU3Tcqa+k0740C7cEsB1R61cYkcwPgwr9ZztYPq3ZP1CnBVFLyCv38b1gAUNjvsIS
         Iu0nL1ttZXkKQjClOAJeRKIv3cCU92DWhAjMK50RLETcB/0KIJXvkk0vNdSFu6hIrtvZ
         LnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rjiI7qovxjvJctePSFMqcOezK5nCO5l8D6ctuUfAkL8=;
        b=pIIa0UIrBFT3Ty1W3Bmor9wlvhxJ7B2uFdUdK4MGRs1DgzqnwXc8VGQXYoUAIUbIol
         aasckiV3Aa1WwKnNidyDhb/3WCNZaF3MRYOKeR9ItUcaviQBOu4NebXhQGD8IDsH04SB
         fd8wGyR805jiPAqjEfoxiYB2tM858LNrR3B1aV7AapPH1PPxCbIINYPMUkYbAQEOB+BT
         EqfI+wTyC6y/ltdcMtma9txQY4vcrhvbBF0gvUbeNF5PLGLnC1OUF5ahd7xNcbe4ktVF
         GhH0o6lpYvtI6RhUN+h3mzjzRj0mNnkuL0wCzb5Nd1SPODRSLe+rD8QsXigUyu9u8Z+V
         XzqA==
X-Gm-Message-State: AOAM532ketmFkk9o+snSwXW2MOhz2Oi6ROLc0Vb0o8N96L86yroLiiFM
	BbdQd6JR6hyeQ5OZEaZqDFg=
X-Google-Smtp-Source: ABdhPJzLAbnw2wzIJZV3pRe4yypgCA8MXjiE5rY1vLS8aLVra27QibOHCNRb8afP+6k614RNmowHGQ==
X-Received: by 2002:a25:9345:: with SMTP id g5mr13056410ybo.485.1591880070449;
        Thu, 11 Jun 2020 05:54:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:be4d:: with SMTP id d13ls849501ybm.2.gmail; Thu, 11 Jun
 2020 05:54:30 -0700 (PDT)
X-Received: by 2002:a25:5186:: with SMTP id f128mr7291549ybb.293.1591880069958;
        Thu, 11 Jun 2020 05:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880069; cv=none;
        d=google.com; s=arc-20160816;
        b=Aj73vrHPwihnjMkrk5KscmBIr6e2whP/vhIH5VGM8ICKKn4WepDAh/ngqWY+8Snm46
         T3WHVhfc6zNHIGeEJJmezy/Tceov/ZRy6mUcCfPeX0fiaxI8jDKdGtUmcL+7Yf9loIPm
         ABflMLogRe0ZTtn0ATx6/t7hJuGE/PSHzNG9VHZGaoN+zp/qma0SCNtideOo593CkCK4
         XorHuWi1mpX/KEwuVR9dqwhbN/bBCoeB4yUsGme/YjkyKtkUBZCD0l2LM5KDN1mCGHTj
         RPDKA9oruYaVsnF0HoWFIPqtoaHHednLN6zwV+f9CR9IbaRX9pOf3VXoquqOdjxwRfBz
         FkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GciPhrbWq+i9lifQCVoFTxv0ZJmEjmdpsrdO0/G3LL8=;
        b=QQqLf93NrKsJT7J3FSZEbDLfGFuHwUgsHtl7Fxnf4xOs9tu+1nlqUdoGY6hgPoJzCB
         CgsTPKubqoeMziBd1tH1hZIUodaUSKHIJS0LYFAgbw6sZPpIW8BcgIwcLNks3XUmKmnk
         SwFuMpeKDZXCeo81VRnL/SsXeZrRh6ofgfckLQmjne5OyOX6b0CbCB3Pyou9Si6FlUA3
         tXAt2MGrU393erqpFSB/bmOiUHcBS5UwGLADbZ7BDTUVMDhfqulH1VpnScV05uCbNJrQ
         U1RqFHIslc0JXhAg3fUdB/YBDu4kb4YshXo0qJoaDRcXHMLXruEgoXK9Xpykwwasv7Sh
         lDnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f8hV0tYz;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id n82si308561ybc.3.2020.06.11.05.54.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsTeB081378;
	Thu, 11 Jun 2020 07:54:29 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BCsTlV063271
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2020 07:54:29 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:29 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2f062138;
	Thu, 11 Jun 2020 07:54:27 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 2/9] driver: pci: Use page size to set the aperture size
Date: Thu, 11 Jun 2020 18:24:16 +0530
Message-ID: <20200611125423.16770-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
References: <20200611125423.16770-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=f8hV0tYz;       spf=pass
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

PCIe host controller is added by jailhouse kernel module via
an overlay. The aperture size is currently set to 2 pages
assuming 4kb page size.

Update to use the PAGE_SIZE macro so as to work with kernels
where page size is configured for 64kb.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 driver/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/driver/pci.c b/driver/pci.c
index 601e2d96..da516479 100644
--- a/driver/pci.c
+++ b/driver/pci.c
@@ -439,7 +439,8 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
 		*prop_val++ = cpu_to_be32(base_addr >> 32);
 	*prop_val++ = cpu_to_be32(base_addr);
 	*prop_val++ = 0;
-	*prop_val = cpu_to_be32(count_ivshmem_devices(root_cell) * 0x2000);
+	*prop_val = cpu_to_be32(count_ivshmem_devices(root_cell) *
+				2 * PAGE_SIZE);
 
 	if (of_changeset_add_property(&overlay_changeset, vpci_node, prop) < 0)
 		goto out;
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-3-nikhil.nd%40ti.com.
