Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBWHH4OBAMGQER2GELZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id A251434502D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:29 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id f28sf50592ljo.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442329; cv=pass;
        d=google.com; s=arc-20160816;
        b=aNwX1UPtWMwk6sstj3dxSfWzRmI9M1SWoVEEcSIuevkcAmJqfSu+m8vW4oilIgBhMZ
         vYuW+SbiBnFHWhxdNx/Z6qMvcT+xNg1GcAoK7yjQ+YqtwTXFLwR1Rh+YUKGrkYhkUFdK
         tXaYdqjEnfc/Rf+ZOZob7TYihBWXsFGv/+ve5qIRgVNFFGFv00G+LF9rJRGMN+AxbrQR
         qdcukYroc0/zrmqti314CylVkh1kjABsruexM9CqD9bbo+T7LO/cNueQdeaDa5HCNFEf
         rfo60DruLp1Uk4FEWq88vBzGJC7EjsbEXsXdeA4SOVsnNAWkzBhOlT1Aqv+ypEXqLYvE
         VQLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/2j+JpY9ZGtJpJ18hHX14O1NmIsECDDHBvaVj1nyyHY=;
        b=tYhyPmYrbzjLbrTeuDUwkWokZsN3PdXv04AOa9yF6ZR+5Mww/IRnBkJ3nNrR3tlgH7
         6YVpm4jDHj8XFAurW6go8WQexEXwHDC/i1N1pRdIQRwQ0XBHfb+Fy4L3OR8zoB116na4
         F5P/2CPTo3+vt6EH34iBJ0q09WlBT38HMJ0Mqu7j7mo2ecKC4nI0zJHk8oxm8rm9W7B+
         5GDHyCy1gNBTtswobYtDVoMP8nvAE7A3vwkQ1oeJ7OaQ/ZaTyLAArAn/tv7UYy/1+3g6
         y9YLidZ+6XsEnpEYqQ/5l7DzYvZOR0wdicR95bRCjRvoznxzglhPVVJOg1ABR7HoZcZg
         iGFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="osGTa/TV";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/2j+JpY9ZGtJpJ18hHX14O1NmIsECDDHBvaVj1nyyHY=;
        b=shVf+wmXcacL7jzSGy52t16ealNdob6qn6ASQsMaetZ1DPoFiRC71wDTiehX3U3SmE
         N8O2poZvbmpyQ0BVpylUQ9UYj25FvhKK6mABEPjE370cXhG9d7Laqe8Ow4x/tQ1tsh59
         YBcnrgSVz9NWJ4gm9t98iZIOsf/Hwnkrcm/JegcS/ImGCSu+8HcWjGvvVvczN+FRbFuK
         +UlgDLqwx6IlqFibfLDRovn2EVP7bLF3/tdGFSGsidc4BKJSmOZTS+RkURXsWLr89wpC
         cUBZWOehDaaHRx42p+dJxMbm9AfUqxvnEp9u0i0LFdNgAEANFgloIieW7ecr6raA+2LF
         KeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/2j+JpY9ZGtJpJ18hHX14O1NmIsECDDHBvaVj1nyyHY=;
        b=LFGWTeNWb0JgKwtGbwkyzUDYJBQWtU+Qbrl31tpB4GKW/JvDtd8PHTX+NTym6nA9Gl
         f3cA6htpSPDun8XDV8GdxL0lh0OHNJ90xVL+IvS9XzTgGHyerB4Dd/QulkzjlRtMVhbI
         MOAe7j3KNZXkYvYcW8VQdv9qBFJBTxVpMqNJuWKamBbKB5feVqxZAg25whu6qkgYVtjq
         cJZdGVjDO4L58XVcvuiuyIFwxhQGlvGVynjFBUxhJFXEe6e4TOc8ncPw5SpZh1uYW9cP
         6M0xdndEBV1Yn4DDdGUZ6Dq0jfgrjbx4I2BN1nOWNEq+HxHvZxGimow8Q7QQW67kGMZ0
         yV2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533aurxJ336H0DAdwWJLjm0TUqCVcnZX/rVS6PhKOj8AdJ1xjUxw
	z0Np2Voqf8xc7ZKmvBDb1NQ=
X-Google-Smtp-Source: ABdhPJzMjiCvygnNIm0+U3oAWx6k5hAqhlXw2QcSbZdZzxi3ryP538XhwW5VY6oZIr4wv4tPuCL3Vg==
X-Received: by 2002:a19:946:: with SMTP id 67mr585357lfj.74.1616442329183;
        Mon, 22 Mar 2021 12:45:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d16:: with SMTP id d22ls3178860lfv.1.gmail; Mon,
 22 Mar 2021 12:45:28 -0700 (PDT)
