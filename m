Return-Path: <jailhouse-dev+bncBAABBLMO6SAAMGQENCKO7DY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FBC310710
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Feb 2021 09:51:58 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id a5sf5222978ljp.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Feb 2021 00:51:58 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612515117; cv=pass;
        d=google.com; s=arc-20160816;
        b=fHjQI4b6zumG/pNlxFVpDntlG/McJTStGGfe1JslOV0GZo5qPgYHUycNrHO6d5PnsX
         RtMy9OBgrv0udZKqMypQ45lINL1h6whgUOP62KZouze9LczNyKhyRJtGdM0hi6HkE27q
         lZ5xBi7W/HxLODGzfXy90ftOM+4nqmBmL2CskPcFulboo5ISDookQx/fEuqrYqs5gHcx
         K+Lslo1jttPUK1/E/2q/eZi389sr5F+zYAqej2CNaMEHBtlQcga/QqDAZn4GCxcHS7D0
         DsFN6yxSf1dFCYWBFOV79zQHVZU+KKwH1dTv/3aSt4R47Y5FqSDE3ASoz/lZp9LTPayB
         1GLQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=CZMSSwAbpo+kyXnCe6N/bpeOFAXsvnB2PNB89lgkbDk=;
        b=G7y75rryPwg7Hzk+FMHof0PZGLsID8nCtF+4gXCpq4uqArs3UkgRdBamPF7f8LOzDf
         vE85FLQHbMZKtz/FrbQH5mCLTKjqbv6HHYcO1atNd5SjL9MCUl8hphiqu2/kHo0A5pMw
         Cr4LBAz1qaWqY0rdqSBrWM1Ptlb+xBQy+a+HOreif5kk2RXO8dg40cIM43WcokO5bFfd
         wddFJsxXr4jKQrfSBe7g9HQyMPxqRkAVPim7pyYQqj/RY+BFcp6Yyoai2o37anwC9SWu
         2v2RA0ggwglfZqQuF8bTxEBo2tx+wUM2fJCclHO0R9PYEZx6QeUAzn+Mkxm6Vn/lhyH+
         W1tQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EnAw+mTs;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.54 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CZMSSwAbpo+kyXnCe6N/bpeOFAXsvnB2PNB89lgkbDk=;
        b=QiKlQ83BzmdX8PuE/PSzpjKfrXaSZ8LBhgPWqSBbP4wNzQIAMw/O3gf7htiI5bS47J
         6hJHV2RHno51jbVF9H4NWQLtjst7IH/BDJNPUvLa7GiYyhLxg4RgGhE8ofaKSHVj6m6w
         n/ymWLiX/Zd0VngGaOnfrvCyyjurqeADqvI9TYBUJQvD0zlxLa4decr6YWRmpu6jLj5F
         s0/HM3gmf5uKf8di/Ufd4/5QIXrPr0n5mQfz3s8f5eH3vLGzMY5ICKPhWC/FhuzcX9TK
         BwrSE7IcMLqICEW0vxgzh224NC4CUnSCMCuXSdFj1grMkvD4wgHM4KaH1rCX7DD7f4cu
         83ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CZMSSwAbpo+kyXnCe6N/bpeOFAXsvnB2PNB89lgkbDk=;
        b=avChZ3v1Uc56YMsMsjqMIAdygqyRNkh+IGiJZhSTsy8F2QsxS0HS+0LRYvnnVLhv64
         ZL6DMAQvcgR2hgtO1Io3Eafp0COsLycVNAqtVbwR6yXXzlaOqHZnznK14twNg6sDJUuL
         Wfd6XgGV+Qv1Z5iFNJ5VMjeWjJNzV29qmgia2wpdSVg35sFtgsgaRuwD6ca50I3/ABUQ
         1m6sA3s90dD1VtqDQ242X+jLf37MiPqnE0E+7Ut6/ogrQTTL2jOe3PKJ4YgFcn0gV/l1
         n3rpI12+76g8tL4Qpj3Lra8Necozs3Gj90Cowy+lesXz1zAdVpMt6nGok35iyruk31mq
         i/vQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533MW6EBlpJpEl1gmBPetuVh28Q9KT1QFpjj8WeGHgvJMaw+w7aS
	1y+Dw5cs7fAKruMQF+sdcM8=
X-Google-Smtp-Source: ABdhPJxPNNaxdfS2DCizX6cMkE2JE4Nu4Phety3Jk9MkvffKoOQWK6mL/k44m9CTwXOrCDuYIk/6gA==
X-Received: by 2002:ac2:4349:: with SMTP id o9mr2165963lfl.415.1612515117737;
        Fri, 05 Feb 2021 00:51:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5519:: with SMTP id j25ls1840739lfk.2.gmail; Fri, 05 Feb
 2021 00:51:56 -0800 (PST)
