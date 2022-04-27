Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2GHUOJQMGQECNR6FMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BDF511135
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 08:34:17 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id e3-20020a2e9303000000b00249765c005csf397471ljh.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 23:34:17 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651041257; cv=pass;
        d=google.com; s=arc-20160816;
        b=kScfeP1vGwVSGGVhZMsqDXkIynWSL8LiVu4eQY5gqgGtLttHzW2ZQvhgTaiOrXr9R0
         JIWro1IEx38R0zl/6N/cylBByeQX+HM54MoUkP6P6CNfTj4WtkVVQtH1xhp/C9OJ/8Lv
         YITvslz3EPXjb4elxAYLytluH6SHXOo52Ti2K28NrWPDjERKuakUGaj7s2tvA5CE51Q7
         iaBilICJNxZpGFImBMzcxxecKOS2UNdgLni9qVT9XQyWpJVOurAfSq3VkWz/0S7rfzyd
         LFA1m2SnDZbV/9xMhePxzm3wlV+/os7OUY8M0u+37CAKumyVSz0F2R7vrMETdqBY1NKk
         /X6A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=iTFPmOrlbbhdeAgihWAVqfZ5Z+l8bmUy8UQpB8qGYKs=;
        b=XPNNV9RVUynnZJ/VKWf/zUKxQRoRTTZYuT/TdIymjiu/bqTEnckq7DOb6PzDViZxUt
         kubnkQVt2M35GpPn8MgkdNvSwIXJU4O4XPoxfbFE+4dNA+N1i7iegnLxIEjyNkLIftfm
         79P/18g9C+X3HVxBVjtig8RgD7rG/2fnDp9ZaqvrcBwREinfVOMy/ET6TwoDnOBUrrgf
         LHFdoNJ6uhPRe8xz7iuQhfLxxZtHEUe4gK0NN6m9sLfADPVda4FIJth+OPcgL0efAMvt
         vuxAL9acJi8cpey4rkA6CRgGtJ9v/hu0zYpAM1CAZq9kxO2/7w3JWTQvUg8okmDMM6n7
         2S2g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hkIHIR6d;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::620 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iTFPmOrlbbhdeAgihWAVqfZ5Z+l8bmUy8UQpB8qGYKs=;
        b=LMVHkOpyEeeeFYqMot4z635kcXw2QypSKZhkEj+AG2Hc5oFTAmeCNNIYv4M8GyYoMo
         ORhgt4kZXtAfyhXNRU/NmuK1JpulmvmyPzJuP7JTqH6yl5/G/fy33cHmsGQIavOWS9dt
         ihsb40w2c6NXF8ScXT2/OqNIwFCGDRj7At+CMOzN5f1oe8bdOydO2xi2G7QUyajwztsW
         H0PmOFsfs824k4EIAn+hRNlqjL+ga++MmSL2j+Qxm8LKxJ6JS6/+6fPPeWRyXMIDV3Kx
         Q4jG7HbgTxGFrtaIslSIhCsBMxZEvk6D9UPgzy0v/bp51fSscHItUDX7F2odZ03Fv2CU
         O0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iTFPmOrlbbhdeAgihWAVqfZ5Z+l8bmUy8UQpB8qGYKs=;
        b=5EcACnD6rTfrFHO0IYi1/ezwRIUr1ZVcN2hR6VVUs1nSr2n9QnJWwvbWl0cx8t5Ez5
         UruLlOh1ZvLwZZVp3YDbV58f3jJ3GzUmGmH5c6JBSNHEjWEZQvE8RZewzTOI8/LYPkWX
         C96bPsm3k65McdXgxEdRirQ0TLibHEWBbenzqp0kweg136E+CCyX77dCgOrp+YeOhX3P
         3dNu0fLLF1n1FWVLob+WDi+d4sIBdVLJMkvV37VKzLtqTN3tcAZtZ+vALa61nKO/intL
         9/Ucg3vilbkloZopDGPDrktHaAYxVdggOM57ZGLdU4bJHOCjuvW3xGZccDTeqP+5qieC
         3n4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53355chA7AHOi4wd/PIsqWVXiuMoNNkh9G5LwoXWGNVz4YOxDLCN
	u4n2JtzF/CX+vyzCgDJ3xqI=
X-Google-Smtp-Source: ABdhPJxozD0fLGbPx6+WMBhTLJqMrJ+Xsd3/xiQnpHcIxuoRzLvosZNkxm7XlPq1OOYXmMy6BMPRdg==
X-Received: by 2002:a05:651c:2109:b0:24f:16cd:b994 with SMTP id a9-20020a05651c210900b0024f16cdb994mr6341746ljq.157.1651041257392;
        Tue, 26 Apr 2022 23:34:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls1048108lfb.1.gmail; Tue, 26 Apr 2022
 23:34:15 -0700 (PDT)
