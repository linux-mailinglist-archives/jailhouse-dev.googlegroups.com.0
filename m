Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBJVWSLUQKGQEIPIHMMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe3f.google.com (mail-vs1-xe3f.google.com [IPv6:2607:f8b0:4864:20::e3f])
	by mail.lfdr.de (Postfix) with ESMTPS id A66FE6373D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 15:48:23 +0200 (CEST)
Received: by mail-vs1-xe3f.google.com with SMTP id v9sf2651860vsq.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 06:48:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562680102; cv=pass;
        d=google.com; s=arc-20160816;
        b=O7J16EwBYob01qSCGqbCTqGkj2S7xQFjG/RjA7kfwEVuqh6Tpb500Rk5pFpW8LPilX
         mx3mGWuCBQReppZGGAmKOPT/juXWyj9SmyCYRoI4ugs+2aIhMmxQQzuHJ++FGkscV18U
         uUKEjXX9LRDCaxUIm1u5ITaKHK+xeZ9k5dDLZ32ERtRsE4zEQ0+NaWuuo5cT7VtRZIzB
         WaEiYmPpm79fVD/2LnF7OIuz7HcZT+EXPxG6q8qRsa6BnZyY+qK/PKyYJalGUBb9W7Et
         PPmf0dL1O0MOE0/cJJdyJYfBrIJbwAyMLJ51aZFSl7L5dgcDgSAoSNcNFUQ7RoAsDt7z
         /IQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=JyXyaVGP0fhpbaYXzUzivVQ4sfSLh1o/CeGXqcRSd1M=;
        b=rv15zNGESaosJyN6FdW17HKmBWWNc06K1z9ADRT9VGl6lzw4oroJIkjKQWviuDmmkb
         w50he7S+qH/LyHWLoBEqN6y74nHOywNW1zat0IpEW98sV6R2drSUzPPrR9x1Tt5SpOUd
         jsiAlLMtNVIhTw1VuJQXpUIQm1A56Tmj7B3v7S4U+uOGS5JvAk0CU7y+e/5sHE60+FcS
         2Z6HeUbHz610//5YAmiXhki5LwKtOElzckOK2KT6Z/Eetrp4MxIydJXHSvsLxifjP6/G
         ymfmi2/2rfY8AC0O1ilOGzwbR0T9m7DydXl3wP9vPuVXLPO2xWhjECL8zzxKk6N5YJDn
         qE8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d0HAowBS;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JyXyaVGP0fhpbaYXzUzivVQ4sfSLh1o/CeGXqcRSd1M=;
        b=gYVdneVNX6AR4qi7NVhIRc9xLd1FohrZ084QN4N7b3Ca+7SSIHcUgvB2huO1+nuiIw
         1u+y6S/i8OxLpLbvGQrNvpIu4FzSvG+7h2jGoJKsVFChKXo2dohsaOPAiiplImnaAoKu
         yhaYoRKePHg7dOLecSeV/l8EIe9RkVJ4br8UyyBRD2G/+5en6QNGgXrXxU7FKcwlR/4b
         QUoeNt5T59lclyJ9qb0Fx0+u6poTOkDQOQgS+cGccJd4KstiqVMzbb5Du0UIy4J11F+j
         1+e6QHbyRDN8h16zg3BJFLVMYiQM6SErq22npSMIymKtLEEi8/1GLGKkraSIsSga3exB
         Y/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JyXyaVGP0fhpbaYXzUzivVQ4sfSLh1o/CeGXqcRSd1M=;
        b=cHX+BT/E7G4jhe6dA9+7F6+5PWtTG8RrOioy6EDSDMtMRroPn2WHgBTqQALerIqLTY
         GbIetheSPaBQdwHas5MJLAlGbjDKD3YUzxGOCigr7hFlZrzf8F82kPPXmn3q9H7SrnfL
         F18dUmLgPvoS23k36bjkwgaF+QWXi7VodH0Ng7bHBv7nKuGgM5SWEdCsNiM7XL/W0WbQ
         Cwdk0jZADFdDoFN4CTfsZLsN0dX+eERT3t5UfgGMaEP67Ti/q+s4VRlYddFFhtXxGZUT
         MTbNfjgC9FbNfjEsj1SWc5y7VRvdCuCnEs/rxhhHe/2I0rT2BCjhxI1G44jHuDIu0YCN
         V1nQ==
