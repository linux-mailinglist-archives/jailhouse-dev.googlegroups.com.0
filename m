Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBFEF42BAMGQEUYFZWBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41834578D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:54:28 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id t16sf581330wrn.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 22:54:28 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616478868; cv=pass;
        d=google.com; s=arc-20160816;
        b=BWvPUSlOHJKN804D7jQ9HgLTqSHiBRhGeILI8cxOxCjvdlFpWonClvGteKczG850N4
         R3sYjuggz9I+mddhw3cBCfPfMxEwKiNRiKQPkzOqBATlebb07QkEQl/QeTyu+XPXf4Qf
         4OvL7xR34ccEzSn82vTGiDn+9IMJfJ7S1UojeSI5qJsQihmOCh+lB0/4twol3+jV4mKH
         Ygk8EJNwouRnQL5Nt+JLpv9tGTvirhqyQSCQdNIQCzRlCOh/qu1jvVN3Ns5A/CXJLm/r
         VKPcraq8RcCBEwhAURu4emP9jn9eod0t9zdmfcXQ4RpkOMrKEyPhaH8nru6b5jyMDepL
         rrYw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=jajWmVvefvqK4+TpjTL7VBY04jJJBKX3D0Wzz4EyDfU=;
        b=e+ug7Yidt58+w0b3I4cK6gwAI8xIjJcd+gC6ABUSBdL/pSWvYbzL7O6+zX/pyJfv5i
         vYMXBfnuepM6PXKZ3iaMuvd2ahrHaShyHKtrUfP5XQCBIH+eIH5YE/34XmnZEq3Xz4jm
         KFxzf8ignUbJTOumkOQXQo0Of1YRtnWLMnTrQrhitNnB1RrJi9PbyPWXtR+y4BUbcop7
         uPERbQPfKyour4rVB6tC5vxpd0v5aytNmelJ9QLejewX5OvKB9+uklqCCJVT5S5Xhihp
         4RaV3EerAxYCgRduma2GmTGdeYic8mWn67KgNESHmlWL1MYveF023FWQehSVylIFDmU/
         ivPw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=g7zwOwoF;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.80 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jajWmVvefvqK4+TpjTL7VBY04jJJBKX3D0Wzz4EyDfU=;
        b=kmjiqMdp2GzJdHE326NJdVLAZkSoduosnnD+KEtCy3VdKvK5XbJxxVxsjykxH8vL2f
         XUSrzV0JUfoxriZ7baqQXIqVjTuCYZJxlV1ep+dHH2HRFHiUjTVJIyzVOmIt/Tx69bng
         ZZga9EiJrkkgQ3T6Mzwz5WsezgnBoZk5X13Q6CIeKzRgb6tlEKMI+FEiUqlVjwNNErYM
         M/sOKdzPPmpq4BbY1l+xroNXWLDAI/6Paplpz/qv5PbkNlve80QadK5Ut6TNU6P2ktnW
         W+SgDiaO8oYrQdGfRm07MJihzlmzgXz30MkpvvSFmm6ryaJ8yIvuk/BtfJMpgqV9VIrk
         uu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jajWmVvefvqK4+TpjTL7VBY04jJJBKX3D0Wzz4EyDfU=;
        b=thwMa3HxBGph+YoggO26mKqR5thkJu1+YcQ5GxggKu+1hrpCNcr/mWPfO3MSIXCTrN
         QNvkEtK4VjhVTIhfKKsKv75hPGn31DJ1TIz5JHyJzZ/CBCxXJOioxVUNh5qsdz1M9VLm
         QahvoJukvr7nxD82lEV0wS55UznOEbIlAcqzC9e3SSnICdmc2v7LfRlNS97eOnZjmqE0
         mL+FXGNzvdBqt1ed/7+dRLtIG/6Fz3TAEDQSNfScJYc4Hw48BrXmLn34FGZrFqx/o4oI
         xevjnCNi8laY+feJR4UipCJxM4XgQKfFmADfBLD+MxpgSfIGog8FTT8yhRvF4b3wxSAq
         CLWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KX9wk9ynU3Qch0v04J57l993YIpFOJ+0uLqhrRhS9EhvhZmaG
	6/VhsgrxYvkeXCBM+OHO0cQ=
