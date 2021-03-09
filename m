Return-Path: <jailhouse-dev+bncBDV3L7XXLYIK7P46QIDBUBEXC4JVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A07332BB7
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Mar 2021 17:17:52 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id a22sf5941103ljq.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Mar 2021 08:17:52 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1615306671; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vqijfak6TajK/S6aLjvBvAQDDL0rHY+G/dVX9s9pNgObetsGr5JT9+8idjC5QgcWq2
         nbFlAa5DzRnEpd2AhkhWpqBF7hJYaDNJI4cALq4oNXfrkP9A8yWPVofy0DRzhpYs6f22
         oau1ChKd2O65tLvzElhwYpr7J16GEglyd6EX8vyqOXAe+rygzRcmKkXWyFL73Li7e5xD
         toEYzCzvgBe6RCdHU2p862zgn+zkR9L/utD7OoZvN0080U6UymmuGj86x6lVgOQn9Gu/
         4kuIMAIe4r0moKDMyu2QN41em3MTzcCgCVxKPu3uRMEKqp+NYlgu5pALIfvcpJ+52qVf
         4MwA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=lYkVNv39lwZnjc3mp3X/i13QREswnPqdhIaAlBeZDkE=;
        b=FKM1pW4vpZfn3k93qN3YMv8a2lYgLwnpnUcNnlDS5ON9tve/iCLic3cy+JebsmNnhv
         dZckLx+lm/sF1VMQdx0aKt/SktOPIq3o4krYP1i+AsRT6PskZ2HgDN1FUNJyV109k2XK
         RTXffUIheyGtkUX3RlVN4/xv+JzJ5oftgk5MlyiaHIT6fNU/uSvKWumTtukpdTO7IcfR
         z/8YVYoByFOK/keRpmF+OFoDda20p+MMoE1WIObmfVVllAqnuPZHMaW6Fz/XNrOJ059S
         z5+2euPJjRuAPu5AVI39fq3j6n1Ql8i/kwDq5s5wlSnJmD9CLMr6CQaiEkxsUkpKPEG5
         pP4w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Yt1WW9XT;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.8.87 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lYkVNv39lwZnjc3mp3X/i13QREswnPqdhIaAlBeZDkE=;
        b=gpAtcoawYAqaXv6gKdVGf3kXwicWohzEG8vA9WOmeE2PbFG8BtqXAtITiEWtEqSeL3
         BrMyAT/niGC+xQ81bggRiKSvwX37N7hwSET/2FHg5ksRBCe88K/g+X9ix9IN//+g5aJY
         HbJDNOdgOhvgXLffMI+AQwHGkYNA63d4+EAWAMEs0VnBfdTsMSrsTpZLfnjG8E78pKly
         EmiGqMQ45oO8HsHNw+JAINMxMbGSF1lf9XVZA43MsYIAAMZrpTwQtY4GDkQs4VXthZJq
         eUxEEzWyfzBBx5YBxNc0lslD2EjCJr7VR5qZfEJn0Cw4Def2f55B2KkgYkoIFPiuv+kT
         ousQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lYkVNv39lwZnjc3mp3X/i13QREswnPqdhIaAlBeZDkE=;
        b=FT7kucFuVDLF/qRRgPq8MHPbp+8yAhCWsL44pnCa1MKHznSnUAjOlDPc/vvJc3eNqB
         OVeDPvGm2zbV1h2UDgvTBTIeyzar6ZVEOG0HPnUBwU4jxrEiy1do0M/8aTew9vw7HDrS
         GeCqcJfhjfm49uR0zfjPLGYlrNdxYTJvorpamd0rlSYrZXHwiW81NnqAFtqpEacvZFGo
         KAo6cqJYNIgBfsUKfngfmIaGlHFIJFUkJB9z+uDxu517WH26LbS3aO0hwlhw5AbCwBUo
         QfdZzDjKteMzU5yLfQreJCT2UFz3XbZoFkAGSiOdr0h5s5o1uASm81frowlJd00CLt8O
         qsTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532mbzER6igeNErF4zjbrovMydISndUhb1f39DLlvrSBfDuElci0
	EvrrcblFiu9zhv5JJej80/I=
