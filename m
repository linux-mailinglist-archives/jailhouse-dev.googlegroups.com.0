Return-Path: <jailhouse-dev+bncBAABBBMO5GAAMGQESP7VPXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 716FC30D37A
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Feb 2021 07:47:34 +0100 (CET)
Received: by mail-ej1-x637.google.com with SMTP id jg11sf11524653ejc.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Feb 2021 22:47:34 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612334854; cv=pass;
        d=google.com; s=arc-20160816;
        b=SxrU8JXn74byVS42dsPdv3fYAyQjg/XSLSLeBT2hbU0J94EkyrbyEUj5+A/HAV/YAQ
         7Lv4KPCL2nd8RalqloJsk7FNFC+LmsfhT2er47JQnHLOUVByZA+OpFOUvYdillGjq9B0
         GkIgbCodWyAOKPMe8cwifBokJKHYUKcXEx6/9ra+zAPq+VQLNYjQH3ivdACK7t+pR93/
         Z7EYKCwTAdXIW3LQDMchSyrmux1iEcAYzZ6g1wR9gmjtd9Gc2llQaVTepOW0PtK1crSy
         AENZLRgL3Ti8SsRwpTLpqDfXzPBuhn5yMhuE3OkEJK0dqDhQiybZlcxtf8g7YcCnSCp8
         428w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=VzykPrCQE/zkRiArABK8XNSx8s+WbQlviRyt8A8bwTU=;
        b=XT9xfUcXM0A4Yi4Woh0bcNd+xgM5WOddBwLXoTZuEwTX7ahG+6Pgp91fJpzAra7qnP
         b7rWHoH+q/iKLoraE4SJp4d1yYLCTk4qExRQSDp0rAdARW+Fe/qJy1/auBHkeIXT2w2H
         wEyCLT/k6YfXCQ/WPqhfQi+IKLqAqp2gtExnAOQ3wNwPAvnQbMPHi9S6UdzB4XIz/ORM
         aEgwnpc3xNG6/rlQefM+SONo5PKJ+l7JaFD9Imk6p9QZBcWQDbCpLjdG4diwCMaJ9pgM
         qGWPlvK4H25A62xMFOYRySkAfXtsNwrKIfLV2Ddc8bEkWdx821w/2o/vX91PB8M8KuOq
         butQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NuInCRwh;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.44 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VzykPrCQE/zkRiArABK8XNSx8s+WbQlviRyt8A8bwTU=;
        b=WF4w4wdwzD1C4Tb1/f4iEPoMLhrf9Tzes4YvIA23H7spnTccX5VRd9JtQCE3o17xHu
         qf+w/h+pXJmhVw8KF/xY0y4XjDVIpN1rCIHAMF7hQi/WWnKx4S3qwU46ArKprifbAY1U
         Ba4T7BQnXUr11Xet7lRHJ3N7xtnGiNDIUShCTjSsJLBMZUW5C7C31oHcxaHgGA71cL8R
         Bep1hGNi9a9WNlgdRt7rg2PmjO3mtyNBFrFy8lLLy9dtFDLhYVju/YIs09YUKFQjqofH
         fbWKuyNjXj74Q+24L0JJyFBu126I0otjeoA7AQzJM4blINzivz7NVoEBJwYUFONjq2sE
         N8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VzykPrCQE/zkRiArABK8XNSx8s+WbQlviRyt8A8bwTU=;
        b=KlP1k/85HunRnQ0kgrw0yQNZTW9WaauhBtg0K/d9p6mcQC2jxKCl/UGuBGlhTD+PGg
         7erpoVJpxcdMnrSSgq72CWdL1KO9yvyvG3Fr6MioTz2j5i3iczAGdfl3PQhK2kPLOfNk
         vdIeGpcZ+TzBtf4UHf03DyhBhGZRXVTK7iaTJ7F7hfXzpJfKHpGafzctWxEXwt0RVvKX
         HkV1NaccAmd0AsL9UH1Sdbk1F6kTj8MuVg3wzHZo9mwTCFJdRkPMfCALEd6ZbrvGt44y
         PjLHJDzDFKs07HhrecElsiom7LOyGgYOykGI+GIoMsjsO1TPbvPBJjCbf6lNkQrmGlFE
         fd3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53378VL6JW2DamebBSWfr9u0J7wxQvRGD7XYJ9lxnYLlFyJYtm6N
	SHL3b55iAr27vXTrsuT6opg=
