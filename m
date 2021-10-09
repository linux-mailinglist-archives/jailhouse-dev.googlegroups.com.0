Return-Path: <jailhouse-dev+bncBAABBD6ZQOFQMGQEVC6TJSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3d.google.com (mail-oo1-xc3d.google.com [IPv6:2607:f8b0:4864:20::c3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D6A427556
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 Oct 2021 03:12:49 +0200 (CEST)
Received: by mail-oo1-xc3d.google.com with SMTP id n2-20020a4a3442000000b002b63faf0fbbsf6373016oof.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 Oct 2021 18:12:49 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1633741968; cv=pass;
        d=google.com; s=arc-20160816;
        b=zIKWNDMDaRHXRRDr0MFC5QZAiB0YHQncnxjYh8trWvJ1AGMXuNYslmHCnzD1hriNNv
         oRpURhSCPFQx4jts/KlnOIIhenKQFnm3JOFRlwGb0lHrf5beqoLJMjXZWJD9e9co/ZGx
         IybePRLv9Zx+rOLby69c2jwQIyMC7ES3i3wQFkR0W4j3tv+/PR8ZiVRM/mE6Lfmp1lvS
         TRjZrYDjwBkK7Q7XetNJtVRlFcziJQfpMEAwN7OZ2dwTMS6ZTG2bWqK4L9z6NqfZJ7Y8
         W+oB/x0GzlwxH/yt3mX80J6Rf9tjYKR8IPxLKki85B8EdH5k44HX+qOyjdaS9b96Ga5n
         Ptwg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=dZqThSmCF05DGxX662wTkrx2OtPHVKXmnXWASI7WKXA=;
        b=XnHpmgHAeNoDrRyGFl2nvSOrlq9Xw0+Vzjrh1CiukqbuyIGLMSGSifRQ/UjXYt4Mot
         WueRdeBh//3rcYYOzWZ8eKn5LM/ABLLW38P0ZBIlypzSOAQnqHVufGnMe8dHDdSHsmhS
         FzdNNO6qrwmRdFACheVQAyJvy+vVXQ8/fZr01fsL0y+PlB347JzmK5sOzcFPCMScIrAu
         Eui2CCK8bJU/awIRQa7bv4tQGie+8PoSzwsyf0B66A+RPNGhH1SQeEZr8tVp7EG9MD1t
         PWTPSvvF6R5E7Yok6pvtLrl9F6KoPGm1lK5ZkhHi48D4VWsYozA1b9TUd7x828H3n4RC
         4nng==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=c2WGYb77;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.6.86 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dZqThSmCF05DGxX662wTkrx2OtPHVKXmnXWASI7WKXA=;
        b=dWOU3PXOkW4hMGmxIpzr8WNyFuUp3B+qdxctMnuKz4JVFfU4DbpSvIOKl9PqltSAoD
         UTw3S6d0W1CSWhYcE49VrhNcZ30d7oI0mUK/PE77ovJ5yzHVuU5D+rZEWuh6hK38GKio
         I9VoibKkB6pQQ0hhLglPk/0RON9wjw9lnR8OB6od3UzT5EKIVhlrfnigESkJ3BkAfyU5
         /QVCVGDSpu8dZ1ZFJrMiwmlFe04Eg0ImFNz6SYqykEx74YPhoTPPF0xpCjA558lqXffA
         JjHeI9GVvL+IoJVsftOe2tUlrkcRe8m1JLN5y1CjedCaNKwV04qBMYHfotBADq4rJ3vn
         ZDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dZqThSmCF05DGxX662wTkrx2OtPHVKXmnXWASI7WKXA=;
        b=iJfx4fMgit/NwGgl8b2+BLEEiZDTlc3ei9seBwBbiZfbBbbXdSoPk+1aX2tMjU+P0n
         tWc1HICDJT1H15OyLHepQMwEX9Yg4EF1Os82muEVr3anQ3rSkhYlaIyDDaY0jtNK0PDn
         oL1D5MkJ6Qu36AnbenfhT0E8mFkZpPPrWIvTeQVxWtp4fr/jNo9S8w7htKRE997sTKCi
         QmdvVveajdRtJgsCJPGSKD2m7mkgLtdXLQ8YgZjVPhr9+PuVQNlGLONWfMOzcBPYQE41
         tov3+sTLPzVkpeh8FDSeYlWStmIV4fh3+TjYRKd4pDX5Vg4DstVTpzuyaquv0cr9H5tu
         eL2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533yvbqDlJstaHYPy1PoN0ebYhE9yNUezZDnz4KfJ4u86KdyrS/Y
	T0/Le3EsXlSa/dXGa2T09vc=
X-Google-Smtp-Source: ABdhPJx5C0gFKPnG/ucUPZQg/w9BFIgpx2SfSdAQDgZVyEMuhnkVfuJJfsOMBzBYDCdL6pVUGFA/3A==
X-Received: by 2002:a05:6808:1454:: with SMTP id x20mr19181933oiv.23.1633741967967;
        Fri, 08 Oct 2021 18:12:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:31bb:: with SMTP id q27ls1512805ots.11.gmail; Fri,
 08 Oct 2021 18:12:47 -0700 (PDT)
X-Received: by 2002:a9d:a4d:: with SMTP id 71mr11615228otg.249.1633741967630;
        Fri, 08 Oct 2021 18:12:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633741967; cv=pass;
        d=google.com; s=arc-20160816;
        b=zQvinRja/Xm1Lvr0O+SbtI9aJkGmTtCOavpRTEL3F5MimIbBeguaiqfoePyb2lFaGA
         9hVxSYBhDhF7qjcd9cd65j8U0YFZzO1PuRFokFMuVCygHngMyULEY30OvRpwssAc1bQr
         k16FJlPtkWNxT1CrK5yvoBwnMdeD+oxnFLMbOSEMgG09pAKQ2Uh/XqvkMhnBPzZud3AQ
         FDxLcPLsrsT3X0BiCTSZqTMLzSuLNzseg3e4/5c0kP7BJiMwREA4vj06A2om2VbAGf6/
         uFr0C050EHexHJEjo1Zj3rNjgYATVHBqoXcSqYAsUel2mZ7pf1vbnRyH4NiOuzPPrs27
         w6Yg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=RPGUKlrpgIspLeXhhHSyy2gvizIhNntfOGupDBd+qa8=;
        b=sO9gVe399D8Wpiu9QNuE3TRdr0fW4lglMjohh2LNVJCQO0w6VnpH6W9wN81d7LL1TZ
         buPullki0G18Oodex45xAlXb4ST2EyIqDuCwBisx7IXnrergI1bTf8/y7Lxsu81ha8H0
         hwlj8WaA6hVi7E0n2peTYRV0RG1j8HuSAG+ruZnG48akNTo1C9JnJ2giSvOFwIqhTdOe
         ZeuM+zqNAvA5uHM0x5pEFV2SvG9kz/tWkIWluevOLWvHQCMYgn2xFkcyEDMEqvB7NEzz
         w3mdQuHQyo2v7shvXo9HLapueLFodFBEAHRICWGO+dBQcOFjoOALRVrFhkNm8C6TnZv4
         hOig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=c2WGYb77;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.6.86 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60086.outbound.protection.outlook.com. [40.107.6.86])
        by gmr-mx.google.com with ESMTPS id bc13si59911oob.2.2021.10.08.18.12.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 18:12:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@oss.nxp.com designates 40.107.6.86 as permitted sender) client-ip=40.107.6.86;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUXn46+rlWvpU4/s9Z8rw4a9kTyDe86oGwTKrP9hlCEIUVDesfFrrPTXF5q0QZomJno8jPG+96tXSIwUTc8xnoRDFtdtdUOy0rA3T0sx78eXtE2V2Q6KjxselumE08wKli6VMjI3IokaxsZx55T3SKwLTATPdCe9iBMBabsSvC0Kxt+idsg/GrGmw7HuocoaHPiRwjS33RAHjpKEpaf3LCCS4WUv/97LFhLTlJwL6DjFuljHE85y04cga6ec0oYUmS0MhTdt0etVvsOolaFDlPvryp1zNt8pCJgqHI8t56SGUJ+0nf8kf9YA3AgSUNlF/qtn7umtThnW04NyE+OamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPGUKlrpgIspLeXhhHSyy2gvizIhNntfOGupDBd+qa8=;
 b=UzJEm02d+0vFT8VIK7bojukp0FVddruFLsQeARACnaxbg8WeFsJjWIg341uUNR9CCme6bo6M05osdCOLmAAOMD/Zmy4TAywHnLK+NuFubBHrfCXtdql+bXFT1oO/1yL2pMEoGlIHXdtPMcya3uQUpoh2ij7HktMX7w9lY70nLc++LlsjBMdp4HaJtVEiAv6quSR+dbYXCkWiTT4z4KNUBK2QlkVC5SljAifRk71lvN3gfE1FMoanaZD2sETulDUGALJ5DltcycpFqCNWtKsFs94wO9i2bHPr0eqmXhy2WkiUh8azHmdeJ02qNIovrjI1B2xpLYLhtp2fYtuomcB+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from DU2PR04MB9020.eurprd04.prod.outlook.com (2603:10a6:10:2e3::9)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Sat, 9 Oct
 2021 01:12:44 +0000
