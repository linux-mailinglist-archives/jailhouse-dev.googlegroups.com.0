Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBM4Z7GJQMGQEHJ5U26Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B05261AE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 14:19:01 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id h19-20020aa796d3000000b0050d3c025470sf4040370pfq.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 05:19:01 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652444340; cv=pass;
        d=google.com; s=arc-20160816;
        b=rgNSsalRQkSqbxehfDE5ePt1qiXyngizPx0oo9MCJc3o2/pf30ypqkhF886a1W2Pem
         1WBw4Qw98qVTA5te/cQysUEZDHABjKUsOJi5j/ntE6pZdeGXWgIkq0sekUD5C37M081h
         gLSgNlMisSTJh6QI5dGsB3FZr7yVHfWvNPULtqJF17LH0WKSGW/ey+KixEivXutAy+9D
         SzdzqVDHekE2okuWx7PJVsm5qaHChk+ueeNfceWL82i39vAzkUQZUhAVdnIOfKWAxBXi
         2CgrTNFDGy8vmX0x5qE46np8jVEntazuye9H0Lez793p2hS+eMbT3XMRgCOtm9sp6nXn
         DE2g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=bzan6yIETXtMxdEUr0oKnZVaxgnHWL/qlRffOYsQeHM=;
        b=xWG4rYz/Hz6W5knOpGa/BIXt9YO860MAT4zRf9qOQ1oS7H+bt7H3btMJThqdXznjo2
         nYxt7hPeBDSDnX5wm1zm43nXRvqt12JKSLXnvZ5YWmIljEs2DEiURasbkZJruqbP+mcO
         K8LRLl0i9ly9K1laNaGVqwvIU+lbwHDFy7si0SFQTHBJaYHU7WIcE9C4aMdql4vyEPwk
         m3i8VPi9HyCkMcb0DC7Sdwmi76saQzaNu84xEzSKYSToYIcvoIaqkdJtsNRCumJuDWAp
         oaFt62oNiHKsj3EXuw4sOLuGU6zZSz+4PAC/QOJorZoBKf/3dy9ySB/BueBzW9q+wvDm
         TDWg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ez1NW8JB;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe02::60f as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bzan6yIETXtMxdEUr0oKnZVaxgnHWL/qlRffOYsQeHM=;
        b=cO4GzRUsspUch7fHYpk07aL3r4PFmJPKRklBCt/8U1ENkNCCtZ5ronpcwloyR3cJIX
         x3v9up7kjLxMBpa5E7Q0Fmz34qGjqd3NcqFmGdmTueXgB31Sj9nlYjLyzbR1IaqNsN8O
         PTwNJPn1KzlOooMjBNbYEq9Rz2aLfgaVCrUHJC6SQ8CMKN7IE94qNRMQ6yQ1zk77qMD3
         OSZ4RROqArSVcKOD8iAd9Em5ioMk7mwyZJLVEOIv+y0d/FRfTWikUlMb3vYNp2OFS6Kn
         0fr74in4g8mEGWYk/qo6IpXtBo+kyxDuuDPdn4vR7Dmc9rp5eh4naktbq9KEcNBD1bh1
         0EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bzan6yIETXtMxdEUr0oKnZVaxgnHWL/qlRffOYsQeHM=;
        b=dkZGpH64irZBB+aVTvQ1poGD7Am71HlSyvy4jE/reNNUH+peug0rrSBXkqQvtdMvVS
         ahQqU+ZHIB1aBwK98u2xLr5LIhjwpj5ZImElgr1ChF9OHKEST7mmCTLG8dpIPNDovnKo
         GIHQJDcw8OSkMcLnPVF99n6ktUvoi9kgDrYP1HF5p1ufbKqhx0PrOAW4l2jSxMa6kqum
         CI0+JaW7wlvQOSe2m1bg2dU1RiEq4WSRlqSbeC+F7TkKg6v+XqzqnW9jnH/JIoU4rWvJ
         3Yiw0hafsJTzmHayaUe1mMRI4RVtcz2xkLvG26vfWB4urv9aDP32QinIo9aSEIi5bhWa
         FwtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533wrMkt7NpHm3cmeX2s7ZvI+wBtw2Vl+ddsG7uq9rsbIXefSrYN
	ub16GmcImyzSuq2KY0odmLk=
