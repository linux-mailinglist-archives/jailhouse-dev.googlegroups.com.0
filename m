Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTFK3KJAMGQEVWJQW7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x640.google.com (mail-pl1-x640.google.com [IPv6:2607:f8b0:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B14FF337
	for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Apr 2022 11:18:06 +0200 (CEST)
Received: by mail-pl1-x640.google.com with SMTP id w14-20020a1709027b8e00b0015386056d2bsf936289pll.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Apr 2022 02:18:06 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1649841485; cv=pass;
        d=google.com; s=arc-20160816;
        b=LOXvorr0f23EowLNId/c08R+aTWx1tHoovVN7g9LTLY6wvYWeP6ZLB/sLXwDszrUfx
         /huQc2sODMDpS4ivSX3AVbjASvpSQVwqmMmeVx5Yk/ydPKjjLQXZaOGScWSwkHv6kWzo
         hKmmkJfjXNo5+OHvJHbVhPBmoEoXqw2dTujarEyQQ/izlXK3rpJvy5RnIGWzHdnbwwcz
         jJ8PY5X7Mmndodx8QKcZjF2OQpmTuZNknFNWlE2Oe755wOcU1EkHHr9CBci0adlQkcil
         ee8HeN7ysDbPmgrpGaftU9KgBOhfN7i/rWi1/yuWWQVv0+83EA0gMcJd1Q1DxlAfQl1X
         MC9g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=9esEWbNsQRo/gfmSUtTQvcL6txwdYVWf5gGRVaMvE8k=;
        b=Jhp4Xtokjf4t4gEcQ+6I2fuL7sStSZGlVV1PnB3+GCtfu1kBaCIvy7nQrmjEszP4uo
         XbrXp7905xXldpe6wFr+uuiudUBw5LCTTvMsG4vfL+XivsC7e4Tojg7JGmE66WFNWgLW
         xQfYNnj0dsAs0G1iHZDPVhyaLoT57xniOSSp4diQ+9Of6itD51MiAqbWHyhsq7pvbqiG
         ua9HbBTwtTPmfKEmupsp+GkneNfGMKYb6uIHFE5S6o6grxHP12rXY+8UxBiZ11+FM3I8
         MX7o8JTP33KKD8taThrJRGmAzU+HfvAOjaLk63VcGN3h88+YKpNeg42+sO8+9R9+x73T
         5rPw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=I87zME0U;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::625 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9esEWbNsQRo/gfmSUtTQvcL6txwdYVWf5gGRVaMvE8k=;
        b=XSF5AcQDT2B89cmxSDWX/lyYi7EITyGDwvRl1NkO1FVbYgwffSwpgCbXbRF8KCfYic
         2kdml8TZZRehS3YaxEWdP0LPQCpQf/t2RDVvM0upqsiYf8JJGah4q9ClD08JlZnZdzNf
         LD0mJXvj3Y3M09WZW+YWe2qYmN6/4euT0eAMRjoQrR+YlKzkAP2jHz837fYC5fc7dyM9
         WmED6wZTuEKK7KAHI8hfMrWWTIedcoSBNk2JlK6J5aYuqNbfeU23cwkyrW3cj13Y193e
         hTBvVEqRQ2oe2xpPVfwOlX/QAWS2QSgMb7gYE+5syBKPFZlKH8eFV3pZNVsCp8S2wX7H
         qlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=9esEWbNsQRo/gfmSUtTQvcL6txwdYVWf5gGRVaMvE8k=;
        b=ZIN8nW4luVtFOkgtbIx+O55Xg1wd00L9agB2CPFBQBMfDn3MufQSU1Zoe//NLLA96m
         VJbVhdvOOZ30HI01RTP8GSU1PPKAsZK6tGu5koZ1tmpRUTANDmRMr/RAJpXs4IbyjEmr
         UCsCoo77wfFeJy9GCITIjnWOHl8OJUp1hHuBamNcdPMubQlfKf//usWrIxCe+cEL7iCW
         kceWj/3GkwmvwE62jCNGRaHi2wG2C2R3J8/3wiHjsOQ/geug4H1yOtwtXJr4UUn8E111
         +lG2tPP9U+F/tR36QcdPltXaQZu6gWUf1mG4g1JfML7+RkhqPlXX4Y5dQWt0QnhInbKa
         IE+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533sU3II7R1CHc94X0rbN/ZmjxFiwQp6ge/iHi0OT9zjEdb0vGir
	MjXnQYlaGTKYfSVUdhNbi9g=
X-Google-Smtp-Source: ABdhPJxb8NDuT7whi1E4cFbIQeLt3F0rioP1hNOFebm37AVy8UYyEhuEb97KItm6DEhiG/lKEzNppQ==
X-Received: by 2002:a05:6a00:1512:b0:505:da8c:26ba with SMTP id q18-20020a056a00151200b00505da8c26bamr10156474pfu.63.1649841484964;
        Wed, 13 Apr 2022 02:18:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:1492:b0:505:acac:6e35 with SMTP id
 v18-20020a056a00149200b00505acac6e35ls1246461pfu.11.gmail; Wed, 13 Apr 2022
 02:18:04 -0700 (PDT)
X-Received: by 2002:a65:60c1:0:b0:39d:9c28:909a with SMTP id r1-20020a6560c1000000b0039d9c28909amr5379508pgv.352.1649841483922;
        Wed, 13 Apr 2022 02:18:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1649841483; cv=pass;
        d=google.com; s=arc-20160816;
        b=lt9MWiB3kmTXyleO/C7ti18I9eO8h2Vm4GbK0lBEgyasFgq4jbfvFN+FuDRelfipgA
         UUq80zAc3bfKR4/YvJsqR1HBdSNqdF7Ae6ZBPwhAy6Pk6w+GynejMn2UWQCJSETiYtlG
         AC+pFDzbFRQPRMMzcZ/GSFzMUShpVvDoz7+XaaB8DVuusNeT30LsrBmUFbmzGezAernN
         3/9o2OD/92uBON0h7F3TlQiGpJ5mlGrA1BJHooQu/TCrGDjgE/bKNk2VVKJWZHaBxds5
         SdAIWfu7sUGf0SAz2Mln+1x6Zyt8Z7i0GpNxPER8wGt1h5ILXTB/vSyaWlJulO4bnRXf
         YQ/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NswG0EowK175RHmEZ/LzU48wq/1jzhZ9+MC78+vk+mA=;
        b=tpG/EC+r51+iCFg0Jw9Oaongpf8w6wGjon4PVuu7QmcYREF3K5ZPXO6oJsLCaDQnQf
         U29pAezJ1t48foZW5PX3eALUcpZvnxSvfJKkhkn/BPkSd3sPbj3wVuwccPrCo2a6gbp9
         cxmTTL8aJw3TRJiCJqsnyYd/2XmMblhM3TXOnsq9Pt3kDPU/DAA1TXF4ZA2FJ0WW3fnw
         n1P1/lMgsKJrlfUApStUPuvWzG8jF8XHIq7J56r28aA/aOxFnlB2VeCe0u3DthkkBldJ
         XSMSuZjg8C3RHh3JKYdanNAHiz1t3UecpYylk83kKZLcmr3yPe6KUcf8I9cYlG9JuesS
         QJMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=I87zME0U;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::625 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20625.outbound.protection.outlook.com. [2a01:111:f400:7e1a::625])
        by gmr-mx.google.com with ESMTPS id p42-20020a056a0026ea00b004e1a39c4e87si1222753pfw.0.2022.04.13.02.18.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Apr 2022 02:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::625 as permitted sender) client-ip=2a01:111:f400:7e1a::625;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgbSnIEDAJvvVkS69JUHnT5gWb0zIV/uqKoL9FKcD+CkZprjZJ7r9R1B9NzFYASCyjVpWhnrcIqsrS+O0w/IemcB9mo3lpcZRFapzwJemAtrprHpRS3CluRL2cv++F5PGHRl1+SdQZhPHgXhp7d5At2+8shLoMIdSk9YIXb0jomcN+f1obV9MsB4ca6Dm+zpvGZruAhGLjgASt1vmvArkqX9qTb6ekmWHCz8aRWli2pG8J9wbaQgx8Xo/YKxxTYx/0wPbYrJsObefVHGAkUb0dhp8zB1iX/zMxPi6taO9MaXGsZxbOQ5YNPqwPoem2ib6iU6ipyJfAP7C/EZzGQP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NswG0EowK175RHmEZ/LzU48wq/1jzhZ9+MC78+vk+mA=;
 b=mwfLMSJyIGNzAITgHk2QBeQNBvviiBTaWLPBqb+2WJzOSsAzwoqwUznS4B3GClWt+ippdQu+i5bMtnigiGusskBg3qXuQaKnNBcUwMXU2FMkNDf2GPPrPrK4IHTqNyuyZ3JyrmNOtJX1XCAvafBEupJ193nvnNneGCpmmJxJBBKo/l5rF/Rl3uHHNSr8OoZ9vW6aIWOPuU7BgmUFnTchsURLefq52jxsPg8pngdSORlh0QelSHoAWITBS/N5c4wCSsZ2KkSMoxjD5xEAXgfqO14Bs+aDHH6xGJHcuq7EZggVsG3o5j8+lI3Ow0AR0h5POiswwMAVnpht8JXBzGLZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0046.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:13::15)
 by DB8PR10MB3068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:e8::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 09:18:01 +0000