Received: from DU2PR04MB9020.eurprd04.prod.outlook.com
 ([fe80::b928:9230:aa10:639a]) by DU2PR04MB9020.eurprd04.prod.outlook.com
 ([fe80::b928:9230:aa10:639a%9]) with mapi id 15.20.4587.019; Sat, 9 Oct 2021
 01:12:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/3] configs: arm64: imx8*: remove UART type from .debug_console.flag
Date: Sat,  9 Oct 2021 09:11:36 +0800
Message-Id: <20211009011138.469592-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: SG2PR01CA0099.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::25) To DU2PR04MB9020.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0099.apcprd01.prod.exchangelabs.com (2603:1096:3:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend Transport; Sat, 9 Oct 2021 01:12:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fbc6009-1110-4d39-b5c0-08d98ac1e5bd
X-MS-TrafficTypeDiagnostic: DU2PR04MB8967:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8967BFB1CEFE0BAF66C231A6C9B39@DU2PR04MB8967.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vsigPLPUkn8cpyYo4VdM7/8fEdy1UzWWbJKkyuD2qon9A7dTrPonpe0Z1lv5tUhUChZ7kzaG4Q5psxzDa7pEHwchiJ2IA/HLyY3YbxBhUNbUGqqIBcFEHwukXF5BQTdV7ijuGg1XUhjc1+PiQgH1Jff5jzR8x/UXHkd0W/aIO8vVPUZ0dx4BXLZygaOhtVZH5IFaIpVglZx4mtleD72JuRNjWZ1+RG+UwTh8f7wTCxYNkb/f+QU9f7SOBzilANH/XDndekHP2To01aO+KMXn+IcqVXVOQ5RxnWsLXH9NSK8OwpGYZLNyss+yeMD8dySfU1QvIAxhhSmlG0JMnP6xWaC+JksQ8zhW+olGdaLYBnK0UB4pSALA090M/QciO3HJ67bri9pdPnbNgL83hHoPqBYgtN6/chRrJAKXb04sTfIDwsiIQNyCYNT4piS0Djz6sj0dw2ZN8yYzEr4A/gyeGIyBYfqw0jkBAgY/OY5H9Fz4oqr9GezRG1OpdqrjcAXcQmdhME/v+Q7SfliHuIekKYeNeCUJcXpo2z5hudfjCwmRBUyt18fxkZwO30HPevihwTNLRjtu59+DdXN5OQFnMQHsIRwMv9R+2uxkO4+BKEF3B4sC11+sLAuyX/65m2MZoPIs5mkFUvNu3CIvZE3WgVZwR8rkJ07/HGB2XLpkkoqLY0OCvINaH5FvujanjGOwKSulLlKm/xmoh5AWEufxd2MsgnFXAk7VED0WQ0vJvj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB9020.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6512007)(1076003)(66946007)(8936002)(8676002)(4326008)(6916009)(2616005)(956004)(66476007)(38350700002)(66556008)(38100700002)(6666004)(5660300002)(186003)(83380400001)(26005)(6506007)(508600001)(86362001)(6486002)(52116002)(2906002)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ODdCjc76Nb20UR50KuHVDEmgoXXvi8mkrPdp10Wduea8A04peqst8Wt10l7N?=
 =?us-ascii?Q?4bpEqqbZXbtG5zaSk9HY9dCQ1ouNSoxUm79ziyFmQVRSuWmIJIW3LyP5kb9D?=
 =?us-ascii?Q?S+XNMHEYf3yPTFwi57f3rfnREFLYFsCCm623iZuLmEY9tucJDelkLA+jh769?=
 =?us-ascii?Q?ZTczeRwHdQZ6n4SvGMVKAPVbo+78Zzp+wHCmjCEeFfyXgHKFfECNQbV3fT9V?=
 =?us-ascii?Q?ZdvIKOGAnEeR0bQd3ynVXcT5Caigoayk6Ec92wEuxwzs7aaMW6KUoZjH2sKo?=
 =?us-ascii?Q?G15p7pUlL8S2C9EA/qg2XTB0ZZBP0s9UkQMwvDjOFpXibMAqFdPkEePg/Gs+?=
 =?us-ascii?Q?Ht6utUJsIPrveGNLzsmQ58UHKTTXxMgxOB4q6dD5ohfC0u3036NVE7iNEMPw?=
 =?us-ascii?Q?1rHkTY38SDS9KPs/6t9JY12zDI7K6VDxpfIdsI1zqWyj/gg7AktB58mgRbW7?=
 =?us-ascii?Q?l6XmcXKTnxWqpphNmNv6wpGM5HNcUkKzxsoVrt90ASzKTwhzGLTZxS3raVS4?=
 =?us-ascii?Q?EEqArsv7/OwxcCUIZsWvp39hvoBdDz3qQZB8uYX1JilyLXu5h7/QZImRwVfm?=
 =?us-ascii?Q?vD6cvp7/JPbtx6z/E9/tbx0wWiwtOKs2gFWDggOj6lc1oQ3sMXjck8q9Vh6T?=
 =?us-ascii?Q?99Se49RTltt4vf5sod7Lk9F8GoZaFX+I+PXpmpG+/Au9EfLMmww8yNllYmll?=
 =?us-ascii?Q?bHmGM43PtfVI3lz88jqD3ylwCy6IKXoRu/Nvj46aqIwoYxT54tteyzNTpcle?=
 =?us-ascii?Q?2V89QI5pdd0A0oRVaLUx/EpTSVk5mIGTzREt8Fb2GbfAqGRheR6ioKsLNpHk?=
 =?us-ascii?Q?7caiO8gFZOgm+AYuIsXRc0q/cLbO42Y2+wLjD4Kt5v84dt790zuKpgCkorV+?=
 =?us-ascii?Q?Pe/7jCuINhMxaOD+rhGeokAwTUb8V79LkQyfAPJr+o2kAgslLMVajDkrk/J2?=
 =?us-ascii?Q?F94d1mUvBKyilWRlbLOJFp95KObOMLkPP9ZXiUaz5fGCudos6SGW2jkiDK+s?=
 =?us-ascii?Q?RmHivxldR7RxA4df46XWT2fOV2lLPqNBvz0VyJI1GQiSKKMTlGtH4zfKHjAB?=
 =?us-ascii?Q?HF2w9hP71hMQ5djCebBArUaCqkjnxRbdaqEsvM3Q6vIuJ1eqcNp12tYpGORv?=
 =?us-ascii?Q?JGgBLJRA3ubY7TvtCv45F6gv7NdHjfMp2GvvTeo/wu/eNzbBeFYj7SQSNv/j?=
 =?us-ascii?Q?pcXRnUskqyfer+uC9fddZIl4SsAQ17Qh3Wna3G541RHoaGHGGibd658xnzg8?=
 =?us-ascii?Q?ePwrUtwkfQXi/m4dcddldyBsog+igQ2dUsr24aYhBjNzefslXVGYJ5qHHEk2?=
 =?us-ascii?Q?P7NlAhHlaYZ8MAYDMqkoer2wEaQgS1M0A07QUKa137vu0w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbc6009-1110-4d39-b5c0-08d98ac1e5bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9020.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2021 01:12:44.4859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JR6i5wNDWuxkYZSmtzFR51azsfV+5aYHFN5HrFEeYopqYuT5sUTjV9/MBJDL8EJlZd8VBrG7fKUK/7DCwm8Lew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967
