Return-Path: <jailhouse-dev+bncBDV3L7XXLYIITKGTQIDBUBFSOEXB4@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EE034221A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 17:40:42 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id d11sf14805622lfe.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 09:40:42 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616172042; cv=pass;
        d=google.com; s=arc-20160816;
        b=ze2cmaxoTRhtaFFwUGMuqZzwvs/9/jG79z347py++kkRXn+0yuLqvE9YeIwYusePfG
         hT/iFwlFt36Npbaz3ZPlRodi3CKHTm7Fkmn4m9xBbUA7SZ+4U4BIKgKyZFw8xkZoyFNt
         jdgRJB2Q4PN1A4FH/fPh0axn3HwbniwfHWngd69H3Dcgn9Q0CPcZ2YqFPjXy+Ql3IzSh
         d5CBW6rQoGtJVmh4iiJLZ9MmEE/qAvohDAkTN6hlb5JJrCTP8MT3+bXtP6yFq8ZC19d9
         VxtxYTmGaoY/wDotBx4AC2QXxKPWDMMOc202ktIycUzN8lgJOAH9rKbeZn3JkdAD5Fwx
         A9mg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=3i4fPoRzkLUXlMgl9EK2j8XtZ9HxUxL7GKGWV8ZwS3Q=;
        b=ZP0yLVG9gtg7KGMnCwTXCeuwk1XwsRFspjFrAuKxv6b81RBTo+BijI18isJ5emooyP
         bt2WpDhlkWHGVh7eRZ01cM5hbEKSQst8fvn+UQ76fD7C3JseQoOcXnFadbd66ZQ1lF8P
         gcLKXoNimxekFGByEiJfgh++LWSXbG3FT58NM3NMoAowiA+jMdGDGKpoCIVAFUCy29QA
         9yv6dp/vmaWPoWKO1RMAfTUKmMX8BroaO8jH+HQWLjvuavl4L5McOE78UvW/WwWUedi8
         eW9EjL4hQnXjgzW9FNYSwqlHeg/c6WGfYmcwmMnqLUY/e+WQEc30ppcfOopLy1SYP1Ds
         nJEQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="Pem1k/p9";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.53 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3i4fPoRzkLUXlMgl9EK2j8XtZ9HxUxL7GKGWV8ZwS3Q=;
        b=TXQW48/3yCI6GZkDk8hAMwXWby4iDD5IbALYWkKHM5LSnYM9PSwiTcqoCjllCUniAn
         vmu9Xp6TIYYXCqNVgp/G5+2k3hcusyXR5k8G2QJAmCJ9MM42lxKAGfjUCXM3987Do+Es
         EAq3zuYRON+xjbIvwP7UCmGLQwv/8FMTjTdHCt3aOL2o0nTTTHC6px38cvIsNTsXdAEr
         QRdzc4iStQ3xEg+Yxb7UPTtoUOnjVUkiZe/xkWaIfOFadogomVSv1d9MH7xJM7Vq/XAT
         j8vLfDo4AGHp86l5sJukkh+OSezDLrbE7DaVu35NUgOckOo9UoStPe2sICmP7WaQrBrY
         FWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3i4fPoRzkLUXlMgl9EK2j8XtZ9HxUxL7GKGWV8ZwS3Q=;
        b=T/qy4SchdnE3s53bRPjkpC4vSDMRYMBaT/YuJcUM1o8VC4/AIbgFpMFY0rF6YMK4Hy
         Xh5ThKz2ObT0ssSpPzP5A2hmZcxUaJqVc6ST10scapzVRzkmgR5ksFzYK3sFDyPpHQTY
         qoSjPp8h3NzZYFttV3vMQj0HsOUUTVOjCqJdaDBz6EWsO1wddJOLj08vLTJzgwXnO4Ct
         /7FHtHeFGOUtOXFhH6txr2C72QSirUddyJ6IVo5BEVqk4J09iFAXlXb6bBBJonavlVcL
         u/o7aqyt2tAO8mMXfX6ccXVoi0TR8PGoOqsKOnYB37GDCU1pZxfaUKKZlMqLG8god+hY
         cUsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533yXUmcdfljveakh8NSOS3EqH3UVBJ5aunvI0HQ98VWmo3v8qUi
	M4FPfxe2g4CueepVADKDyyo=
X-Google-Smtp-Source: ABdhPJy8QROUB2+Z+ukKWdzvNjTmjVl+NodFzToA/fLWFILuX+1yc3KrzW9Oo71cu/KnqlXGj/VDgw==
X-Received: by 2002:a2e:9b14:: with SMTP id u20mr1427540lji.463.1616172042015;
        Fri, 19 Mar 2021 09:40:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls4127264lfo.0.gmail; Fri, 19 Mar
 2021 09:40:41 -0700 (PDT)
