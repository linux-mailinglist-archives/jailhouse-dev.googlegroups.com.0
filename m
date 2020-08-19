Return-Path: <jailhouse-dev+bncBDEN32754MOBBJEG534QKGQEPI7B64Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE7D247F77
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 09:28:37 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id p7sf7519578edm.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 00:28:37 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597735717; cv=pass;
        d=google.com; s=arc-20160816;
        b=sAZHfy+LlgU8RfnvCwBsDyMg1OLdKyRg8Zc6DGwG037PvxYnk86sy+ab/PXhVkTU5m
         dqMpRI9V6vNgITiRSjIuojVRJ27o2S+SceUwXfE6o1ZpULl27+OulYA4DkE2WyHMtGUG
         NPN3QIVYNhPEq/eGscWI9sKIFP01X7gn7KQbJv2A/UZNxOuOSkIYOTn/V+tJuKI03Z8c
         xq/+o8IhXHDn5MCSvAF+lbHFxjVDcSbdpxkZhVU0KVWk4sUg0OW0s1RIXvium0gkcjhe
         TI9i32CiUEo3UJvB3fsl53tSCnNg/Iw9Tyzo8D9NAZ0HUU8duynY+AFwA4s7buTWCD56
         ubFw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=X6C3nxCrsCD1KwnUD7oACfLjvAW90tWSJVJbyrlmEr4=;
        b=Gpt5x674Gh+yZRbW3g5+25yctPRAciwO1a3qe4e8TSodyCj6AfKcLV5RRtL46+i3Jt
         M5z5gA/OFj2zsVH+MJMNHkN9Q7enLswr5lmj3H7LWWGpaRH9phWckcJQyH7bl/1pkriG
         YBBohKKygIEnGAt0G79RkbrNdCYk7qr/Z6zD6T57alrRWWY19rVL1wOTO6MSO2I6LjXU
         t1y90oTHMxKU6TIpPYKZFfrMjHdgPJ9lBLoL2yp1SHaOInRxOhPWhnad+ux0ZVRPSDCP
         E1DuRY3lEcGeDfmtr8RED9n3w0FeTlZQlseSRlbY/wowHJfaFIl+yevdixMr1U5uk2ZJ
         zpqQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=aRID4Ew3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.89 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X6C3nxCrsCD1KwnUD7oACfLjvAW90tWSJVJbyrlmEr4=;
        b=YUDSq+1f2B0batisJMNSBuo/nakY0jVbHgi4CgkoSkByqBnIo7+j02Gio0or+7Xb4E
         QAwJBk9g17Z/9sU2OS9skq8T4r73gZcao5Exr0zv+E4avjvOwgn4eioWE2IRSzgY/Fgh
         NtkszfVZzXdHt3VKHzEXCvRQKkgPFjMxvaO5QuIIoBAiyxyOc3Q4FYeecrEmjEKw1d3p
         Ekc+Pw++tJDqjX1tcZIOMMy8O72hz7G9MMdggbQK3ik5XP8lkuF0JmhQrsGh7MNLPEkB
         Ml8ozPtdWGw3pmK7768+1H3O4pnV6IN9u0154Fpx2mqebqGZeye0212UeYc4YsZIo/sV
         S8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=X6C3nxCrsCD1KwnUD7oACfLjvAW90tWSJVJbyrlmEr4=;
        b=bcJQx+NL7deDJVrTiy0e2VVdr5I/4JIPxmVKrCulv1p2exDWnF+nEtIitUXIHBLfHA
         B6nohZqDOH9N3sRJgm4/TFskVrnpM8BpSieeJkG96WfW9qcji1E1W7Dofma9XhpxzC1d
         VKpaLG7Qb2wFztg4qtoJhBTQC44mZhSJ2OuWypvJXAsgM8vaKndkty03VUB1aD8Ivq30
         OZGZpqe9bleNyWJsaV1eXa34p/2Db5RZd9+uOicuIaEVMRmAnaYA/NHRbEwH21XwhrzZ
         AFEQbIUhI6bo1cfDfMS/XJtHmr6wg0pb88DpBeOv4D/OhV5DUzV4noq/wSy3PSCPxF3/
         OF9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+M6izb4y/VMHDYKXQ1zsZ64zwzNsLS1tm1iNnvHSWQCs5vFRa
	OMIDhLxUkljlcBG/rpR5QXk=
