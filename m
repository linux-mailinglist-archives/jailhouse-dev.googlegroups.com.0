Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBRHV23YAKGQEXR6YHQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id BD158134031
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 12:19:33 +0100 (CET)
Received: by mail-yb1-xb3d.google.com with SMTP id a5sf1758820ybc.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 03:19:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578482372; cv=pass;
        d=google.com; s=arc-20160816;
        b=n4JG4P6cvIFZtOrRu/uxsYrKa7/c7Yu9qFo3TnEh8+eC4+F1gtbojQQ7Xdwcn9FiHU
         PaGa18IdPhrXxJ6KYYNGGiqvdzoPxgYjG1xEBu7Yp67SFtuckp5+6cERL1PeD0A11LlD
         K9WJx0Nah40+QN8m3oWlJSElfoK9YQsdPuTitIvAq3wczYqN4Bytdhx0bcshPXO8OSut
         l2sD6K1qJc7ohVDTHP+G9V5ZKbRnS6JIqL0XrNu6x0tFP3UetIQAtDVU+hUb64KVwHKv
         duspssMycofpSRfH7nOm+JNY3rwryRhqU6gwkbCaxtfikTcjXdjI2OMMVzq0bAA21TtF
         Lw3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vpQ6PYVloHoZxk86Q7t0nZcPj4tOwl1AgUpvGTc0Od0=;
        b=F/qxPTNgt306qFcEsTTe1d2ZBEbM4vML34pZKqnCIfJ0ltM7kYI4xNHYOpKg8YAyv7
         X6Xq9h0fWTJ3zEyewkCgqUKkvKVkM33lkb+Yaj3ehvSZfVAZZTw6pfoqTpl0vLiAAmul
         GXZHYYzOi3DkhBk4NFVQpVH6Z3VIprljq1vk6VaZitIjYcWvlfamjy506ZnWxKVU6HSm
         FOs64KKAP88ZmhwLZPrUVUn2YAKUj+imuhwWQbiFIK7wXVS/hqu0XZT0ZPenJtyvg4VS
         9cNdu41QeJa/yrikRFkRXA5JgTs3007qMTlXsGZvDEFlCdTtR5MTsmgsQk/+ZmpVefkD
         spzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ORKZaeUM;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vpQ6PYVloHoZxk86Q7t0nZcPj4tOwl1AgUpvGTc0Od0=;
        b=Qoip/K8WTfvpCYLlP6kkMvSCY1K0hBjXWdfU9V8vQSmG1r2Y1FqCMMhYBMJu5z5/Av
         xy3TwV5zmh3SRpL/nTdkBXnuqqYLC2RXtJw85od+B3g0qjTKj1n0hP7D69cl7ItyoOQF
         OkBNOIseTq0JbAcGh/fSK3Lsa6nimRRw+5B6TQxH97KySVTpDav4cZgHeJhFlANT681g
         fxVftxpT0yCbIyMRfYjalRuAtbOoozeF8AgcQ/zfOechGO56f01D8qrOep7L0CXjMtDc
         zTJ1Bhk3O8V9H8K6K9EYNavi13hjsrPXpznwg9hp26Hpoe6dMqwa9kzXymKzIJJpf7Mw
         hRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vpQ6PYVloHoZxk86Q7t0nZcPj4tOwl1AgUpvGTc0Od0=;
        b=VDcvCNNVyjlZkF2EB2F1w8rD7nhfHnBaCbNteTbMq9Wt2XH1fJbAfU6JeYvIduOfXV
         pm38y4/7rT4e8/s6sL7401tYiMbX98CaR4nNzvG9YKJjeHHPdK5cqQMahVfrVA5NH6Lp
         gyEn/yLdBZyCb+enT4Atn2/gGniiOv+/o1zUs+MGNaM5eI1Frv0gLeL0ng/uUNXZFjum
         GFmND34W2yy3u7QJpgMHeaRQqXKSHNX+Sy4/OnqGx5jcG3zkh5ki/JkgRMWDGK+XTbhb
         sYuXIQHsJtfPaYVmA327mbAxmzx8fEd7TOApQXw1PV0Zpg7/g15If6GvrL6ZegGehpxP
         UqVA==
