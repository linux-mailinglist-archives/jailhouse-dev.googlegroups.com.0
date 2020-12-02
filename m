Return-Path: <jailhouse-dev+bncBCY4NF5G6YJBBX7KTP7AKGQEUI7P2HA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 572872CB292
	for <lists+jailhouse-dev@lfdr.de>; Wed,  2 Dec 2020 03:01:04 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id a17sf87324ljq.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Dec 2020 18:01:04 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606874463; cv=pass;
        d=google.com; s=arc-20160816;
        b=En4w2bF6Lcu6bZI4x/t4fdRLjNJ6/oD4hVwVL3HB6yD4XFP1cFzQ2NahfvMsgY6aMF
         bz3p7ftHN3bXubIOalyzt1Cnzf58k6EIrG+MmX8zulpcBb2e3DjXx90kuH6pWPO2LFik
         oYxM7vrUHouHGgQp1ozKdsaA8QMuMN+I8Sf7q+gThY2yNwMLVToQLa2vVXw0mcbTqSve
         f5rVN49DOLywAmXKpHgbIq24Vhxogl9n71EB/FIE6/mNowC3n4HCcjcsCDFTESqdS8EZ
         YP8ZL8XZz/cygj87Xensw6XFPGefygTFlAfSegRSU2m7WePcyCrfywyWalhOQfCjDpg9
         veCw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=OtCXGb9eFtPiGZKUhy1FbefrdjFwqt+881mQVkRuifE=;
        b=q5xbyLB6qvhUnc4+DNie76inyyClmpdTc998Y4X9F3VbZnb2bZG3iKRc/Nk5po4A/I
         OlLygW1JQlgGfKY84ct8C3LEOJP9vpyGrgN16pUDItFYUuYpD6qdFUtzJb9lyuf4+ZIn
         GfaZMEpdZ8DYkw6YMMrutQk7/tIBpc3sIwHp7dCBZMQz7jWu9802iFrTSnXMGWtNAI63
         QuGJa7r5YQGubDYjAYsTrpXmUsE+N9BgweAl+eJRvvWdQRjxm/EDmM198N3X6Ykud0UT
         zCTQ5nwMRIx7n/YACzwokHAxbbXTgDSjtteX7O37R6FC3WuSHPBVtjYZg/SfvQ7h6wW0
         vc8A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ihtuNzd8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.7.82 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OtCXGb9eFtPiGZKUhy1FbefrdjFwqt+881mQVkRuifE=;
        b=DANFHUGS4wc9QprEZljL6mne//3HovSifdhPBosYq7CsqU9nFAVLiyfYBmkc65S7i4
         Zn6UKAp5881VnKEtdafCYw6eVm2uPvGawr7DtXxMnDinWWxS5+sJ1/js4cRaIMjooNGe
         fn1vnSA0gL6I/7GVySthFuLaBWYejcSKIuy1kzM0Og3Iyg4qhF/nRRbSZUoytq/BDrz1
         +nlZGZyxUNHjqbeoO+QsAFLC4N5/tF7GYJuItGAP2PjuDVb/yVAAzvpvMW5ZUY0YUNvV
         erbkr1sRK9DdYtzbDvg5VBK1aNu+rHbXNHslBtzGSVUK9M6a3Omx/evdiht5tVOhU40b
         thTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OtCXGb9eFtPiGZKUhy1FbefrdjFwqt+881mQVkRuifE=;
        b=GFxBHzLg+lcq2Md7ApboN5pe0DkGZzi35Y0a4Lt1reG0fwX8MW1MBn/bPCZMCMllmT
         RAo5KEcGBV5y5eziKYXaS6G03DfoA4ELEpWSxSE8P2aX7PJURyqMZEE5Xj8bNlevIOai
         JcKZKGz6AWREgA+eubDCMX5KjHH5aW2cEjfNrON/WlXFymaOuLbEmqNd7CbvD9c8r7+5
         uHRPWiFvt2qoPNOSLYzPJoQzjgH3OSxSoPi/iL/BbrKdkXDiNgPoIbRQTyuRQRnbUSfU
         mRh14+HD9r6xFpJ4aFbatPP2SfviiSnrI5jIrrB53T8luuCyZpHvMP1m9gOicqQ+GyKJ
         Iezw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531BKz3wF/agmUEH1M3BnSoIIzK6ME2oLYveq0g5n+vSBM6o0PN3
	qtrLjm1P0TQ5PlCa48Gly/8=
