Return-Path: <jailhouse-dev+bncBAABBSXG6OGAMGQEQRY3SRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF345A443
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Nov 2021 14:57:31 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id o15-20020a2e90cf000000b00218dfebebdesf1212990ljg.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Nov 2021 05:57:31 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1637675850; cv=pass;
        d=google.com; s=arc-20160816;
        b=ykDVlzIuW6QaVWvKXRNYprk+qcnpct8MosJkcbfxsloPicdjpkFzBl52pyqmNyle3A
         MsMYa99q8qr2hxKzbUFFfL0pHA1RklukkMrTpRRsCwWK6qlRhGeFGhRVuCMcqop9boml
         /5UpLOzuKhbQCp5smTHXv1Xhl7SGuHHW37JAgh6Cn0u7R4h/GC09l+poHQrVFvVJCK8H
         EtahGmSs5bd0YU+K8HpiPvedFk7UYyee11J69bmAx2bLeNEDMboy0ODbwY/LbRAakwLu
         k+ntVRiuqRAdIj/YZGgNDgNRSWh5WTWSTsIBHpiD4auVeaL76ZibVUFgoP9NFsL/TBjZ
         L45Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=HCoV91Ab76yirRCVPpolXKO/Fa1nzwAIUce3P1WFPjA=;
        b=Xwde7M0xd/F5jeVxw1eGOoxkTkJMg26GM9AFmB1DWRvAauUF/oO+2POPLeyCx09pDo
         buvh/lsz1yK4M9j0V4/dU2+CnCQSHEntJmY9U4udKdZx/2LXo1eNQb0zqHBgJ16sYPfs
         kLacJEeyeWoFt/BCiWa5CkuIcsvGtpTPO2d7uFigbNvlHXVPFEwHX7iG1nz6XwyakPQM
         zNCguItQNTjOWlZ//WHtbLhrn5MFY26DMV31L1TowNvasTRAgwq+g22p7Z3tl3V+V8gx
         Iuq83cek9+KYKRoVWtkc34+3QDrUHZcwWyYq1wJpYjTI2fzLH1AjEd03SJlw+NA+g7PA
         I2lA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=ZN5FwiWF;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 40.107.22.78 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HCoV91Ab76yirRCVPpolXKO/Fa1nzwAIUce3P1WFPjA=;
        b=dMMs9bnoxK3a1lAjjxfqgbgK2zJstpt50ANhjtlZFmgdKT9ffiTC6dxqtD+rFmQb1g
         Y2Vzu3UxG+JaoizQ8/HaDL9cLqUBuWjFVDkf9/MvOQF7Gyl4QEbu/wz5Qz4jAGtmXiA8
         fly5UxP3pISlMnPNkxzHgSwbD64VNLf2iL1u+ODtSzii5CXb5W745ZjkFOwHOm8VPg+Y
         3zSjR5834S7yKxkUuPxqxZx6+cGAlWpd4P8QEn5muCNrMNcU9PSzjXEYVpKXMMFV9dw3
         Y+s3ko6hnGR8EX+Q9LweLkWI+9J74QylhCc+YwzLlcTiGVFN4FiVzhkzkK9/6pwtg/c5
         +a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HCoV91Ab76yirRCVPpolXKO/Fa1nzwAIUce3P1WFPjA=;
        b=LFCoQOBJhQ2gotjzBUu8uusS0LsAW8Yl5vMl2pa3oQI6ZiW9T3hTrk202gXM4gLksP
         w08uqJLGQtg240QN7iSNSGP0aYrz6KH5xDJqTF8ClcmNUfe761h3lvodJfH+1MiEC5JY
         G3fcktt09H/hc5+F7/laglAWtzVVV5N0uTsakaB1m/bBmD+B9551IMJ6tn0gwdDNFzYi
         sckrsq6CADxUtUopWeVgv/n7X0BkME+xOLj645xElmMugfpw5Il6EV1+8CWQQiZ/4On9
         5HYXyPP5C1xRNrK5Z9pVlCfXxZ57/1ZczdWu7TD24+y6utQS7jXeiQJYOQ4QGSGxGVUu
         hLrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531jWIkMufpM7B3ErgW0CN+XwJxi2jU+vLDpHg3/9zpvI5BiAKZz
	vzglKYkrVMOPhGbT3uqeO/I=
X-Google-Smtp-Source: ABdhPJyyVg9jiuDV1MIBl0LniOiABkyzCUfgJy6KUl7gO4tGhkQFVQeCR86eVdpCrdypFjq4c5p1bw==
X-Received: by 2002:a05:6512:3213:: with SMTP id d19mr5001735lfe.519.1637675850533;
        Tue, 23 Nov 2021 05:57:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:201a:: with SMTP id s26ls1652538ljo.5.gmail; Tue,
 23 Nov 2021 05:57:29 -0800 (PST)