X-Gm-Message-State: APjAAAXSjIc9/iyLKVERE3Rze7xha63vqu8Rca+H7VCaGW6gjmLh7s50
	TNDCZmnHHAnq7m7IhnviZwc=
X-Google-Smtp-Source: APXvYqzcgq9JPVowW3Ujkjd4BYLVsMRtBhMCFu2u/05CTZrZi//kh3vOP43Xwml26PCzS+uKaq5lVg==
X-Received: by 2002:a9f:2027:: with SMTP id 36mr14269774uam.52.1562680102617;
        Tue, 09 Jul 2019 06:48:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:8d08:: with SMTP id p8ls1821218vsd.10.gmail; Tue, 09 Jul
 2019 06:48:22 -0700 (PDT)
X-Received: by 2002:a67:eb19:: with SMTP id a25mr14022371vso.109.1562680102268;
        Tue, 09 Jul 2019 06:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562680102; cv=none;
        d=google.com; s=arc-20160816;
        b=tqBOtqouwBaPvnBkOKzD0OLGLZhQ35svgxob2syep5n2J2VTh7Apml3uQggQeD2ybI
         YWPpHBh8mx5i3/7+82VFj0EklGliTfjXg8Ol8UrKAAJXZihSi8vUUuYb3eRn5wwa916o
         n6Re59fmwRmI8zCDaZgq2UUdskI+kYx11FQVhv9gr7AJX5dTLnFESIWPi776MMikuL4o
         0zUQdN+Wmh1CZx9RyjT4eh2p/crddqLyVd66V82BAMvKWYve9wpl2OTYeRNAmI6kwKMA
         MdmcTMQPDoajXLrANI6uk3wOgKz6mQ40mgpr4V+5lD5ZMFt6jNaRjgE0OGinYeblZf2v
         HfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u1quH/doLiZcJOIFEvIvb1IeNSHrNbj3Yqrt+Y89JNM=;
        b=U2muBcV82hfeI+0Y8W+Y9RqRiSfWEhSCiDVzk35Ob9GZNH8nBfwNDrfr4U8XcU7sUE
         /PruGoLl8+FA2/28GJf0h+iulDVM6hHn4b7Q9OFFdtylibt7ZKk3i+FXgGq5LCB+TNVS
         Ha7JRcKUYQ+8L3EwLxzbgSzpspgR3ARxC5p6uq/09M/xzc8u6RfT9l2E94VzaZqtPWrL
         94QRX2rxa68KtKpUy3fS/HLhFma0vDN7/hLBo8nGEDMpqh1d9egCriWghgGxC7KVrK8v
         v5MXywKREGJzANRaM0aJgfTsbYl+xCjz6l5yBCmojBErzagE1oeirx9HBKQevUVDNY4d
         Bk9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d0HAowBS;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id z67si533041vsb.1.2019.07.09.06.48.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69DmLKj066874;
	Tue, 9 Jul 2019 08:48:21 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69DmLJx009498
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2019 08:48:21 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Jul
 2019 08:48:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Jul 2019 08:48:21 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69Dm9P3107982;
	Tue, 9 Jul 2019 08:48:19 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v3 4/6] arm64: iommu: smmu-v3: Add support for smmu v3 configuration from config files
Date: Tue, 9 Jul 2019 19:18:34 +0530
Message-ID: <20190709134836.10485-5-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709134836.10485-1-p-yadav1@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=d0HAowBS;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

From: Lokesh Vutla <lokeshvutla@ti.com>

Add SMMU v3 type to jailhouse_iommu_type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
---
v2:
- Drop the struct jailhouse_iommu_smmuv3 declaration because we are not
  using these right now.

 include/jailhouse/cell-config.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index a559720c..c638f2fe 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -202,6 +202,7 @@ struct jailhouse_pci_capability {
 enum jailhouse_iommu_type {
 	JAILHOUSE_IOMMU_AMD,
 	JAILHOUSE_IOMMU_INTEL,
+	JAILHOUSE_IOMMU_SMMUV3,
 };
 
 struct jailhouse_iommu {
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190709134836.10485-5-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