X-Google-Smtp-Source: ABdhPJyNMNddkZFOJPf7QSXdPI6oPeiH7IVbyVVReVqPwVJhWdKmUIWyNKbOdHPNxVQxYrdG36aBgw==
X-Received: by 2002:a63:80c6:0:b0:3c2:8620:8493 with SMTP id j189-20020a6380c6000000b003c286208493mr3860046pgd.18.1652444339870;
        Fri, 13 May 2022 05:18:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:82d4:0:b0:4fb:1450:22b1 with SMTP id f20-20020aa782d4000000b004fb145022b1ls3837726pfn.6.gmail;
 Fri, 13 May 2022 05:18:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:2148:b0:4fa:92f2:bae3 with SMTP id o8-20020a056a00214800b004fa92f2bae3mr4485959pfk.69.1652444338666;
        Fri, 13 May 2022 05:18:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652444338; cv=pass;
        d=google.com; s=arc-20160816;
        b=QGmTAJQ7omTNMw/Q07J/4wnN1HBKbedN+moI2JqrFKuFggU+GhArmWCzVx+BS40/nb
         CDFVkvSUu5oQXuWN+qm+G/wHpVypjt3oiEqciTcBr3GMN2L9TLfsa5S+iSPc7JUSi5NZ
         a9su9UJWvED5WsfshCUTBC7GDRMwSK3S0IIvPLyfGXkEB+C4xKCdhnN0yKoWyvXwfT6x
         aQfxAv+tSiHGNHl1Xb6Du+hujkh92/2rutDo0NuskCmLjyHykV9L5Z8/3TbfrdC7VdGN
         5E2CZgTxkyPIrevLX1ltQpJeM48Yc55aqXto2QZ2hGGmiwh4q8fAdqpm89i2sJAzpczO
         JwNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/BpEjBgn5Y/4nry84aKBX19y3scQM+3Cv6LLtHub36E=;
        b=d1mE6slLsuDBW5pzeRNVviHAKbgq248nS83n6ia4WTgZq6fmQqEqgh+J8rmX005MzP
         BzDL3Ee3qanDYM8ZQu1Jj2S/Xl+xD7TVtr+B1harYjlku27SAnKIoLTv+J7UuJX/u+AI
         QrP62PzNq04+V5LtQ7+kpIZL+yrejyon55rpfneXG+L/j6E0PJ6Q7YJmlg46l8NNqU25
         SSN7NqCQu4zj20a7xvIhGX7lYddMiz7Ho+d6ASHCDvphIfWQuSx3zaqdm1YUrtYuC8sa
         7331jXRSSIbc1gbsU/yf+vT50T92AKx5w2kqv7A7SqTRimq2M8ppyFemJdcdtCfIzv+3
         Jo9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ez1NW8JB;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe02::60f as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on060f.outbound.protection.outlook.com. [2a01:111:f400:fe02::60f])
        by gmr-mx.google.com with ESMTPS id v8-20020a17090331c800b0015a1cc64912si46103ple.3.2022.05.13.05.18.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 May 2022 05:18:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe02::60f as permitted sender) client-ip=2a01:111:f400:fe02::60f;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEE3YRuZ/4VumVRQrjlBcJ40Voq6L2NOCII8havecIqIKqFZ1lK/HhryVNrdeg5WsW5zdxudGDRVVPLBAoD5bXzp7046Y+8RgZm4OZ2PrpwyrNKHpBvsVZHWuuup3wgMg1y25jBLJKBiOovUT+ACvQt88ina7e5iaXEEwd2Hgh241vVy0Tp3lKZ6ZuHEbzahpr52R8dHcEWrKODGQqB//hsxWvxvzMC46QJFIyz4jdoVDaqm+x9LXvzKsX8lbQeUy70IOiahnn6PbrRsDtv7hYn0kViijTDfzo8FF5trNXwQ1ScEx5GUR3Le48K6ZOtEMmjsImmWyP7G6c7KSsDPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/BpEjBgn5Y/4nry84aKBX19y3scQM+3Cv6LLtHub36E=;
 b=l51sURm+3/o61Z0tW6r6gYlNSDG11sYnwRBdqFdiM0nX8UuzV+m/+Xu1Rn+l8P3GSnKm447hmq7JvkWEvcGkD4R2s5X8LNMAkoxdDAb5/pWHmtRe4ihl0LQsxcbCtKcaUS6yHJfajuqNtwVh2wp8q8jPcUK5oQfOA5Xx3SiBUqJJfJru/dwYS0/KXw3siRxw1ogb5Udl1RPDfvYn29RpF4Wd0QQBxYqUIDnjxbDERUZmK77Xa772ndBENRGkBMbuSpLOOOfQXnTW004gQ6yNRFnsU8W6v17Znv+YJJv681oNz2WMYf43YIaS3CvEFHPKN3zuzKs7HzYUUNfKnyCulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AS9PR06CA0352.eurprd06.prod.outlook.com (2603:10a6:20b:466::15)
 by VI1PR10MB2176.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:7a::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Fri, 13 May
 2022 12:18:55 +0000
