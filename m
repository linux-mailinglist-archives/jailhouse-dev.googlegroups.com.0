Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB5EV6HYAKGQERFLGKYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id A80D3138F8B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 11:48:21 +0100 (CET)
Received: by mail-qt1-x83b.google.com with SMTP id 38sf6257970qty.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Jan 2020 02:48:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578912500; cv=pass;
        d=google.com; s=arc-20160816;
        b=NA4DQorD4QOBv06Ua3b+m/tBAhDzCTJS6gWNDlbpraOJgfyxmiRYkHOtWAnVyyXFz7
         OkrENlxD/iSuouYKElWWc8cAki/e8LSf22KZIoto7cAk9jC/Ls2f2m7Qp3sxEUBESI4c
         Pvicm2if8bUbGBaHnFm5RJnCqSTd2r5aV00Z5GhMzu5sl3AYZg0+xqP8QuNBPqABmqmQ
         Iv//zGzbIjjk15eyrCsAxuX5awfGClpGOc841INe0iNgZMi4ZwdLFNgB4BiwzP6RQgK1
         sB9gZhfLFLWi2Whq6vDBZS3ADfPEcl0gInRYL0adICXJ2M77EJKz/Yrr0HCNVsbGIHUu
         L8IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Id51QOKoT7/GXSh7KmwpjcNdJaXjjLszkRmQ8BAiKzo=;
        b=pwdfPynenHYcVwiDjdCmf7RNaycpV8NuoWJEpcB/fazcntuNOQIUropykAPM1l8Xuk
         wdIUk1GZlaf5Dif1qZOyqNloJXK0BeO27ymcT2elNWeBjHF9B8VCalsRNug2CztkkdLn
         F+WDczGwDGELWu/3fVDn+IZklCszkQlJ8y2HxSDQfVvwVQvSi+w68AHlxdT7psvJW6Ts
         qgerFcmGkkFeMeHNolEgjHUNik1IyFyaZDFON8JzIT0WJTMppOnE2wu1xkr4n6pNAH3P
         +QuU1iV6HC64dG649cJU3YINApt+vq1WfB+z8mN5bdx9HYdm06AG0Cid5YzjpFG3HkC2
         SZpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QIUPNOYm;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Id51QOKoT7/GXSh7KmwpjcNdJaXjjLszkRmQ8BAiKzo=;
        b=SfA/rT1Hgv57gfgYn/xdvIEEKtPcevBv6g1YobafvQ0YEOgfxelKSFV3GxqEgRwla4
         wN0yKAmsvLIZwhl+mTfvjTgVIiBIqGsKWPN9yfaR6wvIiav+2OooJUIZEbQnntF382YL
         gqsp+TLcnZwm3KWLsFED5Ck8jRH0Lxy0Hp24xSMMhAwuRiGSNqiMZ/C10oW6PM9X2rEZ
         QJTxzg3+UDWMyTxkKWfs3z9ueFIe//y8ieA89DghAv6TDKTiGX4RiDRBkRH3vLRuujAO
         BM1u6fydqxDYBVLyfW0xZV3lkdXyrunmTAYQdHDIcREaNM6LGegotcnJD6MQ+J3Jj0g6
         ANNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Id51QOKoT7/GXSh7KmwpjcNdJaXjjLszkRmQ8BAiKzo=;
        b=cOG9tl+hN2biZPaEvkTeWCXBHrOorFzMKiyXNGN0yVBaEXGdsHSyYsnUNIOAg6J0ga
         qGjFUehZYmKOBe3GFm2sl0K/S8GNjnfI4cnjmGEId9hmv5/RVq1DLaKOhXmoDGa5HH15
         +c+l12s0S69V9Win9/JNpehr84bJ7U2Zqbat7lSyuzbwYpWtsWkRBSsmOfExYpsKIT/1
         SLS+HqO7TJEZNeM6g+edQtZj/097dJKRfS0QtH8Gzu/1/pzCTA7AL6GekNLYrfpxIemM
         n5L/84rbHCm90MLdFV42c/O/k0xLGhkesbKqXLbQQU43ho/foehLujCUkHVOBCHml/vj
         8vNg==
X-Gm-Message-State: APjAAAV0JMIl9TDnND5Q57koJgK7dVbs2zrheupy73v8CWeB2o071Hvt
	e6l0HFXg3r6f+B1efWnUCdI=
