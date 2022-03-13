Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ5GW6IQMGQEGSB4JMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEB4D74F3
	for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 12:20:08 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id 20-20020a2e0914000000b0024635d136ddsf5225834ljj.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 04:20:08 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1647170408; cv=pass;
        d=google.com; s=arc-20160816;
        b=v+bSp50FHCxdDkj4eW+98RxTyWyqiMLcEgwAyRShWrhKWNqEa0Lcow+dkZ5TLcFKzb
         cjdnQSjPvNy7YWXZK1/I3tLKpWjdJ68elRB9QPs3Sm8PriRzbc40PgBx25ICibz1GriX
         a7FUtjZCnumepQjpyMvLTnBbz7vAHeqWRcYiV8BOOJNhnxiXohuLxQaW+EMcN7zMN/64
         ifRZ+/UumzGsTVZ8H2UqGeleNI0T4rdpg3MDqOr5RFfhxHAmAfIbgpZGOzsgMrFyrV3j
         kjLmFLD1rHBaD+SKZHmEGO5bVbv0Ni3t5eZV4HUBPOb2zyCSBj+1EzlyA8r8gT40IyEi
         FcQg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=hp2El00XFsZaQAGSYrYJdYY7DrJ/4J3mV4mUfnUhzHc=;
        b=wz5iC1uQhy3Me2iym5rpnLdJbJsiYzWeHSpAF9II2FQcF5EEjeoVppx6PiDgn6viXC
         bImIRMmY5neOnDmqWW9d/au18AA4EplX2uSCCCGGbn4xzhWenVMvTxxBYSe1AsBkiXjh
         b/qfiFEX9l33f7QoGhGeREkgVRVzr/l8pP9iKgCBCKk5jyLnKAxdD/1UeJZuGHESTgJa
         0GQ4Jug619ojeOI6ZqFQh96s0OA00i5cEtrOeWCyiHSIXFecO/cEF0c3LLmr5vQvi0tQ
         wUcepKibnqWR7lTWDjQ1cG2RP7+S2HNiRaJSBLoHbCi7eaKH0l0sy0iys+Pu/6czaiOS
         NAOQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=leGXM30B;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::607 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hp2El00XFsZaQAGSYrYJdYY7DrJ/4J3mV4mUfnUhzHc=;
        b=FnNqGDUSPEnz5V+i1wk5sKDtZyDJfMaRG1Zc1Y+huCd+x+C6+uG42xRSzL7kPixz7q
         gkO4ALn+A294NdfFnDT0UzbyOk+MEbgR+ONsyXPdp01RKbaVglTZ7j3kUZ0gg7v2yEAT
         XU/1Aj6cCFeSAh7hS7hfN89YOOkNGY+B4N6nnVZ5mqEaVpZARNwV+wrCDKKFbYMwpEIs
         Xt+Iikxk9Me/BLfMfbvxMHCBk3QgwcMjfGNJ48KUDHQwXAuioGGXitCDOcDPxRYVfSuO
         gr/MfKPNgaEYDiPSg5+wfX4DnCVT7VSNQ8nXKXYwgIHWpufdXy1ZVMmSID1xhHfbhoqS
         OsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hp2El00XFsZaQAGSYrYJdYY7DrJ/4J3mV4mUfnUhzHc=;
        b=ZzllPaXIHX2E9gNcC10bv217nrZflms4hz5DaqFWHFdSqVljV5zgPq+kCDQbDfP7UY
         rJa6HqQ73pYuqom/1T1+PXCEn02VB8oTv/HnuhAQt/UFPqGObQaRQu1B8G0HjVc5W7Ju
         H/ulSZODjY0ICLg1NnPq2TxtB6eW5eZhejNg+z7sQIdoVmmTFgnrVAfVEYNwsaaqWHhT
         Xk+RnhVmD0WNvqzplBNV0fm8d/oNPW/NYYbmNSKtrgaw+riWC/fQPRGVUuUmyTGtBQ0Y
         xwa+FzplGpCQWifRNbxHUbOY5yj+k1oQBvPywSZVIafvvcFmpbW1Ad9nldE1SuXon+zc
         32jQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DssfNhc5W3PzSAA8LS1fi008m4G4j1Oc3xhPXhH2hNUAgvbux
	YcBqr7wsWHwJdeA6H6CPBLY=