X-Google-Smtp-Source: ABdhPJxeeZVtyQ3VJ3HdYCp2XJkSA+TpJkNHjPyug5aCGNp7g2WWaMTZoASEmupRNI/lU9kMgJaJwA==
X-Received: by 2002:a2e:b8c3:: with SMTP id s3mr10967575ljp.264.1615306671563;
        Tue, 09 Mar 2021 08:17:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ac46:: with SMTP id r6ls4389551lfc.2.gmail; Tue, 09 Mar
 2021 08:17:50 -0800 (PST)
X-Received: by 2002:ac2:5221:: with SMTP id i1mr18351206lfl.160.1615306670225;
        Tue, 09 Mar 2021 08:17:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615306670; cv=pass;
        d=google.com; s=arc-20160816;
        b=u7UdNMp6gCHITqhuzPnGi6EOWdep24bEjk4MkOb0G5GE+0qN9oQ0V51jLCLqF8aIoT
         cma7X3vSK6BDoH/tM/UGJ7mVdt12xEcg6TSx0cwPkoBW8ZF1rxTS/XwKH7nTO42Aoftj
         edhCZ/zAZ8axlmxv2+yeclw8k2muEr0Oovlj20Wm0V0m5iDODIF/LIUQ07Wzt3Dg8TeR
         UnAcUTznp1FhJ1gtQu+cRUid8nJBZEWTmckM6FV45sxArLg24aiAw2yJvZBKUC7OV6RB
         H3kY5lXFTPOqNolzOlR1afMyvdBKpEsN4ne3vXP+2R850z8a6trM98dIgZ1dOvck2u0h
         K3ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I13mpBirMITpcgTWKrxp5IX6vrmoOZuOo4X7babi1FM=;
        b=oPyWXaFIYkBHbViW3JCMC8yoo8Y7n9UQ+nQcbbIQS6I9nb4qaYGOQAuKJIEQCmdfGo
         z70UQFjLow0bqlccyk26Nn8PXCvQc3pXK1J3+g7nbZ+nAPo1HRoRR3DBWMqKVk7qtDFm
         lLDPzulkQDGaaLWsCToAGSw1oMtxrpGRP95AqpkGB8C9hHPtfHyqOv6T0YMn6CcX17bD
         tVbH8aVASi0FC3f3jPc2aCkS3ed0mkm1vJx7CWCvvR2ACGJxUL7uQZrArjCdRTkCcA4A
         oZSq2I5wDBTxlG3fVSVYrcTI9SfHm8tCvjdHF5RQROZDasPNOXrxs/31JYYoU2rVVMq1
         zNmQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=Yt1WW9XT;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.8.87 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80087.outbound.protection.outlook.com. [40.107.8.87])
        by gmr-mx.google.com with ESMTPS id a66si555162lfd.7.2021.03.09.08.17.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 08:17:50 -0800 (PST)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.8.87 as permitted sender) client-ip=40.107.8.87;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEIUpaW8cL1mrrAViccAkc0+DfU7aqYvUsHUPtU35Al8ozdeTSXVuxRtayuZDlfXl/sj/JIuyDW6mMWYMD69sL/HJ0DISV1fRmIgpRBV7/W5iumG/vVPYcZJdGvYS9R69/v4pN60QqDe9CEnAnKjptmwEyuKZad2BnRyCovHhx92bBu8RL2y+h7eVp8EN5lvhk6KxXXuOzoo08Ff9vT72cWsMKH52r8g71cFqARqew2+H6M53SLPa9FpzSx2rmiLcSSNlQFeEb0yeu0nVvO5+EAdQQooQ1HZbnvzqbHdwZF3rB4OQaog0CG/RbVtUf3e1e1lfY0AWHtUYzb2C61tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I13mpBirMITpcgTWKrxp5IX6vrmoOZuOo4X7babi1FM=;
 b=iyyF423TFaubepVO2VT4H0rFDdaBi2EVNN6n3HMN2v5ROx8KqsJ5B8AUaBqtHCago30p96Gsa3IioGi4WaUqUoXoKuFBfpXCVzDB89KIVfNVGgBlub//2MPPlLdhUNw8yik5bxlU3NeEaoN22T+SEyd1oRecOn6Uft9FZ7F63+8RYignV1zwbQdU/qpA0AcEYVEyKf9/OAuL6cwkx8w01LfDkuXgEdHHvxygY0+0EwBVUyevNFOhRi59btvTOHvUuKP2gLcoENtB4ArDNgvKgv1OoDQerKigGRQ/XuoHbYGbIJ23G6M+uuAFQJp+YB9Okz6kom2Rz//WDeca6dmjDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB5871.eurprd04.prod.outlook.com (2603:10a6:803:ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 9 Mar
 2021 16:17:48 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::71f7:66cf:af9:814c]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::71f7:66cf:af9:814c%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 16:17:48 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/2] configs: arm64: Add support for NXP LS1028ARDB platform