X-Original-Sender: peng.fan@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=c2WGYb77;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of peng.fan@oss.nxp.com designates
 40.107.6.86 as permitted sender) smtp.mailfrom=peng.fan@oss.nxp.com;
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

From: Peng Fan <peng.fan@nxp.com>

The UART type should not be used in .debug_console.flag, it is in
.debug_console.type

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 configs/arm64/imx8dxl.c | 3 +--
 configs/arm64/imx8mm.c  | 3 +--
 configs/arm64/imx8mn.c  | 3 +--
 configs/arm64/imx8mp.c  | 3 +--
 configs/arm64/imx8mq.c  | 3 +--
 configs/arm64/imx8qm.c  | 3 +--
 6 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/configs/arm64/imx8dxl.c b/configs/arm64/imx8dxl.c
index f94692bc..f70826b1 100644
--- a/configs/arm64/imx8dxl.c
+++ b/configs/arm64/imx8dxl.c
@@ -31,8 +31,7 @@ struct {
 		.debug_console = {
 			.address = 0x5a060000,
 			.size = 0x1000,
-			.flags = JAILHOUSE_CON_TYPE_IMX_LPUART |
-				 JAILHOUSE_CON_ACCESS_MMIO |
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
 				 JAILHOUSE_CON_REGDIST_4,
 			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
 		},
diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
index acb9fd5e..2556ac31 100644
--- a/configs/arm64/imx8mm.c
+++ b/configs/arm64/imx8mm.c
@@ -33,8 +33,7 @@ struct {
 		.debug_console = {
 			.address = 0x30890000,
 			.size = 0x1000,
-			.flags = JAILHOUSE_CON_TYPE_IMX |
-				 JAILHOUSE_CON_ACCESS_MMIO |
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
 				 JAILHOUSE_CON_REGDIST_4,
 			.type = JAILHOUSE_CON_TYPE_IMX,
 		},
diff --git a/configs/arm64/imx8mn.c b/configs/arm64/imx8mn.c
index 667221da..91d088ae 100644
--- a/configs/arm64/imx8mn.c
+++ b/configs/arm64/imx8mn.c
@@ -33,8 +33,7 @@ struct {
 		.debug_console = {
 			.address = 0x30890000,
 			.size = 0x1000,
-			.flags = JAILHOUSE_CON_TYPE_IMX |
-				 JAILHOUSE_CON_ACCESS_MMIO |
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
 				 JAILHOUSE_CON_REGDIST_4,
 			.type = JAILHOUSE_CON_TYPE_IMX,
 		},
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index 9654a764..d64017c3 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -33,8 +33,7 @@ struct {
 		.debug_console = {
 			.address = 0x30890000,
 			.size = 0x1000,
-			.flags = JAILHOUSE_CON_TYPE_IMX |
-				 JAILHOUSE_CON_ACCESS_MMIO |
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
 				 JAILHOUSE_CON_REGDIST_4,
 			.type = JAILHOUSE_CON_TYPE_IMX,
 		},
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index 145a36e4..e853e5f2 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -34,8 +34,7 @@ struct {
 			.address = 0x30860000,
 			.size = 0x1000,
 			.type = JAILHOUSE_CON_TYPE_IMX,
-			.flags = JAILHOUSE_CON_TYPE_IMX |
-				 JAILHOUSE_CON_ACCESS_MMIO |
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
 				 JAILHOUSE_CON_REGDIST_4,
 		},
 		.platform_info = {
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
index 00f5c402..052a58d4 100644
--- a/configs/arm64/imx8qm.c
+++ b/configs/arm64/imx8qm.c
@@ -33,8 +33,7 @@ struct {
 		.debug_console = {
 			.address = 0x5a060000,
 			.size = 0x1000,
-			.flags = JAILHOUSE_CON_TYPE_IMX_LPUART |
-				 JAILHOUSE_CON_ACCESS_MMIO |
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
 				 JAILHOUSE_CON_REGDIST_4,
 			.type = JAILHOUSE_CON_TYPE_IMX_LPUART,
 		},
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211009011138.469592-1-peng.fan%40oss.nxp.com.
