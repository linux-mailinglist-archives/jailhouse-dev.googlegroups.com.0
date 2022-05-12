Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO5G6WJQMGQEJS4P6KA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3f.google.com (mail-vk1-xa3f.google.com [IPv6:2607:f8b0:4864:20::a3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7C5254EC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 20:34:37 +0200 (CEST)
Received: by mail-vk1-xa3f.google.com with SMTP id i22-20020ac5cd96000000b0034e3b94e4b5sf898332vka.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 11:34:37 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652380476; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wttwo1VVhoxUC8dK0VH7TB2eaOS14cbeCHxIin1K28HZSsCxeU3F4BQMiOLSmuXvPM
         9obHnRrohu2TaUGGzhkCqgfK9haX83oKM77SMpHxxZxJwSsk1xyMQAv2INz2hLBBg9MB
         7fQL3yvEVDOLkRzTihtFd02lxDhmG7wLJVeALgHoazE1arZeihzNsvQx6QhdTZpz8Ca9
         j3Em8nkcKqgjuv3PRvUbEk+sikf5YLsL5rlZ3eNCC1jcEY/HnIRYPazdvGMpDKpUqYYi
         nL48R3c/vXoV1xmuWApxB//sVntrp1a/gRDk6w4b1bF2HxJJh/kJWM4Gqt43+fynng2i
         jy+A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=tMbAQtzDeDY+2IrfSvCn3IcB0ziobCrGrQ7T6a3tcME=;
        b=iz7onvURM0rQgZ+guNb775xPYzKA9KGQZ7DmNR8NiT1rTzPPaLutfsm0RXA4/TuxXb
         sEEGXu+0f+g5Ng1JH98nQjGq5pDs6dBWlA80yV8nmSNF8mz8p30cKYfNBfuhWvHABxEj
         zGFSosPPRzVvKq6qsTk3TBpUiafxA+nVE+vZbZpJPby/7oIMosu9G71NATf06a8anfGI
         wLPaJd5coCqCuyFt2y8hNUL9nJEHClnV6+rZ+Y/2olp4iMDk2X5wH1P1u+luVaIciMpW
         PJt1lfehrb0cqLi+HhuDMP9q9vR0wgIvp74rXStOXBdeXop3vb/Ha1YubVKJ3fD+bZ2L
         +GBQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=qxxEigjF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::606 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:from:subject
         :content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tMbAQtzDeDY+2IrfSvCn3IcB0ziobCrGrQ7T6a3tcME=;
        b=egAuDqGOVGdT7czHELOSf9fJ4RcP+H5IX5LWjcwaNh801m3OCz7lm6h5yMETsKTbm0
         kpoUFtEwJHhNIWEsUHQqcIng26rR4ndRdSJ2q1od/5O4yZIYi730M3/IYupq5RWy7QSP
         TLI1BZ+g25rk36lgFn3Yg90xbykqYA2/FL+0JfxWRr2MPK9qq5KNrjAIMvSz73kp4OHT
         bo26I1HDNFZ7aFEe3f5V5/2GbAEBM2LQCE534o31lwW3ol1a6hwDeiCPV1WAyLFuU0ja
         sd6QjHcoy83hId7Bl5faYlg7ZokkPtJOQNfwDJAyib4UM0nlWheRglLF4XCWYROHEZHa
         H3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :from:subject:content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tMbAQtzDeDY+2IrfSvCn3IcB0ziobCrGrQ7T6a3tcME=;
        b=hzQW0l1XEBHYhLU/CMZEedzNJRHEZeLHJxjKX9Fcf1W5rv6dcbAF+w9Yi66MuiHGN1
         jB284lqp+W+L3bLTeB48t/MjI9Xa1lZOwXbvAUbMYMVSz98BgkzGBJ/pEr1WlWunvz0y
         +GFkR+vqycv1ZTGJ9BmPDuQBHXw2BlVooDG3kcPeKhRU/jOEFYo06uUd6BtYxki8BTq9
         wOIcbSgfwIbg7NeT4FdlVNgjdF10lKPUnonbHV3qPz0fcwfdj3oUj+F7EX5xSImcxePw
         LpxR1B9gLuhgXqeCEp9zJHyt0fd7baXDm7hWzQQbWomBZ9/ql57CVD9fceWMM/0hh9Af
         PmUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533BR9xGG0TvC4j/XA+jV0ALQjg/g+9Nl1rmtu1CerTqq91+p8cM
	IAfjZOsUojQazok6bdWMfls=
X-Google-Smtp-Source: ABdhPJyXkVONOaUf7wdbQ7OkEnLkpS9928DV3I1itUMARRYC6b5XRErq6Xo8/hov6vYH3EuPP5g5Og==
X-Received: by 2002:a05:6102:153:b0:32c:fe5a:3d3a with SMTP id a19-20020a056102015300b0032cfe5a3d3amr674875vsr.55.1652380476277;
        Thu, 12 May 2022 11:34:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:37cb:0:b0:365:7b87:309b with SMTP id e11-20020ab037cb000000b003657b87309bls529416uav.3.gmail;
 Thu, 12 May 2022 11:34:35 -0700 (PDT)
X-Received: by 2002:ab0:708d:0:b0:362:85f2:7f56 with SMTP id m13-20020ab0708d000000b0036285f27f56mr944622ual.99.1652380475415;
        Thu, 12 May 2022 11:34:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652380475; cv=pass;
        d=google.com; s=arc-20160816;
        b=EtXetV+XXrSIkwojYkkgiAEa2UhaxgJuxG1X9HJSo7LIcYnFZ+6zQnJ2yCikgpOOHd
         upwp/JUH/VLH9DQjCh6k/GD17wWI7eoy5IWdyvfrriPkp5CXCGDTIyPznJA1bvIlyvjZ
         o5lFLmenxNecPd8kgRmnCXl4JEENa8UrdGbHN6PEsViou/SVdh7wXNRoW7FOR8ReGplK
         ms4o3i+IV4d8mz4IOwG7jnIDIw9hsGUhPhTgsKnG9eg9WUbkqcuAyr7XOg5wBzHvKbDg
         JJjCOH3GjwX3NyPDpDGypHv6W7bRdUEdvpAipEqPislTHSPYQ4EKVFqr0A+qr5wDtt7d
         shlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QSkjwucBPljZ2wuEd5fyv1aQ1nG+ym2Hmg0tCsZJXJ4=;
        b=I58tz708Y2QzzQlrnJ9kplY8MU4s1VPNKHT2SbdyqtfGGIPECHaX2H1A0+8+J+kvaf
         jVa5sLBU1EL7MeQcDUvfjzv54hTXt0ns+Suwj+fAolmpdY04tcRIfcsADnboeIo2KoqV
         TMl48VjjaVbqMM6jeSeZmhjFJcNSZYjjtGfGjzNe+28NQsZ6MH1KpvIk+nAF5FA2dBVl
         aau6pJ2B0auEqD0iGKLPtT9HaGCfZurYUfZdFtXGe67e0NsM13g3iYfn0za5/QKwO9KO
         ukvIAdNBUXLrJ+nOl9xoxlf8lGsDEakwJOev4qTtdX3980ubjiqyZSgzavoUoMG4ixlT
         VQyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=qxxEigjF;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::606 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0606.outbound.protection.outlook.com. [2a01:111:f400:fe0c::606])
        by gmr-mx.google.com with ESMTPS id u21-20020ab069d5000000b0035fc4b18c67si55045uaq.2.2022.05.12.11.34.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 May 2022 11:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::606 as permitted sender) client-ip=2a01:111:f400:fe0c::606;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyiiDSZWFRqFv/ES6ERDTmHRVE2aX4LOo65B0SpBCdRPDp4fENv4l5TQ6cq8X8x01noxvqA3FFB/xj25JFfzaRQtyU4I9RNPCT5bw6nFmfXSzCeNib59A5jmIJJGzdDduTgeQAgNbSGfl7HfvhzKyqbdki+RICu3I/8cYAeYuCTB5VQ9XzNyUvEGJZbMygPosct4XUHS+6Ohw/juTThA6HaV1qlIu2WgnQ4bo7sfjiVHKJu9IqetGA5JIOhFfyoFkl75nXvsf27qnR+EO/4aLLE3o5RdIiS7QQKKGfk+8MKPSTPL0v9MAFrbczOkVciHD652W2659nJgrIMZqBNi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSkjwucBPljZ2wuEd5fyv1aQ1nG+ym2Hmg0tCsZJXJ4=;
 b=CPCirETCwMpSS5oTouX6htlP3w4RPBgTdMikMHBhaW4aK+Z92ky7Iwv6dRhbG1oxweYXvf5mlHqxXVf4OFeObEOosXf40r1EvIzInGVOdu1QKQpREcGt7N8UHuVdkDGDF/ogrbLE8d65l3UmRyzYVKYcuB9Qt7yMdsTFhGjMxiyHl0sPwoF0qZig6o2eWxvzV9033U3TiUOJkCfIvJCXRq05iMIsr3cyNdRAvnOAHRF1k9n+L42vKJ/3KI41WU6vWCAvFO8uoBSwXxqgmHhvG6TPwDRilEFdmJsmGuUAV4bA0TSQ7oDA/7s2sFkd04i+G0eBHAvtgFGaofFeGXlQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=googlegroups.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB7PR03CA0097.eurprd03.prod.outlook.com (2603:10a6:10:72::38)
 by AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:319::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Thu, 12 May
 2022 18:34:32 +0000