X-Received: by 2002:a05:6512:214a:: with SMTP id s10mr1904061lfr.225.1612515116846;
        Fri, 05 Feb 2021 00:51:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612515116; cv=pass;
        d=google.com; s=arc-20160816;
        b=eMvt+SEape52ks6RzjswO2Y9DLB/8DUqo2J6lpjKb6Yo1KKEpQ8UmwdZhs5xSXIjMo
         LdRb9IYLdb7TLF/IbXIUVWc9O/jjf3W4/oLTdD08bmjZYDzo0INrXmmvB9xGhcxZD3rk
         T7774gkyDX0pcTt7SkFq6T9Vv5aIQ2bdyMO1CiaUE/tbRE3XdEbvrQQCaA4UcW9abi4e
         3Teo6oxSJxoB8AxfUIJGK6gltP0Ec/Gpn+2EXc9zJXz2mIfFxt1nNYtiZWrE7rImpHa2
         Ii1xkuoNBER1ZikeCf0DsYDzbKYfrF6JReojaDPD7/XcqOb8rhG4qDgNXAH8UHghZc5T
         WRQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IWfIhMdgNhfKEGHlDsR466ltSIlnsPtMlcN2KWMSDb4=;
        b=MxWQTk50K8A9pP7VRIyeEPldKSfYGZd5+LrgT6ZvCnSkhEo0BU1MnK4atZUG2HvZYV
         HBkqKPSMRr2V8foX5cUO8DXFDgFOAp/m1UADSFCDLGiPlODEL948ZUpiXHFjWHucJfJi
         SvhaiVZ18lIi6I81icOn0b7W7MD2d06Ryi+dZMjBu6Kq5OgDGYOOr1dS4T2imyvk4K9q
         i4xDhSyv/2xsTsb6Wc2kvCsu8teBOHeoXT/Q191Tr1fmDiUng/S238kfbzBHyM5HSsEO
         Lg+l6RfpWPXF6Yav4OKWt0XH2M+G7Tynq/L/qj+iqpyekNcXQ6sYGxiq6WtJbHJKNIRt
         ftBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=EnAw+mTs;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.54 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com. [40.107.22.54])
        by gmr-mx.google.com with ESMTPS id i190si336523lfi.8.2021.02.05.00.51.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2021 00:51:56 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.54 as permitted sender) client-ip=40.107.22.54;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgoeP2NebMzUOOLvqKeYYCpL6eG34Q1OjsMoMM4R6X8wgSse+ocs+dwKSSKA+ZvpugFdqKCITZrsDjAT0+5Yl65Bygw5ngiBB0wgeB82BByuzpvNEDfDFQLzpxKfrJYGSjv7Cv86s8qeVO5Gn0CTQR9cffmHYfdaw4IbghS8LEYhlHZYQRv4podEWm8MotW1k95d1yr603CLX2lL/nvn550/WNVnhLM4a/M4Q52hOGb7/2FHd4Gut6CPGk5rnfYQ5UCDUXoIBR+MR9F8rHyItTkRJC6XFA/HzFolAiYufC140DNuucSEf416+e4JvcuqY7W92M65z3tkkDGO0LdCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWfIhMdgNhfKEGHlDsR466ltSIlnsPtMlcN2KWMSDb4=;
 b=ITUu9RrwpzjDNkZNhThTfLRm+j6c7B3h03WLR9xqZF3VrIWLfJcai1j4w11d0TW4Kd18OZi0cllg1JNNx9od+dq9nhjZq6jmbP8vEmBmBZcIPnDC77gMD9tx2N5S+/DQNTsTCNaLbUXpy+GKrdNAgAErL0bcDlZnV99HHn9UqUw9z3pg7LDDaaDS45oEsALd2N04/9D5ZLG+V78gyqEkzcmmfTKipOoymwSZmyQt+Q1CL62zkzL1NVtmawlgF9+ohE98VkuR8Xrd8PD8+ULmFPZO6qKz4lUbn3cqgSPLx4rOBWE5K0H2NwDeZrsF7fx0SaQISy7nR9IcxDvqCzta9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB7069.eurprd04.prod.outlook.com (2603:10a6:800:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 08:51:55 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3825.024; Fri, 5 Feb 2021
 08:51:55 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	xiaobo.xie@nxp.com,
	jiafei.pan@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v2 2/3] configs: ls1043a-rdb: add DPAA support in linux inmate dts demo