X-Google-Smtp-Source: ABdhPJzkMxbMXDIoyFF1F0ECs4k//cVoNGn/knOPCzBF9vvPJ5etxOjdZCxI0cT29v5JxjfHAlmMvQ==
X-Received: by 2002:a19:7f02:: with SMTP id a2mr201374lfd.48.1606874463706;
        Tue, 01 Dec 2020 18:01:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:99da:: with SMTP id l26ls66044ljj.10.gmail; Tue, 01 Dec
 2020 18:01:02 -0800 (PST)
X-Received: by 2002:a2e:9510:: with SMTP id f16mr115776ljh.155.1606874462511;
        Tue, 01 Dec 2020 18:01:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606874462; cv=pass;
        d=google.com; s=arc-20160816;
        b=CgCYHGct91BTuowaAZjZZyRbgW5muE6h8qW9DK1BH7L8tBw4Abk6pUk8+4FLZ/sObP
         N1qFvRz0M/Hdx8l3x2yqeJXYNuVWgkpeBPEiShT8VgE/ehcxrEHuyie+44Dmab8RtbQa
         QIkUiltYy94J5rnXhNa3JT4ws8egyYFPKBP2C6V6JIxfTc2QoylfipkIOjHduaQ5J3Ov
         hgd5nO/LYF/rn8eCjql5EcFcy8in28JYFxguXJDy1WD/E2t2BhG2h5JMw5OaJz7uHTFW
         Rnc8CBK6Adr4D81NtkvdgSX2EBuLoKFPkYWyyzbldN/VnZg1knz6dgxhrh/bwpBIxIoi
         JgBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=iR9ncTKq7Nt6469iQTjX7BSXi/Wi21rDPgWHZUdRkZ0=;
        b=K/2oolK3RemT/2v19fk0lrWaUt5HZFslm9u/ecttyu9c/fvrbA1qqnf3EH9osJIgOl
         ye+O/IqFiAGq0kmJOgmm4X9XSFZJTmS02YBuPUrrnuRAQsck9dmuaJIXMlv9n73znapq
         wgDQev7npJS/2CB2H/WswDCpYsEGL0aBMNwSU4ZvSnPLyeKq2FjWcGls1r4XTXu4PJkY
         8YWdX0IGxB2E74BtbqRmzCrYg3IiG/5bXDZgtDb7J+PaJVDQ/e30efzRv/jeM1tUqnG/
         YHqWFX8ecjF/u4LXQA6ND0mv2NIVOSrSk+XdhE+BIl2jBVqzfN3YZFIJ2qeSymxt/q0w
         HQpQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=ihtuNzd8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.7.82 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70082.outbound.protection.outlook.com. [40.107.7.82])
        by gmr-mx.google.com with ESMTPS id f9si8925lfl.3.2020.12.01.18.01.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Dec 2020 18:01:02 -0800 (PST)
Received-SPF: pass (google.com: domain of jiafei.pan@nxp.com designates 40.107.7.82 as permitted sender) client-ip=40.107.7.82;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM5mNxnSavAJFRLWW0LOUgM4NeCQnF4rUB69xGNINX/0G0VIKlPKovyrK4SDS5JvAXRvbSq4yb7WRbaJPI30xzVyKaZ4X7abqP6ppaCPXsSSxJAWpMmoF9Uu7W/sULzy8ge2crXASkfC02L4Z7vs3nHkTW5czi5xujIf74p0UnpLiE9vEta+VGKKRNegv1f1T+6FwvxOhPTBJgkvu9Ts4TL+8VAnItypsxmn7WkAHmq1GxHn6zTLMhPCyrdcIezwdhBCnQ4GFWdhJMetpUG8l+xGM5poY8sYD7y420RdHoqgrwOOvQBmf+ZFRfEx7EtxYAzUYhIMFQkHa6bSio+rpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iR9ncTKq7Nt6469iQTjX7BSXi/Wi21rDPgWHZUdRkZ0=;
 b=fHZwue2yc+swdEzQFp0HOnRPbthbDaETqCDAUhAITQKuUwo+Gyqv7Ne8VsXw4zC588cP1mhcyqUFT9huxz8ChCEwG2fT3bCtbBafmAHpebZGNN7jXHoDh5VXCYu1Kg1PmKE7GP+9A0jFpqJ1X+nDMQt62sfWwni3qbHYmTqa0gLhGm2WaJl10L2k915FI+RGL8Uf7gObo/YCVAAbaopZpvK5/OL7/BC1/cGvVL+bzgXS/GwkM4+S1qWTxMoWSLbOJD6gOSLzJ7GOvv9uyBb7cimAxDPPJU4XljLB1KZAZ+BN0tHN0lCxy8FFJo3iPU6ix4IifN+jpeDqs/JAvxyeUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com (2603:10a6:208:c2::17)
 by AM0PR0402MB3443.eurprd04.prod.outlook.com (2603:10a6:208:1b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 02:01:00 +0000
Received: from AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795]) by AM0PR04MB4772.eurprd04.prod.outlook.com
 ([fe80::749c:710a:a453:8795%2]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 02:01:00 +0000
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: jiafei.pan@nxp.com,
	jan.kiszka@siemens.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v2 1/2] configs: ls1046a-rdb: add cell configure files
