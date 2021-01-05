Return-Path: <jailhouse-dev+bncBAABBNW62D7QKGQEZEBHDWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2FE2EA72C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Jan 2021 10:19:54 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id b11sf23824345lfj.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Jan 2021 01:19:53 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1609838391; cv=pass;
        d=google.com; s=arc-20160816;
        b=XFJ1TROW4YPCuLTiGf94lPtIJz/8E2DwdBTjFxDpwTLxTvrSYjRy1QZLsqyE14v+cP
         Oy34R22jaxc2p8LUvQzYZkNXLZ3SFEjEyutpue9b7sp0uC6NPXzqs5PVgzAfjJ4LHfVy
         FlTxs3blKv6ocyfOPTU7a5mjD29/GtWwvBXlxS009U/kUiBaOLFyzPbmzGNV1/mUfwxY
         4OHR3PZs7Wg0HkNl6/fu+cbRuXc2W/LU0N7ixTWPNF2h6aJiVujXnTJtQmiHhye/FkpR
         yg5xMhr3Cf0LAz9nC/3JxNcc7//KVqXk4KdXq8Y52mji4hs9Di3iA+cyCCWf0nefslX+
         weWQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=AtJTflVrktzRlmNSA8TKvWr+sxPSznspWD+NdEoeXRs=;
        b=QGGx2QkIrfQrQiMskfnVUM9rq2o6wfVimCyfHmxdVWXb3YFrb9Zpxs0NoJPJrObAyk
         kzkHfj7nHSm2PrXcqmtqNKjWiXhQSuswRE8YGu/IDHTiD7+OQ0xsl1+jYqJ2M3eZUo7R
         IbBg0IWKAClLbE5rE/XjyKUNa+Vo0WYbzlPKrnJuq9SBZSt7ig5IyK9R8TbSdUqRa5tl
         /CudiKQYq9pddRBa4pMNMcRp+TYtKMSE8kwqCSwIn8oggTn8Esy/jGLQzpvwWPu73RA2
         BD7Jr60cm36DWzlNvtCA55qP9A71u5mWpxzVsXmNJkVLbCE0xqEa+t/Vln/9qHyDdBHO
         4e+g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b="ajm/FG5F";
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of alice.guo@oss.nxp.com designates 40.107.3.88 as permitted sender) smtp.mailfrom=alice.guo@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AtJTflVrktzRlmNSA8TKvWr+sxPSznspWD+NdEoeXRs=;
        b=qzCOZcJ2IxipmoH0ybGgRPPRJ59g3VBt565HYPt7G7snmZ2TK4IcU0m/p1FC6qDKfC
         DH+njWO1yKE+iFZXv6WQgfq+IbF9FMS41wNGT9pqFnRxOCYS8PCUxSFbqZc+TyN+NB5O
         xrGpg77fvOROf2EBxVCMvL7ChRaZvC2Ed4XMm39UAhgv8mPgyzD2IborucGFKSNSoZHZ
         1/P+dF0zvGbmyzsu1k0xl0ZBZBBfwQyBCRYcVb6DMlXeVkz4jOuJTjLyKT7j6ejxanmc
         ulvOac8t4rNNL9QgZ9RucH9HI8wX8uIm4eYRaV5FhJoNies5HE9CS3TmqjYQSXRDP1Jd
         ZI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AtJTflVrktzRlmNSA8TKvWr+sxPSznspWD+NdEoeXRs=;
        b=r+poOBoHMkXFA/JfIo3XJXX3iJ1xCrhTio2EVWzyyj9EzYwNZzb6o1AkvtDvXd1Ayx
         UO7At+KjSy0aSRVbL+VcmQawI+3qOev0LtD/rOYNo47DcFzOSD+m3X4uLos291NziMLT
         32JaIxN/JwiCNJf6Lzgt+AWnP+NxwLqFDFdnjX4JXSNk9C/6gTHnpVqZFe8imA9QkRnX
         m/RkaIrmTQrINnjnZ6uZyx5rArM5uexu+iiTqLz8boHeuyX3DQF/OwAY3r+9qq83L+Ja
         5VLyc+84fLeTstT54FLj20i6pO6XcVTz2zzsyMlO2VFeG9RQn9jpmHB514YSC3Yk/P+L
         BCJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Th1TMtdTc42cc1n/72Bglzb/iQ40LhVko0ahUITo0sHWQlMw9
	6W+PBD9MHDKfVcteB0Z9FYg=