X-Received: by 2002:a2e:890c:: with SMTP id d12mr5593978lji.218.1637675849552;
        Tue, 23 Nov 2021 05:57:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637675849; cv=pass;
        d=google.com; s=arc-20160816;
        b=zXduzfuIbye2ntcOdzKi3JLn4HIpfkhTwcyYUePX/tp9e22GTkd4VcK6/fK5c5NyLM
         7cA862JWne/7xKtlBtum27VTEPZLPlg+00dwG9ZoBz8fiHUkQp4YMuFRQ6xOdy7Arasq
         1JbXF1brjP+PogxdDrj/1KJ1xwfGjAdqyuggu4dJi8FEdLrJZZO9BoxOqMC/e8/yLL2b
         7yd6+fnZwr8+EXVfFub5H6GZJjiVQebPeQuqqDMNH/bE3vwvI0U+QeiJeNhBtzEFncO+
         VfiZQuVRrtFx3WdrAs4yQATrypBXHgbQzaFZQUKMRlanZU5z5zCBLA+f7ZyPtEDuKhVO
         OPPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=PYK/Mua67gpQxjpxbjae5bIiyS0vmk3YahKY+U9UHYg=;
        b=mBTXZsTuzUrc3PGZfkHjKypL/trywsS6IEy8oEebPQ79E+sw6ZGeH+C4hVAnshGmI1
         JDpbw0bVocLd2L1BFzzYavwzYrXCkOGlGRpQYkmcP+Ed3ulW2zKumE5fON8QZpP2KGmx
         jnXBqqesl7LvigN5uJETpVRU5ILUbzWlfmKoc344L6rZ4ezPZWweyp/rGrIgar8+Gp6m
         LhT9eHfV6neQeMlx1XgQ6HDELEHqiqPvcJtCQUCWysoZPxs1YW6k/hQ8CC7KOxEMR22H
         rrk9msPmEe+SBNipNNaj1NfMhEEQAdIEOtpsnTZaR+2K1M+BvrFrtY2pZ4yS2Oembnaq
         1DiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=ZN5FwiWF;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 40.107.22.78 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com. [40.107.22.78])
        by gmr-mx.google.com with ESMTPS id e18si980739lji.3.2021.11.23.05.57.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Nov 2021 05:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 40.107.22.78 as permitted sender) client-ip=40.107.22.78;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECkTzYvBY1WK2yfpFjDdqHezdNsC03LjHlUz4vKCAamrSp9ajIFg6fCjw2UaiuttpPb9Z7CyQEtv4zEj47E4msq4UQ6rStg5CG4/7ZvbYGzm8rXRnywe366eqv4/JKQUMX93sxuEQhCCA7j3scDeXCt0b0YoKKaGMiASgCmL/QgtSCIKFiG9mPEm9D0gWW1MqltN5q0cIci7kqFMphMmxKzFeaS5hYbuGzn3QIVNycfKOyy0L1jzpN9jrU9owU1mgZ9b3Ka4eKPvnK4KgqaUWMIPEG2hhUgTPsJzbiPZkpsDlBzeZx8DpZ8frM3Edu6ghT/14eDxr4u5mL2sbOHeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYK/Mua67gpQxjpxbjae5bIiyS0vmk3YahKY+U9UHYg=;
 b=cEVSfWE9ZsUgN9u2D3fh2K7B6D89ORh8AWDzFywtt47XQoK5sRX2q743tGivy6cw25FjQ6Fu25PeOtzA9BcgZlm59R0icPG7QfX/WYTBjO30sH6T6csrXz+09nTy4KAqFWDHHS0Jpf29c3BITfrixpr0lE9u+htr01gOnhTIES4LChVaH1B9XPLOdxrEUhdghz+qKrqT44bHm1KX0EulNCT4MY2i7JQTK8gwb5uwCLQ9SihHExjsEhNL07XvE6/zUGds0PC1nQpIW6+sWDNTLoFI7v3Ea0vUnExX1UqlG1ZOP9L06UHqeNy/15WOJXRjz5+FW1kMA5rEu720/iVdjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21)
 by AM9PR04MB8969.eurprd04.prod.outlook.com (2603:10a6:20b:408::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 13:57:27 +0000
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370]) by AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370%7]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 13:57:27 +0000
From: Stephane Viau <stephane.viau@oss.nxp.com>
To: jailhouse-dev@googlegroups.com
Cc: Stephane Viau <stephane.viau@oss.nxp.com>,
	Stephane Viau <stephane.viau@nxp.com>