Date: Tue,  9 Mar 2021 18:17:34 +0200
Message-Id: <20210309161735.26777-2-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210309161735.26777-1-anda-alexandra.dorneanu@nxp.com>
References: <20210309161735.26777-1-anda-alexandra.dorneanu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM4PR0101CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::24) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-119.am.freescale.net (83.217.231.2) by AM4PR0101CA0056.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 16:17:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e03dfaa0-3172-4c27-c124-08d8e316e146
X-MS-TrafficTypeDiagnostic: VI1PR04MB5871:
X-Microsoft-Antispam-PRVS: <VI1PR04MB58716A7A574282D48EB2D2DEBA929@VI1PR04MB5871.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JrG+cXMzGaTE9jT9pALmJEVYVTGV4XCJkQsC9PQspUte9c9N87H8H+TO9kajgdHFQVHZo5d7Zkb+aK2kEVN9DT70RTNkRYs5S0OJ9sb6rYTbw+UcpfkMsSu3A6SAPR+hmiZjKnzbRMkbC4iKPuQUioxTjtOngDhZvpgmA6gORctAEvmn/7MAlyGZ5ziND9oC3erxVAeZRk3XmvSpYvLDHdLdudLA2kbd8Mh/hKM+XibwlQI/Qr4hGBiqLtaIBmLFDqJ3yygycUGKbrVVceoqdxkQpmnvM7ATjOn5C7SoiiPrgS940NwBl7Z7qUTwO1CIOd9ow7sx88rXQi+5QB+1hKT+8fGFMCzytV7skX/0zc+Qq6KPoZs0iXEsNGbzZ0YMf5knk3h0EhVstuJQpbSqPZN9qAIDiuMiN5OBLweaacWzaeVU581zNJZYcVDD4Q9GjmlSqupI2rr6PdxvtWN9TD7QOozzq5HcnhkymUXVtEApkJtQnZbqhY11+W2dNyW1ERNogWi4gKE4SGGbGeh/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(498600001)(186003)(52116002)(2616005)(16526019)(1076003)(86362001)(956004)(5660300002)(66946007)(66476007)(66556008)(36756003)(6512007)(6916009)(2906002)(6486002)(30864003)(83380400001)(6506007)(8676002)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8rofNwtmp9HoB/OnDfbH2rph95mHXlf9Ztg47ZXzrWBjR9fbfW+yFn1douLr?=
 =?us-ascii?Q?ZbBMkUnNDyWRU9rV6XA42oZ+uZV3qI5nv7EoV823ualThFzO6S2zjlcF0UVt?=
 =?us-ascii?Q?e/54Px9fXl7JStYMg5EpxW8D2N73aHWOdF7E3jqcpWr2NlqECThb11T90i0T?=
 =?us-ascii?Q?4fD/3QBtwmgSlskcv/YfbDLWxu3a1CUoHNO5oylll4n5EevEG/CJTaaHvi+C?=
 =?us-ascii?Q?O5xKwiF244WltHWtz5LmxSAGTaK60/vFSB7nHWzY5Ddkp8rO6n2UUPtyhzj8?=
 =?us-ascii?Q?R0F5E5lGaPVH1CjcOe8Ht0++NjUUivtqX8gqh/yKqrFZJT8aaGcS/TaDti8P?=
 =?us-ascii?Q?/EHU8C4HfBsCUQehN2hA4SdEMYMd8dLCxZinguaB2uZ0NjjVs+LCPEmE+AV6?=
 =?us-ascii?Q?ysqtqVViZhh5EQG29FeYhINFPZ+NznzoXSsnrjGYGkPazQihZtTj4NymepU7?=
 =?us-ascii?Q?dgO6uiFCUhBV1mHmTMQ6+DEMHuRIuSa6VLHRL2RWUoQY534wdFNAgNfwJ94E?=
 =?us-ascii?Q?T9w/ouwSpqApfaHPD6VQ8wE3B8Mzr0AWH+VajAyfJ1LXPImIJXPOko2bHMcX?=
 =?us-ascii?Q?Vut5oG0DTC6L2l1H+r4YU3jikaBSIUJ6mU4wv3mGtw5xE7PbOTxvvRPBQtbI?=
 =?us-ascii?Q?XPLkpib60SiwRCPMWJZZCdzzppgrB4ZLvJvRtJ7dg14n9tiy2p5dt/t6y2q8?=
 =?us-ascii?Q?CB6Cv9BgoHATgwWrmHWnh5r8bv7mfB+1trbmKSt3nczR45rpjEiCuPJOBLDl?=
 =?us-ascii?Q?AD+9zNkIt/h5fyGHNDIrpwrAnGK4DmqFkxtVMHJEGSdG680Dq6oczQ4+E5l6?=
 =?us-ascii?Q?3LZFXBJ1zNDx/s1oDJ2h054GPmVW5uCgFinJnliLHPlDnS8flF0Wu16bKTyn?=
 =?us-ascii?Q?iUSYPUWX6Vjy+Lm3YBhLnF1C+SD0n7mWifEhyaNHClxOt3DPatuE5Lus5yEV?=
 =?us-ascii?Q?b0iqoodj8PGE/sn6Yg74fGk5JKX77sXdGywW7bO+jb4juNg748FJew3EHEKD?=
 =?us-ascii?Q?hmFAlDBzMXqpLQf6wr6ko+RHyhM99WYNfIKirIDJPC9j0m+qZ3LPFnF4kMi9?=
 =?us-ascii?Q?eZIpEdjIru5fnxugpZXougABC+GK49CnFyaoIbfgPsXfOI3DaVAflOIgbNni?=
 =?us-ascii?Q?U/2LSRuG07bSwvWJyiPOG3c95WvCnTdTzrqLTdljtTaLocEC5C65j+PVzdem?=
 =?us-ascii?Q?qVo1OtTQDol7NN0kjW2jT6WiMQGlyXZ4yFtwr4fx2PjFlxBeMeTQz/UB+6z6?=
 =?us-ascii?Q?xlTAq/UzDAxtNnIsfFWksMEIVxOoVBFL7VWDaqeelQupxLgiuGvpisjTqbXY?=
 =?us-ascii?Q?woSfuppQNuAQlFL1wtncgNb9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03dfaa0-3172-4c27-c124-08d8e316e146
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 16:17:48.3849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COQeRcFD9bvCRxQmSXrU9iYEDWahrHRfJEfeIArRdlkLLHlS8QB2yQ36GFBBgB5kdLdDedphHeES93iH4Hw6h99HqqSlN21DoVt2G06f4JY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5871
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=Yt1WW9XT;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.8.87 as permitted sender)
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

