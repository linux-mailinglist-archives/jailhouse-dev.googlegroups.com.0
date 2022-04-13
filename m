Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB55J3KJAMGQEM7X5QBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 867904FF32C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Apr 2022 11:16:41 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id a15-20020a056808120f00b002f98f8822f3sf740185oil.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Apr 2022 02:16:41 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1649841400; cv=pass;
        d=google.com; s=arc-20160816;
        b=x/+LXBN9zd1+xrU+7xFPZ2dne42IpqZIeHce+TPgdff1Z26LwIocEuaqRAiHj3JYkT
         2Muggj37ZBIVrPoJzvUZsvzalv8ob7/DoX9XvZ0PLwmxRIpaD9CrU46LGKKPS5T5S4ir
         gUn27KFuVCBd8E2IO2LkhsvmItw85ma6+6B5aE3bYInwzpMznmiJOPkFG+bLBgA1Udut
         ZeotGR8YdzSnP3Vc49gEIjArnv0xDpvcx6QlCBkBwGrhImvzhJIfwtNnhSi0zVCzI3L4
         KCDVlmJ0ZDznbMZ9FeVayJHWfBq0BhAff/k5Pz3IOYUk/P9Tb0C+DAUDw0cnVwkKs95t
         3vCw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=gHq97kulbtmJm7U1M1phPrSi/sx4jS6kDgK8liXuPdA=;
        b=Neb4eXm+doQ3Ddlv78vdWA8QT+vgHMpBmmbYeRkRRJQciaUorUYg32k4+bGae3SQY5
         /RN+Kpla6XOw/n9ovRVqOX+CQ4FompXQYFPyBre/YkUn1bbFVsr3v+WuaJ842xf2oJ2T
         Jkeo9+Apt2JqZgmtkJnRe0axA5e2GxtbYJgWC2OJ/kzUO4N5voFZXPcy2r1fFlvxmpGF
         j3fZrrSjm7+JyDIIKOLLbpdvAJSi7/1MprUafUwS5GJ/Dru/FTd00tiKiv+xpjuxVVql
         i1haM4K7z906tXR6CPaKqMfq/d5p0oefjcFU5r2D+5JaYu0/pdzgfsX6vnXKTKQzlWOh
         QGYA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=idfN0LWs;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::624 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gHq97kulbtmJm7U1M1phPrSi/sx4jS6kDgK8liXuPdA=;
        b=nrpT0eNKqlYEqM0GGhqWBMRugc3poyIzEJUYqvKQrEE3ZQ03vF7KtAuJBySbD4fyOW
         eL1/2I8XQj8TP21sOXAphyrnaGHzzuUx1DCsZTZag2nl9feBJa69Zao9lbpHJxcpLmKE
         BWxwzC+ehNGm0aSpBP5eCkLaKklOeVZGESJox4Dq/b2CbvU/VjvoNyLkTz9hK5GqofrQ
         6Z+FwCrKJxz0T29bB9p6J8wlsHvi6rCTgfj7fYkyHGLZIellmv/ZMO8/GgJlV0UZdrc5
         9roHn7vy4JN9F0gNmd0D997D+3VMpwbk7sb0SwWmtrjS9MMKgf68SvevxpG+0cUdDxb7
         FbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gHq97kulbtmJm7U1M1phPrSi/sx4jS6kDgK8liXuPdA=;
        b=ky1hXBOFvw1U5L70GzHZvG8LnwSBm83Lras/zijll76ejjRYYyC1wXDVUlzdzOfWaY
         eTwfu+S8ztaIWlLNsSjMS1M0PPJOU/RttdXHVGyXTT2r/gM0RfJlvje1WYP4Y16nY+MC
         w/IJusm0QLx4i84DKop7qLaLxbN21U0KWJN/bzfHB9qdy3wTedpeLHN6HXi2/DuDjn1b
         UrquvVsX95VsAmxP7msVvoKPdASPx9SjMqgfj/5qkPj0GmJ5TZsqiZOP5HZ9GL7vhpDW
         Ie6VDXdCNw7V8wgYnGTsN6EJUmO/snGFktjhvb8w+UuwBc/mrG04RenrL2Fjxaa8WIwY
         xIBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316HspbUGYZCpTVXHK0iV2Xs+SPmAyABbYAZVmti4xKemMbvm+N
	x21Q7wnNpJHEfdlBc9Ywir4=
X-Google-Smtp-Source: ABdhPJyjkxYhSyEqGEzFbwdmk3eYcOAuoiu9Tq76j8burgUZfgxa8jPZlB1DJNg+Lfk3xBxaiVbPQQ==
X-Received: by 2002:a05:6808:f8f:b0:2f9:76b9:421f with SMTP id o15-20020a0568080f8f00b002f976b9421fmr3720720oiw.281.1649841400270;
        Wed, 13 Apr 2022 02:16:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:1998:b0:2da:32ff:a70f with SMTP id
 bj24-20020a056808199800b002da32ffa70fls918019oib.9.gmail; Wed, 13 Apr 2022
 02:16:39 -0700 (PDT)
