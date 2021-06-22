Return-Path: <jailhouse-dev+bncBC44VTVY2UERBSGPY2DAMGQEMG7YWNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C23AFFD7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 11:05:13 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id i19-20020a05640200d3b02903948b71f25csf7051310edu.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 02:05:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1624352713; cv=pass;
        d=google.com; s=arc-20160816;
        b=E+0yJTZuJ2WzzEa6t4socV3EyXzorSyObJeJ65HOztHLQswe0AOyPqvqTpoQyJmVyd
         239AHC2pTlWSOkntWITMW3BHiMkjA2r4ELaATOqvrO4M1W5v6n5nSfB3Axnztz9rSD3Y
         gPGpljkhHz0fjd+uyC0+VoUoE09SL7lvHli7Mici7OwyAgZqzsGHkgrhw9fJCi5RVr7l
         zqR2QYuE+jrj0Uill+pIOp41+Fu1s0rCfcRUgpErV+eujinyf7SQqCcs6I94Q3cTyJVK
         2y01OQqvgi3wVIH9mD+Mn5rMYoqZynXZyhKipguhcE0ylWlD2/IADGhsYnoK+rCr4KsG
         eAiA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ZTbMAtTjD4qhuHGT5NpsMnpph7V4FZh9tPkiiKYjMBU=;
        b=jXdEEdwWjh9Ct0kkdQuMJAWg34Inhq6mgJJxwHOksDgn6AXHSth4//vPFt8UF2p3pV
         ZUclH0hewtfOf868BjPl8CMIfhv4DxfDB8xM8qbcA2wAZnXDlZ+zpNo0XQ+oXMk2PXUQ
         8prTSLqdsfh17LOxoUX+ipQ8Q97FDl5SjU20KuafGXKc3hK1NxLi9qaYZ8A66DBQk8q0
         izPLGd7Qwarky13ARWDvs3LO9JWzOqlVCBkRUcJg9UwGmdgdKuAQ/N5koulMRt0JOl9R
         0KKsOIqn+KPFqKG3OM6PxynTkHS+0xi/A3l9eZRyD7rOCKWtQx3uqdQTXuV0Xd0ii3k1
         ohkA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="GX/YwJv/";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.4.85 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZTbMAtTjD4qhuHGT5NpsMnpph7V4FZh9tPkiiKYjMBU=;
        b=M44CM2trUoIUiZcxeK2QcUOzmzKdEoI9Q+REch7PVQqR9C8sdj0OC7miPRzCKpRhIh
         9OlUw68g8VSxtDdr+Y6/vP12xdb5RUBzKI+rpGMXflrX6iLS8leVqufduf3alWiDpdIZ
         xFwQM+00r4rin1dgmzINRNM5zNECw5VXk7Ux8YbX/exaEEn9aH5CfyAgz5fYkb4gKQGb
         E6JA7XAhSeJCHRD7sEORZbLKWJk/l7XSNpBsmT0hm2TUk6StUJaibxjeDdPQ4nIw2JKo
         FKh9K3aKlI1lkcfIfcTzsvkenco/6kCwWw2iPH6TU3LA0oxWu90fhUn3UAAlKcW1P+vH
         hjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZTbMAtTjD4qhuHGT5NpsMnpph7V4FZh9tPkiiKYjMBU=;
        b=cir4P/5zZwBBukIEuJ/+NkzL0q6bcnWSW3/GxMgKLSaQpzRTbjfleBtMKJ7GpXGNfq
         MUmpPtggu4UEGuvzWlLdHgq5Sz/Yfgh0ygIIgi3vGNkmRFjSJ3uC9m8efEuTQ8+dXkNk
         IdMkbJXCM6A0x5Vph0DPbAizQAUmzsMveOwMtoQVKDONwvFvzmdCsCiZp9w3y+KzIAoS
         X8iTYWUZBHbb2zu31GYXXz9VqPZxxpQF6WCyTt0w9REPRXTacEbiOZ2b6qVydR1H2Led
         AMLOC2EKNgWXJilwhvECqXIaRC34y51kwS1ud9meKEinHY7KvrwfN0ZaL3EbCEgk9HqV
         fRgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5305Ma/1AzYH1UpyC2uEnCeaYvFkMrHzdAcJOkAz6SDkRl1mMM/3
	BjtmuBa6OfzpsLfV+1wpdy4=