X-Google-Smtp-Source: APXvYqzw5MGAu4qLNI+e9xotC1+6/SEAnz99Y+9dBpMXwA383Ms3VtGJ5Pr74rU3foX5gkleDwGynw==
X-Received: by 2002:a05:620a:1030:: with SMTP id a16mr14828472qkk.1.1578912500249;
        Mon, 13 Jan 2020 02:48:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:3262:: with SMTP id y89ls917700qtd.8.gmail; Mon, 13 Jan
 2020 02:48:19 -0800 (PST)
X-Received: by 2002:aed:2d01:: with SMTP id h1mr9696951qtd.239.1578912499817;
        Mon, 13 Jan 2020 02:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578912499; cv=none;
        d=google.com; s=arc-20160816;
        b=Uk73s9RFziCZY271vt3Kvg2hiIqo/3YQcsSDl0jSZNfqfa4XStyG6F6JeFpxbIvCrB
         pbP9IBDUwRldDJOrRav3u2U6x8tm8omdIYNNS7wjkFs5iQcu0tVgLfyhDQpfo5l98GKK
         hLxIeG+8amKtYcWe272pSOP9kkMv4erEJCiNvNZpwXpJEi8saOi0XCHlokMkkiDwgTu1
         l+U2mll4dcsdpen4nz+Oy2y5sq72ZT8hOwOE3PqSu7KqW0VQt+CA+MFjRkC57MshuGpW
         qEH2Ugv7LCpiPTIdWvIvjQRF+WhzUeYAh1GRTvABc3i9/q0XNrTNQ6ShGXCTiuM2bc50
         gl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xOEinOTxBodYj28UjET+1VS96A/LHy+6mMSFOwu+xMQ=;
        b=RqAUuOwPBAVjgBCFsVJmlUjDn3+Vrx7qeNRAMOi5BvSX3VSTI8c0FXfiiepZfPT92y
         ApnctiyU8s/Gb12KyWlJMW/Qoju+ucOTWp+EzW9JPYFrepfsQAXJWzOub/kegAW3y+DJ
         O+XTr7uaDxmclq8D40rRuIpnb/WhRgj18g+g++BTg2jKvs1zEcDGYhIoJT9YlYMU/esT
         1aiy26KhtqIdPiJVqhjhDuTeGhJnIKJD5vQgBNipWSqdia7g7IDR6rkE+ND35a1of1M5
         pkkquo7KEcm+XMkli1j7+RG6tfSSyecFy9+7T49Sg9FW2x+J4gVZ2w0OXXxZGqcCuuP2
         pgMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QIUPNOYm;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id g23si464003qki.4.2020.01.13.02.48.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 02:48:19 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DAmJ9L043924;
	Mon, 13 Jan 2020 04:48:19 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DAmJT6001693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jan 2020 04:48:19 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 13
 Jan 2020 04:48:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 13 Jan 2020 04:48:18 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DAm9MK011219;
	Mon, 13 Jan 2020 04:48:17 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 4/5] configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data
Date: Mon, 13 Jan 2020 16:16:46 +0530
Message-ID: <20200113104647.25884-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113104647.25884-1-nikhil.nd@ti.com>
References: <20200113104647.25884-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=QIUPNOYm;       spf=pass
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

J721e device has 3 instance of PVU which can be used as IOMMU.
Each PVU has a config region and a TLB region where the memory
mapping information is stored.
Describe these as part of the root cell's platform_data.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v2:
    * Update references to tipvu custom fields

 configs/arm64/k3-j721e-evm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 1de90416..ca91636d 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -56,7 +56,29 @@ struct {
 					.base = 0x36600000,
 					.size = 0x100000,
 				},
+				{
+					.type = JAILHOUSE_IOMMU_PVU,
+					.base = 0x30f80000,
+					.size = 0x1000,
+					.tipvu.tlb_base = 0x36000000,
+					.tipvu.tlb_size = 0x40000,
+				},
+				{
+					.type = JAILHOUSE_IOMMU_PVU,
+					.base = 0x30f81000,
+					.size = 0x1000,
+					.tipvu.tlb_base = 0x36040000,
+					.tipvu.tlb_size = 0x40000,
+				},
+				{
+					.type = JAILHOUSE_IOMMU_PVU,
+					.base = 0x30f83000,
+					.size = 0x1000,
+					.tipvu.tlb_base = 0x360c0000,
+					.tipvu.tlb_size = 0x40000,
+				},
 			},
+
 		},
 		.root_cell = {
 			.name = "k3-j721e-evm",
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200113104647.25884-5-nikhil.nd%40ti.com.