X-Google-Smtp-Source: ABdhPJzjvJF5sC0B5FvSDAkrkcPm9TuRauEL/GHJ1RUHfwcmjQATlTpl58jDuVrLUstYVON7nNEeug==
X-Received: by 2002:a05:651c:29c:: with SMTP id b28mr15136444ljo.330.1609838391186;
        Tue, 05 Jan 2021 01:19:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3614:: with SMTP id d20ls14850305lja.6.gmail; Tue, 05
 Jan 2021 01:19:50 -0800 (PST)
X-Received: by 2002:a2e:924a:: with SMTP id v10mr37221405ljg.154.1609838389975;
        Tue, 05 Jan 2021 01:19:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609838389; cv=pass;
        d=google.com; s=arc-20160816;
        b=tuPzLQpO9tZRtxgQlT//rif4pI03bmdjS0cne38t0MZQcD/R7/XspfCm5Phu82EUbo
         hLro816DeAp1SJtmUQnbMcJlL9pszLgC4BYb8iXca0HJxFaP1magUFuHTO5ySU1Js+IG
         kE792a307NAbncUx5cuKjOQCffDmeIqRZGLPHk3gnvegB2thyGWJztPxVlh8J6sGT9vm
         MBslP+EPyCWj3u1rQQgckr+hLi4uHCecwHIfN7+DDcepkNbnDYRKZ01PR4l/Hltmqvic
         yRc6Sy4i66mMgNyp39XSJnpk4XFQ7Zf9b3yLjlmP4S5okZwrfizi9BgX7EMgFiYWTqpN
         qWhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=z31FiSet+LeeNFaprz+d6AVrGH2IAe9S+iZVPc0BspM=;
        b=gJFAviL1aPK3ziwKsnCVvhbVZBJGLQ+PYFvFAjUa8RpBUb57tqbAS8vQPq+iJ+uUTs
         I5dTmvvn/mLBOSIioXOtH/bOZiK44+JK9E6fBp7RkErjuWfSHpHqwDtF0YAKagzq+VD5
         TsU7TeABRb3ym5p2cH1wpv8G2480GwPfiqNnkwDIXAYJNU1QKuaSXuSN45fwfzfTmEvA
         ELyWBOGZKQJaVZ+rcXcfNFHzhx5/80okd/QPJrRJ7Tfgz6Q5/4Hfwuw130RkQzF2FmT7
         T9JG+8H4RUtPg4W2LLyLvZgPNKxF2sLg8pvFPXGL5tZfJdvNcArtfYylZONOHQkpqpUk
         mU+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b="ajm/FG5F";
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of alice.guo@oss.nxp.com designates 40.107.3.88 as permitted sender) smtp.mailfrom=alice.guo@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30088.outbound.protection.outlook.com. [40.107.3.88])
        by gmr-mx.google.com with ESMTPS id q22si899024ljh.3.2021.01.05.01.19.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 01:19:49 -0800 (PST)
Received-SPF: pass (google.com: domain of alice.guo@oss.nxp.com designates 40.107.3.88 as permitted sender) client-ip=40.107.3.88;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzGUjHEtPSAN6m1jJkjnFwHMWR8/OiS6jMN8wVfscV+jHLzwtwRWz0m0lCJZvg8Xr/BO9qttkCfsMCaVTKupTkc1SiPDR9ErXbZoUMaoiB/YFpRarxyExxMVtw7myjjCdkVqBIAcpzPLsFoa0mrS36pdJiSNI8RoNwi3469+14YAIyITg5EdVglViVsR0Jpy/bMbe5Swr6NXEAm02fSgQxF4ZugqobWJHfu10IG77000Y3l8F6oZCI/xKdPNcrECkkZYFRtEkOmnAfBExRYmsg57p8nz2vSjIdNhh7LNcyBNiUVkvcaPXNtGXW5eUFbHpV4eg29Azj8UaxeQOgbK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z31FiSet+LeeNFaprz+d6AVrGH2IAe9S+iZVPc0BspM=;
 b=DjHEsog9DeaiAiAaiRxPazxJNNDBFAtCL+5OLsH+GhaQpvaTeVTOnNof2IBtCvO755Vp80kByD1E0yOx+FKfi5T08GwywWm6/SBszt8OM4WozEEhRL9XjZuzZGqlNjUAej1tt8gs6gU3Y9+GOYom+u2xNFosjpt4espK8QL7tA8Wv5Mnh/b4/Ltg6X/DZ66FAATGoYqvIH/hs3tOMQ0HDS+EeZzG+q3t/Wit8yXPuum1E9JgWc23ujAR8sfy76wZtcNBK2rNpGR16920rNpsKwZyO79QhxbDNTH6rXeHQD6LBNGcluE/8rtb7xCvDQu4XiDa7niWdboo4WFfJ9elhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com (2603:10a6:20b:b9::10)
 by AM5PR0401MB2610.eurprd04.prod.outlook.com (2603:10a6:203:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 09:19:46 +0000
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::78fe:9b7a:a2ac:9631]) by AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::78fe:9b7a:a2ac:9631%7]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 09:19:46 +0000
From: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: peng.fan@nxp.com,
	Alice Guo <alice.guo@nxp.com>