X-Google-Smtp-Source: ABdhPJwjSGqhivj5iqNNEWRyc5DpNdtu7YD+iFrpSw0L9dOniZMG+EMbY2b20yJd9L8EHRpM7+7kZg==
X-Received: by 2002:a17:906:57cc:: with SMTP id u12mr20129549ejr.422.1597735717258;
        Tue, 18 Aug 2020 00:28:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:bc05:: with SMTP id j5ls3249118edh.0.gmail; Tue, 18 Aug
 2020 00:28:36 -0700 (PDT)
X-Received: by 2002:a05:6402:1758:: with SMTP id v24mr18821567edx.274.1597735716403;
        Tue, 18 Aug 2020 00:28:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597735716; cv=pass;
        d=google.com; s=arc-20160816;
        b=cPdV/n7aRmYwZHp51Ed9UUvq09hHGM8NkouLdZ1KFoZLza3yjUw3M7y2KCixIEmZrv
         CfzWq29zks08yYlWg/+4oe+CyNFPxk1WPs257+JY6C3xVhC1JXYrI0l8vtSY9rXYQbXr
         M/nZF4BkeJSPx0hvKEI2i+FHN+rf11UnsASH2TLnBr/jAA5TV3RuDyZ6kZmfVraaapsq
         D4QZUN2WNuEDeTY6lRchNFPl92aopflW58pPQffaAtWeRHTZ3vLj2DzYXO1bQcKzd9Bq
         BcJxR6E/XEphlO+aCmot4KWm3EAKnWHeMtfzrobtNFOTFB0x1RjstXKM8Lm8K9G3A3WX
         +t8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SVEajnWZOU5dJO5CNX63HlgBLx1k/A94TQ43bgC3Etc=;
        b=qh17k78euy6dnKFdbfTKH6eGHcfobn70M/ntYJYu+Igd52jwO91y1bcocIkmWZvYyh
         i3gJ+77rA5cEKtZiYtEBieOy8MRJO/lrKs8rawU4q8angjh/KW2Vcybb0R8R0UXec5Db
         PbB+kox7lL89ddhMt2HiJ6Q1LrODBwt8q4hHwYF643nhTvsdGN+B3EYuh3F5rXFcZ5h7
         4YcDMM8zCZWLT/vxbVWtG/SNsErTBiFIjvfPU1YYSfuxY65/gdMHWIUulpe/9ejkIYkX
         05EEMp/JP214l7Jhcr0tBoMI51V/1hjyMIfbH55LyQpgeEvAj+vwfIjj08ScF/95U/1a
         e6aw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=aRID4Ew3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.89 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70089.outbound.protection.outlook.com. [40.107.7.89])
        by gmr-mx.google.com with ESMTPS id lw8si877533ejb.1.2020.08.18.00.28.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:28:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of alice.guo@nxp.com designates 40.107.7.89 as permitted sender) client-ip=40.107.7.89;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PI32jwoJ/938bWdUWRUmirUsZFRBZ/+I2iMFF+mvsa+40L+u9vr72ywwdmcm89W9RNIghJYXBl1TBoBAoQ+t1qZGj+gFlBtDyCPvDZhpJ0wL52VwdnsRSWuso9sq5nUvUI1N6YJG+eCCJDBx1YYCzA310z6Zf6KPNh5oIG3ZoPWVvuGWn5X2Cs2Gmo1PmOI4wg5EzKdMwUDh5qVU5+4IZz619aeCoahm7D2AB9pqnfTn9dAIj2uPZjMwePGZ8WelPMUkXKDkXo6Zc7DChfOJWC7hUpokQlnrt1Y7Q9XsIUgXBabFGSS+gb+3KGs3Sq7UDXDLpfBwewT00tuLQ6kzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVEajnWZOU5dJO5CNX63HlgBLx1k/A94TQ43bgC3Etc=;
 b=hzgt7z87h4rPHCMLwoNPJTwvuqINXul0UZXGaPnyR+E+NLlBarwXx1A5iTUDxyGdwnpmAqUEe3pjLksa7taNH6Qos+dBuapiUpkdu+Gsun4CzDsgeGKIv98N1HSDeZvbB4sO1f5uCvuKtrhgVVjth7bRUBZwsIhGFHqcumQrrWSpK6d4QgJ2ax0+e+M+XjUFcsyK1IVYU5QN14Aun7nbbd0z+DSgYwOpcgrTGz04bySRtG0D0oVW8LcUxxbWpaDnnX/7dyueNsgQc9t9soQx7ud7IcxOlQmAQ27n9uURsojVZDGuOKohiggwqcakSzd3qsVjGmPgOqF7CpCv0WQkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by DB7PR04MB4058.eurprd04.prod.outlook.com (2603:10a6:5:1b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Tue, 18 Aug
 2020 07:28:35 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::5042:d7a1:10c0:c40e%6]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 07:28:35 +0000