Date: Wed,  2 Dec 2020 10:09:17 +0800
Message-Id: <20201202020918.27120-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR06CA0182.apcprd06.prod.outlook.com (2603:1096:4:1::14)
 To AM0PR04MB4772.eurprd04.prod.outlook.com (2603:10a6:208:c2::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.73) by SG2PR06CA0182.apcprd06.prod.outlook.com (2603:1096:4:1::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 02:00:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 479bcdad-8404-4979-6a32-08d896661d75
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3443:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3443E977AEB7F1400C074EB68AF30@AM0PR0402MB3443.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rj82IstOaYg2JoUjGd55GpeuRF8PYgF4UGQrZRTUNEDEQuvklgkbcApFzhkkGml4UkXJIKPeem4p6sXJNa+5iNcJmr+ADTHhs/l1K+hh5o5BnTs7X23SIgFXX5LuwggmMFfcMC34j1RT+sqOzlZaBYqgPG4Reyc6gCaJIHCj78cCU/0L2KeFzo1/UmR8iM9c8opzSe+zbfexYyIi9ugbm+EobON7PoOYYsx7bt6/j9C/NwBANunWZIr8O1425J7qaad0mjwmdldf9Almeipf/Xh7FOHuUEb5Vr6KWQUBrdYQcrZl+kgX/xU+gU5ePBkPGTkuScNIYTZRLLSCd4ufk6MS8F9nOO+gILKHPL/spiC5Q2yZYNgPiJN9vd09nXZU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4772.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(69590400008)(26005)(16526019)(66556008)(66946007)(86362001)(66476007)(52116002)(6506007)(83380400001)(8676002)(186003)(4326008)(5660300002)(30864003)(316002)(36756003)(6666004)(1076003)(6512007)(956004)(6486002)(2616005)(2906002)(8936002)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xmE0DclPvx4K1aIGcbboxHzDF1bGliijUdVGPNwjaiIpbAXvTaztizluwj1R?=
 =?us-ascii?Q?Kg9mXOZPJQ0iwuJWXj4r0paNLfVvyO37Ji9wIsjunqP+lugQqR7xTwJKynY7?=
 =?us-ascii?Q?YVcZGrQxEKY8+Bg8bRUxCkojPZyK27xBHpKdU4fdZtji81aIBB0e6zaFNLxu?=
 =?us-ascii?Q?FJWUws7QyQJAhzw3tJbBeClTBN76U27SC0aWZ/5twzCLLeKnX0zCfr4wVf92?=
 =?us-ascii?Q?sznZDmyHivse41dMXhAfzc80JeGU7ZIcF771Y4ukDkgYq9AACmqsofztHztC?=
 =?us-ascii?Q?LnGsXdtQDzAgfPTc+OJKZqs2A5sl4lC38osl8J+bv0KSUKN8sz402GR/5xQT?=
 =?us-ascii?Q?LYjQrgxQIjT+R/bc3aAYXd5ugJRULqkEVvzq/ZMvARj7p9ph6u0fxy+ME3bM?=
 =?us-ascii?Q?Bd0Kvhh2bxA4sjZAYb14JprL47U0wvwIJBEzf1IHOQxELULCT+iAWlPMUD/1?=
 =?us-ascii?Q?nxRy/XTB2cVZ7WDOe3AuSDggYR9nUPs8H5SY6L/omTM+UXRqFTfFl07nmTLc?=
 =?us-ascii?Q?Z24nNmCUltKFtzoPQafi+UbNLibIlN6xl8pV8UAEWOqT9ltAhWN6yWYMfXhk?=
 =?us-ascii?Q?YMQPB6MT3vNyPv2USPFb4wLyODkL33ReNha99/+XCtMD9Y2pHi0TRj9FXh9p?=
 =?us-ascii?Q?KXmfIWF8clkq0T4NO1cN7mhqygHK1D0iKpuHS5rEnXThmngqrLrWUCgFAchH?=
 =?us-ascii?Q?LbWHxXq1im6YYGiRgQNKXye/5jGQuIiStVmvZugAgjU45/TtneGcgg4nsxyF?=
 =?us-ascii?Q?wqCbPbrxfRMFDCeKc1U3KkyfI+PP5sZj3uD39aHVwP/ZJYuFoYfhltOYnh0l?=
 =?us-ascii?Q?jfl9V8lQb11xqjvlC04CNRJDdNLeUQRJRRurexlZ2mkn3C8bhmqoCteTb1+C?=
 =?us-ascii?Q?XqNq0ACYBHmKaL1supwxTHcHqOtj0wQcwM/3GMqTFpHjaahhVE6kcU8zcrZJ?=
 =?us-ascii?Q?kynYSZ+ankrw9ExeLCF3LaC1CJbccSnPjL5+RkAeIsq9lNsMeAnl1X70tPTy?=
 =?us-ascii?Q?cAUf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479bcdad-8404-4979-6a32-08d896661d75
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4772.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 02:01:00.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7pcthgOLCtZh+JwM5QDigrkuH96ev9pddxKVIpKjGSXNb2isXLVhg0m9t7R+WksZG4aJ8kqMABh5BWRv1SLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3443
X-Original-Sender: jiafei.pan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=ihtuNzd8;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of jiafei.pan@nxp.com
 designates 40.107.7.82 as permitted sender) smtp.mailfrom=jiafei.pan@nxp.com;
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