Date: Fri,  5 Feb 2021 16:55:08 +0800
Message-Id: <20210205085509.21595-3-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205085509.21595-1-hongbo.wang@nxp.com>
References: <20210205085509.21595-1-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR01CA0161.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::17) To VI1PR04MB5677.eurprd04.prod.outlook.com
 (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR01CA0161.apcprd01.prod.exchangelabs.com (2603:1096:4:28::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 08:51:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3279de58-dd5e-4b92-496d-08d8c9b349f3
X-MS-TrafficTypeDiagnostic: VI1PR04MB7069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB706926A33AF582686B2B84B8E1B29@VI1PR04MB7069.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LClcRo9RvWusuLbuZoOl7stgwTGt2Z0zJES6b1z9ZN+feBTigC4Fz+ZyWdDW6TO20vSd9xXVM/0+sjIpBhmcWzsMtOQVplXYEfTGV4YlVo/gEZwSlaxChGOGceChGMihq9e1bO+rndn6kWAM52/qc7qw4Pu79NldVfPHDzjQf/RQvO1HV6kI1RAfiegClAXBm6nR5XTTr/EyVONhu+hSsFTVsMbo9PY4ywiMZYf9TaDRG5PNZG3HwgXFg2JCOO5w5Il4dfaCCu83/p2n+PA1VhEIz+SjXHWUkY6bJ7V6vU6WYouysdiBCznUQE4AOSeth67r/d1iWJxF+ZyDFLQXajaPkOnqaBljHGbmEbgMaPlal+mcudTjAG4BJH3BdH7FywMBPJKzQ2TpXdWrjYc64XHu7Kvox5QRbjA4jo+g16VEgxl0Oi1h6HfQVqLmH3ucX/hfTEmurTgw2PZ3wpaqatMm6OCHdhqYV9ZJe4ZJJUdS06O9FPzIKi1sgrzegR/WEnNUWGtNTZ0BA0BXWW5GEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(9686003)(2616005)(8676002)(186003)(956004)(2906002)(1076003)(86362001)(26005)(52116002)(66556008)(6512007)(6666004)(5660300002)(30864003)(316002)(66946007)(6506007)(8936002)(36756003)(66476007)(83380400001)(478600001)(6486002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Q3rOd85BG6eOv+3yiWuvhLy3tjPb7oH+cap3utr9qSIfiLc7wJrW287Uooc/?=
 =?us-ascii?Q?iWOhD7FcQSI20IgP3PogqdTQCTpDYf/eh5EoB5lCvpXv6+G3wURZ63bYvB3B?=
 =?us-ascii?Q?pIPjQA+7B7860pGB5rsukhVZ5efLhTdqYFh4umcvAepX9WC9Rp1c0QQ3MgZ/?=
 =?us-ascii?Q?K6omGj2J5br4ovDHCteS9Q+YdYhA78wEQ56Rs42wYQ4LLUjUuq5hdypZx839?=
 =?us-ascii?Q?TBUbI4+h4PUs4N4SnDT8GFwDGPSASxyGWC0Lujx0bcTIPLRP56aG2Wv54JCJ?=
 =?us-ascii?Q?9uDoDN1F8j4S/MKtPZ2ZNndM1ntCaX7bL7YpQaajuA1Up71D7mfnPLyZyQcX?=
 =?us-ascii?Q?y5TK+4cEYY36SUUnugWuzDcmOSaL7azDraGK/bfr+aoAEcRCKH9xcD22Rk/r?=
 =?us-ascii?Q?7hqQ8eBc2fvj+aq3+xIzQJAfeH5228O1YVdcV5TpdG6k7FKHguvhLBcpZJVA?=
 =?us-ascii?Q?7QOl6fjugAo7bHLzDt0qNNR1ph2VkgeoRDtoD4NhNSdOoe1O5nQjW0WGxRcR?=
 =?us-ascii?Q?SiZqnfiEA0rtTwlcAxUr83isosey8BVSNu6lmSpmrx0VaQoeCRiHQwfxg4Gx?=
 =?us-ascii?Q?VZ9tFPncAYAwmUe0rRZGenyjQHtkiMmiJtTHAOoO7V+V5u7byN+zRWpNNPmn?=
 =?us-ascii?Q?x0gzYP9z5h/1o7UXIMkYWS0RpogmhDVjfjdCWGUcqJbCPpbGe4El4844iPP/?=
 =?us-ascii?Q?4Eb1P2Ofw7QRC+qLSFg0M6j5CX1vC+Ol31HjbBNJgM1DhJnY13DkeNUmoIEh?=
 =?us-ascii?Q?OvIay2juKOFKbG4CkCG+7koLXPEaToSecRaxIryWuJEKZkn5AL26CbpNct2P?=
 =?us-ascii?Q?CP6mo8qEUa0BWGUYnV19AG6ofkhEYfaO0W4tZ8EV4Bh6If15Dox3b9obTEhZ?=
 =?us-ascii?Q?n5Px14OvnEoIpvVWLOdTAq2Lj2Oe3nuU8MHOu44fXiYWnAXOB2eAK+aT7C2H?=
 =?us-ascii?Q?TfHTp03ZAFefBOIAk7Ji9hc0gHWujtqt0T6SbWa8tTMCM7vUUBPf672E1QLm?=
 =?us-ascii?Q?erlELe5F+oqIlZSXN36UO+UTiGc7qUHvVElB1bOwwlIyAM7uMV0eIVUO6g2j?=
 =?us-ascii?Q?8GZZDN+ugRiNQkPYhDtdWF6y6SogD0VAK+bc0hLs5A5cClzErirYRbeLs7ZS?=
 =?us-ascii?Q?NrrCglQr9QsxtxXCJzGI7ZVPQ/dXRsoNSJILFudjyPAbjX9jN6SExor5cHKb?=
 =?us-ascii?Q?Mk+MjqkmjkU643kDZAdOEhUjMM4x0BtZ0/nJvsrhiHJbzFNpcmNK2PJ1S7rc?=
 =?us-ascii?Q?5m/86W6i+Wz4ulpqHjvjImPNSExnRATn/pSEWYgeiWMxE/ggDWzz/gpMGRZM?=
 =?us-ascii?Q?NVRJmRRDCVYDi11eR45UGpNr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3279de58-dd5e-4b92-496d-08d8c9b349f3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:51:55.4792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ne0OtvNf0f+o4IztILhphMQTdHWZxvs6FhA/yZuHgpUfpNnTMF+xorThBkMEi9q726AJlKl8j2pU5hwZEqug1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7069
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=EnAw+mTs;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.22.54 as permitted sender)
 smtp.mailfrom=hongbo.wang@nxp.com;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

From: "hongbo.wang" <hongbo.wang@nxp.com>

  if user want to non-root linux can connect ethernet or cloud
via DPAA ports, and need high performance, should choose this dts.

  this file will include inmate-ls1043a-rdb-fman-ucode.dtsi
  the related config file is ls1043a-rdb-dpaa-linux-demo.c

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
---
 configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts | 930 ++++++++++++++++++
 1 file changed, 930 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts

diff --git a/configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts b/configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts
new file mode 100644
index 00000000..34629a41
--- /dev/null
+++ b/configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts
@@ -0,0 +1,930 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree for inmate cell on NXP ls1043a RDB platform
+ *
+ * Copyright 2020 NXP
+ *
+ *  hongbo.wang <hongbo.wang@nxp.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "fsl,ls1043a-rdb", "fsl,ls1043a";
+	model = "LS1043A RDB Board";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	hypervisor {
+		compatible = "jailhouse,cell";
+	};
+
+	aliases {
+		serial0 = &duart1;
+		fman0 = &fman0;
+		ethernet0 = &enet0;
+		ethernet1 = &enet1;
+		ethernet2 = &enet2;
+		ethernet3 = &enet3;
+		ethernet4 = &enet4;
+		ethernet5 = &enet5;
+		ethernet6 = &enet6;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PH20>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			clocks = <&clockgen 1 0>;
+			next-level-cache = <&l2>;
+			cpu-idle-states = <&CPU_PH20>;
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
+		CPU_PH20: cpu-ph20 {
+			compatible = "arm,idle-state";
+			idle-state-name = "PH20";
+			arm,psci-suspend-param = <0x0>;
+			entry-latency-us = <1000>;
+			exit-latency-us = <1000>;
+			min-residency-us = <3000>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bman_fbpr: bman-fbpr {
+			compatible = "shared-dma-pool";
+			size = <0 0x1000000>;
+			alignment = <0 0x1000000>;
+			no-map;
+		};
+
+		qman_fqd: qman-fqd {
+			compatible = "shared-dma-pool";
+			size = <0 0x400000>;
+			alignment = <0 0x400000>;
+			no-map;
+		};
+
+		qman_pfdr: qman-pfdr {
+			compatible = "shared-dma-pool";
+			size = <0 0x2000000>;
+			alignment = <0 0x2000000>;
+			no-map;
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
+	reboot {
+		compatible ="syscon-reboot";
+		regmap = <&dcfg>;
+		offset = <0xb0>;
+		mask = <0x02>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 13 0xf08>, /* Physical Secure PPI */
+			     <1 14 0xf08>, /* Physical Non-Secure PPI */
+			     <1 11 0xf08>, /* Virtual PPI */
+			     <1 10 0xf08>; /* Hypervisor PPI */
+	};
+
+	gic: interrupt-controller@1410000 {
+		compatible = "arm,gic-400";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x1410000 0 0x10000>, /* GICD */
+		      <0x0 0x142f000 0 0x1000>, /* GICC */
+		      <0x0 0x1440000 0 0x20000>, /* GICH */
+		      <0x0 0x146f000 0 0x1000>; /* GICV */
+		interrupts = <1 9 0xf08>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		dma-ranges = <0x0 0x0 0x0 0x0 0x10000 0x00000000>;
+
+
+		ddr: memory-controller@1080000 {
+			compatible = "fsl,qoriq-memory-controller";
+			reg = <0x0 0x1080000 0x0 0x1000>;
+			interrupts = <0 144 0x4>;
+			big-endian;
+			dma-coherent;
+		};
+
+
+		dcfg: dcfg@1ee0000 {
+			compatible = "fsl,ls1043a-dcfg", "syscon";
+			reg = <0x0 0x1ee0000 0x0 0x1000>;
+			big-endian;
+			dma-coherent;
+		};
+
+		clockgen: clocking@1ee1000 {
+			compatible = "fsl,ls1043a-clockgen";
+			reg = <0x0 0x1ee1000 0x0 0x1000>;
+			#clock-cells = <2>;
+			clocks = <&sysclk>;
+			dma-coherent;
+		};
+
+		duart1: serial@21c0600 {
+			compatible = "fsl,ns16550", "ns16550a";
+			reg = <0x00 0x21c0600 0x0 0x100>;
+			clocks = <&clockgen 4 0>;
+			status = "okay";
+			dma-coherent;
+		};
+
+		qman: qman@1880000 {
+			compatible = "fsl,qman";
+			reg = <0x0 0x1880000 0x0 0x10000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&qman_fqd &qman_pfdr>;
+			dma-coherent;
+			clock-frequency = <400000000>;
+		};
+
+		bman: bman@1890000 {
+			compatible = "fsl,bman";
+			reg = <0x0 0x1890000 0x0 0x10000>;
+			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			memory-region = <&bman_fbpr>;
+			dma-coherent;
+		};
+
+		bportals: bman-portals@508000000 {
+			ranges = <0x0 0x5 0x08000000 0x8000000>;
+			dma-coherent;
+		};
+
+		qportals: qman-portals@500000000 {
+			ranges = <0x0 0x5 0x00000000 0x8000000>;
+			dma-coherent;
+		};
+
+		ptp_timer0: ptp-timer@1afe000 {
+			compatible = "fsl,fman-ptp-timer", "fsl,fman-rtc";
+			reg = <0x0 0x1afe000 0x0 0x1000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clockgen 3 0>;
+			dma-coherent;
+		};
+
+		/* fman3-0 */
+		fman0: fman@1a00000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			cell-index = <0>;
+			compatible = "fsl,fman";
+			ranges = <0x0 0x0 0x1a00000 0xfe000>;
+			reg = <0x0 0x1a00000 0x0 0xfe000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clockgen 3 0>;
+			clock-names = "fmanclk";
+			fsl,qman-channel-range = <0x800 0x10>;
+			ptimer-handle = <&ptp_timer0>;
+			dma-coherent;
+
+			cc {
+				compatible = "fsl,fman-cc";
+			};
+
+			muram@0 {
+				compatible = "fsl,fman-muram";
+				reg = <0x0 0x60000>;
+			};
+
+			bmi@80000 {
+				compatible = "fsl,fman-bmi";
+				reg = <0x80000 0x400>;
+			};
+
+			qmi@80400 {
+				compatible = "fsl,fman-qmi";
+				reg = <0x80400 0x400>;
+			};
+
+			fman0_oh1: port@82000 {
+				cell-index = <0>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x82000 0x1000>;
+				fsl,qman-channel-id = <0x809>;
+			};
+
+			fman0_oh2: port@83000 {
+				cell-index = <1>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x83000 0x1000>;
+				fsl,qman-channel-id = <0x80a>;
+			};
+
+			fman0_oh3: port@84000 {
+				cell-index = <2>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x84000 0x1000>;
+				fsl,qman-channel-id = <0x80b>;
+			};
+
+			fman0_oh4: port@85000 {
+				cell-index = <3>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x85000 0x1000>;
+				fsl,qman-channel-id = <0x80c>;
+			};
+
+			fman0_oh5: port@86000 {
+				cell-index = <4>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x86000 0x1000>;
+				fsl,qman-channel-id = <0x80d>;
+			};
+
+			fman0_oh6: port@87000 {
+				cell-index = <5>;
+				compatible = "fsl,fman-port-oh";
+				reg = <0x87000 0x1000>;
+				fsl,qman-channel-id = <0x80e>;
+			};
+
+			policer@c0000 {
+				compatible = "fsl,fman-policer";
+				reg = <0xc0000 0x1000>;
+			};
+
+			keygen@c1000 {
+				compatible = "fsl,fman-keygen";
+				reg = <0xc1000 0x1000>;
+			};
+
+			dma@c2000 {
+				compatible = "fsl,fman-dma";
+				reg = <0xc2000 0x1000>;
+			};
+
+			fpm@c3000 {
+				compatible = "fsl,fman-fpm";
+				reg = <0xc3000 0x1000>;
+			};
+
+			parser@c7000 {
+				compatible = "fsl,fman-parser";
+				reg = <0xc7000 0x1000>;
+			};
+
+			vsps@dc000 {
+				compatible = "fsl,fman-vsps";
+				reg = <0xdc000 0x1000>;
+			};
+
+			mdio0: mdio@fc000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xfc000 0x1000>;
+			};
+
+			xmdio0: mdio@fd000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xfd000 0x1000>;
+			};
+
+			/* fman3-0-1g-0 */
+			fman0_rx_0x08: port@88000 {
+				cell-index = <0x8>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x88000 0x1000>;
+			};
+
+			fman0_tx_0x28: port@a8000 {
+				cell-index = <0x28>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xa8000 0x1000>;
+				fsl,qman-channel-id = <0x802>;
+			};
+
+			ethernet@e0000 {
+				cell-index = <0>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe0000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x08 &fman0_tx_0x28>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy0>;
+			};
+
+			mdio@e1000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe1000 0x1000>;
+
+				pcsphy0: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-1 */
+			fman0_rx_0x09: port@89000 {
+				cell-index = <0x9>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x89000 0x1000>;
+			};
+
+			fman0_tx_0x29: port@a9000 {
+				cell-index = <0x29>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xa9000 0x1000>;
+				fsl,qman-channel-id = <0x803>;
+			};
+
+			ethernet@e2000 {
+				cell-index = <1>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe2000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x09 &fman0_tx_0x29>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy1>;
+			};
+
+			mdio@e3000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe3000 0x1000>;
+
+				pcsphy1: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-2 */
+			fman0_rx_0x0a: port@8a000 {
+				cell-index = <0xa>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x8a000 0x1000>;
+			};
+
+			fman0_tx_0x2a: port@aa000 {
+				cell-index = <0x2a>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xaa000 0x1000>;
+				fsl,qman-channel-id = <0x804>;
+			};
+
+			ethernet@e4000 {
+				cell-index = <2>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe4000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x0a &fman0_tx_0x2a>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy2>;
+			};
+
+			mdio@e5000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe5000 0x1000>;
+
+				pcsphy2: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-3 */
+			fman0_rx_0x0b: port@8b000 {
+				cell-index = <0xb>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x8b000 0x1000>;
+			};
+
+			fman0_tx_0x2b: port@ab000 {
+				cell-index = <0x2b>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xab000 0x1000>;
+				fsl,qman-channel-id = <0x805>;
+			};
+
+			ethernet@e6000 {
+				cell-index = <3>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe6000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x0b &fman0_tx_0x2b>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy3>;
+			};
+
+			mdio@e7000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe7000 0x1000>;
+
+				pcsphy3: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-4 */
+			fman0_rx_0x0c: port@8c000 {
+				cell-index = <0xc>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x8c000 0x1000>;
+			};
+
+			fman0_tx_0x2c: port@ac000 {
+				cell-index = <0x2c>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xac000 0x1000>;
+				fsl,qman-channel-id = <0x806>;
+			};
+
+			ethernet@e8000 {
+				cell-index = <4>;
+				compatible = "fsl,fman-memac";
+				reg = <0xe8000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x0c &fman0_tx_0x2c>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy4>;
+			};
+
+			mdio@e9000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xe9000 0x1000>;
+
+				pcsphy4: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-1g-5 */
+			fman0_rx_0x0d: port@8d000 {
+				cell-index = <0xd>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-1g-rx";
+				reg = <0x8d000 0x1000>;
+			};
+
+			fman0_tx_0x2d: port@ad000 {
+				cell-index = <0x2d>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-1g-tx";
+				reg = <0xad000 0x1000>;
+				fsl,qman-channel-id = <0x807>;
+			};
+
+			ethernet@ea000 {
+				cell-index = <5>;
+				compatible = "fsl,fman-memac";
+				reg = <0xea000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x0d &fman0_tx_0x2d>;
+				ptp-timer = <&ptp_timer0>;
+				pcsphy-handle = <&pcsphy5>;
+			};
+
+			mdio@eb000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xeb000 0x1000>;
+
+				pcsphy5: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+
+			/* fman3-0-10g-0 */
+			fman0_rx_0x10: port@90000 {
+				cell-index = <0x10>;
+				compatible = "fsl,fman-v3-port-rx", "fsl,fman-port-10g-rx";
+				reg = <0x90000 0x1000>;
+				fsl,fman-10g-port;
+			};
+
+			fman0_tx_0x30: port@b0000 {
+				cell-index = <0x30>;
+				compatible = "fsl,fman-v3-port-tx", "fsl,fman-port-10g-tx";
+				reg = <0xb0000 0x1000>;
+				fsl,fman-10g-port;
+				fsl,qman-channel-id = <0x800>;
+			};
+
+			ethernet@f0000 {
+				cell-index = <0x8>;
+				compatible = "fsl,fman-memac";
+				reg = <0xf0000 0x1000>;
+				fsl,fman-ports = <&fman0_rx_0x10 &fman0_tx_0x30>;
+				pcsphy-handle = <&pcsphy6>;
+			};
+
+			mdio@f1000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,fman-memac-mdio", "fsl,fman-xmdio";
+				reg = <0xf1000 0x1000>;
+
+				pcsphy6: ethernet-phy@0 {
+					reg = <0x0>;
+				};
+			};
+		};
+
+		fsldpaa: fsl,dpaa {
+			compatible = "fsl,ls1043a-dpaa", "simple-bus", "fsl,dpaa";
+			dma-coherent;
+			ethernet@0 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet0>;
+				dma-coherent;
+			};
+			ethernet@1 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet1>;
+				dma-coherent;
+			};
+			ethernet@2 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet2>;
+				dma-coherent;
+			};
+			ethernet@3 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet3>;
+				dma-coherent;
+			};
+			ethernet@4 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet4>;
+				dma-coherent;
+			};
+			ethernet@5 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet5>;
+				dma-coherent;
+			};
+			ethernet@8 {
+				compatible = "fsl,dpa-ethernet";
+				fsl,fman-mac = <&enet6>;
+				dma-coherent;
+			};
+		};
+
+	};
+
+	pci@c0700000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 2 &gic GIC_SPI 29 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 3 &gic GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 4 &gic GIC_SPI 31 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0xc0700000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+};
+
+&qportals {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "simple-bus";
+
+	qportal0: qman-portal@0 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x0 0x4000>, <0x4000000 0x4000>;
+		interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <0>;
+	};
+
+	qportal1: qman-portal@10000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x10000 0x4000>, <0x4010000 0x4000>;
+		interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <1>;
+	};
+
+	qportal2: qman-portal@20000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x20000 0x4000>, <0x4020000 0x4000>;
+		interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <2>;
+	};
+
+	qportal3: qman-portal@30000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x30000 0x4000>, <0x4030000 0x4000>;
+		interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <3>;
+	};
+
+	qportal4: qman-portal@40000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x40000 0x4000>, <0x4040000 0x4000>;
+		interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <4>;
+	};
+
+	qportal5: qman-portal@50000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x50000 0x4000>, <0x4050000 0x4000>;
+		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <5>;
+	};
+
+	qportal6: qman-portal@60000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x60000 0x4000>, <0x4060000 0x4000>;
+		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <6>;
+	};
+
+	qportal7: qman-portal@70000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x70000 0x4000>, <0x4070000 0x4000>;
+		interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <7>;
+	};
+
+	qportal8: qman-portal@80000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x80000 0x4000>, <0x4080000 0x4000>;
+		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <8>;
+	};
+
+	qportal9: qman-portal@90000 {
+		compatible = "fsl,qman-portal-3.2.0", "fsl,qman-portal";
+		reg = <0x90000 0x4000>, <0x4090000 0x4000>;
+		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <9>;
+	};
+
+	qman-fqids@0 {
+		compatible = "fsl,fqid-range";
+		fsl,fqid-range = <256 256>;
+	};
+
+	qman-fqids@1 {
+		compatible = "fsl,fqid-range";
+		fsl,fqid-range = <32768 32768>;
+	};
+
+	qman-pools@0 {
+		compatible = "fsl,pool-channel-range";
+		fsl,pool-channel-range = <0x401 0xf>;
+	};
+
+	qman-cgrids@0 {
+		compatible = "fsl,cgrid-range";
+		fsl,cgrid-range = <0 256>;
+	};
+
+	qman-ceetm@0 {
+		compatible = "fsl,qman-ceetm";
+		fsl,ceetm-lfqid-range = <0xf00000 0x1000>;
+		fsl,ceetm-sp-range = <0 16>;
+		fsl,ceetm-lni-range = <0 8>;
+		fsl,ceetm-channel-range = <0 32>;
+	};
+};
+
+&bportals {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "simple-bus";
+
+	bman-portal@0 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x0 0x4000>, <0x4000000 0x4000>;
+		interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <0>;
+	};
+
+	bman-portal@10000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x10000 0x4000>, <0x4010000 0x4000>;
+		interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <1>;
+	};
+
+	bman-portal@20000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x20000 0x4000>, <0x4020000 0x4000>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <2>;
+	};
+
+	bman-portal@30000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x30000 0x4000>, <0x4030000 0x4000>;
+		interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <3>;
+	};
+
+	bman-portal@40000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x40000 0x4000>, <0x4040000 0x4000>;
+		interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <4>;
+	};
+
+	bman-portal@50000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x50000 0x4000>, <0x4050000 0x4000>;
+		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <5>;
+	};
+
+	bman-portal@60000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x60000 0x4000>, <0x4060000 0x4000>;
+		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <6>;
+	};
+
+	bman-portal@70000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x70000 0x4000>, <0x4070000 0x4000>;
+		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <7>;
+	};
+
+	bman-portal@80000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x80000 0x4000>, <0x4080000 0x4000>;
+		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <8>;
+	};
+
+	bman-portal@90000 {
+		compatible = "fsl,bman-portal-2.1.3", "fsl,bman-portal";
+		reg = <0x90000 0x4000>, <0x4090000 0x4000>;
+		interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+		cell-index = <9>;
+	};
+
+	bman-bpids@0 {
+		compatible = "fsl,bpid-range";
+		fsl,bpid-range = <32 32>;
+	};
+};
+
+&fman0 {
+	fsl,erratum-a050385;
+	compatible = "fsl,fman", "simple-bus";
+
+	/* these aliases provide the FMan ports mapping */
+	enet0: ethernet@e0000 {
+		phy-handle = <&qsgmii_phy1>;
+		phy-connection-type = "qsgmii";
+		local-mac-address = [0e 09 00 01 03 05];
+	};
+
+	enet1: ethernet@e2000 {
+		phy-handle = <&qsgmii_phy2>;
+		phy-connection-type = "qsgmii";
+		local-mac-address = [0e 09 00 01 03 06];
+	};
+
+	enet2: ethernet@e4000 {
+		phy-handle = <&rgmii_phy1>;
+		phy-connection-type = "rgmii-txid";
+		local-mac-address = [0e 09 00 01 03 07];
+	};
+
+	enet3: ethernet@e6000 {
+		phy-handle = <&rgmii_phy2>;
+		phy-connection-type = "rgmii-txid";
+		local-mac-address = [0e 09 00 01 03 08];
+	};
+
+	enet4: ethernet@e8000 {
+		phy-handle = <&qsgmii_phy3>;
+		phy-connection-type = "qsgmii";
+		local-mac-address = [0e 09 00 01 03 09];
+	};
+
+	enet5: ethernet@ea000 {
+		phy-handle = <&qsgmii_phy4>;
+		phy-connection-type = "qsgmii";
+		local-mac-address = [0e 09 00 01 03 0a];
+	};
+
+	enet6: ethernet@f0000 { /* 10GEC1 */
+		phy-handle = <&aqr105_phy>;
+		phy-connection-type = "xgmii";
+		local-mac-address = [0e 09 00 01 03 04];
+	};
+
+	mdio@fc000 {
+		rgmii_phy1: ethernet-phy@1 {
+			reg = <0x1>;
+		};
+
+		rgmii_phy2: ethernet-phy@2 {
+			reg = <0x2>;
+		};
+
+		qsgmii_phy1: ethernet-phy@4 {
+			reg = <0x4>;
+		};
+
+		qsgmii_phy2: ethernet-phy@5 {
+			reg = <0x5>;
+		};
+
+		qsgmii_phy3: ethernet-phy@6 {
+			reg = <0x6>;
+		};
+
+		qsgmii_phy4: ethernet-phy@7 {
+			reg = <0x7>;
+		};
+	};
+
+	mdio@fd000 {
+		aqr105_phy: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts = <0 132 4>;
+			reg = <0x1>;
+		};
+	};
+};
+
+&bman_fbpr {
+	compatible = "fsl,bman-fbpr";
+	alloc-ranges = <0 0 0x10000 0>;
+};
+&qman_fqd {
+	compatible = "fsl,qman-fqd";
+	alloc-ranges = <0 0 0x10000 0>;
+};
+&qman_pfdr {
+	compatible = "fsl,qman-pfdr";
+	alloc-ranges = <0 0 0x10000 0>;
+};
+
+&soc {
+	fman@1a00000 {
+#include "inmate-ls1043a-rdb-fman-ucode.dtsi"
+	};
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210205085509.21595-3-hongbo.wang%40nxp.com.
