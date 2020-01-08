Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBR7V23YAKGQEED4L2BQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 885C1134034
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 12:19:37 +0100 (CET)
Received: by mail-pl1-x637.google.com with SMTP id d24sf1451366plr.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 03:19:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578482376; cv=pass;
        d=google.com; s=arc-20160816;
        b=cz+9MpHxesyg0IYC2iAzTehWX1YepP3U8D5JTNjt7lXi9tc4bvKPiokoHjibemaO5y
         YWXTiUJ1Xr4+IfI/TN4Zs9RhryfCWAkHaTpnwDj7lwkbx1INRD7pLkrP7L4jMJdCyEd4
         LPHgR/pKF9cxBS2DyEGzLrnBjuOHNUSwxd1fNs3GnDB+tsR+rSmNYtQiUfki0hmO7oSq
         czQeJCH0q+0UlbtVIMEpzqpp3wBIGET5zimXc+rTiQ/2kaxCGlu7Pv+2zWB312SbAUtq
         a74+WtVV7Mvzl7tLZ1atDf/HZhoFYn1tNgskpPQJPhAyICOQiRIQjvJZcQC/du+jt3w/
         C2xQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=OPF42HO+kOctxcLaIlwzotBjlDhkxG1qOtXLYCn1JdU=;
        b=n7d1uZ7wWLc1+Y+c9Sq2XTKbHPb1URUZr4cBqT3Sm2MFUASHaTbzKIj3T2e1u4SB0k
         OEzHbtoCaLzMKvTtG+2tHVOjbLeYbqm9g5exKBUv/R+wGrjYfrs9SZFXneoqS68pYype
         c1KVdfKFVGutPWL71lGtZax0iP0mEKZMJAW9vw3EoxkD9Kedgff3cKnS9lAFPRywiyjO
         K5FXiN8WkPt+OEEOsIZjiFHhpgvEJtiZf2wLnaEKQF0VVa6y7shVBzIt9UEwxThBtzMb
         lHj0AS2ne7UgGo6oFFcmhdzPUazJBdL9bDFIJ3au6aDiWToe9h/x2llsyPrv4id5Yh05
         yBhw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bbJso3bQ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OPF42HO+kOctxcLaIlwzotBjlDhkxG1qOtXLYCn1JdU=;
        b=XtcY/eX83P6Z2rGZWuYudvs6+9CLuYtEu/HiZby0O6M0wz6RfOAvt8WCsxD8xgYJXL
         9LOLgQWw+JzVTHH7JevAtULXbVtMvS6buBE58r8cHPL1vGuEOBbhAL/IrJbBs0zK4Kiu
         5Gf3g1SO71MVafNPrMs9uMJUEHsHfE0S4C4NOBMM0kIjgWyg17rMI5V/zw/5bgWu0qGJ
         4YovIpi9JZsJN0wzaSaMYfxW7itlde5hg3itMPJcP4ZKlkhlgy++sTgj3+U9PbR1RZvX
         MPBiVI/qKj0gbaxfxOMm1lsC0CZTXeVwg/tWCH/RwTsGdCaX83qAp/e7EFyhrOXr0x9r
         IA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OPF42HO+kOctxcLaIlwzotBjlDhkxG1qOtXLYCn1JdU=;
        b=D6H264q0EojakCIi8gCp5zqzEiFnQtIXLfrXCoRLxMC7mTdKA8TrGoeYKfs6wBOdGA
         Ox9vByK6WHGe8eM0MP3OIzHgsgGLOX+8bNTd1QM/2b85LFXY1EsuLxJbc1zD9anbRLyM
         3fXiYqvRwqPOeyyskj7L7NI+At/xZ04wti9bI7KvMNyB/bmuGzRGk6tBSA469HkUBLgc
         dHeOaJm9x3a88kU3LAOzHXQZxG+LFVqVA1nsP/da1ezBdsUXw2d/znh/IAMBQ7MWVdy0
         taDF4CrQz7Jm3Uw5XHFXpUZLmU4u1jTHaJxhYiuUQbuSae5NALVCtBz7JoVj/W1pNAiS
         6dKw==