X-Received: by 2002:ac2:5144:: with SMTP id q4mr1377464lfd.145.1616172041120;
        Fri, 19 Mar 2021 09:40:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616172041; cv=pass;
        d=google.com; s=arc-20160816;
        b=iPGjEvRGtNpPxXnVxEP1M1pivXz926mUShMvKjIXudBX2UmO9O0zikV71zObfNO9rx
         pEwFlPJy4s57tMGUHm1g+okGdw1e9sQMk9/MqQr3GQW5ELOiMRofJgkePd1HmLSVEm8c
         nA/Yc5SXZJ3xyaAFaaTtAkfWlQHvJiFJlhdOKxLcG0fnrBIHas7CkeRvAy6SjQ8+68RY
         dSYW/pA3rhQPESpxhs6RJQHrv2Twp1xv/VGoQDRNtMJepok/tdqRiOZQgxy5/glspfOh
         Z1Rb3dTp5vPVnRHpDSCKcbGzsmlewvbi3dWh/DDpjmMNjWJXIuuixl50YCk6DkzfcH8q
         I+ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jEkdNBBEcek8NKhH0KQjyGnOaVaEH48SmLeHOMlQr10=;
        b=u8t0DjxyrvaKUlKrQ+awJ70rHvJeWNMKguRyM7Z39fpgKs0wDQBCl8PsEc/7PZGZz0
         b7cMBthtl3KuMAf2xR6ey3cHnLr2e1kFiDZNWl4SutKVwc1B9Vq+GYX5/4QOW+02d4nM
         /8pQidc7y3o9f07IQMegBDqE0pQOZT0sRbxSeMInEUg5y9u9Yz58MGEsixHZlJV4d+5k
         QdQm5ZCjYsNf0WdznpuWiaPaj07MlfkNo42ATZmu9cMhWmU+etVD5XL4X68KVd82yoE0
         +3bdT7OpoIzgC7OztiCInd6zzv/aExpxd/FEac6fvw2mQ10uy3f78KieYGxctf1Pduoa
         0m4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="Pem1k/p9";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.53 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com. [40.107.21.53])
        by gmr-mx.google.com with ESMTPS id z5si195244ljj.5.2021.03.19.09.40.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 09:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.53 as permitted sender) client-ip=40.107.21.53;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOnajVsqixZr7sxu/eHq9G5gNlyJXfCmWhZ85f/69+OcNiidzz4320PiZzrT73w4VdtKZMZqmWCqmcBIWVNaXcd+qKMZZjVYYOg1ZZFv2nmRjbfmzkWezBdKdaeRn+WA2QPXrVT3ehH5waRpbn2/KLrBuyM/7Uz21r5h2x5yeK8xeDcKKNAysO8fUDvkGzdWrjijTDh53Ahiol6X8PLxNX96FhxnnEEmjpoVsTRsn5NucTsRncSnx7SfAuaMnMWxxwNsfyE5pCpgWRPWJ+9UaB6cVvQUR4oZesgGjru1ENx8HSs+KjoDlREEwyNnXbPlYEeGB7ATWBvSEhXmGhihnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEkdNBBEcek8NKhH0KQjyGnOaVaEH48SmLeHOMlQr10=;
 b=DFNvYa6IMP3yf8zfrbj68ZgXvnEgJ7wwUfY8HTTfisw1VoHNRsJN8u6tXDkkRVkTOkOSNBPpx/fBiNHrw/nYGau91vtZU3xt5d1UeMcveokXClf+Cdax8X3X3LWwDdzvQ4msnW9IUtz7fftvdtBwRAvON6TNKnLIAGbnCFH43L7WGXEU7MvUVyI+5kUs9KfcORQ8k3VMfkLnV7n07FXCCNVU1yx5MJq1asEbLDJxKTFW9eoMsOPnddFSKlE4bZbCL43iItAYX+NtHAJdWl3I36+icY9VSg0sZVBE3sC+u7F1sl9xvubtVoKnQksxHKDCtsftDzk0ahJurEDWZGtSqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB5709.eurprd04.prod.outlook.com (2603:10a6:803:e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 16:40:39 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::5dc3:addc:b43e:a00e]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::5dc3:addc:b43e:a00e%6]) with mapi id 15.20.3933.033; Fri, 19 Mar 2021
 16:40:38 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Subject: [PATCH v2 2/2] configs: arm64: Add Linux inmate DTS demo for NXP LS1028ARDB platform