Add root cell, inmate cell and Linux demo cell configuration files for NXP
LS1028ARDB platform.

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
---
 configs/arm64/ls1028a-rdb-inmate-demo.c | 132 +++++
 configs/arm64/ls1028a-rdb-linux-demo.c  | 152 ++++++
 configs/arm64/ls1028a-rdb.c             | 617 ++++++++++++++++++++++++
 3 files changed, 901 insertions(+)
 create mode 100644 configs/arm64/ls1028a-rdb-inmate-demo.c
 create mode 100644 configs/arm64/ls1028a-rdb-linux-demo.c
 create mode 100644 configs/arm64/ls1028a-rdb.c

diff --git a/configs/arm64/ls1028a-rdb-inmate-demo.c b/configs/arm64/ls1028a-rdb-inmate-demo.c
new file mode 100644
index 00000000..9646975d
--- /dev/null
+++ b/configs/arm64/ls1028a-rdb-inmate-demo.c
@@ -0,0 +1,132 @@
+/*
+ * Configuration for LS1028ARDB board - inmate demo
+ *
+ * Copyright NXP 2021
+ *
+ * Authors:
+ *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
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
+	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_irqchip irqchips[2];
+	struct jailhouse_pci_device pci_devices[1];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = "inmate-demo",
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+		.vpci_irq_base = 40 - 32,
+
+		.console = {
+			.address = 0x21c0600,
+			.divider = 0x6d,
+			.type = JAILHOUSE_CON_TYPE_8250,
+			.flags = JAILHOUSE_CON_ACCESS_MMIO |
+				JAILHOUSE_CON_REGDIST_1,
+		},
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
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
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* RAM */ {
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
+		/* GIC */ {
+			.address = 0x6000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (40 - 32),
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC */ {
+			.address = 0x6000000,
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
+		{ /* IVSHMEM 00:00.0 */
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
+};
diff --git a/configs/arm64/ls1028a-rdb-linux-demo.c b/configs/arm64/ls1028a-rdb-linux-demo.c
new file mode 100644
index 00000000..fff8599f
--- /dev/null
+++ b/configs/arm64/ls1028a-rdb-linux-demo.c
@@ -0,0 +1,152 @@
+/*
+ * Configuration for LS1028ARDB board - linux demo
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
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
+	struct jailhouse_memory mem_regions[13];
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
+		.vpci_irq_base = 40 - 32,
+	},
+
+	.cpus = {
+		0x2,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
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
+		/* IVSHMEM shared memory regions for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 1),
+		/* DUART1 */ {
+			.phys_start = 0x21c0000,
+			.virt_start = 0x21c0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		/* clockgen */ {
+                        .phys_start = 0x01300000,
+                        .virt_start = 0x01300000,
+                        .size = 0xa0000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
+                },
+		/* RAM */ {
+			.phys_start = 0xbf900000,
+			.virt_start = 0,
+			.size = 0x00010000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
+		},
+		/* RAM */ {
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
+		/* GIC */ {
+			.address = 0x6000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				1 << (40 - 32) | 1 << (41 - 32) |
+				1 << (42 - 32) | 1 << (43 - 32),
+				0,
+				0,
+				0,
+			},
+		},
+		/* GIC */ {
+			.address = 0x6000000,
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
+		{ /* IVSHMEM 00:00.0 */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
diff --git a/configs/arm64/ls1028a-rdb.c b/configs/arm64/ls1028a-rdb.c
new file mode 100644
index 00000000..f61a1615
--- /dev/null
+++ b/configs/arm64/ls1028a-rdb.c
@@ -0,0 +1,617 @@
+/*
+ * Configuration for LS1028ARDB board
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
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
+	struct jailhouse_memory mem_regions[77];
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
+			.address = 0x21c0500,
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
+				.gic_version = 3,
+				.gicd_base = 0x6000000,
+				.gicr_base = 0x6040000,
+				.maintenance_irq = 25,
+			},
+		},
+		.root_cell = {
+			.name = "ls1028a",
+			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
+			.cpu_set_size = sizeof(config.cpus),
+			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+			.num_irqchips = ARRAY_SIZE(config.irqchips),
+			.vpci_irq_base = 50 - 32,
+		},
+	},
+
+	.cpus = {
+		0x3,
+	},
+
+	.mem_regions = {
+		/* IVSHMEM shared memory region for 00:00.0 */ {
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
+		/* IVSHMEM shared memory regions for 00:01.0 */
+		JAILHOUSE_SHMEM_NET_REGIONS(0xfb800000, 0),
+		/* RAM - 1GB - root cell */ {
+			.phys_start = 0x80000000,
+			.virt_start = 0x80000000,
+			.size = 0x40000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* DRAM2 6GB */ {
+			.phys_start = 0x2080000000,
+			.virt_start = 0x2080000000,
+			.size = 0x80000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_EXECUTE,
+		},
+		/* RAM - ~1GB - inmate */ {
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
+			.size =	0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dcfg */ {
+			.phys_start = 0x01e00000,
+			.virt_start = 0x01e00000,
+			.size =	0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* rst */ {
+			.phys_start = 0x01e60000,
+			.virt_start = 0x01e60000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* scfg */ {
+			.phys_start = 0x01fc0000,
+			.virt_start = 0x01fc0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* clockgen */ {
+			.phys_start = 0x01300000,
+			.virt_start = 0x01300000,
+			.size = 0xa0000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c0 */ {
+			.phys_start = 0x02000000,
+			.virt_start = 0x02000000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c1 */ {
+			.phys_start = 0x02010000,
+			.virt_start = 0x02010000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+                /* i2c2 */ {
+                        .phys_start = 0x02020000,
+                        .virt_start = 0x02020000,
+                        .size = 0x10000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* i2c3 */ {
+			.phys_start = 0x02030000,
+			.virt_start = 0x02030000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c4 */ {
+			.phys_start = 0x02040000,
+			.virt_start = 0x02040000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c5 */ {
+			.phys_start = 0x02050000,
+			.virt_start = 0x02050000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c6 */ {
+			.phys_start = 0x02060000,
+			.virt_start = 0x02060000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* i2c7 */ {
+			.phys_start = 0x02070000,
+			.virt_start = 0x02070000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* fspi */ {
+			.phys_start = 0x020c0000,
+			.virt_start = 0x020c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+                /* dspi0 */ {
+                        .phys_start = 0x02100000,
+                        .virt_start = 0x02100000,
+                        .size = 0x10000,
+                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                                JAILHOUSE_MEM_IO,
+                },
+		/* dspi1 */ {
+			.phys_start = 0x02110000,
+			.virt_start = 0x02110000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dspi2 */ {
+			.phys_start = 0x02120000,
+			.virt_start = 0x02120000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* esdhc */ {
+			.phys_start = 0x02140000,
+			.virt_start = 0x02140000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* esdhc1 */ {
+			.phys_start = 0x02150000,
+			.virt_start = 0x02150000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* can0 */ {
+			.phys_start = 0x02180000,
+			.virt_start = 0x02180000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* can1 */ {
+			.phys_start = 0x02190000,
+			.virt_start = 0x02190000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* duart0 */ {
+			.phys_start = 0x021c0000,
+			.virt_start = 0x021c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart0 */ {
+			.phys_start = 0x02260000,
+			.virt_start = 0x02260000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart1 */ {
+			.phys_start = 0x02270000,
+			.virt_start = 0x02270000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart2 */ {
+			.phys_start = 0x02280000,
+			.virt_start = 0x02280000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart3 */ {
+			.phys_start = 0x02290000,
+			.virt_start = 0x02290000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart4 */ {
+			.phys_start = 0x022a0000,
+			.virt_start = 0x022a0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* lpuart5 */ {
+			.phys_start = 0x022b0000,
+			.virt_start = 0x022b0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* edma0 */ {
+			.phys_start = 0x022c0000,
+			.virt_start = 0x022c0000,
+			.size = 0x30000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio1 */ {
+			.phys_start = 0x02300000,
+			.virt_start = 0x02300000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio2 */ {
+			.phys_start = 0x02310000,
+			.virt_start = 0x02310000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpio3 */ {
+			.phys_start = 0x02320000,
+			.virt_start = 0x02320000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb0 */ {
+			.phys_start = 0x03100000,
+			.virt_start = 0x03100000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* usb1 */ {
+			.phys_start = 0x03110000,
+			.virt_start = 0x03110000,
+			.size = 0x10000,
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
+		/* pcie1 */ {
+			.phys_start = 0x03400000,
+			.virt_start = 0x03400000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 */ {
+			.phys_start = 0x03500000,
+			.virt_start = 0x03500000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 pf0 */ {
+			.phys_start = 0x035c0000,
+			.virt_start = 0x035c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie1 host bridge */ {
+			.phys_start = 0x8000000000,
+			.virt_start = 0x8000000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie2 host bridge */ {
+			.phys_start = 0x8800000000,
+			.virt_start = 0x8800000000,
+			.size = 0x800000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gic its */ {
+			.phys_start = 0x06020000,
+			.virt_start = 0x06020000,
+			.size = 0x20000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* crypto */ {
+			.phys_start = 0x08000000,
+			.virt_start = 0x08000000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog0 */ {
+			.phys_start = 0x0c000000,
+			.virt_start = 0x0c000000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* wdog1 */ {
+			.phys_start = 0x0c010000,
+			.virt_start = 0x0c010000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* gpu */ {
+			.phys_start = 0x0f0c0000,
+			.virt_start = 0x0f0c0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai1 */ {
+			.phys_start = 0x0f100000,
+			.virt_start = 0x0f100000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai2 */ {
+			.phys_start = 0x0f110000,
+			.virt_start = 0x0f110000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai3 */ {
+			.phys_start = 0x0f120000,
+			.virt_start = 0x0f120000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai4 */ {
+			.phys_start = 0x0f130000,
+			.virt_start = 0x0f130000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai5 */ {
+			.phys_start = 0x0f140000,
+			.virt_start = 0x0f140000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* sai6 */ {
+			.phys_start = 0x0f150000,
+			.virt_start = 0x0f150000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* tmu */ {
+			.phys_start = 0x01f80000,
+			.virt_start = 0x01f80000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pcie  */ {
+			.phys_start = 0x1f0000000,
+			.virt_start = 0x1f0000000,
+			.size = 0x10000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm0 */ {
+			.phys_start = 0x02800000,
+			.virt_start = 0x02800000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm1 */ {
+			.phys_start = 0x02810000,
+			.virt_start = 0x02810000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm2 */ {
+			.phys_start = 0x02820000,
+			.virt_start = 0x02820000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm3 */ {
+			.phys_start = 0x02830000,
+			.virt_start = 0x02830000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm4 */ {
+			.phys_start = 0x02840000,
+			.virt_start = 0x02840000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm5 */ {
+			.phys_start = 0x02850000,
+			.virt_start = 0x02850000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm6 */ {
+			.phys_start = 0x02860000,
+			.virt_start = 0x02860000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* pwm7 */ {
+			.phys_start = 0x02870000,
+			.virt_start = 0x02870000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* rcpm */ {
+			.phys_start = 0x01e30000,
+			.virt_start = 0x01e30000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* dpclk */ {
+			.phys_start = 0x0f1f0000,
+			.virt_start = 0x0f1f0000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* malidp */ {
+			.phys_start = 0x0f080000,
+			.virt_start = 0x0f080000,
+			.size = 0x10000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* hdptx0 */ {
+			.phys_start = 0x0f200000,
+			.virt_start = 0x0f200000,
+			.size = 0x100000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+	},
+
+	.irqchips = {
+		/* GIC */ {
+			.address = 0x6000000,
+			.pin_base = 32,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+		/* GIC */ {
+			.address = 0x6000000,
+			.pin_base = 160,
+			.pin_bitmap = {
+				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
+			},
+		},
+	},
+
+	.pci_devices = {
+		{ /* IVSHMEM 00:00.0 */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 0 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
+		},
+		{ /* IVSHMEM 00:01.0 */
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 0,
+			.bdf = 1 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
+		},
+	},
+};
+
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210309161735.26777-2-anda-alexandra.dorneanu%40nxp.com.
