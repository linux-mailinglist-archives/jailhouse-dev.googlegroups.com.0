Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK6GTPUQKGQE6JI4ESI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4518F65254
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 09:20:12 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id i13sf382763lfj.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 00:20:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562829611; cv=pass;
        d=google.com; s=arc-20160816;
        b=CqbfTv2vfuPYbgnnLYuwbcgssCbdzBueXJIOpEjKItv5DEqdp2dJRQpScEYqRUuJ/y
         Rt6TLC40RMKMYWu0NW41V7VnIv9N8l+0fpi2i9dSjv0z/Fx7Tsw7nmPXcMS6yvxbFSOV
         DOI3GfRz0eKvCjECzEDz6FW8TX0puRq1DaCu/5VHARyUsK0U99SwnmAQT69cXqi6Ayuf
         YxpqU2BeeAyYOvKjwNWDdMnFmg0SO1t2L0GTqa/4nOV8AUCSjA4B8vPO0veuPDDvGsU9
         F6/BnJNRpij3oZX6aWdOg/AxJjI2j96rXa37Di1WTl79xup7K5IJTsIMcjTKtdggfoa8
         qdOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=cO4//Qg1Dz/3CxmfXAy8kMqpbupdWUDsJfjieEBIAZE=;
        b=0ap+20+/XSRu6H2BtJK2f6u/qtCXARaMl+G6mJx0df81hfl5GwDs3aA2y8bc0QfsZ1
         5dgupdiJwVZroFq0IXYbkE3bMK5A5Y5k2A0x6gSlxd0m4KTXCkA4PNp2MVZWQyVEVDFY
         BHjlQJ/7MJZsUMw52Gan36TgTsx9plR3YzefJ1+rYSvSsAZTOFFdzu3LkIqRxBBo+Ie3
         UV0zBGBH1XlGTvL6wWaQk309VAamExpoYgWEJE9tPwo5ZejqSdCLDdmg9ccEOjhnQwb6
         IAq419hqBAElsvVaTfxAUdB5D6YtfkXeTjZrXPW/aWk6a76N83kEWbu1bwfWh2MTeTWb
         fycw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cO4//Qg1Dz/3CxmfXAy8kMqpbupdWUDsJfjieEBIAZE=;
        b=seM95S4KS76oOSb0VNKJIffe/bD5qt4m7ElajDA/UtAavL89l68tCLELLVLU7qswE9
         +d1ByaVXsZMGwXMPtoj1fZ1lbj9akCkdZiEDJEe0FwRkA3Zncz8nZmmnrrJkkLb81p7X
         91hdC1wYqt+TWsWZ50VEZ7jR13fJ1x7L1saMbWtPMG6PheQlLpxbLnIjkj/gQb9+mT57
         B6Iv/0V7/1tP3Vcmc1EYSTXvSU2tr11AmZwwocD6U6ocVYq4ZMlOfEMh1Mv7ZBEaWqHy
         29tBXSPC+1y8Q0uGm1axKcPltDrJwnZ5gx1KAThJurIwvyQ7JgQmOKOnVE+p/vMeKDPZ
         REvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cO4//Qg1Dz/3CxmfXAy8kMqpbupdWUDsJfjieEBIAZE=;
        b=WiCkbLZZ5nTqbrDwRx1sEIv0o3DlJ15urbcXJZsi+9pS1xNEChlFvZvC1VxAOYfsaN
         yObgVpjL1OjtInK4+htFsGA9CXz0FVgPaZyzyDAXVFU4Z76foQAiES9K06MHT6LmjzZ5
         E6egc7uamfzHplvhaojtKcKmfOMBxnCGguqFStiogNMuEHltuym42vtvA3cDXqkcjK2P
         2fibZR2luNV/DemNuGQoN/z5p8ihvHHD6+CcGJMU7wuH6phAXh6MAhInHMFbE4Say8DO
         7NthBL6InmdxUAqZBcwAd54iBohWTvSK7D8tn0CukrlwnlfEm/eNBUrUQdD3m9xB+kwY
         z/gQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVr8NoUZ9weYvq7WIzj/9vM4C8J2LeyiPs5a0uGSvHZMeGPrjDi
	pnqKRB1n++/no6oO6aKpPNU=