Subject: [PATCH 1/1] [RFC] configs: Introduce helper files to create inmate cell config
Date: Tue, 23 Nov 2021 14:57:21 +0100
Message-Id: <20211123135721.23908-1-stephane.viau@oss.nxp.com>
X-Mailer: git-send-email 2.34.0
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM0PR01CA0105.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::46) To AM9PR04MB8652.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b57362-l-11.ea.freescale.net (81.1.10.98) by AM0PR01CA0105.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4734.20 via Frontend Transport; Tue, 23 Nov 2021 13:57:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebb0db9a-d96e-48f6-a358-08d9ae892eca
X-MS-TrafficTypeDiagnostic: AM9PR04MB8969:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB89693F1562DD76D5A2F13469A7609@AM9PR04MB8969.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPADaUSG/BGqH+Ye/XCsWUmi+wPI4yk/PbBPm7dRfQtAQxwQRkS6a56JJ5lDLKTg7UM+2fiTGVvWLTsE8v4VvNF3+Zv6yRf9dmbgIDPaZCPOJ/p/edc3jiCY7OD+G/44OCTHdKTKDspGmfq2L7ESKhgBjoZPRvCRBy1QMsX/0T+X7w/S9OSIPhHbirzNSI7JzmcdehOYilhaHXKQjt3e/D/8skx6Y9tmeRZ1hnJTAxA/2h2naVr/ThoOPawVy4J8Ywzyr44yeSHJ5L3Fn3A2KG5Mvpw2oAgiclNvHWhT62oq64iiantMlxsLz//jKWXO51xgD1/uNeYG1sDcYWtMG0MGSvAlzhowooN/FzqZO/GwuHfU/A4xXRMJRJfCY1wFUUy5AYCABSGILtLqH+wZFZkZT5e6LlMfPWohmbJoQRj2+n6BS+mRb3b1mH2VUNxDnldhDfQxhmJm7D4wDbRC96uBDg00I3RPxREOZNFzpO2l+1+tnntr8V6ET99zgstGcJVtmTJJYKXmmghoJ+OyxmycoMY7SC2arU4WUWqn96/B4odyaSKlrncVhRJ1s0KOgl7WulDS2BaLQoBqWqLIrYr173Q1SqYWU98SRrpaFgqmONoPUKlbA6tEn9c02fF7lVlQQ6fp3gqY25nYJBgFhekBnCgorR4X+N22m89OD4HulyFNSzA77AgJeALagOE19OIL2wtqR1XjaVPEv6r+2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8652.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(508600001)(1076003)(5660300002)(8936002)(186003)(38100700002)(66476007)(44832011)(6666004)(38350700002)(6512007)(956004)(54906003)(26005)(8676002)(66946007)(66556008)(86362001)(6916009)(6486002)(2616005)(52116002)(316002)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OGbHypMqCCI1NAZRDmOblu+didGFmKWl6XREA0y1biNB5ebkvYnXV3tPK9oq?=
 =?us-ascii?Q?BkHcUgC8bCzBCTvxU8sFcYgBxIEl5Ny94SFBz+Btn29jqwwxoRoJp+6rGtYp?=
 =?us-ascii?Q?qV7IFFUev118SuIPCy2/hKcM0XcLsa/moDzScc7zUos+JGHFScLoLYllVFmC?=
 =?us-ascii?Q?EGD7LlWGUx+IHruYbFWtNolU566cHhZSfugaZQY9KleJ5aBJrCxILSPk8MO0?=
 =?us-ascii?Q?xZjSGKtB8yk3Z6n09XOxiATmsMrxBbSXfeyrSs/ryF0dOK7utZr5jfdUJtyA?=
 =?us-ascii?Q?vJ+sCdiEMTb346TuIGruiZY7MJT5Eag7ZDSpNP2oDSDmXGA2AkNOKAvgx4hl?=
 =?us-ascii?Q?yqRZcPcMRed+1L6Tp9bME2808NCajHgFvfAJeHUeOcxi5JpBTmBhV5whALf1?=
 =?us-ascii?Q?neh4OuiLFAvKDjY70/Dkgd0dzEBxd454NrIrmJN/KvPzwxorlqQH0ZNAPpzZ?=
 =?us-ascii?Q?uagi/7kbKprVKcNTeTMTWMV35Eg/Ol7fEePx6b5irIl5tATu7EwOVtvInI2r?=
 =?us-ascii?Q?c6kxauqf4TSc3Cr74Nzz1/1YCeYQMBlCd9j6sLDd/enWVtqu1PIUcgGpTvL9?=
 =?us-ascii?Q?A5KBVFoolwkT5KQV9uoU61hmtmZF9s0XbVn2DcWKJ54ymAChSgNgmpIRm/Cz?=
 =?us-ascii?Q?1tY0yop3QTxVlBoRL1pd5TuhuPNAPy41y7KeG31D2kGSosb5JWOxk25Kc7YZ?=
 =?us-ascii?Q?5i4hsaCbYxmCz9eTptd9iZJOwYHz9YhFeglRXSgo/8JJQJoIwz8F9oOQ+IVg?=
 =?us-ascii?Q?aIEcV8EF1Pcyr28tUkTUYpOtcRUdYK1OhSatL3Vdg+3tGSMuWJ5bY24HjbUe?=
 =?us-ascii?Q?EICGZliNfVuaiBUiBhaK0F8eEVysWXfBvpcLmupxmi4CVD9NGyNW3dIObq86?=
 =?us-ascii?Q?FlR4QmmPMZNqBxTSNHZNj1rUbC6uUU5r0ObfPPUTu7kzECQv5pf1XR+RstUk?=
 =?us-ascii?Q?Us0SNM0UbS8xO7AISb3zQwtLzytGQ50MBYFWQN9KFq97p8kkrV6bAI/YNF/P?=
 =?us-ascii?Q?2Uo5mwn39Zk5m8hMjhfskqyfULoauryONQDSVctsNqZarL0z8K1YPtD8GpIF?=
 =?us-ascii?Q?934e8NNPEST1BTtsqCVrrfTWXF6WsOqtbz6ivk8L9PpM7bVMiUhdY9nqmMkx?=
 =?us-ascii?Q?IsYdbrhQN5Us/oHOVp2ivRnTCIyCmVWTsVWYdRY/VM/6F+FPTMmLFBsKjUOK?=
 =?us-ascii?Q?UpVMKSHpFyfWtlfGHsiB0VSprklH/mOOo1c83+aPRZF50/Wf97DdpGVBRwMd?=
 =?us-ascii?Q?hqY4j2OMWy5u42YqMTRvV3bxvaEpnvlw+FLNlsY6xwQUhC4xNETKjn/gdrXA?=
 =?us-ascii?Q?HXAYfoYmJYXrxrE/V/EnQYWk+BUGmfQo4NBAe81PBpsyfQmjefEs0DwAXAyF?=
 =?us-ascii?Q?wOWq4kW2PwYp07it0bK/M7nTeHtTmNNaRWM1m4HypKcNYStmEgUyIhNRcomI?=
 =?us-ascii?Q?pFgVWAWhIg6V8XqR3DZct+gqsL09nnBk2UIwXukYfg27S60ye80iQx6FqKsO?=
 =?us-ascii?Q?9YECEh9JLbGzh/yWCN6Hq1z1vXOSRuwW7TapYoZdicHozxy9/kzB9fPEv4py?=
 =?us-ascii?Q?pL3uaAD1YuidLuLIdR+SRYe9s9oHt57r6/oeL9XFFjQ0ajXDjH9zv20N7JBd?=
 =?us-ascii?Q?89B0XKjBCDvaxuYdDt4fRG8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb0db9a-d96e-48f6-a358-08d9ae892eca
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8652.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 13:57:26.9993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5ziACJ8letkf5CNhpXAnLFzce+68cpOV3Uyv4ifYAZ9A7xogajrSdACgJvpJsg/TkByHaDre0q1PopR+HedIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8969
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=ZN5FwiWF;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 40.107.22.78 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
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