X-Google-Smtp-Source: ABdhPJy2Yp2i6d5j1Tng2R4ZT2Dti2+PPAL9S/F83T8DTd/y3yYxGrV4OtveHUW/OYH0lFDpqCHa3g==
X-Received: by 2002:a05:6402:53:: with SMTP id f19mr3573277edu.200.1624352712906;
        Tue, 22 Jun 2021 02:05:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6b82:: with SMTP id l2ls2689700ejr.0.gmail; Tue, 22
 Jun 2021 02:05:12 -0700 (PDT)
X-Received: by 2002:a17:906:28ce:: with SMTP id p14mr2884208ejd.344.1624352711838;
        Tue, 22 Jun 2021 02:05:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624352711; cv=pass;
        d=google.com; s=arc-20160816;
        b=fqJyo8B5Wtv2F/HIXehm756bRI03iNGUdbFKi8mAV3FctOy9l4NLDSBeORSpH09Xf7
         GfK6kTCTZxo0JsorCgVbAUWkSSTXVsMMJKbFFCyCO2tvyqWCTP1IEnBWwse4G2NCByBx
         oRymE3foQzv6PjqJ1ETE+/c3LGa8UbKh+mm3zOIJ1CfQMtivZMEHyf+Lr+Fbk/a3mTDd
         7py3iepp+t8VHRekFcLTv2KTd35xwKgK3z0CeBTsP9YW2GkWG2ULxfRVOtHWaEpCqql5
         YVubxa7HYcg3bbHW0R58prufd3aIlgGbkJnGinsd/rMSAxBVALAstB2kJC3+ir9R4yOZ
         2z9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OKnmNQ7BQJ1iOppy983QLgeZQ4kjyenQGc+5P2sU+TI=;
        b=JUXsxDFo9wu9nad+/QgdhrA1IBmWPVfPXkXdlPy1UkPgOTUxAwinoSVx2FT4rSzujc
         Yxc1zOMw2DcPBugy/MX4pNRwaB/HoA1M0kkfkTGKTvL86x9eLlICqIAozrR6JCppVTUA
         YToS7+1raTli9DfZsVK6E271RdTaPPWd7OlO73qf3a6FgUK3D5hvaYvCTeoq5AuPlD81
         Ye6KXk8UZ16Los70DoQ2JAx01fruL4lDnnoYdSg+YqnklpPXwB9RpPMAwV5fORW2uETE
         g5rPtdmDAHany1hFQ5QstmYePPxc/RUyoPjeECnEP7oEFq56g7V9DXWkLNKo7Bp9LU9W
         mU3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b="GX/YwJv/";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.4.85 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40085.outbound.protection.outlook.com. [40.107.4.85])
        by gmr-mx.google.com with ESMTPS id x10si78465ejy.0.2021.06.22.02.05.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 02:05:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.4.85 as permitted sender) client-ip=40.107.4.85;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZeq7F3xBBZXPO2kCRcxTtYycMRQ57PKu+pv5IvIDKlHBcvd7wzpByRVeIWfYeAiUQ+5UbiGjONlH9BZh9A9JjA4OgzvV3P+V9/mixNt1EETTk8xmTE2UoG/HLEQ59ydpC7zMtLVIj33j1f2C/q4JLdRocuaKezuQrsZkg2Wgy6NqCuFEPhHk2qY/cmQTmwK9MeV91vtt77Raw/wZHWoFHVYgO6r+VBZHNLz4pdGyU4RIzR9SCy5HFOJ6UBxb5kgKdW7dcm8QLNePbVv06bG52aAX9WY7p+iLKUySYBqjxJSJ1MFfJvsKbAkO6tQbWmClJiddC+CgwnVaRvqi1aP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKnmNQ7BQJ1iOppy983QLgeZQ4kjyenQGc+5P2sU+TI=;
 b=icbyk3WFoeytskPtIznqEJPtyhf38WWUq4IUYRJ/dZh24IoAVqoVxW3LQKHfZdAceCicWQ82gvZUKfifU8baFyo1h01iu+/XfOAOyVRz4dqGS1a/s7glfjVhJdFX3+9lqeX4L95BV9//5CXGwTmurX5TFo4Xu/UVNb7w+SBggSENoQ5R3kjnH5ITU2kA1G8DUUs74FrotGANG2+uOiCfPHxqXfNp0AV1wgMKf5P1WjCK9S9mc4AQiu/3dlyR8gOqbYVXau1aA3PomjwRLgtDfvZ5QDpIx4/dubcnYtc9RUR/3lRxiWsChvp2rWoTarMowPyCLH07vZT/2iVIL5IMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB1907.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:4b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 09:05:10 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 09:05:10 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v4 3/4] tools/scripts: Remove python2 specific code