X-Google-Smtp-Source: ABdhPJxma4H16ViTDqspGNWlz7KKVp9qjVRPbSd6YWh8+AFUTIrlXQXOX43OWKR5bzdB3H+rM10zeA==
X-Received: by 2002:a05:6512:2312:b0:448:4bbd:3761 with SMTP id o18-20020a056512231200b004484bbd3761mr10583101lfu.255.1647170407926;
        Sun, 13 Mar 2022 04:20:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:b05:b0:448:696a:ea62 with SMTP id
 w5-20020a0565120b0500b00448696aea62ls231684lfu.0.gmail; Sun, 13 Mar 2022
 04:20:06 -0700 (PDT)
X-Received: by 2002:a05:6512:3a85:b0:445:c812:cbc2 with SMTP id q5-20020a0565123a8500b00445c812cbc2mr11318423lfu.232.1647170406509;
        Sun, 13 Mar 2022 04:20:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647170406; cv=pass;
        d=google.com; s=arc-20160816;
        b=tcMmHt35Y7zP/HhW7cyPNoKJ3mmpxrw95bOmj5ZvMgQ9BBZz+XLZUq4aRT+bmADcih
         nCl7ZXgM+Z6jS/x+w9A3UHzmkxXw2Gci38p0fZbwJreGpaSga24TOc2ZQ5zSvFvNx4Kc
         bvXQo2tCsJ8TzxveUEze+WjQOCn6VtzQODXuWLlI3Ug8f2MYVQEMBFM6cIdatgbxmPeB
         fk+iDH8j4G9DjkPYf4hBZ5DL2PccSYh7Il7VkGt3t+o78f3aVKKAzux3PwHbCzaK1lQj
         z1L2MRpkuE2lU1rXHRmP/FJIiLxsRcu5VEejY3FTXJzkyjogNXLXlLcAOGHehCJ2/UK4
         yZPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R7ETQrhYAsE6MwzcYItSCba3kNI1D0jeCjRTwGUBevo=;
        b=FriTXN+Xc+T4qpEpBx55OdPqPRpJUg3hE5d1goZjzuDMiPXxT9fybRmhWINSEPPxFP
         Fv7ukeWzh3+mvulXMvUzZitu4qBLfQH3BalGIcUXGOwpqQjEu7bcuygc3y6T7IG+ig0G
         dw4DHdSLscPbbZmDkAg/uu3/ixVSDpKSv6OcX/EAe6FXZAZP1htqbbpqXwZRe+5SwZBh
         quBbwuPjQ+JqaqVbiloJj7g6pYT7FOPV7koiB+hAo2UOqZpgJ2cxENTU6F22Q4+VlMBX
         sLG8bqq7xzLmrJzRDBIJipbfZxw7xfT65l9dnBnIEqiVCFlvj8v5cAbwDhnJ0kTj2hqc
         RmlA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=leGXM30B;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::607 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02on0607.outbound.protection.outlook.com. [2a01:111:f400:fe07::607])
        by gmr-mx.google.com with ESMTPS id d5-20020a0565123d0500b004481e31c8adsi896382lfv.12.2022.03.13.04.20.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Mar 2022 04:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::607 as permitted sender) client-ip=2a01:111:f400:fe07::607;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vz9XN5EjZFOlGqVvfu3bR8OKEmBCgTs1kmbnsZRrU5guterf/HfhIteyJMBTWZWLmwmPzVR0bH9/kh4Aqa2SpmU7vWG2TcEmh+7BLvx603CFoEZL7kAR9VEBJ/Lx8oMeoZf49al4H8DrGcgPAjmlJngAQmyyouAXOtxqFLp78kq2JEjdCbeTvmCho/G9y2u8AaKqgXDhlhjvKPrWkSdTYvGJ/rMpN2uploVR7bMzZLnc9hxiy/tqfM7CgC6cFStF+tCvXSAB0+bGF/ch4bLeQrdL3QgSKnEFaJyXHxKxv/I+umgEfC3Uhx4ei28uHRZ2VXW1DTMJl9QAU49R4SWSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7ETQrhYAsE6MwzcYItSCba3kNI1D0jeCjRTwGUBevo=;
 b=TJRKdG0ztYPUBgTVcgmeug6vLHjtkKDy+q/0D0xMkAib9WafO+6LdFWj0SnzR2QX5eNfzCGFYOHen+IHwXrnm7yCfJMtkjg5R1ZIUikOqxEvV7Bkep/3nK87qaTBAIs1YiF/BqIJYyIhjdnB4bIpa/vL/kgHAQeLEsrltNIrcwOzk+tbLHntTbg8sCLE92FgCeXS4JGLscUhR5y8ZZwQcIebQEuHnoEsHtZ6nm5r0xPuQ6YYj5oirf3TUtADVzBYYkthOgpIAV9y4UG905oiJGghajfmya5CjWJ6WB3nbfCvagfQWGdHaIkrnrT/c+orCPOjvF2fnXUByWv8vNJdVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=nxp.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AS9PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:20b:462::10)
 by AM7PR10MB3842.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Sun, 13 Mar
 2022 11:20:04 +0000