Received: from DB5EUR01FT074.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::ab) by DB7PR03CA0097.outlook.office365.com
 (2603:10a6:10:72::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15 via Frontend
 Transport; Thu, 12 May 2022 18:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT074.mail.protection.outlook.com (10.152.5.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 18:34:31 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 20:34:31 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 20:34:31 +0200
Message-ID: <4372aaef-9f12-d45d-23d5-45e9f2e64fae@siemens.com>
Date: Thu, 12 May 2022 20:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] kbuild: Fix rule for building pci_defs.py
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--10.120200-8.000000
X-TMASE-MatchedRID: +HK6zpJEf2KaPyWEyuxOvSEBl/8TS4WzYlldA0POS1J85pjA/x1xfkt7
	DR1QMaJsRbDwb3N5ZwoR5ZQYGIKgNdRLZZUof6V3kZOl7WKIImrvXOvQVlExsAtuKBGekqUpI/N
	GWt0UYPAyvwnTpDX95duXwVyehyIVRQaB2/UWEmV26BviUEV+Ybc6cJ4uYUQo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.120200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 2F20FBC19360C5F572F7012EF4A8DEBA3759C241FD2D9A611F76122CD35C612D2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa3c2342-8ae6-4006-33d0-08da34460e4b
X-MS-TrafficTypeDiagnostic: AS8PR10MB4696:EE_
X-Microsoft-Antispam-PRVS: <AS8PR10MB4696C4164C431DFDE2F06D7695CB9@AS8PR10MB4696.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ND5GvqOAle3GhBScRA4EXZMByeZubo4FCtOTE7k5ZbIpoIlGzzbMIw0pTJLrW6T8kn37yCkEfYsRa8//ZiQiZCL33XgeZzouSRO8a3cAeDiG/4MYbh045Q/OfCAnd6TMsi+BgHijGZrwXR8EOjkiYPBVtxZlvaBzF/lNmtJGRxMrsPCzvz6/zXJHXVJsYJP5CL+tF0D0uAdaiJlSRRqCtubrxskobEXdxtX61q8VXVswj24NVNE6Lc9qnbWuP2Og1uk7JoZCYg2f43tOsZDYY6A0gLs6bNQUcJGrp/F8zbinkQ+FdWLy3XnQQx4F6Uc4GXNXXsYr3r8+7hhjCSQXxr3jEU5O3+oEJ6Izv27RaNycAtUaxxAoEbPsTBvLsZ7cAkGUkKjW1JoXcDkw6KsjdX0FxiPkvXmUQu+/6l7e4pIDKXh8v5BymejJAXIWCdaVM2vGfHdHvgmtDRvqWkYU3mE/PwIFxiBWkEd849TodX/6vSviNi9E5/0qenM52YM0fdE9gc47CqcAE28uxxfXyv3TpJt64Xzl4FJhJPqrOOV5YeEZRMMJ/cb1fcCi7Er9Vj9ge/6DQaUlzihlP/GOjmt5OWhxpkaXzcUKGFoD59EmDtredY/0ujKZmpDgmGg7zbh/sMbg9XQ/FP8pzI5ahHQ/gda3YYz4T99UQhmIiQ+1xIonqJ8fpqCztdnsQLUcIcSflqCzO5zvcHnkjywZKbB/l/6aMVfSYZRkEIKMuegTZnWr5simD4C9u/Kz5iP9aXrLJ4t+0VLHJ2dU/+6H/Q==
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8676002)(70586007)(70206006)(26005)(86362001)(81166007)(31696002)(8936002)(5660300002)(498600001)(44832011)(2906002)(83380400001)(16576012)(2616005)(956004)(6916009)(6706004)(36860700001)(82310400005)(47076005)(31686004)(36756003)(336012)(356005)(82960400001)(16526019)(186003)(40460700003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 18:34:31.7729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3c2342-8ae6-4006-33d0-08da34460e4b
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT074.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4696
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=qxxEigjF;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0c::606 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

To avoid rebuilding things needlessly after b5a39e1746dc, targets must
be maintained. At the same time, we were missing the dependency on the
input file in the rule. And that dependency should then not be
hard-coded into the generator macro.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Kbuild | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Kbuild b/Kbuild
index c12f1aef..2258a62c 100644
--- a/Kbuild
+++ b/Kbuild
@@ -46,14 +46,16 @@ $(GEN_VERSION_H): $(src)/Makefile FORCE
 
 quiet_cmd_gen_pci_defs = GEN     $@
 define cmd_gen_pci_defs
-	$< $(src)/include/jailhouse/pci_defs.h > $@
+	$(filter-out FORCE,$^) > $@
 endef
 
 GEN_PCI_DEFS_PY := $(obj)/pyjailhouse/pci_defs.py
 
-$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh FORCE
+$(GEN_PCI_DEFS_PY): $(src)/scripts/gen_pci_defs.sh $(src)/include/jailhouse/pci_defs.h FORCE
 	$(call if_changed,gen_pci_defs)
 
+targets += pyjailhouse/pci_defs.py
+
 subdir-y := hypervisor configs inmates tools
 
 obj-m := driver/
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4372aaef-9f12-d45d-23d5-45e9f2e64fae%40siemens.com.