Date: Fri, 19 Mar 2021 18:40:24 +0200
Message-Id: <20210319164024.4060-3-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319164024.4060-1-anda-alexandra.dorneanu@nxp.com>
References: <20210319164024.4060-1-anda-alexandra.dorneanu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM0PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::16) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-119.am.freescale.net (83.217.231.2) by AM0PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:208:ab::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 16:40:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 675dea71-66cc-4f76-98b6-08d8eaf5ba46
X-MS-TrafficTypeDiagnostic: VI1PR04MB5709:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5709A37599A1D489F7CA374ABA689@VI1PR04MB5709.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITmoE8Um2wcFW9I1Xxm4qicY4XEp3bREWAQXh+DxkvSMLTH0xi5jux2ouAR/7hFJU6591sgdTVpwD69TZqKvPOAjh+PVYugGvZK3vRXL7CJ0Z/t90H7NvMs3Nk4freV2TMkBNVD4fMLz2WKf21s5GmidReAJwuSHxvCTmkJlvF5VJSO94tqrGc8KZhW7iGmnmSBRikYTAekv9ez7J4MDhYR4kb9Z0LKCZdLhv19F692nEgiWZGIGFRhtEI88sZlKDOyoMuTq3WiSmBLLDIbdGdWzSenfht6TRP8uKX7ZjKeCJX0kD8K41BvjGLpqpfP46G62NZ25/yL9jdDqKnjhkHK2WiQnWyNSwHY01qeFThihQcb1FLRq4xmwhivbNKtYRCcD4qJkjHJduSdYzm0tN+w2UDpDHqpjetZOns1GHmbL4LYv2FAU5CNumXS3V95HvlQP0MUYVPLyi9UUC3Fe8tE82062agvbS725nl+gkdHNo88J1PTWizKlyX2eS+4DMRtXXGgqGI/wiYF7E/R1PYND3/zg6q/WtiNIX4FhvpMcKgWKFkn2PgLmnA7MwMvZP6EfTXwPCY3j1rTrB5wjxHwuDosRqoFJQX3l32oaKabg9gaiIn4yEd8jCOOPInlQTsEA7PwhTmhSgKIwlcXOQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(83380400001)(8676002)(86362001)(2906002)(66946007)(478600001)(1076003)(6486002)(52116002)(36756003)(316002)(26005)(8936002)(38100700001)(66556008)(5660300002)(186003)(6666004)(16526019)(6512007)(6506007)(66476007)(956004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vnEmOSXuiB9njAyZ5Oj8cSl2swdkdbZWXD15h6aj/JcF0EFldMIVfHc6u8U+?=
 =?us-ascii?Q?8knU/HBbsHGz1VOy3nHmrA/zhiorvgskT0iPkzcg6B+Xl93qZz7IVNeapCxe?=
 =?us-ascii?Q?sfrwW6Y+Je7MA6PMo15dU/lGm7Zz04ioq82RvQjNAt+FvfBhH/smiOrYH+zX?=
 =?us-ascii?Q?4l+dMgU6zlUqRmSp8Vh7r3RX+xFwxsHysMkI+SDLsTAV18LY+qgEpSQnEU/d?=
 =?us-ascii?Q?yERX6WQ8NTLfmmLAcKZBHmBq1W89FzPdU3A8x5V7xjC2XxuR/OoOM30b37t+?=
 =?us-ascii?Q?ZxjbkcNRFS6GaNKLY4z9IHWgp971rV7xzsariOWn2GlkgAIUKSm3VnYIYwkf?=
 =?us-ascii?Q?XX3GQEp4KkpKVHbH0gbtPVUQ9FRUmyN8pfySPvWkyIE1En5dE+39hlj0FHX5?=
 =?us-ascii?Q?3V+q/Vh4PMFbCNk8xjgCJCV1pNJF6dXyd98YG7ZeSSMa+yaNBzHgaCCswLA1?=
 =?us-ascii?Q?2UxTeNbjRBqEGq122UCID6wy6TZ09Oqyx4uTes6fa8pl06m638Dy66kSuGuJ?=
 =?us-ascii?Q?c4IUhiUWvS7cHZ6TSqzWvJnFPFmEy4MdyW7WL9wgE2GeTcvC4xC6bjQx/Vna?=
 =?us-ascii?Q?8hc9ju38oK3tfsm2ogFFDSoliN6PzpZEpi94qvTbaRvMDqUcEpTX2Qx9lvSb?=
 =?us-ascii?Q?16tFEqgRgk+OPQN7OE3Pt8xSHQwLRIuLL7nuBZSOP3W9g6PXiWlm1Dig3lTT?=
 =?us-ascii?Q?RkBOnUXomIuVK+TnMlJQUv0YwlMQh4419rN3nFGmBZVkNRFxD0ntPTA07cNM?=
 =?us-ascii?Q?94v9Jj1Cf2R+Outb6Gfxp72e7GiNxe1vh0+XLoRFLJde/OhaEOk+5lTVCZi1?=
 =?us-ascii?Q?mzQQWjGBrMq682rY/jowYMsKPv4Om54Ws8Dpn65e+6W8aqbKJVCcQ0NPJUi9?=
 =?us-ascii?Q?ozFJqMFn/DgTjJKa0vBVH11ZgvOcumepWBQL9bOFXt5hITNQXydBj73V7QhB?=
 =?us-ascii?Q?CQgF0m+lL2+T39ICqLNABKjP4jf50GNp5PU4EbSvxNOLQ9YxWjPnQ5zTWP69?=
 =?us-ascii?Q?1YmZzEB6D0Vmm1oLyQd4ON+5jSbUdEqK0xzRIaohrtMmxLPOethee4AzdD6O?=
 =?us-ascii?Q?p/e6NZRb+hqZfo6UPG2Tc5RnMccp4i+MPWzDvRxHfwUZZysGMlrD6SAdJ7Uu?=
 =?us-ascii?Q?dFz/ZjNOqX9v+6PfWRw8r1LFWQ2HQSdFMgoy2+2RqX//hTwoKRn2d9WQxCZP?=
 =?us-ascii?Q?oZoFOGO2yrvGtMu9v35OH5HuBnMD1D4oJPbmhM5maABnzITix0f2NNuV5YOX?=
 =?us-ascii?Q?hbcpDixJ0PQBJUdDfYdFUgdP9DeEGIhhdPLiHeSiPGs4kQA9nDO2GJlzSg92?=
 =?us-ascii?Q?aEjTrJtk6NTUtUNQEjQTNyFC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675dea71-66cc-4f76-98b6-08d8eaf5ba46
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 16:40:38.7308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2E9TLrSCmmLnFBL8zkp7L8MXHDbHriC1ywnEj9g/PlRxKH1IfHSxjpaEVrG3dr+FJdUIYhKTd9h58QdpW6qgS2oXMVLi7p9vA6x6qTiX2zM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5709
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="Pem1k/p9";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.21.53 as permitted sender)
 smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=nxp.com
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