Received: from VE1EUR01FT105.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::7c) by AS9PR06CA0011.outlook.office365.com
 (2603:10a6:20b:462::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Sun, 13 Mar 2022 11:20:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 VE1EUR01FT105.mail.protection.outlook.com (10.152.3.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.10 via Frontend Transport; Sun, 13 Mar 2022 11:20:03 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Sun, 13 Mar 2022 12:20:03 +0100
Received: from [167.87.72.30] (167.87.72.30) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 13 Mar
 2022 12:20:03 +0100
Message-ID: <47a111ed-3f54-e384-88a4-c73ec264e194@siemens.com>
Date: Sun, 13 Mar 2022 12:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] configs: arm64: qemu zephyr inmate
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20220301080926.15295-1-peng.fan@oss.nxp.com>
 <e100f09e-0bcf-3113-5f78-d1dbacc6aa11@siemens.com>
 <DU0PR04MB9417FB18D5606654EE4A51D888059@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <DU0PR04MB9417FB18D5606654EE4A51D888059@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.87.72.30]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cdc6b36-57c3-47e7-2e1b-08da04e36bd5
X-MS-TrafficTypeDiagnostic: AM7PR10MB3842:EE_
X-Microsoft-Antispam-PRVS: <AM7PR10MB38424450D2BFCE87B30C7A7A950E9@AM7PR10MB3842.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RFNazMTli8sLqZkf1Zz1DYB9uh8VpYkTtqEYZ5C4Usv/S3yeqJ3+JOvIvcq+epvKogtG8qn31obzMssveji7TFvqlHdmEmcwpqhVxw0EvSESYkcMHmJF3mDc+PF1Rek8BfFeUpL8JQKNQsMWlh61+VL/cHBiocnyyGYcV+s6NRC4/DK0zpUXaorhQuSGqdhJAy6yf+XiCa+QxXCRbWqok8HLfoeJKCoAfII4Yw0UgeIHI07TvxuEn8c6gdHUyFiMtK2Ee7gi8YiGAifZvTmsSYqT1ctLtLTa/Uzw68ptIayZOtBTLPdbgM1ZljbZWQAO895czy8N0iWm5F7JpOlIfzzSLG2/XvyNdiQNyNdak/aPWJ8FRKtY609NFfap3aOUeg4W9eLuqxzP/h6qpPp0N1Gs4F/yNzqguaGm+C1iwZx5SoxPCFhircmJmfoEQia25eFWflNvxlKmqaZMSjn3kwB3961aF1A9QvUqfbESdpj9Hu20q4S+HrmFQCJ205re7iLKzlBuqe07pOaSMi2wxmuslJJRSKsKHscFyFLMU65zg7DcLxfN1eEz7Yg7uRZewZHEM0gkSa+sLGM5q1f62bG57Mg8MgZAJn5y1Jepruhn6ewQjXIPlw5o9fmXb5LyuzjO3M80L9q9ImkuJc+JmujLYFIT8mh9gB2GihWELGjIzN66NNTzM4P5P60pORcwEQLQrHS3kh9bbqM0MVsPNuNyDFuBlNCFCgYcH+TXHJZOXWbaDW/0MGPkH3pU1puUKkEhioYwgW6hF8uviVZNOg==
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70586007)(356005)(81166007)(70206006)(31696002)(86362001)(47076005)(2906002)(186003)(53546011)(8936002)(36860700001)(82960400001)(26005)(16526019)(44832011)(956004)(2616005)(966005)(508600001)(40460700003)(5660300002)(316002)(8676002)(36756003)(31686004)(110136005)(6706004)(83380400001)(16576012)(336012)(82310400004)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2022 11:20:03.8941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdc6b36-57c3-47e7-2e1b-08da04e36bd5
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT105.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3842
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=leGXM30B;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe07::607 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 04.03.22 02:05, Peng Fan wrote:
>=20
>=20
>> -----Original Message-----
>> From: Jan Kiszka [mailto:jan.kiszka@siemens.com]
>> Sent: 2022=E5=B9=B43=E6=9C=883=E6=97=A5 20:00
>> To: Peng Fan (OSS) <peng.fan@oss.nxp.com>;
>> jailhouse-dev@googlegroups.com
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Subject: Re: [PATCH] configs: arm64: qemu zephyr inmate
>>
>> On 01.03.22 09:09, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> After root cell start up, use following steps to start zephyr inmate:
>>> jailhouse cell create qemu-arm64-zephyr-demo.cell jailhouse cell load
>>> zephyr.bin -a 0x70000000 jailhouse cell start
>>>
>>> Currently ivshmem not supported.
>>>
>>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>>> ---
>>>
>>> V1:
>>>  Just a copy of linux inmate cell with minor update for zephyr usage.
>>>  zephyr ivshmem-v2 is not supported for now, but I not remove that
>>> from  cell file.
>>>  Zephyr PR:
>>> https://gith
>>>
>> ub.com%2Fzephyrproject-rtos%2Fzephyr%2Fpull%2F43301&amp;data=3D04%7
>> C01%7
>>>
>> Cpeng.fan%40nxp.com%7Ce66ac20ef6444d239fab08d9fd0d5e35%7C686ea1
>> d3bc2b4
>>>
>> c6fa92cd99c5c301635%7C0%7C0%7C637819056122949007%7CUnknown%
>> 7CTWFpbGZsb
>>>
>> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
>> %3D%
>>>
>> 7C3000&amp;sdata=3D5W%2FeJXaP4LCVWAvrUePKG%2FlKb93oQuo%2FtT0rsv
>> sQTrs%3D&
>>> amp;reserved=3D0
>>>
>>
>> What is the delta, and why do we need it (asking while being too lazy to=
 diff
>> myself - but you should also try to make my life easy here ;) ).
>> Can we possibly enhance linux-inmate to cater both cases?
>=20
> Zephyr inmate has cpu_reset_address and use cpu 0,1.
> Zephyr arm64 not only support boots from cpu 0 now, but this could be
> addressed in future.
>=20

OK, applying for now to move forward. But it would be great if we could
sort this out and either reuse and existing config or make this one a
forth cell which could run in parallel to the others.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/47a111ed-3f54-e384-88a4-c73ec264e194%40siemens.com.