X-Google-Smtp-Source: ABdhPJz42msRa08ht2JqIYgDNzrllMJE/tRSSQS2kPA4V1bjWUSFaCZpMzlFx4Vkv8v1sRCCipkQCQ==
X-Received: by 2002:a17:906:a1c2:: with SMTP id bx2mr1827305ejb.138.1612334854229;
        Tue, 02 Feb 2021 22:47:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6a87:: with SMTP id p7ls656347ejr.10.gmail; Tue, 02
 Feb 2021 22:47:33 -0800 (PST)
X-Received: by 2002:a17:906:494c:: with SMTP id f12mr1798743ejt.56.1612334853461;
        Tue, 02 Feb 2021 22:47:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612334853; cv=pass;
        d=google.com; s=arc-20160816;
        b=lXMe3LWVH5U2hrq+EKFF5P1VhHE2mjp6k8JZUAE3JwgKcWBlfcrfsnGssS8srgF4ru
         7qe1P1+pJEYtoKsg2jjX841A0t6SEtn4t4m1osksPfVKLQT9POC8isaVwNQfhhfOhhhj
         9whVQg0RGTS+mz1rAo+a2Sk7lZZexU2hvE252Pd05NK3doheBGKMxvRyWQE8yINfqxvE
         HzUs9aBXQJDSsgcR16tNO+iy3Mni3zcvhAPHk1J7InXrvgiDGOwmFSvBPAoLLpv62iLr
         HPgkpOPH6/OG4ZdNTAyfWbNH1vTqZR+66vP8gnr9IghJJzcsoweSROI2NUe8z2Nq73mn
         WLwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iHMw91D532h3oHpWMKdQeAjMWvPPrCWFo5gdiJxrAzE=;
        b=fds3Xj2Bc/i/4v7ojJVntDJwAYVST4r9rznwS56EpDoSTd6Su6MdRpKmb/gjRZS6p1
         bOgyFYmNNQPawtCD/0eDeRboYh856FweKy/lgVxFEtwrzuN5kchLkPgS24iJvqioweMB
         Sf+mYvAy6TeRLVIy8gtpV3D7OTdnaX2fW31B6cdzXI/jzOwCpbUpcoZY0hwPNfjTmbrf
         PIuUSRcnkOM5XT0w2H6LKXWZ+UfrFxfzie4D4beaj/0pWuGupzdY7OugnR8hscjgvJyM
         0hgrq3bbneljIUV3nJchK8pedw+Qq8Tv7fG0Z0eX7FsLJEfASRC82tJejV/QtrEU1vH+
         uyxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=NuInCRwh;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.44 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140044.outbound.protection.outlook.com. [40.107.14.44])
        by gmr-mx.google.com with ESMTPS id y20si33264edv.3.2021.02.02.22.47.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Feb 2021 22:47:33 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.14.44 as permitted sender) client-ip=40.107.14.44;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lab/G1cLswNfO3ZeN9sbU6NJquiqwmkq1v9rj6Y4aL52523tQsn1SWTnMvkJNbPTdLfZmh3ZxpmSQOVlTh9qU6pieifaQrY4akUnAYwBn3WfwxUVkybzGI7s25ln6KgkkF9gXKtdtYQYLMH95et/ORCGNkx5KMlK5yHhjtnEp3ymES0Wa7Mg1XHzOfWXbGcXMu4toeWVTlu9et6MnIIY34rsygMgg7IK/Owmsh8d/3tSgb5dz1CZLNR9Xs3yjtKwIpLUOROWEAsTHcEVkLh1Rmtt77qJcwUsQF5Sy3oiZAFLGz3peNQ6gYUumIJlJ8nE6Z/DCh1L2G7fwSjxaXv+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHMw91D532h3oHpWMKdQeAjMWvPPrCWFo5gdiJxrAzE=;
 b=W7shj79CWesPO+z9K0Jzu5ydpl//e3hqPRL7vc6e+ud3V9iAevMkHEpHxrHkrNve9RuW80Y43YzQuKzQ68/k7xbDCskDL6S8mDfRdlccqUQU3he0JPQ6rhAuPl/Ln0mjB8bnkQb0QMt97C7080xh2PkNoyUe3eRfKaTO1AZ6SwnqUt2JSYdvZo11yKLacHnoZJcM3cBpFQuBCZHJa6RdCrBCq9uFsG69cQqt9d+XsxlepN8Ozk4dOkCh8YPPe7hRIcm6SV6m+KyK+m+Pq+QsYitou/6vVkbSESJ70J6C+t7M5TBYa+Ylb2E0CKaw+YPnagTy3hOfA82wQuu2cD2ypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB5149.eurprd04.prod.outlook.com (2603:10a6:803:54::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 3 Feb
 2021 06:47:32 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 06:47:32 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	xiaobo.xie@nxp.com,
	jiafei.pan@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v1 1/3] configs: ls1043a-rdb: add DPAA support in cell configure file