Date: Tue, 22 Jun 2021 11:05:01 +0200
Message-Id: <20210622090502.231179-4-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622090502.231179-1-florian.bezdeka@siemens.com>
References: <20210622090502.231179-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [178.27.125.62]
X-ClientProxiedBy: VI1PR07CA0171.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::19) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (178.27.125.62) by VI1PR07CA0171.eurprd07.prod.outlook.com (2603:10a6:802:3e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.9 via Frontend Transport; Tue, 22 Jun 2021 09:05:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b88dc27-751e-49f7-51c9-08d9355cd6d0
X-MS-TrafficTypeDiagnostic: AM0PR10MB1907:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB190716AB9A7581E34DF64AB6F6099@AM0PR10MB1907.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2svTASnLNRDeuKXUGG3fEB0RNaBSRnRedorY14kTe/Eb72VPzAxXYCthNIXmz149Bq4A8aOqF7gWzusr3NV0csgh5am+ibg6cnHRlDKIvTlaPZ75JkAqHZjr7cnOpMQRBGGFJ1eG5wl2GukZl55EIRDbc53vNQWhsr0+OiA1y8YKUvpvKxAEKwp1vHRZPm+/T+q8GNfc00PeGzVdGodg6B2iJZSX5VeBSb9707S+bB+2xQE274AjpBVrE2/DGCv1UvwNsecN7x559TMtkgsttZ1tULRu8qWtAzoRAKx5mJmIH1lo0XMwR3elvCfVmgXJ7Jk1nJDjuuspOsOKZwhjQZGX/XGQOsSQgwXZVc8NRTw1oG5KGLiY9PxzrlqW3GnMdO8QbwTmzvsW5DgPz64TokgCwqLykg/NI35AT4iMyg+jE0/kBGLVD9l8WQqRlGPTCp+jTDBxio7lA1itAvrvnrCK/2FIaEqW8gMD8NsIQ1KTrGYgKOR+sdePBLJIb/fMYVtf90nMmfKsomO6t4iSt/OxvzfRkrvLixV47sHh8IcPEmW4zFtI1LCjYPjZxeBJCjGOYRnNZE3AgVHFwo13iVp1eRbPUPPVbwnJJr2tww=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(86362001)(107886003)(66556008)(16526019)(186003)(1076003)(6666004)(6486002)(66476007)(36756003)(26005)(2616005)(83380400001)(66946007)(38100700002)(2906002)(4326008)(44832011)(956004)(6916009)(8676002)(478600001)(316002)(5660300002)(54906003)(8936002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3xQWArOpzqa0HYWpSUQDrJG+xO4+8JJu1m9/oVbixKi1KD80JGPu65vzXY6D?=
 =?us-ascii?Q?4m8UC8QC9oOq/940xarPuPkZqeQcUBeSewI8aCNFZy+xG0v6VuTJzDQzAL5c?=
 =?us-ascii?Q?C9EdP8/fLdmhiZ8Qs2qJXXibCO4T3eHJ7XiOLWVv+xaLL4yep7S0YyYz48a4?=
 =?us-ascii?Q?E5V2fsbw/Vck0Y7FARBYyo5sIeozLWQDgAFImfp1o5ctFA4RVDDouFfPsvY0?=
 =?us-ascii?Q?FrcCpju8jzufYVKUxU/7bwLDhSGPssosF4YqIQWu1qZTkAwd6l9ajFMyu6NU?=
 =?us-ascii?Q?tjbLLL9BrCT830yQyx+If7iiWeHh8PLeTCTyvJlLMuZxNkyFYeD8+26y9M4L?=
 =?us-ascii?Q?rgtY8qg7kSmRuvtcDbQKuLkssiHYmChnrW/jX0KMmEN6wWjNjCOa8LniGy9z?=
 =?us-ascii?Q?H9rqF27X4PGioUP6H3ql6rY1SDzoT8vAQ7FhSKNv6u4TfWTBXf9O1zrmdBlU?=
 =?us-ascii?Q?n7iE5SlmNuiH+eEyQ2vHsW6gtErCwt8f+SaKpf68iH8ocaRWhJNkcsmFc5gy?=
 =?us-ascii?Q?D2CXkWpxvnPCFP98xw4aC3KwjLfgrvUs4zChCGAyepoaoq7u7ViwxOzgHOsh?=
 =?us-ascii?Q?DYTueTZY1gNgZs/O+Vzn8W0IbmQqcud64sHLtU2oiV876uUxHqlTO6Esn4iY?=
 =?us-ascii?Q?hEmeDDhucLvPKyEXJk8ItVnRemMugU4xVQXNWVh5GDMi6PUOEuo46NML8Rrp?=
 =?us-ascii?Q?kxC+stVD2fDQ+KlG3MgNG1tHDZczv+Jt5BsIp4SLej5hB4x/s9QsYHOuG4s3?=
 =?us-ascii?Q?AjUW0Qn02W5LF2XpZ2jW6JQdLWSYYsIl7AHFJcLWajMso0U/7wDj6MXRQpyc?=
 =?us-ascii?Q?7hyZje1BnepZu+fyJz3aSR05LRizK+m6CSzOiWNt3PsRrcgjrXPz3KrhISJw?=
 =?us-ascii?Q?3EMI7WclhTHYjOYcOH4owtkrfMYIviFULfhfq6doLD2epcpqISr1XWHRCKob?=
 =?us-ascii?Q?o6K5DO94aISCe5vRAbdyIwHVf189CeUraTQ5StW07+KUdPC3lVW7mX245oKi?=
 =?us-ascii?Q?ztv5b/yQloeDJ+oAWuNXow7V1MMKp9i6/7osDfPckDy3sTM+SvUWwJZqUjeu?=
 =?us-ascii?Q?zoo6MIqOANKyTRTLthYPU1sWYbwyy7fWPwZ3/gMSFfClfBBtsJjd66UfDNQa?=
 =?us-ascii?Q?+32GqRPnBZn6S6d6sHQX3VhW274kzjP9660C/fgUPfXW0OfIJLaqGgDrXLHB?=
 =?us-ascii?Q?nx51qRNBuvUC6PBGC3cqawifRhDn2A/12gjnAxEZ0lfSAhnZ5R+oubbcdeHG?=
 =?us-ascii?Q?utwn3MKBX1KL1bW9X1oRHbvpz0JeYPIk1eh/OraTQbuaRYVUgp9/0olv9TqH?=
 =?us-ascii?Q?igP7sItSz4I9BNwv+nAlurYg?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b88dc27-751e-49f7-51c9-08d9355cd6d0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 09:05:10.8045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftHe56rpLyg242j4QA8oHRxAMmh+UGLzxqW7pzOXD3SEGUnfg+rXHkydORzsfLlC51GwLbgGhoDyggkNwHTI1XJOldOPOMlqIzsZ01h+qFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB1907
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b="GX/YwJv/";       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.4.85 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

We are now calling python3 via shebang, so no need to care about
python2 anymore.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 pyjailhouse/config_parser.py   |  1 -
 pyjailhouse/extendedenum.py    | 15 +--------------
 pyjailhouse/sysfs_parser.py    |  7 ++-----
 scripts/arm64-parsedump.py     |  1 -
 tools/jailhouse-cell-linux     |  1 -
 tools/jailhouse-cell-stats     |  1 -
 tools/jailhouse-config-check   |  1 -
 tools/jailhouse-config-create  |  1 -
 tools/jailhouse-hardware-check |  5 -----
 9 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index cad761a5..7a7f48a3 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -14,7 +14,6 @@
 # information about the system. For more advanced scenarios you will have
 # to change the generated C-code.
 
-from __future__ import print_function
 import struct
 
 from .extendedenum import ExtendedEnum
diff --git a/pyjailhouse/extendedenum.py b/pyjailhouse/extendedenum.py
index f3dd1bb9..bcb959bd 100644
--- a/pyjailhouse/extendedenum.py
+++ b/pyjailhouse/extendedenum.py
@@ -9,25 +9,12 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-# Python 2 and 3 have different ways of handling metaclasses. This decorator
-# is a support layer for both and can be removed once Python 2 is no longer
-# supported.
-def with_metaclass(meta):
-    def decorator(cls):
-        body = vars(cls).copy()
-        body.pop('__dict__', None)
-        body.pop('__weakref__', None)
-        return meta(cls.__name__, cls.__bases__, body)
-    return decorator
-
-
 class ExtendedEnumMeta(type):
     def __getattr__(cls, key):
         return cls(cls._ids[key])
 
 
-@with_metaclass(ExtendedEnumMeta)
-class ExtendedEnum:
+class ExtendedEnum(metaclass=ExtendedEnumMeta):
     def __init__(self, value):
         self.value = value
 
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 58910e8d..7f19fb57 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -919,14 +919,11 @@ class IORegion(object):
 
     def start_str(self):
         # This method is used in root-cell-config.c.tmpl
-
-        # Python 2 appends a 'L' to hexadecimal format of large integers,
-        # therefore .strip('L') is necessary.
-        return hex(self.start).strip('L')
+        return hex(self.start)
 
     def size_str(self):
         # Comments from start_str() apply here as well.
-        return hex(self.size()).strip('L')
+        return hex(self.size())
 
 
 class MemRegion(IORegion):
diff --git a/scripts/arm64-parsedump.py b/scripts/arm64-parsedump.py
index c695706f..54f4fd66 100755
--- a/scripts/arm64-parsedump.py
+++ b/scripts/arm64-parsedump.py
@@ -14,7 +14,6 @@
 # the COPYING file in the top-level directory.
 
 
-from __future__ import print_function
 import subprocess
 import sys
 import fileinput
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 6d1743f3..a1650912 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-from __future__ import print_function
 import argparse
 import gzip
 import os
diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
index 4c5289fb..7a634212 100755
--- a/tools/jailhouse-cell-stats
+++ b/tools/jailhouse-cell-stats
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-from __future__ import print_function
 import curses
 import datetime
 import os
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 62db24c3..d6ea7079 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -15,7 +15,6 @@
 # information about the system. For more advanced scenarios you will have
 # to change the generated C-code.
 
-from __future__ import print_function
 import argparse
 import os
 import sys
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index 2095f4e2..c2cd5952 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -18,7 +18,6 @@
 # information about the system. For more advanced scenarios you will have
 # to change the generated C-code.
 
-from __future__ import print_function
 import sys
 import os
 import math
diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
index 7a41b48e..fc8ce4f1 100755
--- a/tools/jailhouse-hardware-check
+++ b/tools/jailhouse-hardware-check
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
-from __future__ import print_function
 import mmap
 import os
 import struct
@@ -20,10 +19,6 @@ import sys
 sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
 import pyjailhouse.sysfs_parser as sysfs_parser
 
-# just a dummy to make python2 happy
-if sys.version_info[0] < 3:
-    class PermissionError(OSError):
-        pass
 
 check_passed = True
 ran_all = True
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210622090502.231179-4-florian.bezdeka%40siemens.com.