X-Gm-Message-State: APjAAAVdACE1Zo2wAxJRdjJ+n7S/AF1toSiKkSA8b/OVCMK0H38h5QXK
	gbMox1fGrseUJrEAYfzvmFE=
X-Google-Smtp-Source: APXvYqzVRvJfldPW4AyBg6IP4F11d9w6SQ3OUtVHJiXgqwBEJLUt/pOYIwTBJnZU4wYL9PrIPAwhug==
X-Received: by 2002:a81:4308:: with SMTP id q8mr3182917ywa.9.1578482372395;
        Wed, 08 Jan 2020 03:19:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:8644:: with SMTP id w65ls419094ywf.3.gmail; Wed, 08 Jan
 2020 03:19:31 -0800 (PST)
X-Received: by 2002:a81:1c15:: with SMTP id c21mr3156027ywc.408.1578482371865;
        Wed, 08 Jan 2020 03:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578482371; cv=none;
        d=google.com; s=arc-20160816;
        b=qSjZETHT/hgP3UtIlJiWsQJJea/z9rM+42m7CZzqOlmfncuok7qotqjBIXLoP6vDub
         /EC6ptYOkes2Ibi+1ABeCbTCGDFcXRYvM6Emx5aDxO4YIRywtkdYJgnleJQpxPKTt8oy
         LJ8uoj0ufvmUl0s8dICIy1nQJN3PIVIQHgHnX/88MeZoqseG8UjL5GX5ufUPE8F8yWuO
         2DJhFwCoOjLNW6GGHazODNvGqB43uTsPKvnV6a0fNJSDTNFQSYiKnNR3kUqRTNcFMm1/
         fSXye9inN31/t/8Iu9LJbIO4A86Io3iW0ORv72/+H6IizzUMU+MCA7kod6tWeLnNL2OJ
         KzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xbO3d1ao/6SGg9dT1XzzrdPsdmle3cOy8WHzeGWCSag=;
        b=gK5Tsb2L8nDIHzz9yMaQ99RwfNA5V0pp0foFNMiiAXk3O4+oHDuJ8rVAvDT+jcxsFo
         vFC6XOsONzSKVdw5uWgwM38trxOlLX/oRMQa2rRFDkUdtozbcLdfBgvR1ZAvjQkhXuBE
         bPJPitIejdU/S5INqVuL1K0j/4XMwcnVvhBHGZTmRWOw3/RgyWFQpIbXTf32tn5OQ5Uu
         ByhfvF0OATZx0ctRPdhyXRcKIjeXrz8n1zBjIXdlReaziXDupwRxOrSsk5TgF1VJRmOV
         Hp1uBU7X0XM4xny+wwzEUuUnJJrBe/bsc8VrGXsiHKK3BlZz10wVVLjShu4YhUpcTDRK
         UG1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ORKZaeUM;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id f8si141161ybg.2.2020.01.08.03.19.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008BJVHN104346;
	Wed, 8 Jan 2020 05:19:31 -0600
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008BJVSC115628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2020 05:19:31 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 05:19:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 05:19:31 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BJPDs021746;
	Wed, 8 Jan 2020 05:19:29 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 2/5] configs: Introduce tipvu IOMMU specific fields in platform_data
Date: Wed, 8 Jan 2020 16:48:22 +0530
Message-ID: <20200108111825.14280-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108111825.14280-1-nikhil.nd@ti.com>
References: <20200108111825.14280-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ORKZaeUM;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
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

Move the amd specific fields in separate structures.
Add new tipvu fields for TLB base address and size.
Wrap all the vendor specific IOMMU structs in single union.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 include/jailhouse/cell-config.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 5b983b38..b22275eb 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -251,10 +251,18 @@ struct jailhouse_iommu {
 	__u64 base;
 	__u32 size;
 
-	__u16 amd_bdf;
-	__u8 amd_base_cap;
-	__u8 amd_msi_cap;
-	__u32 amd_features;
+	union {
+		struct {
+			__u16 amd_bdf;
+			__u8 amd_base_cap;
+			__u8 amd_msi_cap;
+			__u32 amd_features;
+		};
+		struct {
+			__u64 tipvu_tlb_base;
+			__u32 tipvu_tlb_size;
+		};
+	};
 } __attribute__((packed));
 
 struct jailhouse_pio {
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200108111825.14280-3-nikhil.nd%40ti.com.