X-Google-Smtp-Source: ABdhPJwGART/1vo8fN0oluCSKdrWUoIy5REXKDdHZdAcfcH33Y/jLrGjtTMAu3ZjrJ9KepQf77c+lg==
X-Received: by 2002:adf:dfc9:: with SMTP id q9mr2145905wrn.200.1616478868478;
        Mon, 22 Mar 2021 22:54:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6a89:: with SMTP id s9ls1149280wru.2.gmail; Mon, 22 Mar
 2021 22:54:27 -0700 (PDT)
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr1978836wrw.355.1616478867582;
        Mon, 22 Mar 2021 22:54:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616478867; cv=pass;
        d=google.com; s=arc-20160816;
        b=goj7sjYK+kbVd/yrd3htLKNPqt04gP8zljwOPRAjgdN1EtHzEylfT0icZrHREv0uOm
         /LOl8chknfn0WAoawulmLVBIEdu+dMCSmv44D0cBC+IreDRssjlNM+g3qWBdJWh+EJle
         DaIcMf0Mz9wgvucZAWcw22xfZs9tKqGgm10sdg6bLZk/HjYkV/3PIOyCRveADcJpc4za
         HTRYXNvHZhAjnweeRFcYphP83uDcWhbjauabs+2dHqy+6/vm9xMI/RdRLL5YWC6EeDOo
         VYzP9xJomZrkWKctFeu0ozRfy0NdByp94Fb4YF+K8Miw4afVw1nMhpntWvfTr4CrgrnM
         lXsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IJVQ6+rJv0/Qd+9v8kfFJs5LyIyEeoAQr5PHonWhj2A=;
        b=gkhla2GCK3rK6Jyd2aEONShb/nnwvx4dTCdhG4t1XLFqire+HeNzzX4odHpfrgwZUV
         TSNoZ76XCP8zvz/T/nivggYW4sD55hSlSq8Lz+x4vKXIR+ny2qlUocDRQsNxjNmF1RhS
         YwRUFBVBGE6mdcw3Df/mhKpvWBoQXV3SHPvMb4ApofiVwZI7PYBjb3QafWR4lUGz6c/+
         ZZD/HKu3oXt3H3os8Xhf5bwyqOUPIDcWsv0cebPhD6YaOxRdfa1P6wemjPW5KUni+6Ot
         C50VfVKIhEJUAi3RwhiEphODGX68J7aqfHoL5omkE+Z8e46cKLq96I7PG09V9OWwUSJB
         RHHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=g7zwOwoF;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.80 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40080.outbound.protection.outlook.com. [40.107.4.80])
        by gmr-mx.google.com with ESMTPS id h16si579939wrx.2.2021.03.22.22.54.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 22:54:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.80 as permitted sender) client-ip=40.107.4.80;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs5rqdQgaDhpKBvYFmp3EZSk150ZJqNAwy+OJkg7vTKtkb6jYD3Fuf5A1eTgf5ddzA2zRAJGCZRWWr4U/oo1bI902DWMot9CKZvE9o/Z3f19dJgkkGR3GriuHyxFowBurtuVDylhAY6VWgzozUqwUSOnm8e6qoiqcG4q4Z/OqPQ65KLchlrInq+Y5JSTGtbPfqIBUT2R+yjlOIROkFEtlZnx5r4ZSwWavxVGh+bVOyy75OY2pUYoERVOL/q4PCq2T8y1ZbZ0/zY323dH+qx91sHc+ivirMprqeB5YqRZLKmvVMvXMkYN+ow68eEqMb9Zv8WG4gaU2+7xrLMOb4yGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJVQ6+rJv0/Qd+9v8kfFJs5LyIyEeoAQr5PHonWhj2A=;
 b=YuHCSsipAoiUBpD6Uu7QDrgeZjvpODgReaZTQHaK+PvLtgr+RPTiIvdBPUDDfwnd06mqins+mIZj5RDo4eLe10pDYMbj/W9t9q9a/xAmpRrKGPVgOm1ClaRPmzIlS6Q33RUdh/pDaqjBb+M90044YiVG0qMc36imsxi4a0m7jSYbat7uu/Cpnwj64vv4U4Y7bL6tv5lfQXjD8qwXTalnrh8L6I4SLIivFL6ywDx2D0+cDNRzQ3Rzs/5rtHSxnkJG5LtbfjnmmIrQKNG8oZNjljg/oFU/rS+lk4VkRKx2RAFylcj3No2gXl6Ks8iDY80PYWJZ9oQRkHzWiA6WOI8z1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6619.eurprd04.prod.outlook.com (2603:10a6:10:108::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 05:54:26 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 05:54:26 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 4/5] imx8mp: support virtio console