Date: Wed,  3 Feb 2021 14:50:55 +0800
Message-Id: <20210203065057.27914-2-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210203065057.27914-1-hongbo.wang@nxp.com>
References: <20210203065057.27914-1-hongbo.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Wed, 3 Feb 2021 06:47:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 46290cd7-a11f-4f29-c457-08d8c80f94e7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5149:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB51494CEFC5BB90E6FB22164BE1B49@VI1PR04MB5149.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fwReXjBB0a4qZ+nbVW9NcxZlHkEvm9oD534TpRQqVEjge5L9DR4OkvrudKBKRWAFUjPcw5ATR3fShb8HmU9Own18eq+iaSQzVdkSmTv0+rroHSgDdV7S1NQq++uCB9yFKZ0z9grCsAdmmeWW4t/Hyd9aIBiNu6K1lU5tfu2vJhW9kqO7j3tZ/685v86EhRvRJMMpv6a0W/TxcnP8rjDx7ckzIzrC+SM6M37UGg/Ixvx2j9w611+vHO+3MtvUCrQ2/tZT6FbwW0Qdq1Rtp76zk2hWr4molntHyxFooKDTijgC/bEUR7Wmj3PFpdEKuCqGkbTF6uhQsN7NoFScm7F6xMR/iktCa1sXRT0PRFxhdndT2HgHLpIgyHeZz1lUxH8pOpdBdJ6OIB4m9C3Oq92nFRUU1lEWKcaF6jDMuOa2yU7OedAIhN6g6VUNS48PfUpdgpd9eJfzJyL0Vz5mDVLNw0LVEQoXR3k5TF0yuR+YeELxWkBKW9PQi1t89GgP1WrwtxvwNrNBsFK2+//hfnUWvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(316002)(2906002)(5660300002)(9686003)(8936002)(26005)(8676002)(6512007)(86362001)(186003)(478600001)(16526019)(66556008)(1076003)(6486002)(6506007)(83380400001)(6666004)(36756003)(956004)(66946007)(52116002)(2616005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?llx2Ohxw5s0Zl5cEocCtHeYHIT4sz47EiMSTVC5TOdSl+RH54sSfl1qDhlgY?=
 =?us-ascii?Q?fkSXeu1Xu0wOmOEqYFdFGi/RkA8+2ZVcerOAEKmutId7NsZWG8OpFIhth0hm?=
 =?us-ascii?Q?dx0ux8E8SbWuMoUjsayNphZELod+v8+YvFLHyTiogLod5hZTkyFFESXHMU05?=
 =?us-ascii?Q?ghkBJa4JauKbxtL+z7apyjbCikEQdJ0Tatu3K7Uyfa/3Iq4eiE0WFhfBAWCW?=
 =?us-ascii?Q?7mgyeZlZK0P3o3VJsX82eXwnsI61EEuMGZC40mn2c3SxpqIVv2Fbxen4sJdL?=
 =?us-ascii?Q?HsyIFIBT0XI85UD2WjPC8/Fc4kVP/hxta50olPIUgc5KQfoqcltdo6bkEuyE?=
 =?us-ascii?Q?zI3N/qmK9mOQ7yMkrSRiayHySeaGm9wFT0iu5ERoex5R+bPHkxGUqqOZwdTs?=
 =?us-ascii?Q?rM3A8C1rn0csvhkCWyY3BLGbMi4wlP2XWwKwiX1slut5PNzBmsEZx5iGXBRS?=
 =?us-ascii?Q?Z7wWFOco25pJeuKaAIfcqWywyyVRp5K7CZxsSgicUwUZklfCSl+7p7BQGBe7?=
 =?us-ascii?Q?P/NS0feBL6Q15wM9+tmqAWCFRMTc6+vmafFP+DzYtm2nSGPxCOhi/yrWiuwU?=
 =?us-ascii?Q?0YLSJqFajJRrw7Azjdr6aHWf+UwiHLuJWTiOvDjF81gXyudXLOFq107CI47E?=
 =?us-ascii?Q?78yyGKfvqM5vZLIiqB5/d1BSijdErf0uiVmLVsrSTtJJ2ZdgpnkWra8sxuo0?=
 =?us-ascii?Q?lRf5dZ0RqnN6pEcZby92EWrmo2Er+E0rNqGuCmbCgEFg0uU3Ve8DSv7gqhTw?=
 =?us-ascii?Q?0EmFZNO1zoq0qQpUrgTDmZfT3Ba9v8OtkySj2thpD8Wmh5c/5icIt8NhljhM?=
 =?us-ascii?Q?mcpPTdwidcmleVO3fu6qKF482fXBKNUwveI8mSU8lty/DFCy+fk7BRbIIM1h?=
 =?us-ascii?Q?dFj15OqhcgpICLfvsjkD7tzeqC6zXfa1o4W8Q8sNUlgMkdBMqeECTD45KlRt?=
 =?us-ascii?Q?r3O+vnUNCeELKm6HWP+Uy18Op3cQOCzvL77USKyP16OkTLhQSI+MmGyUCj/M?=
 =?us-ascii?Q?Y5vPLi2dSXYNph3752GprGl2u4G0+2fMS9/KtSf/6y5oBaQAkUITwnMd7FI1?=
 =?us-ascii?Q?Ct317Q2e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46290cd7-a11f-4f29-c457-08d8c80f94e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 06:47:32.3925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hyoWYOCvly92O4nTdKZjHuEllORhLEzfkWfPyGxattGRLwYxy6TRC9kUVqawq6gK7Ld76XozQhP3bG2g2SkQnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5149
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=NuInCRwh;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.14.44 as permitted sender)
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

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
---
 configs/arm64/ls1043a-rdb-linux-demo.c | 57 +++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/configs/arm64/ls1043a-rdb-linux-demo.c b/configs/arm64/ls1043a-rdb-linux-demo.c