Subject: [PATCH v1] configs: imx8m: remove the physical address range contains GICD and GICRs
Date: Tue,  5 Jan 2021 17:19:10 +0800
Message-Id: <20210105091910.417-1-alice.guo@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR01CA0168.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::24) To AM6PR04MB6053.eurprd04.prod.outlook.com
 (2603:10a6:20b:b9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxf55104-OptiPlex-7060.ap.freescale.net (119.31.174.71) by SG2PR01CA0168.apcprd01.prod.exchangelabs.com (2603:1096:4:28::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 5 Jan 2021 09:19:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7aba200e-c1ed-4ced-c6e8-08d8b15b0b8c
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2610:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB261061BCE0B014527FAC4F54A3D10@AM5PR0401MB2610.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: McXZYhXatsqxC/sMYvlLFfMpUGga9z3v85VQPrxw33TX7o2KxK96br0IfZaim68GaR+XCHLzMDaOiSBKffn6n4FCS3eVTFCy9ORhWZ7QQHYp0A6Hap8cYjNbBOMzs5NIuuugvtgvxlAL6DO1jypZe0uqLrG1ROjEa31SR5CRlL/rdNFyLVstgbsWaq+qxF+I0tDx+TWbT8M5tNEyCNWLlL5RflYEbS0EpxTOO3RT+8QVvLXD79DBJSmtSNKRdTq9ymjFe7GfMXMB7Kt1a3j6irEpUUPxlFr7UmR6KFmAtex1uE2XPTF/fum3aenVkZ8Q5oq8UEqCKchFUG441xfmwKe6hsDvIThofVS6ArLWgLmjb0nxeeyNX4aLpx3E48aVtkrvsZ81lADTD1X56DdFXadT4BfYkGJQLhrE+tYldjdgN+kbsb/Gt45pEk4E/5vo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(16526019)(83380400001)(26005)(6512007)(66946007)(1076003)(5660300002)(186003)(6666004)(8676002)(52116002)(86362001)(6506007)(498600001)(8936002)(66476007)(956004)(66556008)(2616005)(6486002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?G56eBoMIZ7ijU6mwWyn1eexl0HCrYkvTogwzCDT3xkyIHazdOm4OsV5Zr2r5?=
 =?us-ascii?Q?0pfRYLMkgQ8Ufb2NPRZY7DLPTzrsPqDFFVQ+LKtCwKaBxP8jyu1lcuGNzCio?=
 =?us-ascii?Q?CLoxDloErRFpZxi1xKDEeMW4sCbMvfgN+JHjyJL8eHB5aZFOiAs2pMROOnjX?=
 =?us-ascii?Q?xhuUd62pn8pPcPyfkp7W8rM4JDU++55j6zTrU74CCRlfhbzmGuymydnWV03P?=
 =?us-ascii?Q?r7AyowqX6oiczECLM0SWst3RNccyGGfifpGFG7v0GneukL1UVbDHi+e1Wv3N?=
 =?us-ascii?Q?48f+KBToNsCEF0prLXLiR20hZyr7/QNTkE/FO0qv6OL4uJA9z6z/Bg52dxux?=
 =?us-ascii?Q?XM0gZHBjnEFdWDf3nCQdvKrzcuUqq9qYJ+HaEJX9kZkTc2ciGPGZA0KswEcQ?=
 =?us-ascii?Q?cAoBwQn/YImzntarMErqWcSy2sDS4bqliKPkDhbumdxNBouOUKp5CWvnT0F4?=
 =?us-ascii?Q?ID48CHaKtIKaUumqOUfkLs3EeMq6Ifjm8h/poWuALUE9+IdM5/GkvfqIBTbH?=
 =?us-ascii?Q?q+0dSiBcavHsWhU/imXXt04oUaZ1UqTPJvjty5J5A1jBWvYqzJhzwRi4EMjo?=
 =?us-ascii?Q?jqJ8HUejL3lrLZuLCcozXG0qI+Xm1+PAqUIPefJOl6Ce3IzjWO2KvjDgKktr?=
 =?us-ascii?Q?T8RI+VWAhPBeKgzyA81hR3eKBOCNMu4DGiGblJywU10p0OZryypSqchRxxNM?=
 =?us-ascii?Q?167+vQWxgUd2RIdY/RiJJ7GzMiF8bcUQDoTstk+5NEHaW2F5B5Dl0aUxK40s?=
 =?us-ascii?Q?NzT+ZObHuxIPpJvqiu2oenWwOVb7pULzRz9B3xMCrlCNKfPvgaj1BDn5oHlm?=
 =?us-ascii?Q?qc9Qw3Ac4pEaMV2fiCzRxg25dDEEzkksORWGfh8RWUyWOgdoprD9sa453aWp?=
 =?us-ascii?Q?aVCApXHHBNFzkS+tuLpLT7gTLweopMqSMHk5tOHJWL1nPD05bK53VoCeU6QM?=
 =?us-ascii?Q?zZtvJmi8/pt9xophVcETQELG9YHo4qMopPSdzweS+N42dXillDlzKtwXvAE/?=
 =?us-ascii?Q?efSm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 09:19:46.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aba200e-c1ed-4ced-c6e8-08d8b15b0b8c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3gVYbw6KAuaz7nFik82Syic9K2WgEtHSZaBv0lpvCdQSYGbEAKqQED2X0reL1a2OWFR+AjrDpDb8g14RMTDNxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2610
X-Original-Sender: alice.guo@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b="ajm/FG5F";       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of alice.guo@oss.nxp.com designates
 40.107.3.88 as permitted sender) smtp.mailfrom=alice.guo@oss.nxp.com;
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

From: Alice Guo <alice.guo@nxp.com>

When enabling Jailhouse on the iMX8M platforms, the stage 2 translation
about IPA->PA includes the address range contains GICD and GICRs, which
should not be allowed because GICD or GICRs should not be accessed in
the root cell. In order to solve this problem, remove the physical
address range contains GICD and GICRs.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 configs/arm64/imx8mm.c | 2 +-
 configs/arm64/imx8mn.c | 2 +-
 configs/arm64/imx8mp.c | 2 +-
 configs/arm64/imx8mq.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
index 88365919..ebc2d294 100644
--- a/configs/arm64/imx8mm.c
+++ b/configs/arm64/imx8mm.c
@@ -107,7 +107,7 @@ struct {
 		/* IO */ {
 			.phys_start = 0x00000000,
 			.virt_start = 0x00000000,
-			.size =	      0x40000000,
+			.size =	      0x38800000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
diff --git a/configs/arm64/imx8mn.c b/configs/arm64/imx8mn.c
index ecd00a90..667221da 100644
--- a/configs/arm64/imx8mn.c
+++ b/configs/arm64/imx8mn.c
@@ -102,7 +102,7 @@ struct {
 		/* IO */ {
 			.phys_start = 0x00000000,
 			.virt_start = 0x00000000,
-			.size =	      0x40000000,
+			.size =	      0x38800000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index b870a788..a1e221f9 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -103,7 +103,7 @@ struct {
 		/* IO */ {
 			.phys_start = 0x00000000,
 			.virt_start = 0x00000000,
-			.size =	      0x40000000,
+			.size =	      0x38800000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index 12afedb4..9f9c6071 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -101,7 +101,7 @@ struct {
 		/* MMIO (permissive) */ {
 			.phys_start = 0x00000000,
 			.virt_start = 0x00000000,
-			.size =	      0x40000000,
+			.size =	      0x38800000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210105091910.417-1-alice.guo%40oss.nxp.com.