Received: from HE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:13:cafe::1a) by SV0P279CA0046.outlook.office365.com
 (2603:10a6:f10:13::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Wed, 13 Apr 2022 09:18:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 HE1EUR01FT032.mail.protection.outlook.com (10.152.0.176) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 09:18:00 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Apr 2022 11:17:59 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Apr
 2022 11:17:59 +0200
Message-ID: <1a43cff1-d631-f749-59c0-913a7ad645c4@siemens.com>
Date: Wed, 13 Apr 2022 11:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re:
Content-Language: en-US
To: hubin yang <yhbczj@gmail.com>, <jailhouse-dev@googlegroups.com>
References: <CAD47rNQALFv6GNYbP-W8HgDpzpTGdGtL2xtONURepiGxtK28vg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CAD47rNQALFv6GNYbP-W8HgDpzpTGdGtL2xtONURepiGxtK28vg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.275500-8.000000
X-TMASE-MatchedRID: 0ayLSLUekQU5QaOxwNGfvo9bHfxDWoibUUP6fwHYzLa0sO72q2op4dhQ
	O8CvZj/Xeucl7MdNw8QPEGClxngghEHOEnP0b7ytZEG/65H83ZlEW9VS9C2W1xbwCXv1ucAP7G9
	b22wQFXOUAUfla+IhaLKXWmEvaG3ElyyR46PvItO2qNGaLuHnvk1+zyfzlN7ygxsfzkNRlfIRTI
	LTyAA+ovoLR4+zsDTtjoczmuoPCq2Zc+0v3cEkykXU62fXosMNhKsAYCJSsXmp5W5UvwSYiiitI
	BQyRlgz
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.275500-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 49C828763E4708DCF82EC46D41294ADF4498DD48EEA6EFD01C7C2FDF2D01E78F2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e178465c-0045-4aa5-6cf1-08da1d2e81b6
X-MS-TrafficTypeDiagnostic: DB8PR10MB3068:EE_
X-Microsoft-Antispam-PRVS: <DB8PR10MB30687E3388470A59582AC99B95EC9@DB8PR10MB3068.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jdxwUQ9XZGtp0v+H+kjMPD4q0Ip81lRClXkOHrpxwd8HD2nXEhaXan8F5yv+T9B+cBEg8GtIeRjrbw1M2DYGKS0Jq/9cTQRM+mKisj+8Rs00fB9cuW5mkQmTdY73zcZ2smt7ZHCKgzEoy+j5Wlbft5xjEheh1vGnEMZ4hHwgRnL2AeZ8HZKlte8PSMbIanx+aidN7CQlw7vuR5l2RmeClRBYu2LdgT/QuFYTm+efwDpvVnEgC70wdhEK/riTcYlXkDrrAsPLniraeySLoZCqYqJlvzxQdNyh3w5Ozg63/HTnl94hGM/R8CVLD7+eMQX23Faamvw4Nt5LainkXRE5JzTHgJbvXZfDNOQLaTC/zQNRwoFK4cXPvGSEjGiF6nsdyr8ZWLv5EIvsIjPZZzdxCSqX/luUWVHmiU7xOwCbj9zhDHtMMyIQOa/qB3DDmykuFa/IgfEPIProcaKSeAMmsQKDfAnuxW9ZXfqHVDrgIgE47Yxp+yYwMTV7YQnrasQ8YTEG/QYgOcrRLcHVUvnV9neS2W158DIYBXVK6pCLbnuDHVy+CY7TE2i+lWq06x0X9gEG6FQQ0/zQhgwNMVjaHeGQ2PBaicWhXnKeNVTSOvqoN0LEEFu9tXzmsnRAkIy6O6leQa/9GCKkMpbAEAl8bhehhPdnDxRWj+HlXxJv0GKyuC6XL7geK5STjllzBmHs6vFIs0xfLaL6OM7a4BB64bo3/ntwbZye1VaNSRZXS0rjqXSNAk0yXbuZ0syi3JXYb6VfNUjAfDpAi18gzuIR4w==
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(16526019)(186003)(7116003)(82960400001)(4744005)(336012)(47076005)(44832011)(81166007)(70206006)(70586007)(3480700007)(2906002)(40460700003)(36860700001)(8936002)(5660300002)(31696002)(356005)(86362001)(8676002)(31686004)(26005)(110136005)(53546011)(2616005)(6706004)(82310400005)(956004)(16576012)(36756003)(498600001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 09:18:00.7326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e178465c-0045-4aa5-6cf1-08da1d2e81b6
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT032.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3068
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=I87zME0U;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1a::625 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 09.04.22 04:11, hubin yang wrote:
> Hello everybody,
> 
> i want to remap memory region for a cell when its image has been loaded.
> for example, the virtual address 0 was mapped to physical address
> 0x3fa0_0000,
> now, i want to remap it to physical address 0x3000_0000.
> 
> how to do that?

Adjust the respective cell configuration? Or do you want to remap that
after creating the cell, i.e. during runtime? That would not be
supported by Jailhouse.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1a43cff1-d631-f749-59c0-913a7ad645c4%40siemens.com.