index afc10ede..89552b16 100644
--- a/configs/arm64/ls1043a-rdb-linux-demo.c
+++ b/configs/arm64/ls1043a-rdb-linux-demo.c
@@ -16,7 +16,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_memory mem_regions[23];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -86,6 +86,53 @@ struct {
                         .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
                 },
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
 		/* dcfg */ {
 			.phys_start = 0x01ee0000,
 			.virt_start = 0x01ee0000,
@@ -121,9 +168,9 @@ struct {
 			.address = 0x1410000,
 			.pin_base = 32,
 			.pin_bitmap = {
-				1 << (60 -32)  | 1 << (61 - 32) |
+				1 << (60 - 32)  | 1 << (61 - 32) |
 					1 << (62 - 32) | 1 << (63 -32), /* vPCI */
-				0,
+				1 << (44 + 32 - 64) | 1 << (45 + 32 - 64),
 				0,
 				0,
 			},
@@ -132,8 +179,8 @@ struct {
 			.address = 0x1410000,
 			.pin_base = 160,
 			.pin_bitmap = {
-				0,
-				0,
+				1 << (132 + 32 - 160),  /* 10G PHY */
+				0xfffff000,
 				0,
 				0,
 			},
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210203065057.27914-2-hongbo.wang%40nxp.com.