X-Gm-Message-State: APjAAAVFnNZtO4st5kRLppgZlnFofoPm/xvsT0nxrj76kk3jpH5RQspH
	qMJXlAC5aGE0THzfp/3x3/g=
X-Google-Smtp-Source: APXvYqxsVr6hWELa4C/4rydQrvFvxOq5rEr2Lt4qh/MTXlYLxeXAouYiw0fzyqQj2ztEnuZx9Flt2A==
X-Received: by 2002:a17:902:d711:: with SMTP id w17mr4884844ply.303.1578482376165;
        Wed, 08 Jan 2020 03:19:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:d207:: with SMTP id a7ls1028790pgg.1.gmail; Wed, 08 Jan
 2020 03:19:35 -0800 (PST)
X-Received: by 2002:a62:a515:: with SMTP id v21mr4502911pfm.128.1578482375644;
        Wed, 08 Jan 2020 03:19:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578482375; cv=none;
        d=google.com; s=arc-20160816;
        b=OB/dRwb7xY3qAjAIv0MrqBLsMiRETeE1aoh84lPOpOh5QnRTILit8Cd9aFbNuP9+od
         xCPLBDFmTSgU9sd1t+FhpYicrbFIQ0lhmgvSUeoB2WVgtOKbopKGRjVoGf9GRT4lSLLS
         gLgdMG45e2OE5O4ApbYiJkrNTTmJRKnWWgHFGIQhO+ldgjUxp83Sqff3r2nJOh4Smayd
         WSpy1dXdNXu/f+WfjRKlvWsP8i62+qynIe/n0Kz68j2F2UpN+f66bef9KuHig0udeSuY
         9QqKC5LjipNXsvfasKFUA0z6n9Iszdymx4GVTyS5mIUbOVSl4tpNSACdc1eghkWbm4s1
         1WgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TuIJGmWWvHunc+yMHrG0ExSGA1brB/Ko8pbvkp2ZScM=;
        b=nJsSCpbCcefXGJF0ndPrlYOwip0rvNO6XtsStoCKL6rP0f27DvjGuaUiji75uLHaKr
         yvE7poITEQJKxwP9bt8AhiLHK8YRt7LGDrYui0NvxCqrI6MIiAHZsO/FHZFZk/aBsGl9
         adDeyb62xCIUTc8XgPvZbUZL6wgdlRgaxdfL7fuCc15qQZGZNyjHlbjnqMK+FJLNyGRz
         w6keSj0yDcgrMYBxXwj2aHkeNGSusXYtd5DoPPBF9ByszPkjDyagernstUW9FlbWRhoC
         m8J1DbScgXZcg2Qu5HiKh94Fh3WXhtruYSZvv3m1x8+ZN02OaXYhCoT/HIXX0Pwq3vYV
         F57g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bbJso3bQ;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id k1si138220pgj.0.2020.01.08.03.19.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:19:35 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008BJYcP061221;
	Wed, 8 Jan 2020 05:19:34 -0600
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008BJYFs037732
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2020 05:19:34 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 05:19:34 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 05:19:34 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BJPDu021746;
	Wed, 8 Jan 2020 05:19:33 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 4/5] configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data
Date: Wed, 8 Jan 2020 16:48:24 +0530
Message-ID: <20200108111825.14280-5-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108111825.14280-1-nikhil.nd@ti.com>
References: <20200108111825.14280-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=bbJso3bQ;       spf=pass
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
 configs/arm64/k3-j721e-evm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 1de90416..825883c8 100644
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
+					.tipvu_tlb_base = 0x36000000,
+					.tipvu_tlb_size = 0x40000,
+				},
+				{
+					.type = JAILHOUSE_IOMMU_PVU,
+					.base = 0x30f81000,
+					.size = 0x1000,
+					.tipvu_tlb_base = 0x36040000,
+					.tipvu_tlb_size = 0x40000,
+				},
+				{
+					.type = JAILHOUSE_IOMMU_PVU,
+					.base = 0x30f83000,
+					.size = 0x1000,
+					.tipvu_tlb_base = 0x360c0000,
+					.tipvu_tlb_size = 0x40000,
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200108111825.14280-5-nikhil.nd%40ti.com.