From: Alice Guo <alice.guo@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH V3 3/4] inmates: gic-v3: solve incompatibility problems in gic_v3_init()
Date: Wed, 19 Aug 2020 22:28:06 +0800
Message-Id: <20200819142807.20972-3-alice.guo@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819142807.20972-1-alice.guo@nxp.com>
References: <20200819142807.20972-1-alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR0302CA0014.apcprd03.prod.outlook.com
 (2603:1096:3:2::24) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR0302CA0014.apcprd03.prod.outlook.com (2603:1096:3:2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.16 via Frontend Transport; Tue, 18 Aug 2020 07:28:33 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 87a1a348-5c7e-44d3-d74e-08d843485135
X-MS-TrafficTypeDiagnostic: DB7PR04MB4058:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4058052A86F0D44F4E124497E25C0@DB7PR04MB4058.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6CqVsyC9nUjFkMDRsxyHNLQLXXLgZ9Lw/A7I7WaNq/ddNFsDqDp+Oru8It0jl8z2mL1uJisQ3rjruhJjNUExWCycmrkSJ0aTJqgW81+uPVXomUwx5wmQMtH9arMS+P51aU9ZrcdCDIz1RSdllg92fs1Ivemlrd6CqJTjbN6kSdzERzBRk4hvjbW6Sjm0b1nILS7m012F209LG+uKs1C3VBGxFv/ZWDtlTxOsH4XWegjZA4zyWRn2dqQApunNg6PhWpZd2pEi9dp81ZWiC3jF4SeBTj1g+8xxKhCTzbsuxng98D1J4nyZHQ8ZzhoVefiylPRrBr4zNqQtdXY+xLR4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(83380400001)(52116002)(36756003)(86362001)(956004)(2616005)(44832011)(6512007)(1076003)(316002)(8676002)(4326008)(66556008)(186003)(66476007)(5660300002)(6506007)(16526019)(2906002)(66946007)(6486002)(8936002)(26005)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: NsX7vbh6iyNt+t2tOdCdrfNkC90LlkMhA8ow7yXa6U62IyuCz+ZqdMJb8dr18uuHBGIe6668EhF6+/X747gjiTwwJm39RA+RBQImHZ5hQXpXG1Y4+tVRSksS+0qKNQbj1dCvH/ULL904ovdqIfTsgdsJchhqvD7gYgAwP4KfiFRw0kDpJVmmfE76amrLetUuyJjol2D+7DE7iv1CiStVVOdFkeudFtyy7FhxmXHwW34O+Obep0ohNGu5Lq7NXKLmeGPIRKAu3QRFva2SkGssQXPpoedGRvWJyn9VZovduD6oKmHbCk4urq26e2CFr3DCxyqKaTEkAU08ztQt7AI+E6rMeOSUsK/iiT9CANjPvym9fTcjLjwd6x4GraeInesTJbo8FQ67AEbAfm3txO4xw4w+hu/xMmcE4OlMU2BK5M+8BwKaKZVUf/H4iTZhurgYXUtUvVPWESgvdjNF7D5LtNq8OywHjbgy/jIOGtAeWQe+e5wNLRpDbpZmXLVgkg4iglbnYbgUCskHjmaQ0B3LwFR2v7Foy5hzVEpP5HyjAkUadUz6qsZEQPry8FHDBxf/aEkTHuVVc1hfsnB8o1gsZeWCtS05rVXSqaK/WpplrTriHlwe7U6awoHy5IloIMiIZf9CF65zp73OZ++H/diduQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a1a348-5c7e-44d3-d74e-08d843485135
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 07:28:35.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Xi4ULYgWrXYHk9P8SBNQ5y6w+EQzSrURKg38KZkcWCJCR0f9Cl2pmZfa3jv2rp9zrHXNLkWMpneJN3xSlmYBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4058
X-Original-Sender: alice.guo@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=aRID4Ew3;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of alice.guo@nxp.com
 designates 40.107.7.89 as permitted sender) smtp.mailfrom=alice.guo@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