Add device tree demo for Linux inmate running on NXP LS1028ARDB platform

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
---
 configs/arm64/dts/inmate-ls1028a-rdb.dts | 139 +++++++++++++++++++++++
 1 file changed, 139 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1028a-rdb.dts

diff --git a/configs/arm64/dts/inmate-ls1028a-rdb.dts b/configs/arm64/dts/inmate-ls1028a-rdb.dts
new file mode 100644
index 00000000..bf196b92
--- /dev/null
+++ b/configs/arm64/dts/inmate-ls1028a-rdb.dts
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree for inmate cell on NXP LS1028ARDB platform
+ *
+ * Copyright 2021 NXP
+ *
+ * Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "fsl,ls1028a-rdb", "fsl,ls1028a";
+	model = "LS1028A RDB Board";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &duart1;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a72";
+			reg = <0x1>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PW20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		l2: l2-cache {
+			compatible = "cache";
+		};
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	idle-states {
+		entry-method = "psci";
+
+		CPU_PW20: cpu-pw20 {
+			compatible = "arm,idle-state";
+			idle-state-name = "PW20";
+			arm,psci-suspend-param = <0x0>;
+			entry-latency-us = <2000>;
+			exit-latency-us = <2000>;
+			min-residency-us = <6000>;
+		};
+	};
+
+	sysclk: sysclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "sysclk";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
+					  IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	gic: interrupt-controller@6000000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x6000000 0 0x10000>,
+		      <0x0 0x6040000 0 0x40000>;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
+					 IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ddr: memory-controller@1080000 {
+			compatible = "fsl,qoriq-memory-controller";
+			reg = <0x0 0x1080000 0x0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+			big-endian;
+		};
+
+		clockgen: clock-controller@1300000 {
+			compatible = "fsl,ls1028a-clockgen";
+			reg = <0x0 0x1300000 0x0 0xa0000>;
+			#clock-cells = <2>;
+			clocks = <&sysclk>;
+		};
+
+		duart1: serial@21c0600 {
+			compatible = "fsl,ns16550", "ns16550a";
+			reg = <0x00 0x21c0600 0x0 0x100>;
+			clocks = <&clockgen 4 1>;
+			status = "okay";
+		};
+	};
+
+	pci@fb500000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 2 &gic GIC_SPI 9 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 3 &gic GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 4 &gic GIC_SPI 11 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xfb500000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210319164024.4060-3-anda-alexandra.dorneanu%40nxp.com.