X-Google-Smtp-Source: APXvYqyE3ue+c58cglsKvGQNvNo5GaVF30CnEta76Jejm4r0IWJFVRmqa46c2dEqr6+t7AyAvluZ3g==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr985011lfm.77.1562829611775;
        Thu, 11 Jul 2019 00:20:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d0c:: with SMTP id t12ls595837lji.12.gmail; Thu, 11 Jul
 2019 00:20:11 -0700 (PDT)
X-Received: by 2002:a2e:5dc6:: with SMTP id v67mr1482197lje.240.1562829611058;
        Thu, 11 Jul 2019 00:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562829611; cv=none;
        d=google.com; s=arc-20160816;
        b=KSKZtztNKSxL3ayKml2Kiu5vINKIA7fYgIoOUtt075WQIyMZs0HUKSqmGYzqAH9B4R
         Dcv9IIhW1YWtqGfitwCVewTK43x1okPWBVWo2MfgiCgoMzTTpqWcGuFkyA8ZnUL0Pcp1
         oRokREUnyAahL7iZWNfRbCQLNgZN9vc1xZ9iDYzo6qCnK5fbqr3m/y+TM0HO5zAmmnkw
         YsSTr7Z3w6aW70s5EsMbMWRSSj+FXlX22UaQUSpU5uc6J/jU6+MnnBRsL0D42MTbx+wc
         oyrNta9JhWpfuGy1rr90TsNBNWkCvVU9nCMxHgWnBJC1Hoe06eNjvfqBwSFPrsEbrzyK
         hYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to;
        bh=uNqdsORK2vSNV0vFtB2PJUIexuggN+tTXTbpv7Fnots=;
        b=wHsnCK+ARkkyrdi2u39IgZkRwGVRh5mr+QXNNB/ctqxhbdeyEgUprhm3ZIvR3kxvIm
         GgvY3dGyw0m6sMJvwTxZnS4BEey/fwYUL06RrLda21H0D/btxilv2VnAUpyHRrt3ky9d
         fKLL7ErPCQUgO61s26QbD8HDVD6ZzuxaAC8CvUYj4/qtpW/HU5j8D3lThDedv9Mzmaj5
         sByA8tiE/VGvvZRaYLpqgGOCu96HM+KsgKtQvIVvDE8wTzBllGMiOhPKlFR5W0H5PBwS
         rAbWTyfmcHUSVo0TvVdRiDuqtC8jbUyBTWQXYaTcMfVlhDqwNPWL4Ynj9TP4iGT225dp
         XI/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r27si257515ljn.3.2019.07.11.00.20.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 00:20:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6B7KAvL020991
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 09:20:10 +0200
Received: from [167.87.36.253] ([167.87.36.253])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B7K9mF019954
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 09:20:10 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] configs: qemu-x86: Fix ACPI region size
Message-ID: <d9ab3066-4bb2-b10f-d943-1df044d2107f@siemens.com>
Date: Thu, 11 Jul 2019 09:20:09 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

At 0x40000000, some PCI resource region starts. We accidentally
overlapped this so far which was unnoticed because ivshmem uses 64-bit
resources, and no other PCI device was placed in that region. When
changing ivshmem to 32-bit, this will become relevant, though.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/x86/qemu-x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index fdfa8915..7e0e25bc 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -97,7 +97,7 @@ struct {
 		/* ACPI */ {
 			.phys_start = 0x3ffdf000,
 			.virt_start = 0x3ffdf000,
-			.size = 0x30000,
+			.size =          0x21000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
 		/* MemRegion: fd000000-fdffffff : 0000:00:01.0 (vesafb) */
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d9ab3066-4bb2-b10f-d943-1df044d2107f%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