When the inmate cell is in AArch32 execution state, using mmio_read64()
to obtain the value of GICR_TYPER will cause error because mmio_read64()
generates "ldrd" instruction when compiling 32-bit gic_demo.bin, and
"ldrd" belongs to A64 assembly language which is cannot be used in
AArch32. So use mmio_read32() to read 64-bit GICR_ TYPER in twice.

In ARMv8-A, AArch64 state supports four levels of affinity. but AArch32
state can only support three levels of affinity. So use MPIDR_CPUID_MASK
to set bit[31:24] of mpidr to be 0, and ensure the correct mpidr.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 inmates/lib/arm-common/gic-v3.c         | 4 +++-
 inmates/lib/arm/include/asm/sysregs.h   | 2 ++
 inmates/lib/arm64/include/asm/sysregs.h | 2 ++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/inmates/lib/arm-common/gic-v3.c b/inmates/lib/arm-common/gic-v3.c
index 35ee9a6a..cd202a46 100644
--- a/inmates/lib/arm-common/gic-v3.c
+++ b/inmates/lib/arm-common/gic-v3.c
@@ -76,6 +76,7 @@ static int gic_v3_init(void)
 	map_range(redist_addr, PAGE_SIZE, MAP_UNCACHED);
 
 	arm_read_sysreg(MPIDR, mpidr);
+	mpidr &= MPIDR_CPUID_MASK;
 	aff = (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
 		MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
 		MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
@@ -87,7 +88,8 @@ static int gic_v3_init(void)
 		if (GICR_PIDR2_ARCH(pidr) != 3)
 			break;
 
-		typer = mmio_read64(redist_addr + GICR_TYPER);
+		typer = mmio_read32(redist_addr + GICR_TYPER);
+		typer |= (u64)mmio_read32(redist_addr + GICR_TYPER + 4) << 32;
 		if ((typer >> 32) == aff) {
 			gicr = redist_addr;
 			break;
diff --git a/inmates/lib/arm/include/asm/sysregs.h b/inmates/lib/arm/include/asm/sysregs.h
index 72cabdc5..c0b137c7 100644
--- a/inmates/lib/arm/include/asm/sysregs.h
+++ b/inmates/lib/arm/include/asm/sysregs.h
@@ -77,6 +77,8 @@
 
 #define MPIDR		SYSREG_32(0, c0, c0, 5)
 
+#define  MPIDR_CPUID_MASK	0x00ffffff
+
 #define MPIDR_LEVEL_BITS		8
 #define MPIDR_LEVEL_MASK		((1 << MPIDR_LEVEL_BITS) - 1)
 #define MPIDR_LEVEL_SHIFT(level)	(MPIDR_LEVEL_BITS * (level))
diff --git a/inmates/lib/arm64/include/asm/sysregs.h b/inmates/lib/arm64/include/asm/sysregs.h
index 8065b89d..6d94a59f 100644
--- a/inmates/lib/arm64/include/asm/sysregs.h
+++ b/inmates/lib/arm64/include/asm/sysregs.h
@@ -75,6 +75,8 @@
 
 #define MPIDR	MPIDR_EL1
 
+#define MPIDR_CPUID_MASK	0xff00ffffffUL
+
 #define MPIDR_LEVEL_BITS_SHIFT	3
 #define MPIDR_LEVEL_BITS	(1 << MPIDR_LEVEL_BITS_SHIFT)
 #define MPIDR_LEVEL_MASK	((1 << MPIDR_LEVEL_BITS) - 1)
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200819142807.20972-3-alice.guo%40nxp.com.