X-Received: by 2002:a19:5213:: with SMTP id m19mr503204lfb.203.1616442328188;
        Mon, 22 Mar 2021 12:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442328; cv=none;
        d=google.com; s=arc-20160816;
        b=NujMc70z/bjgFbA9UJrIJ5YOMhAbsQgjTEE8Pme5SLiTBZ2HBtbv/hnZnw/ubjPMNV
         royrfIvowRkNjJAEkKYteNeZY+7anlBxLnnNs1PvhLBmpNVPlQmSczYNkuxxC5OfzO6W
         XdxEcR86p2fFRsFuoR60YuBxhXn+bysAUH+EGIyvMDI1adT7OmjCkRGDJZs1m8dQZqLD
         1hqukWTtwMy9jKpjLcbtkZFkWhTqKcWgvGJ2pvo41DpcKw7/C00yg8gQ9Q3dWqkFd49o
         6yaB23nUd7DxMFL53D1N5+lE6MkT4j6/mnK6cVuWLvguZOjDHJZqMuFW8uPriRkdL/p7
         juLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XgVbvtoaK4EPR4Z5ZOK6qTMzmyLVh0AMSMPCqc08yVM=;
        b=Fqxk5NObIG8ROfbrQOf79G5DuwLjAF5IKDvIxa/lC/GzSA9Xq4e17HaIq7W5b56Doz
         Xt21CdKvSM4T3Ee3YrMO1yrIUTeZfXp9jb3OTvK4IJZCPW8yK4hqmfb7yBM9Ewy8Tq4O
         vacnM4GFEoI4HPy9z5PQC66h6mKtYp6TPeoy2pAiMqA4r7zvCf3N9W2Fm0tf20XoSAQV
         UKfNP8bR7pNVrFSjIOAf07u/m10sCLPx+ZZKJ9wpeh3I2mVmzW3WpvKD8SLpZDI5oF4S
         IepV3Sh2T04v3PXkLEeMphNk+M+M/oKtihtBpuEDUaY4naSdZ3wSSzjbukVf85/vQcnt
         0S4g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="osGTa/TV";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id d32si311169lfv.8.2021.03.22.12.45.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jM4yrjzyXW;
	Mon, 22 Mar 2021 20:45:27 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id TUZTzYo1NRGw; Mon, 22 Mar 2021 20:45:27 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jM0Z1CzyVB;
	Mon, 22 Mar 2021 20:45:27 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 3/9] driver: colored memory regions: add temporary ioremap offset
Date: Mon, 22 Mar 2021 20:45:01 +0100
Message-Id: <20210322194507.82643-4-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194507.82643-1-andrea.bastoni@tum.de>
References: <20210322194507.82643-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="osGTa/TV";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
Content-Type: text/plain; charset="UTF-8"
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

---
 driver/cell.c | 10 +++++++++-
 driver/cell.h |  1 +
 driver/main.c |  4 ++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/driver/cell.c b/driver/cell.c
index ade61edb..8a9fccb4 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -333,7 +333,15 @@ static int load_image(struct cell *cell,
 	if (regions == 0)
 		return -EINVAL;
 
-	phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
+	if (mem->flags & JAILHOUSE_MEM_COLORED) {
+		/* Tweak the base address to request remapping of
+		 * a reserved, high memory region.
+		 */
+		phys_start = (mem->virt_start + image_offset +
+			      root_cell->color_root_map_offset) & PAGE_MASK;
+	} else {
+		phys_start = (mem->phys_start + image_offset) & PAGE_MASK;
+	}
 	page_offs = offset_in_page(image_offset);
 	image_mem = jailhouse_ioremap(phys_start, 0,
 				      PAGE_ALIGN(image.size + page_offs));
diff --git a/driver/cell.h b/driver/cell.h
index 92afbff8..51afe6d8 100644
--- a/driver/cell.h
+++ b/driver/cell.h
@@ -32,6 +32,7 @@ struct cell {
 	cpumask_t cpus_assigned;
 	u32 num_memory_regions;
 	struct jailhouse_memory *memory_regions;
+	u64 color_root_map_offset;
 #ifdef CONFIG_PCI
 	u32 num_pci_devices;
 	struct jailhouse_pci_device *pci_devices;
diff --git a/driver/main.c b/driver/main.c
index 64e2b9a4..bdf4f8a1 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -579,6 +579,10 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 	if (err)
 		goto error_unmap;
 
+	/* coloring temporary load-mapping address */
+	root_cell->color_root_map_offset =
+		config->platform_info.color.root_map_offset;
+
 	error_code = 0;
 
 	preempt_disable();
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194507.82643-4-andrea.bastoni%40tum.de.