Date: Tue, 23 Mar 2021 14:25:35 +0800
Message-Id: <20210323062536.3888-4-peng.fan@nxp.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210323062536.3888-1-peng.fan@nxp.com>
References: <20210323062536.3888-1-peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 05:54:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b97eac58-8269-4cd4-689c-08d8edc01dc6
X-MS-TrafficTypeDiagnostic: DB8PR04MB6619:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB66193C31BEBD0416DE2B478488649@DB8PR04MB6619.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/Y1VaD1REBsubQj/synJA4pCNKY4g/y6EdHAISrDXU431++W1+BETMzaoOPbWODA4AZWb4DO+rQzli8o1RNwXdJIA3rnrwCRyoudSxVTxO7fDvCoE95AO7ET7bC+CjtOpTvmzG2bMQ8NhTVU0enmiI/pqYsG4dJtvxe+5M0tjj0zqWaXX2USHz9uOFDxeA5wS519n19pVuU1IPVdS+z2tq30sMu8r5Jn1ibDpSi6JWiVAP6wVOQ3vrIEoB8DN/VRf7Mgdc7m9nF/M+Qx+6NcoCEKcNbyqGbbmDkFzkGcHXsBAnmmhc0wQw5EcdQQiUa7Cg5etPSgmr0sr4KWnLq2yTh4St1kZ3wHST5xMaexnnThOVfTpXaGnJgJGRqI4ioIeh70Svti8PUrnm1QvGm9TsxY5zRfVVjAnxvT+i+7PMZ7eTm40vwLlEeAcvRssuyy8eZvRnSsIVuJa7XFb9aAXFhSbachoWimnnYtVTdR2Y/7uRelCJZRW7cyRWmyZv83TJEY494xtrSllzpPBs4X5wD9wtBu5KThnWCHcw4IfnNJD3CITYVX9kVtliKiqUiFpgf4UWubn7wDAQ1UfT2ouIvurowKcpF/7b8RwDCetnST6sYwPCJNYJ5/Up7JuEM36ocK9ABRblFIYbSNRBA19PyOgbmJ8eVzFmD0yiqujQ0gHzlL8ezpoFo2XJLbJdJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(6666004)(478600001)(6486002)(6506007)(38100700001)(9686003)(316002)(956004)(2616005)(6512007)(6916009)(5660300002)(2906002)(4326008)(8936002)(186003)(52116002)(66946007)(83380400001)(26005)(66476007)(66556008)(86362001)(8676002)(16526019)(1076003)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hqw5INMVH2Gm2Wj8xjgWPCa1dzZ5kv0rvQG5OZgrniKpGxwCcO/XHpyMpgwV?=
 =?us-ascii?Q?IJ05nEKXOjGN2j2siqeBCOekVYa7gom9g6v2mtsOKRxRNOpVgB+f8cB47EJE?=
 =?us-ascii?Q?2c878f/jHsjDY+KIyN+2y6eb0MUJjE0pJvD92MsjYhgvCZrbVXAHqJ5wdvpU?=
 =?us-ascii?Q?XsgScdgnUwIqyMow/Ifj3IOMbot01sZ1hDMepcB44Eb8+ZLSdOEbzwdvRt6Z?=
 =?us-ascii?Q?g6xnZ/GkPmHB2Zj7Ud1H+FJZkj7LfgoauDlwUxIuiUmeqA14SJalWS4qLZ3s?=
 =?us-ascii?Q?h9Oel3r9VGAEmN2gUQS9jUyCHLE2Jj0vVDfiqKxYWi9toZze0HZdsQAEXrA7?=
 =?us-ascii?Q?hPq6vKQX15EjYlv5YSjzAz+JyaXiUxHN7s4NgojCOaWSfvJgLLMD3iQkv8bx?=
 =?us-ascii?Q?6S+zkAbo9eQna9qm2BNils05DSM5+/3qZBRi/NtovRm+Rqd2hg6W9kBdO6K/?=
 =?us-ascii?Q?juvV56IhelHXeui8okpZLfwLQgizRbq9S+bsquHP3IIBzqLDGK/EJpBId7zi?=
 =?us-ascii?Q?Ur3MBPXm3qk+/ztXpV5Qe5Zl/mi+xRymJ/1Q9iKfRt3dH545Bs5sDtYJRzn9?=
 =?us-ascii?Q?XNpudlvl1M5cBnI3XhAhT0RBXa0DtvXgcEocKitozQjxO38UXLEQoPGw0P61?=
 =?us-ascii?Q?wNmIrNEAAflCtnVJA/hSXpynm9yyPRLLQmNBuK1FWguXvGUdign5awIQBuO5?=
 =?us-ascii?Q?Dz60+Tzkby1KaICRCQZyMemeAZsc9ZJG+jVVTptM6p7f0FtrUYlKuKRVYSSn?=
 =?us-ascii?Q?xGMsC/3TpkbhcW+znnBns4Y+kZItKLNqwMdEBIruxlykJBfZnt0Kobvgv+yE?=
 =?us-ascii?Q?CaFEPTZVBu7LDSeW0NF2PpjGV7a4PPmFnnP27uxBcUMuTteeaqWsoD26XzJx?=
 =?us-ascii?Q?UzUJngGpVm1n5HgVGXDNpqDnueOxTSl5ZfKhOqFCcN10yCJg66uUgQ/DOIus?=
 =?us-ascii?Q?V2SFc95mELAwkp49Z8jvwnJYO4xT6LmCBdnY5oKOkc9Ag6G8RHcoujxhC1rs?=
 =?us-ascii?Q?hV8cHWUyZ0xRdLkKOC+usElbmSeL21QUlpz6A1eW66GZy0XxOSDJQFg9xK8E?=
 =?us-ascii?Q?8kW5yNFeosJQKXeGl7EiX9AvPVrk33Y6sKAkEarKUdrVWn5E1E6ua177ZO1t?=
 =?us-ascii?Q?muPI/ZoJahDj2gqQiEo1m22RTfr25SaZXXWQ/9plN0R4BPpEESALEhIyxnZN?=
 =?us-ascii?Q?Oob8uy2veT5Ou4acHaHnMa6rCVtZ9usxEF+kUAn7Cx+9VI/AVQ/CAMgcaXuJ?=
 =?us-ascii?Q?zdAFdPxTtIEYJFIAi+XI4aCpveFtyTDM9b2tBAikuXt88mKppXV9MbDSMtDO?=
 =?us-ascii?Q?Il5LQrZmtBgqk/EIUepeFr0E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97eac58-8269-4cd4-689c-08d8edc01dc6
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 05:54:26.7058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGvR6SL4e2+fYz1WyMoPn9mtzScMn6fWmSmNTeepOmpqYVzt5cFPU8+G5CBixFxsQdRRcoyxMClVnC1f4u+1uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6619
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=g7zwOwoF;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.80 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Support virtio console

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 configs/arm64/imx8mp-linux-demo.c | 81 ++++++++++++++++++++++++++-----
 configs/arm64/imx8mp.c            | 80 ++++++++++++++++++++++++------
 2 files changed, 134 insertions(+), 27 deletions(-)

diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
index ff0cdffb..1e0a9f1c 100644
--- a/configs/arm64/imx8mp-linux-demo.c
+++ b/configs/arm64/imx8mp-linux-demo.c
@@ -21,9 +21,9 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[2];
-	struct jailhouse_pci_device pci_devices[2];
+	struct jailhouse_pci_device pci_devices[4];
 } __attribute__((packed)) config = {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
@@ -43,7 +43,8 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+		/* IVSHMEM shared memory region (virtio-blk front) */
+		{
 			.phys_start = 0xfd900000,
 			.virt_start = 0xfd900000,
 			.size = 0x1000,
@@ -52,25 +53,57 @@ struct {
 		{
 			.phys_start = 0xfd901000,
 			.virt_start = 0xfd901000,
+			.size = 0xdf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{ 0 },
+		{ 0 },
+		/* IVSHMEM shared memory region (virtio-con front) */
+		{
+			.phys_start = 0xfd9e0000,
+			.virt_start = 0xfd9e0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd9e1000,
+			.virt_start = 0xfd9e1000,
+			.size = 0xf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{ 0 },
+		{ 0 },
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/
+		{
+			.phys_start = 0xfd9f0000,
+			.virt_start = 0xfd9f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0xfd9f1000,
+			.virt_start = 0xfd9f1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0xfd90a000,
-			.virt_start = 0xfd90a000,
+			.phys_start = 0xfd9fa000,
+			.virt_start = 0xfd9fa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0xfd90c000,
-			.virt_start = 0xfd90c000,
+			.phys_start = 0xfd9fc000,
+			.virt_start = 0xfd9fc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 		},
 		{
-			.phys_start = 0xfd90e000,
-			.virt_start = 0xfd90e000,
+			.phys_start = 0xfd9fe000,
+			.virt_start = 0xfd9fe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
@@ -143,22 +176,44 @@ struct {
 	},
 
 	.pci_devices = {
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 2 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
+				VIRTIO_DEV_BLOCK,
+		},
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 3 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 1,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT +
+				VIRTIO_DEV_CONSOLE,
+		},
 		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
+			.shmem_regions_start = 8,
 			.shmem_dev_id = 2,
 			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 		{ /* IVSHMEM 00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 5,
+			.shmem_regions_start = 13,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index a1e221f9..3f758980 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -18,9 +18,9 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[15];
+	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[3];
-	struct jailhouse_pci_device pci_devices[2];
+	struct jailhouse_pci_device pci_devices[4];
 } __attribute__((packed)) config = {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
@@ -42,7 +42,7 @@ struct {
 			.pci_mmconfig_base = 0xfd700000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
-			.pci_domain = 0,
+			.pci_domain = 1,
 
 			.arm = {
 				.gic_version = 3,
@@ -68,7 +68,8 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+		/* IVSHMEM shared memory region (virtio-blk back-end) */
+		{
 			.phys_start = 0xfd900000,
 			.virt_start = 0xfd900000,
 			.size = 0x1000,
@@ -77,24 +78,53 @@ struct {
 		{
 			.phys_start = 0xfd901000,
 			.virt_start = 0xfd901000,
+			.size = 0xdf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{ 0 },
+		{ 0 },
+		/* IVSHMEM shared memory region (virtio-con back-end) */
+		{
+			.phys_start = 0xfd9e0000,
+			.virt_start = 0xfd9e0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd9e1000,
+			.virt_start = 0xfd9e1000,
+			.size = 0xf000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{ 0 },
+		{ 0 },
+		/* IVHSMEM shared memory region for 00:00.0 (demo )*/ {
+			.phys_start = 0xfd9f0000,
+			.virt_start = 0xfd9f0000,
+			.size = 0x1000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
+		{
+			.phys_start = 0xfd9f1000,
+			.virt_start = 0xfd9f1000,
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
 		},
 		{
-			.phys_start = 0xfd90a000,
-			.virt_start = 0xfd90a000,
+			.phys_start = 0xfd9fa000,
+			.virt_start = 0xfd9fa000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE ,
 		},
 		{
-			.phys_start = 0xfd90c000,
-			.virt_start = 0xfd90c000,
+			.phys_start = 0xfd9fc000,
+			.virt_start = 0xfd9fc000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
 		{
-			.phys_start = 0xfd90e000,
-			.virt_start = 0xfd90e000,
+			.phys_start = 0xfd9fe000,
+			.virt_start = 0xfd9fe000,
 			.size = 0x2000,
 			.flags = JAILHOUSE_MEM_READ,
 		},
@@ -167,22 +197,44 @@ struct {
 	},
 
 	.pci_devices = {
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 2 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 0,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
+				VIRTIO_DEV_BLOCK,
+		},
+		{
+			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
+			.domain = 1,
+			.bdf = 3 << 3,
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
+			.shmem_regions_start = 4,
+			.shmem_dev_id = 0,
+			.shmem_peers = 2,
+			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK +
+				VIRTIO_DEV_CONSOLE,
+		},
 		{ /* IVSHMEM 0000:00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
+			.shmem_regions_start = 8,
 			.shmem_dev_id = 0,
 			.shmem_peers = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 		{ /* IVSHMEM 0000:00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 5,
+			.shmem_regions_start = 13,
 			.shmem_dev_id = 0,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210323062536.3888-4-peng.fan%40nxp.com.