X-Received: by 2002:a05:6808:300a:b0:2f9:4722:fffc with SMTP id ay10-20020a056808300a00b002f94722fffcmr3641430oib.31.1649841399595;
        Wed, 13 Apr 2022 02:16:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1649841399; cv=pass;
        d=google.com; s=arc-20160816;
        b=zJdEO9+vXciWBJLmjXV2a5+jTV1QogwyqHh/XulpfPmjc7GB0yvRb2/rlxCqLJMHXJ
         Fn3y0pcFJHQ+QpLwaivIv7uw21pQnvX+KQ8bFY+ARuUKN5fPex4NzyF3HFbHko5nkTsB
         rKsJDMEreWowqt7hezNZWPR9oYzBxWB4+s3Je2BOcTiWg0dJV4WB3uTwPnCSTHrdZnxW
         MfoaEhoYrB6/oTcx0yBfYIi4MzjTptQNZMUgv8bOwtC9S5RtMmwrCJrEl04lBeM4MQVV
         QhoXBRukI2jxQJym+kokZTihOqgIn/cm+0m8nHoOO6jMqtRwVwIB2gY1V5s6HKoiC1uW
         /qLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ulM+MW0k1YebO8Zt7FDdLBJ5PgR5gFgPuyQfpaT5rWU=;
        b=K9H3Q2Chx3VhuGP4Dt6TZO4njgoFhQMlwm1UniZmOSUwxEuFcm61dSrjttw49g5b8e
         1C7ZqQLjtRZwsvyig5yjc04q7KLhbe1wPbHkcxkTh+Mh/ljgEEaPEDopQ9CJhqDZI9fB
         3mCqho/T4i75daixZOI92moEeVKAtokgimLzopLdjs3cxoQEaWIu7K03SNJ1UKx4oKBi
         txYX+/rYraij/WEe3ZdQe0j7H1bo0kIMskQhtRKqgKMmn5KPTLT/BOYjxBrqlGWPwMds
         Kv/geatBq1dRBcQZDJxKliIFEO0ilJN00FJp+AqSHcmMVDPqw9/tY0wQiTOOfSQ4SD+l
         vxMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=idfN0LWs;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::624 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0624.outbound.protection.outlook.com. [2a01:111:f400:fe0d::624])
        by gmr-mx.google.com with ESMTPS id x5-20020a4a3f45000000b003214f361d8dsi2813331ooe.2.2022.04.13.02.16.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Apr 2022 02:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::624 as permitted sender) client-ip=2a01:111:f400:fe0d::624;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlxoO1/6tfUYpj6QN3LIv6pOH9r4I8szOrch2wVhddJ+Mk/JrhiYEOs6Vj7ooLR/ACDwlYtou7mj5yK4s6dvRULEPxWAkhkZZdr+YzSq8SgZZzCP21YCtUJDdJwgriJwKSIOYOesFEuxJZhnRwKc45a+7I+UrrAAQA3dl97Cqt4Gc3OWZIVC2MF8lY8e6y9N9ekzsHAprL/Ocjx3ntz4zsXtJULQiEVyMZT7cdWKZy5wlRYToVTfV3vyxoPrBebcTATTGBeObxq6IfRCobonRDEJcMbhcRj/oISkRd2XFrStjzbOHaCxf1JfgrAWS4GPOCOSAwUqAvtKpQLMFS4yFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulM+MW0k1YebO8Zt7FDdLBJ5PgR5gFgPuyQfpaT5rWU=;
 b=SdJGsWDMTWn7mVODPfP7Gwgzr+1Ht6EzrYOd1Egl+KNZD0LcTauOYBd0+lrgY0VQ01wvk7zLAdr/yGUIo0mrXF+K0lWRo9YKR+lQPO17B0GCRbzHiAgvvZs8WlkA2nh5fn2YhdrB5sD+AsoC/pXMPSZmrPWDkeT0juHmKBYs0Dw6iOxmPIF73W1lPdTH1r4GtD9S52cGJWuJ5pSOyeBrV9SWFs/ewh4oLmiBZni5xTNkISMtiNHtsg/F9/vSlUAXjJVXbcrLg46vdKRQWFQgznZDToqb87M5CefTzbqoZp8Ti/QUYLpxZesBjBbpgFZTUhufRGWLz/pVL/S7VFDYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0007.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::12)
 by AM4PR1001MB1347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:93::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 09:16:36 +0000