X-Received: by 2002:a05:6512:3341:b0:44a:eb29:c59c with SMTP id y1-20020a056512334100b0044aeb29c59cmr18936652lfd.596.1651041255823;
        Tue, 26 Apr 2022 23:34:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651041255; cv=pass;
        d=google.com; s=arc-20160816;
        b=Sey584/yzJ1RxTQkqTzz+CY5gN480+ui9RpDurMVmoXtVDHpNzQJeX7FwsO5kaMQIE
         l4G2Z5TaZQsU2DEPpEQkpTMVLR8ivKEAitqrWE1bFHOfx9OHZLAQV2i6NrGpRUelLxzb
         BEf3y/jTIuwlgeamHnNtgE0UYlz6BSRIxFjUc6lc+z3O5rHMDjAF2bxMqwS/neX3QvZr
         p1H4G6eNhaJ54vMeUfPzDVJBMySoB8G62tXGhcreVz59g4GZcnVmPR0D5VibYeLKlQL/
         bcPfB2bmqsjVhCx4bgNSOsXNQTc229cPZJKdxa5X956oGbV1Q/D+wnC8iJYb99VoRQSG
         LnBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EUgpGQYBGmbo2Nw2TojZeeJ/xoQ+RPPPxG+wwelY3HU=;
        b=SgPmQ9leMF3VTyK7ytCuY+9we/0RgjvZFN1vE4oLB+NVSo2dMt5UBO3rZVsHr26fZl
         JZvfTL6/T9tDgojIRilROZ+aNUf2kLknOfKzJeZEr9gNuZI6L834j/XN+zsIuCEZ+URT
         aVFi+v2E4+ghznsdkpE7TZVbsGP+aAB6KOSfAwlMm+1haB3QWYAbJds2bdXXMiWFAaiu
         en4RPkR8mdmIHuLVAcr/ZWHlMAzYeRfbKwTCwnEg/2cHtfKL/+/0wjVIkgjMNwc9Oz/9
         nqJTZNPHUlhG0w7zuMQQz5x9ic2PfKU+RECnyIS659hywqi06o0+RZcedTS9c6R2n4/S
         HCFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=hkIHIR6d;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::620 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-ve1eur02on0620.outbound.protection.outlook.com. [2a01:111:f400:fe06::620])
        by gmr-mx.google.com with ESMTPS id f30-20020a0565123b1e00b004720a623d80si28382lfv.7.2022.04.26.23.34.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Apr 2022 23:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::620 as permitted sender) client-ip=2a01:111:f400:fe06::620;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHHLybeir43uNbFmEEvHANYvCIyoaVfwsE/LiV/HCRQ1F8xxFp2hUhGiwyRxD5vaQmVpMnaw/WWlR2yVxVINk8COMs0rl64fhateaLpdmbs8t+8H/4owdAa/4WMRsyrlNw7aVwVrM08hI1zkmlHQVkKU+deuwwWXUN/k1Oynh7WUQR8cO2yLEhTFfIM3VGCK/G8Sln1S53NztRx5TIrHpDuJEiwykD6MWGoddElp8PN/Hkzcw9sd1S8qzrrUgNwKiZD6rhlwvh3F+qYRYvvciBs7rV3aiLJmdewzr3ERZq8eT9LMkMVYxX7amfTVrYcTdg7u65fhSxqoTQlhDTrmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUgpGQYBGmbo2Nw2TojZeeJ/xoQ+RPPPxG+wwelY3HU=;
 b=N7Bs3FHLtvX2Ge3E63TnqopBmzjTffkeBXI73m+yw6IDRfGBcsz8ePvjUbghdCuXqEheMViiyyZ9gl4jkk0vCXplCIw5a8YasufX9IBJvlsrK2msFkTybVJjXfE6c4RSRkLjLrYtbQj6+QiQPtTa5JhFIGQNpz+O24HBPfpi1A+fZ+qly1B8JAvvSX3GLoqf2klsOHy46nBsiVnuD3wooeMiVZfS3OMyj3vFyBH5yV/ooN1sOZ/dGXwySU3EmcOaxYCeDhUT25WJvcI/chkNUhzinfCc6P9LN2qfA0id7IUUkZHpC2qAvycd2eYlN5SZwMGRrPWL1aYgyMW8gxYWWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from DB6PR1001CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::13)
 by AM8PR10MB4209.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 06:34:14 +0000