Add root cell, inmate cell, ivshmem demo cell and Linux demo cell
configure files for NXP ls1046a RDB platform.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
Change in v2:
	- Removed some annotated code

 configs/arm64/ls1046a-rdb-inmate-demo.c  |  67 +++
 configs/arm64/ls1046a-rdb-ivshmem-demo.c | 139 ++++++
 configs/arm64/ls1046a-rdb-linux-demo.c   | 165 ++++++++
 configs/arm64/ls1046a-rdb.c              | 517 +++++++++++++++++++++++
 4 files changed, 888 insertions(+)
 create mode 100644 configs/arm64/ls1046a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1046a-rdb-ivshmem-demo.c
 create mode 100644 configs/arm64/ls1046a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1046a-rdb.c

diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c b/configs/arm64/ls1046a-rdb-inmate-demo.c
new file mode 100644
index 00000000..0f4f2395
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
@@ -0,0 +1,67 @@
+/*
+ * ls1046a RDB - inmate demo
+ *
+ * Copyright NXP 2020
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[3];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = 0,
+		.num_pci_devices = 0,
+
+		.console = {
+			.address = 0x21c0600,	/* Uart1 in DUART1 */
+			.divider = 0xbd, /* baudrate: 115200 */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_REGDIST_1,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 2GB DRAM1 Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	}
+};
diff --git a/configs/arm64/ls1046a-rdb-ivshmem-demo.c b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
new file mode 100644
index 00000000..9c303899
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb-ivshmem-demo.c
@@ -0,0 +1,139 @@
+/*
+ * ls1046a RDB - ivshmem demo
+ *
+ * Copyright NXP 2020
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "ivshmem-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 60 - 32,	/* vPCI INTx */
+
+		.console = {
+			.address = 0x21c0600,	/* Uart1 in DUART1 */
+			.divider = 0xbd, /* baudrate: 115200 */
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_REGDIST_1,
+		},
+	},
+
+	.cpus = {
+		0x8,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM: Top at 4GB Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (60 - 32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 1,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+	},
+
+};
diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c b/configs/arm64/ls1046a-rdb-linux-demo.c
new file mode 100644
index 00000000..c8f699bb
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb-linux-demo.c
@@ -0,0 +1,165 @@
+/*
+ * ls1046a RDB target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_cell_desc cell;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "linux-inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 60 - 32,  /* vPCI INTx: 60,61,62,63 */
+	},
+
+	.cpus = {
+		0xc,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* clockgen */ {
+                        .phys_start = 0x01ee1000,
+                        .virt_start = 0x01ee1000,
+                        .size = 0x1000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+                },
+		/* dcfg */ {
+			.phys_start = 0x01ee0000,
+			.virt_start = 0x01ee0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* RAM */ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0,
+			.size = 0x00010000, /* 64K */
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM: Top at DRAM1 2GB Space */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3b500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+				JAILHOUSE_MEM_LOADABLE,
+		},
+		/* communication region */ {
+			.virt_start = 0x80000000,
+			.size = 0x00001000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_COMM_REGION,
+		},
+	},
+
+	.irqchips = {
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (60 -32)  | 1 << (61 - 32) |
+					1 << (62 - 32) | 1 << (63 -32), /* vPCI */
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC-400 */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0,
+				0,
+				0,
+				0,
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 2,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-rdb.c
new file mode 100644
index 00000000..3eb58005
--- /dev/null
+++ b/configs/arm64/ls1046a-rdb.c
@@ -0,0 +1,517 @@
+/*
+ * ls1046a RDB target - linux-demo
+ *
+ * Copyright 2020 NXP
+ *
+ * Authors:
+ *  Jiafei Pan <jiafei.pan@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/types.h>
+#include <jailhouse/cell-config.h>
+
+struct {
+	struct jailhouse_system header;
+	__u64 cpus[1];
+	struct jailhouse_memory mem_regions[64];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[2];
+} __attribute__((packed)) config = {
+	.header = {
+		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
+		.hypervisor_memory = {
+			.phys_start = 0xfba00000,
+			.size =       0x00400000,
+		},
+		.debug_console = {
+			.address = 0x21c0500, /* Uart0 in DUART1 */
+			.size = 0x100,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				 JAILHOUSE_CON_REGDIST_1,
+		},
+		.platform_info = {
+			.pci_mmconfig_base = 0xfb500000,
+			.pci_mmconfig_end_bus = 0,
+			.pci_is_virtual = 1,
+			.pci_domain = -1,
+
+			.arm = {
+				.gic_version = 2,
+				.gicd_base = 0x1410000,
+				.gicc_base = 0x142f000,
+				.gich_base = 0x1440000,
+				.gicv_base = 0x146f000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "ls1046a",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 67 - 32, /* Not include 32 base */
+		},
+	},
+
+	.cpus = {
+		0xf,
+	},
+
+	.mem_regions = {
+		/* IVHSMEM shared memory region for 00:00.0 */ {
+			.phys_start = 0xfb700000,
+			.virt_start = 0xfb700000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfb701000,
+			.virt_start = 0xfb701000,
+			.size = 0x9000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xfb70a000,
+			.virt_start = 0xfb70a000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0xfb70c000,
+			.virt_start = 0xfb70c000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfb70e000,
+			.virt_start = 0xfb70e000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
+		/* RAM - 1GB at DRAM1 region - root cell */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DRAM2 6GB */ {
+			.phys_start = 0x880000000,
+			.virt_start = 0x880000000,
+			.size = 0x180000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: Inmate */ {
+			.phys_start = 0xc0000000,
+			.virt_start = 0xc0000000,
+			.size = 0x3b500000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM: loader */ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0xbf900000,
+			.size = 0x00100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DDR memory controller */ {
+			.phys_start = 0x01080000,
+			.virt_start = 0x01080000,
+			.size =	          0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* IFC */ {
+			.phys_start = 0x01530000,
+			.virt_start = 0x01530000,
+			.size =	         0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* QSPI */ {
+			.phys_start = 0x01550000,
+			.virt_start = 0x01550000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* esdhc */ {
+			.phys_start = 0x01560000,
+			.virt_start = 0x01560000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* scfg */ {
+			.phys_start = 0x01570000,
+			.virt_start = 0x01570000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* crypto */ {
+			.phys_start = 0x01700000,
+			.virt_start = 0x01700000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* qman */ {
+			.phys_start = 0x01880000,
+			.virt_start = 0x01880000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+                /* bman */ {
+                        .phys_start = 0x01890000,
+                        .virt_start = 0x01890000,
+                        .size = 0x10000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* fman */ {
+			.phys_start = 0x01a00000,
+			.virt_start = 0x01a00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* qportals CE */ {
+			.phys_start = 0x500000000,
+			.virt_start = 0x500000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* qportals CI */ {
+			.phys_start = 0x504000000,
+			.virt_start = 0x504000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* bportals CE */ {
+			.phys_start = 0x508000000,
+			.virt_start = 0x508000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		/* bportals CI */ {
+			.phys_start = 0x50c000000,
+			.virt_start = 0x50c000000,
+			.size = 0x4000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dcfg */ {
+			.phys_start = 0x01ee0000,
+			.virt_start = 0x01ee0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+                /* clockgen */ {
+                        .phys_start = 0x01ee1000,
+                        .virt_start = 0x01ee1000,
+                        .size = 0x1000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* rcpm */ {
+			.phys_start = 0x01ee2000,
+			.virt_start = 0x01ee2000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* tmu */ {
+			.phys_start = 0x01f00000,
+			.virt_start = 0x01f00000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dspi */ {
+			.phys_start = 0x02100000,
+			.virt_start = 0x02100000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c0 */ {
+			.phys_start = 0x02180000,
+			.virt_start = 0x02180000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c1 */ {
+			.phys_start = 0x02190000,
+			.virt_start = 0x02190000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c2 */ {
+			.phys_start = 0x021a0000,
+			.virt_start = 0x021a0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c3 */ {
+			.phys_start = 0x021b0000,
+			.virt_start = 0x021b0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* duart1 */ {
+			.phys_start = 0x021c0000,
+			.virt_start = 0x021c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* duart2 */ {
+			.phys_start = 0x021d0000,
+			.virt_start = 0x021d0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio0 */ {
+			.phys_start = 0x02300000,
+			.virt_start = 0x02300000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio1 */ {
+			.phys_start = 0x02310000,
+			.virt_start = 0x02310000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio2 */ {
+			.phys_start = 0x02320000,
+			.virt_start = 0x02320000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio3 */ {
+			.phys_start = 0x02330000,
+			.virt_start = 0x02330000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart0 */ {
+			.phys_start = 0x02950000,
+			.virt_start = 0x02950000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart1 */ {
+			.phys_start = 0x02960000,
+			.virt_start = 0x02960000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart2 */ {
+			.phys_start = 0x02970000,
+			.virt_start = 0x02970000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart3 */ {
+			.phys_start = 0x02980000,
+			.virt_start = 0x02980000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart4 */ {
+			.phys_start = 0x02990000,
+			.virt_start = 0x02990000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart5 */ {
+			.phys_start = 0x029a0000,
+			.virt_start = 0x029a0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog0 */ {
+			.phys_start = 0x02ad0000,
+			.virt_start = 0x02ad0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* edma0 */ {
+			.phys_start = 0x02c00000,
+			.virt_start = 0x02c00000,
+			.size = 0x30000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb0 */ {
+			.phys_start = 0x02f00000,
+			.virt_start = 0x02f00000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb1 */ {
+			.phys_start = 0x03000000,
+			.virt_start = 0x03000000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb2 */ {
+			.phys_start = 0x03100000,
+			.virt_start = 0x03100000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sata */ {
+			.phys_start = 0x03200000,
+			.virt_start = 0x03200000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* msi1 */ {
+			.phys_start = 0x01580000,
+			.virt_start = 0x01580000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* msi2 */ {
+			.phys_start = 0x01590000,
+			.virt_start = 0x01590000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* msi3 */ {
+			.phys_start = 0x015a0000,
+			.virt_start = 0x015a0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie0 */ {
+			.phys_start = 0x03400000,
+			.virt_start = 0x03400000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie1 */ {
+			.phys_start = 0x03500000,
+			.virt_start = 0x03500000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 */ {
+			.phys_start = 0x03600000,
+			.virt_start = 0x03600000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 pf0 */ {
+			.phys_start = 0x036c0000,
+			.virt_start = 0x036c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 0 */ {
+			.phys_start = 0x4000000000,
+			.virt_start = 0x4000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 1 */ {
+			.phys_start = 0x4800000000,
+			.virt_start = 0x4800000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* PCI host bridge 2 */ {
+			.phys_start = 0x5000000000,
+			.virt_start = 0x5000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x1410000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0x1410000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 (demo) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 3,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 (networking) */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 5,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201202020918.27120-1-Jiafei.Pan%40nxp.com.