Received: from HE1EUR01FT073.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::96) by SV0P279CA0007.outlook.office365.com
 (2603:10a6:f10:11::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Wed, 13 Apr 2022 09:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 HE1EUR01FT073.mail.protection.outlook.com (10.152.1.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 09:16:36 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 13 Apr 2022 11:16:35 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Apr
 2022 11:16:35 +0200
Message-ID: <416c28fd-5904-0b77-ede8-da1199c27df8@siemens.com>
Date: Wed, 13 Apr 2022 11:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Cache coherency with the Linux and Inmate
Content-Language: en-US
To: Andreas Orfanos <andreas.orfanos@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <6740e6fd-5156-4aac-9e5f-1dab6ccb0fc8n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <6740e6fd-5156-4aac-9e5f-1dab6ccb0fc8n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--13.593100-8.000000
X-TMASE-MatchedRID: 3OnHKS+pL/Q5QaOxwNGfvo9bHfxDWoib0k/LryWy4EDiOdBOoPgLNI1j
	+mrGi/PFbcPp/oilssgVARIK9rkNEyEX2TavZzI+q24sfCPZqRrHLcRe7wyoEP7FEhWgo0y8sDy
	a1Zprd+U8a+/GjoiAqkEP7PbxCSZ39A0HXWvmID3JsyErXnmiHX3IBt52R0X7SUAFemq7B2X2X2
	nyY2WSCWAMM0WKD4asYG32ZLukpVN6ipWzVkuu8IbXzhjksitpTX7PJ/OU3vKDGx/OQ1GV8t0H8
	LFZNFG7bkV4e2xSge5K6WF/FTGAZIWw4MHM/rJyF5jA6MYRCdiBDcqRyXPNxEsMHBii02BH
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.593100-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 86281F739156B1123750DB2109B85FC91498B9EE8CBFE27AAE66D42CBC5E1C1E2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78da52e8-1124-43e7-a00a-08da1d2e4f65
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1347:EE_
X-Microsoft-Antispam-PRVS: <AM4PR1001MB1347F2CB61EAAEBB8D8FDF1695EC9@AM4PR1001MB1347.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XgZUI5VXsDAS+Ou1uL22R7vZl2fM+UPUJwlR8cQwPvAtgo5U+23How+SupUKBXGRMsZY2ev2c38x34608gHphT925HMje4a3FTYXZddrpCEe+fV5EiQFec1LlU/WXURbWZ7mxIQUHjmVPBI6nsusMbqjx7nh1zwzBp2yCatF92GVme3jgMCIw9nMU4Zz6KprY2FDVLRfZUvcEZKN6k3+X+bIltxvjpaYv9JcY2h32nulmI6M784j6g79WMYOBI2yb1Mbke1s8jrkaOf8SMh8Vg9ojDaHaFRkKlkhdSZDjKlNGGRPH3EkWGV2wVwgv2FG0xyc/qk5HiMTeuR6CMceey6/106JvridRlIUV20Yigw64Xfy3UHFVj94xQMsCplLzHJcWPZ4AqBgw/i4wbL1B/UAS3Z7YspYJRiA1hpkzznji/UJCxW6ERhGdB2c7DGtj1RdVIAqxa3boq54nGi4IiAPD8RtGPm85gucZ1iu28cQqcTLNpk2VDfe5nw3QZCqq7acA4CXN3ZgvmumSqcnQIQHFCjsdPqSritER4NiCEJ2O5/i4LshW7Now+KrNLoU49z5CMeMVrtH7jXL7Ot6SFYe1T9BsqXR0iN17AwnYrCb0hRaECThYrcH3ZzbHcKdHmhh69NaKbqXdF8ipEEqOIAMfVr/ZcjoDzL32GBc/KnKzqybPLIrkIM1Uo4Z+QOUUyQzy6S4a27INMkNdU1DnWtpQRDAnvN5s1HaFeag8WNO91BpWAZ5R+bvQEfAKTxHQfSJvkOvKGiZZ/1p8PGh1g==
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(110136005)(2906002)(44832011)(336012)(47076005)(5660300002)(82310400005)(8936002)(2616005)(36756003)(31686004)(956004)(26005)(186003)(16526019)(70586007)(8676002)(70206006)(81166007)(356005)(82960400001)(6706004)(498600001)(83380400001)(36860700001)(40460700003)(53546011)(16576012)(31696002)(86362001)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 09:16:36.3326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78da52e8-1124-43e7-a00a-08da1d2e4f65
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT073.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1347
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=idfN0LWs;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0d::624 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 12.04.22 12:18, Andreas Orfanos wrote:
> Hello,
> 
> I would like to use a shared memory region between an inmate and the
> Linux in a way that is coherent. The memory region is a memory pool
> partitioned to provide memory blocks to inmates and to the Linux
> processes that have mmap'ed the region. The Linux process allocate
> blocks of memory from that region for local data processing, and then
> indicate to the inmate that a block of data is ready for further
> processing. The inmate takes the indication and access the shared memory
> block with a cookie to continue further processing on the block.
> 
> I would like to keep cache coherent between the inmate and the Linux but
> not sure if that would work in Jail house. Do I have to clean and
> invalidate the cache from Linux all the time when I pass the processing
> to the inmate? I am using a Xilinx SoC with a cluster of 4xCrotex A-53

Shared memory you configure between cells is just like shared memory
between processing in the same cell - cache coherency is ensured. Just
follow the existing examples for ivshmem devices.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/416c28fd-5904-0b77-ede8-da1199c27df8%40siemens.com.