Received: from DB5EUR01FT062.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::2b) by DB6PR1001CA0027.outlook.office365.com
 (2603:10a6:4:55::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 06:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 DB5EUR01FT062.mail.protection.outlook.com (10.152.5.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 06:34:13 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Apr 2022 08:34:13 +0200
Received: from [167.87.0.81] (167.87.0.81) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 08:34:12 +0200
Message-ID: <5473ee5e-1891-dd00-db28-388dad40ee02@siemens.com>
Date: Wed, 27 Apr 2022 08:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] configs: arm64: add support initial support for AM625
 Starter Kit platform
Content-Language: en-US
To: Matt Ranostay <mranostay@ti.com>, <jailhouse-dev@googlegroups.com>
References: <20220427025419.3485-1-mranostay@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220427025419.3485-1-mranostay@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.0.81]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--12.153200-8.000000
X-TMASE-MatchedRID: P9IPSxB8xL05QaOxwNGfvo9bHfxDWoib9c0SSBk6D857k1ZHmKLF7TMD
	HwdijHSHOF0RIPSotdNvxt6yFJGkPz60AyLGoqqf01CTCPwQxknVL/J7UhBd9l5hVZTm4dD8DKv
	LdahoIESbKItl61J/ycnjLTA/UDoASXhbxZVQ5H+OhzOa6g8KrQF3jKo1Tm52RGGTlad9dB5MH/
	ryZVLac+s25xBcTUvnRidBrCV8rZE=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.153200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 17DD1DF28757E6725AEE85AC0EDCE81239BBBE2669BB49F9E31863D16E18699B2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59feeeb0-da2b-432e-facc-08da2817f22e
X-MS-TrafficTypeDiagnostic: AM8PR10MB4209:EE_
X-Microsoft-Antispam-PRVS: <AM8PR10MB4209A344D09260AECF0858E595FA9@AM8PR10MB4209.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 99I+JRV/S4b0sMtRJ1O1AfYjTCR3Tli6kUSLHJBAJlp87X+EvkHTSA3uXPhjkqf7EASpfORa7cvc1xAlKoPgbK1CN4rgEtZpB627cdQ+Phk5Kww384XgKC3vMVSFepPUUVT81t8tPcN1DuQpl8o91/6ECOR6pkdJrVt7ObHYQuzfUc2uvoXVWbb9Uzf+TQ/HkpH0IvTmIlvcfuX/vJs7DI0miVUfQ0PYbrGPXP8fyFRf8DHByUVtTQAS3r+nb+WWqiSe4sVOLxtJ2TTud2jmtf92td1kCPapTki8f3SpHLpirDqZop90eDPEkvAOHGMtKe6GzYz4Gh3f7614vy7GX09lH9nEjfsCGOEsj6fpBoRNhB4QDMzXXQs0hbf0u/5diLPvcbdW+3V/bVlHDsFV+PXb6G9Vs851kVu5l4I2wJ98Fk4TlKIZZJKBzZDV3kIguMFzaFTBDCCeWgTGQ/pRiJ6iv0QMbgQzoFu461LbmzOIiqawOm339aTnQzXfFldLteR/WuF+XDGzzF8Pyjj93n8jU/aPeIeDpNLUpYuhYsUcbChB2gaXUzmomuQca66Ix8OtDNmddVy2iCCK/8HrOuPF6/HRLJhl8jXcKEJYytusueBXulkCgin2onSm55/qDk7tTVp5sQCCWmDdBLG3GOfXnmSikvGQOwtj7dBrm0dkCHruGMJGEP/OXP/yjVBomkXrd6EONOtliDKYN4sUHTIKSQ3jm18SuKtJVhH6y/Hs2Cy1a7nQSFblQhyXRJTohGXLA9c2eDsKwHP3+0WKNg==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(31686004)(70206006)(70586007)(8676002)(36860700001)(4744005)(508600001)(16526019)(8936002)(86362001)(186003)(26005)(53546011)(31696002)(6706004)(82310400005)(40460700003)(36756003)(5660300002)(2906002)(81166007)(110136005)(44832011)(16576012)(316002)(956004)(2616005)(47076005)(356005)(336012)(82960400001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:34:13.8151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59feeeb0-da2b-432e-facc-08da2817f22e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT062.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4209
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=hkIHIR6d;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe06::620 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 27.04.22 04:54, 'Matt Ranostay' via Jailhouse wrote:
> Add support for TI AM625 Starter Kit platform along with eMMC and non-eMMC
> Linux inmate cell configurations.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  configs/arm64/dts/inmate-k3-am625-sk-emmc.dts |  28 ++
>  configs/arm64/dts/inmate-k3-am625-sk.dts      | 163 +++++++++
>  configs/arm64/k3-am625-inmate-demo.c          |  72 ++++
>  configs/arm64/k3-am625-sk-linux-demo.c        | 220 ++++++++++++
>  configs/arm64/k3-am625-sk.c                   | 317 ++++++++++++++++++
>  5 files changed, 800 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-k3-am625-sk-emmc.dts
>  create mode 100644 configs/arm64/dts/inmate-k3-am625-sk.dts
>  create mode 100644 configs/arm64/k3-am625-inmate-demo.c

Why k3-am625-inmate-demo, rather than k3-am625-sk-inmate-demo? It's
k3-am625-sk-linux-demo as well. Or is the inmate-demo not specific to
the Starter Kit while the linux-demo is?

Rest looks good.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5473ee5e-1891-dd00-db28-388dad40ee02%40siemens.com.