Inmate cell configurations all look alike - more or less.
Let's create a couple of header files to hide the fastidious stuff
(structure field names and so on) so that .c cell configuration files
look a bit less ugly.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Stephane Viau <stephane.viau@nxp.com>
---
 configs/arm64/cell-create.h   | 56 ++++++++++++++++++++++++++
 configs/arm64/cell-helper.h   | 76 +++++++++++++++++++++++++++++++++++
 configs/arm64/cell-template.c | 32 +++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 configs/arm64/cell-create.h
 create mode 100644 configs/arm64/cell-helper.h
 create mode 100644 configs/arm64/cell-template.c

diff --git a/configs/arm64/cell-create.h b/configs/arm64/cell-create.h
new file mode 100644
index 00000000..871784fc
--- /dev/null
+++ b/configs/arm64/cell-create.h
@@ -0,0 +1,56 @@
+/*
+ * Cell Configuration - Structure definition
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Stephane Viau <stephane.viau@nxp.com>
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
+	struct jailhouse_memory mem_regions[CONFIG_INMATE_REGIONS_NUM + 1];
+	struct jailhouse_irqchip irqchips[CONFIG_INMATE_IRQCHIPS_NUM];
+} __attribute__((packed)) config = {
+	.cell = {
+		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
+		.revision = JAILHOUSE_CONFIG_REVISION,
+		.name = CONFIG_INMATE_NAME,
+		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
+
+		.cpu_set_size = sizeof(config.cpus),
+		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
+		.num_irqchips = ARRAY_SIZE(config.irqchips),
+		.num_pci_devices = 0,
+		.cpu_reset_address = CONFIG_INMATE_BASE,
+	},
+
+	.cpus = {
+		/*
+		 * bitmap of cores used by the inmate cell
+		 */
+		CONFIG_INMATE_CORE_BITMAP,
+	},
+
+	.mem_regions = {
+		COMM_REGION_RW(0x80000000, KB(4)), /* communication region */
+		CONFIG_INMATE_REGIONS
+	},
+
+	.irqchips = {
+		{
+			.address = CONFIG_INMATE_IRQCHIPS_ADDR,
+			.pin_base = CONFIG_INMATE_IRQCHIPS_BASE,
+			.pin_bitmap = {
+				CONFIG_INMATE_IRQCHIPS_BITMAP
+			}
+		}
+	},
+};
diff --git a/configs/arm64/cell-helper.h b/configs/arm64/cell-helper.h
new file mode 100644
index 00000000..d35bc0fb
--- /dev/null
+++ b/configs/arm64/cell-helper.h
@@ -0,0 +1,76 @@
+/*
+ * Cell Configuration - Generic definitions
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Stephane Viau <stephane.viau@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef KB
+#define KB(bytes)	(1024 * (bytes))
+#define MB(bytes)	(1024 * KB(bytes))
+#endif
+
+#define REGION(phys, virt, bytes) \
+	.phys_start = (phys), \
+	.virt_start = (virt), \
+	.size = (bytes) \
+
+#define MEM_REGION_RW(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE, \
+	}
+
+#define COMM_REGION_RW(virt, bytes) \
+	{ \
+		REGION(0x00000000, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_COMM_REGION, \
+	}
+
+#define MEM_REGION_RWX(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_EXECUTE, \
+		}
+
+#define MEM_REGION_RWXL(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE, \
+	}
+
+#define MMIO_REGION_RO(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO, \
+	}
+
+#define MMIO_REGION_ROS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_IO | \
+		         JAILHOUSE_MEM_ROOTSHARED, \
+	}
+
+#define MMIO_REGION_RW(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_IO, \
+	}
+
+#define MMIO_REGION_RWS(phys, virt, bytes) \
+	{ \
+		REGION(phys, virt, bytes), \
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | \
+		         JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED, \
+	}
diff --git a/configs/arm64/cell-template.c b/configs/arm64/cell-template.c
new file mode 100644
index 00000000..bf731101
--- /dev/null
+++ b/configs/arm64/cell-template.c
@@ -0,0 +1,32 @@
+/*
+ * Cell Configuration - Structure definition
+ *
+ * Copyright 2021 NXP
+ *
+ * Authors:
+ *  Stephane Viau <stephane.viau@nxp.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "cell-helper.h"
+
+/* Name, cores, entry point */
+#define CONFIG_INMATE_NAME		"inmate-cell-name"
+#define CONFIG_INMATE_CORE_BITMAP	(0b1100) /* inmate uses cores 2 and 3 */
+#define CONFIG_INMATE_BASE		(0xc0000000) /* entry point in DDR */
+
+/* Memory & peripherals */
+#define CONFIG_INMATE_REGIONS_NUM	(1)
+#define CONFIG_INMATE_REGIONS		\
+	MEM_REGION_RWXL(0xc0000000, 0xc0000000, MB(16)),   /* RAM */    \
+
+/* GIC */
+#define CONFIG_INMATE_IRQCHIPS_NUM	(1)
+#define CONFIG_INMATE_IRQCHIPS_ADDR	(0x38800000) /* GIC DISTRIBUTOR BASE ADDR */
+#define CONFIG_INMATE_IRQCHIPS_BASE	(32)
+#define CONFIG_INMATE_IRQCHIPS_BITMAP	\
+	(1 << (29 + 32 - 32)) /* UART4 */
+
+#include "cell-create.h"
-- 
2.34.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211123135721.23908-1-stephane.viau%40oss.nxp.com.