Received: from VE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::17) by AS9PR06CA0352.outlook.office365.com
 (2603:10a6:20b:466::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Fri, 13 May 2022 12:18:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT037.mail.protection.outlook.com (10.152.3.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Fri, 13 May 2022 12:18:54 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 14:18:54 +0200
Received: from [139.22.104.221] (139.22.104.221) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 14:18:54 +0200
Message-ID: <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com>
Date: Fri, 13 May 2022 14:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com>
 <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com>
 <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com>
 <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com>
 <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com>
 <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.104.221]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--10.800900-8.000000
X-TMASE-MatchedRID: a2rrTcOVXHk5QaOxwNGfvo9bHfxDWoib5GpNAiPonKiCCtrY06jaLY1j
	+mrGi/PFV4i674aSi3ybAPxtNvAfmGMJRJ1WGnFogoYjLp9hKaAxs7ulGdJ/volSWYvdSPSY2mv
	7uQWtSfmvloAnGr4qhvVPDFRnPwE4ULd14sEtBkEKfxNpX2AZXE1+zyfzlN7ygxsfzkNRlfJq8/
	xv2Um1avoLR4+zsDTtFAQvQYa7pIP2aXtT3DVQKSBOKyXaIpeAfIYQ2EcElptHTjQBcWWglg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.800900-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: A92D2E0B80A1F072509E53BCCC4475102A012A3EA354146C9DE3B38356C71EF92000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6d7a7db-e1cd-43b6-ae73-08da34dabfa9
X-MS-TrafficTypeDiagnostic: VI1PR10MB2176:EE_
X-Microsoft-Antispam-PRVS: <VI1PR10MB2176EB5EB18B61D46EAAEE3C95CA9@VI1PR10MB2176.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m25apFLJLKFBklovcRW3N/whHFt7999hJVy/6LeSz2YKq00DLzEaGSTeCJXUgpZlr/eFXaiGxjRStx+0UpBYgDxRF3eh+oHzBz3F7k8U2Fzx8hXwn0jSzZdQFP1MTB7jUqfrNKfpmhm3i060BRmCJp2kI3jG2ru5g6/d91wqTvDTBWNSe4Mk8k6YXWCqruqSUx8+I9Jyi1oa0ft1H4O8fd4lJNyeuYGu3HsWPvHvdFbMGVQlRYAaG2WMJ0AVVjJPCGxZ0017v83e0rsYqzV2njFYhbGv59SuaqbckgfF5lcmybfVq7u1l8oDeFH7MszRreqKANvUQX+lhuyz48tK7ygQQo7QUUQ9A4U7qvZGDa3jW6bK5TXWHeUJb1X5cpaSHMmZa85QSMdNNuF61am3TQ7hAXtxzOZ2uPL4R+ManTs6vkWLuWdNtpzS589cvnzgnWRDlrddVnx/IQlYLVXrnoOlw2OVteedDn8AadTKQLarBsxIPpNVzSamwbp68T4GeyL9TWJaxo/7x7P1IgnXuZp2k3lKbzdwh1m7JnotFHVZk1H4T+tsraZSzCPNFWgcImSX93kOC2tOY3m+UGTpj2/YYQdNx/0SllD9vwaDkvsEMeiRP9laean7mkZAaatfeV1cpHGSYdCA0zHSq3ak7gP0yTwp0Hrz4swuNdbaff5Cg6GIvbEbuoDB+uc5NcfI92OhDiIkBTJvdPs6j9EsL901YlmN+JVQRl7QQLTKm4NFF18H+0UPUCkpVU2hD2uKpmxGmtHk2R8LQbcSY6DU2A==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36860700001)(36756003)(8936002)(6916009)(81166007)(6706004)(40460700003)(508600001)(8676002)(31686004)(2906002)(70586007)(70206006)(82960400001)(356005)(186003)(956004)(53546011)(26005)(2616005)(16576012)(16526019)(4744005)(5660300002)(44832011)(82310400005)(31696002)(86362001)(336012)(316002)(47076005)(4326008)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 12:18:54.8961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d7a7db-e1cd-43b6-ae73-08da34dabfa9
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2176
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=ez1NW8JB;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe02::60f as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 13.05.22 13:32, Lad, Prabhakar wrote:
>> Could it be that arm_dcaches_flush was a red herring? Maybe we are
>> actually crashing on hvc in arch_entry, and that because of Linux not
>> starting in HVC mode, thus no hypervisor take-over stub being installed.
>>
>> Could you share the boot log of the kernel?
>>
> Attached is the complete log.
> 

"CPU: All CPU(s) started at EL1"

As suspected. Must be EL2 or HYP. Reconfigure your firmware to enable that.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c44b2378-e682-4b0b-8443-57f28aeea9ee%40siemens.com.
