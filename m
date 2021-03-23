Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBFMF42BAMGQEK2AQ2NY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456334578E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:54:30 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id 9sf584168wrb.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 22:54:30 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616478870; cv=pass;
        d=google.com; s=arc-20160816;
        b=DSs3Mcj+LY1G13xP6Aqq8IvVTiq+0sqI0bZmgmiN3jx8Otc6r7PbdO9w6WMqV0kLkE
         v5EBeX7ukeNq9qauzqoSQPX6CNa2WRIE6isfwxV9gAExZ2r7Jg4VAith70YLySxN0fw0
         3uQEyQQG4QYY0bEooM+Ji6gYQMlZClqEOypcQK9d/hKVVJ8Arr0Iza5/6/U0s99R0//N
         CZbzltjKHiTa1fEjDWE1IeBjqxHcwwIofG5/g5yZRSKvQUBI3JwaPoEVv2p8FYe7u/cU
         MshFYN/NbDBJz+5baK7S60MGTVSq25cLcmk2ntVL/2XGtOW+wl4xylRLFhJUPr8BZ9tD
         uzEA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=IQ/FUz5r49N8BQ02t6Oh9IFhKa7Hw4Z0Ym3gDPuTcac=;
        b=Qg/P9P+CJdibgpqO3cTJvrbaiKJaqkLZMv8Xw9X0do8oimznNa8oSdJEY805scNyJo
         Zxn+Bm7ZHYs7vo7mH67i0JSVYZpDyc10YkPxYo5Sp/FMBhSk4RUqR3/7kfNoR8cGt4oH
         QKv2W8g+EZBfzBaKT4wvytkIPoV4HfXDyaiz3kUSTcIIaB3j4Yfj8PqkBl0NYhmzSi7m
         sb+l/tyERaHAnPFr96yqkoSbs8BAacA4cY/5oiBzhxIlWSqJFoxQp4H1mADIP0IRQyXe
         HOJcsLfdM04sIrF7LLP1oiOe2dVFXtJGG/e18E+itcxECDVELFWMvZTV+mqnAbBCXcqu
         +fdw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=h+qruNUy;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IQ/FUz5r49N8BQ02t6Oh9IFhKa7Hw4Z0Ym3gDPuTcac=;
        b=MzgI/AdlQ3872BUkaPzgZNQfHdRxODe5LtKTd6odsAMi70nIvqieip+oAtJw6yGG4E
         i8JL9pJ1oPLde/+tc9iZRXwvJcL6LY+sNqBWQg4YPCjH7et5ksGSYjcbZb3mMy5LyhUs
         tmjpE99hTsDTgz0ZmF0R5c9Md6+ySX5FIuPvBkx1ICxzjhzzAxDbAqrjTB0NrfqdKhU0
         LuWeXQ1tl5OfvCCgK4qJVKBBm5pj+4NnC4Lh/W6Uz2uldbvovnyMr5Zbz66iOiJ4DyTq
         1TJsh+6ontZIBFwzS0/tm6fk4iGgUcaJlHUVxdXjwx9NdDVQbIJNkcomGAJrSmlwz7Iz
         PsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IQ/FUz5r49N8BQ02t6Oh9IFhKa7Hw4Z0Ym3gDPuTcac=;
        b=mfccODWWwpt6TNYqkYFA+CZBjIZ9g2eNIBGkXjzXjHE2OQ5hawS1qZ1iuLAjh8x7nh
         5UPCIon8r7syU3D1XTJsnGC4ap52EObcgwHwxk/BpvNQ7mMYqT0oGs5lmyS3zi4+hKJ8
         Hb41LNwinE7pidnwtJIw/WMIt06cDYFI0zU9KS3z8t2qdE0B1fzXg1h2J7CuQ+S4dMEZ
         yUfAzL3qzOxDau5u4RYWffRaDFZWkTq/sqgDX+vBwRFXIOlfBl3CAEYweUo/n+Y8I9C6
         qN/QOhdBsdEYnGVoa44pu6OPVUxtcK3x7wqUuwLL61Sm5NeZNok+KvjJpdkMRttPwzF+
         pGMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531iDIUgp326bR8Uq34a0QMTwQfmNNcbGHvuWnCUEYoXnRV7hTn/
	vs6HOUu81h6SzwykaCuc27c=
X-Google-Smtp-Source: ABdhPJzfRvC/voZUQEAVy8MvGQPmajVYJhA5hnVCrjpApvfZkZz8KqvcFYfwdh3cJf3p4I9CG/RH7Q==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr2068741wrr.12.1616478869894;
        Mon, 22 Mar 2021 22:54:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:162d:: with SMTP id v13ls1149268wrb.1.gmail; Mon,
 22 Mar 2021 22:54:29 -0700 (PDT)
X-Received: by 2002:adf:e548:: with SMTP id z8mr2068815wrm.246.1616478869035;
        Mon, 22 Mar 2021 22:54:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616478869; cv=pass;
        d=google.com; s=arc-20160816;
        b=fz6UhUG/UqMq44Em1I8DZW2dEaG1dmqxIDZIPk0i1YZt/zOfj/IT8iaNNSFdq/jn8D
         4fFJFyloqIFV0C2dDAUTcmiUZiRqiuJapOOZASwuncyTfzdwdcQnTdlab7AHCvjqPVT9
         njXvHA9+0imO263cVbiBHHDJmWnx55a/jHoEhNfWB5nMhAVxPtSm3bEtF6H9HcjAWH28
         u+BNW69oJQ5ZXStmx3xWBjcIIcqTUp2/L2F1TaENwl7q4Dq0XhEBSw3mKKCRmgDOpF4v
         Tur2rA2JApLoCSLaneekXnzGGG3Lh2J1f4vgsEDcuE/0uUMIzjoiCeLZ034FS0OJ4i6q
         8A9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YX/JDIY5l5w10XoowFYEqhCr8pYzNI3MQiprwUVsbzk=;
        b=r9XbZk5mnXzGnjcf3qdvf9sFFnoldUjZttzlPNL+802rKkbWbjIvaDsYYXig3Twc26
         86v1cHTt2kan3TtVmj4Cxppj73tozugF1Zut6KjXtIQ4+JhQqg0IWBiuPXYY+keGWRUX
         fdw2RBkpjcPiIz8LPC3vx/0mzDRV6D537ldad+DvaOxt6AdWsk09RG6t1nmSgdBTTXhM
         n6SfLkcoetw7CUSOklj8mBFEplAJYfCNFHBdG+47zijOCbcgvUK7e//Phf3gvebV3W69
         0Q4/F+gMDglu9XI5q+5DLXHdZV4o8lkIehPk9x8R/rcG7sH3P+ykISrKZpgl1LKArlc3
         fXGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=h+qruNUy;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40057.outbound.protection.outlook.com. [40.107.4.57])
        by gmr-mx.google.com with ESMTPS id y12si532469wrw.3.2021.03.22.22.54.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 22:54:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.57 as permitted sender) client-ip=40.107.4.57;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXPl9ZR3UPF66S7cUxKzIK4vMWWuwRu9CdK+kkG3D5p8DSw2vOYRGBqTog34XKTyAqUSVk7rrksQyJQZpcZ9YrtZT5h6VbmcSZpbSGmsPp/4T3VbzkdufvYvLijBYgB86c2QNa5k1oJcKGpGy5sL5t0XDAx2nkwi1EWu1sBDtV7B+sba7orMoeRsdCkYxczU8DxELwN7qCfmOupzpvFsj8EZODncsQv4j1CsFNPvoayrWiiZcCa9XIBBxwpaIpl2e7Mvo1Xj5d/EpguXRQIYKLlSVtyLWw4DXlqmqmGZn7L+G9usDjGGYkBT1eezWVfDfkhlt2O6900Z5hihSCUNpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YX/JDIY5l5w10XoowFYEqhCr8pYzNI3MQiprwUVsbzk=;
 b=BCtUd2DK6XWBPeenD7KvtnMVKW0m25kAQYeiQsFtfHHgEccpXGVlWQfkZTZBj9YYYSH0qvXcHYxJiLJTWo5idixsl9Z+dgKVcM3/ASUjNen24g4YnTjXqS7rRml2DeZfs+4gdtQARh+o3LZ+rvJP1qov6A5dPJ8bkyZlZh3oypjqGkszdAEQf77Ek6Z9sTBY4ZqZcpCXzeqzyWODlZW3hgF/QYrmisgL6rdxfimkh6jnDDQn8oMA5wDWYHOm2ap/CPs+EVYNkHYUpJtOHvGMLEPAi9PTvS3/Hkpby/3G2YUfVCD9nNjw4OizbBdnYqrCSo4OIRY6qRU0fUenlmVdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6619.eurprd04.prod.outlook.com (2603:10a6:10:108::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 05:54:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 05:54:28 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 5/5] arm64: imx8m: correct pci domain
Date: Tue, 23 Mar 2021 14:25:36 +0800
Message-Id: <20210323062536.3888-5-peng.fan@nxp.com>
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
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 05:54:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19b870ec-8e58-4846-54c5-08d8edc01ee1
X-MS-TrafficTypeDiagnostic: DB8PR04MB6619:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB661931460E91F41E093EF49A88649@DB8PR04MB6619.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ij8aulM65R+sp2R5oAOI38IGLo2NKovTOJrf3JY7o+5cP9SMmrteLehzR40XMxoT6burOL3mQu9zo+OUH4u141aB2/vDoQKdA8Qdy/Zog9vKC5Zr3XvBl3olgqAcvU1PCikRklamTnx4D3lChvNV9jTLNH25N6C0E3oUgsu8dm+HhWgjIX+TxvDJiyK4A1jUTqafUnOEfZj8pU3HpiM0NAy6SrexgPL57i2Hu5lMh4Ip6PWuIujL4Da9Zp+/HuTfyxTLXqfsw8PcjbkFpD6Q353uOM0ZO++m1zoiRyeIVXeM7CRHhHT4KZaJcS1UqM9hZxUl5HR+rySL7RJrM0G9VCGtoI2l9h1ocYC05E1okUK/F73i1ZI5mmbUrLlamVk3VDubfgdmeG/+5+3h8s28mAyvR2o7lqXWWcqWkOI8+daeT7chkw2/szAgzpNbiocoa2up2pTFYYs3XLEO8XAlDE9nSy7vy1B8/AibilOba4sz9kBucpg0kMz75GLxh+ZK5l5u0FmvBa0nDZf2siJHK/HpqKMLOfhmkntQgGmi/kgSBuQkyorItHqZ494Yazu1VbSxiXT/q+1sZbY0zxKYZvavqSmCYKc9zqaAnn4WMQa+5NTnihfiIIShdYlPEZyXRK4tOwDZEmmozMppKVe26gTUUV5eev7p3rXHnnBTWfh4shX0ewy0MRnYdFCXKs5L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(6666004)(478600001)(6486002)(6506007)(38100700001)(9686003)(316002)(956004)(2616005)(6512007)(6916009)(5660300002)(2906002)(4326008)(8936002)(186003)(52116002)(66946007)(83380400001)(26005)(66476007)(66556008)(86362001)(8676002)(16526019)(1076003)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gebUAa82L/kWbQPoN5AtfmxSETMttL5FVtJJpdRCbxsMCP4HOfc4qBSBzjpr?=
 =?us-ascii?Q?e71MP78cukKmsU7Czi9EWgooZGMqVaWBGURNEpPFAkbHFB1coK7NgGW51Nhn?=
 =?us-ascii?Q?4VKY5WX+9BAaBcDLt6sb2Sp5+wBgmJabtlTjSjIrJZ6sCfQ8v8ZQBo81LDaP?=
 =?us-ascii?Q?PCC7o7Esfcsn+4knCsogszPTnxWcfYW8DmLzVsok87xvlz1PzVwQnLDjdgEL?=
 =?us-ascii?Q?qqLqhhr1g3o12y4BSwHvPZfoIKGVv3PY2DBSiCyRu5i+CotYmH4BCp/LsitZ?=
 =?us-ascii?Q?78oBE2Y1gG35ZGFhuQScp/0QcnYu2XnrEjPjPL7nCRWP1CU7CwaJjD9Vd2zk?=
 =?us-ascii?Q?kZTHv2C6vqC41000xTkC9/CGOnktDa+9QCL4cG/N380Or9hEX5Pp4UiUt6xw?=
 =?us-ascii?Q?OFQT+LMaXzlCZ8Aqg4WWB1nUXVE7SbQpwvQvXpGEiBqzGDJP7i3ymM+IfT4K?=
 =?us-ascii?Q?yEHKW6tClKUVFnqcNplEYzAGE497LGSHKTWjI3Xf7+sLQHfaMYJbZCoYE2CE?=
 =?us-ascii?Q?tCXqZw3e08e+Zkv9mGkGvyfbvgPEv9cJKBzOOh2XTekfO0R9S/KZIzrazcfo?=
 =?us-ascii?Q?VGfVRJRcbo5A4ZG9Iwf5zj4sD7mO0LrA4smApl5eiYJn4mPKnRqqcm7RWkoz?=
 =?us-ascii?Q?qEfhoma+PJqYrhQN0coHZE6siA3kIqZpcqW3A8hBZQV+ODD5gGQzqN0qL00k?=
 =?us-ascii?Q?nr+Rtud+wg3gE6sn2qChKvB+bBgHsH2YNEhwz8E8pdP6shxLOqsVQZel0vAa?=
 =?us-ascii?Q?VZjFeFDlm0qXMn2qCxn8qmNj8M13BDa1mtLfAmBvSKTdBsVj02foKGNtRwBK?=
 =?us-ascii?Q?WMVamLG4wSpKQcZhdW8pLFjAhyfrkSWurgzkPL1uB21LTEh9jDshlnqjFWwB?=
 =?us-ascii?Q?K+VyoWqxXak+FUbrmzyezPA4LAR0vs4vbIfKJ+llP6MrfvbnMbWM2eXcuMaI?=
 =?us-ascii?Q?nU89F7ZYTXl+yGZKCEEQtyeNwHdjmHtqPtxwFvNRFP5q84i5R7vE3djRy4a/?=
 =?us-ascii?Q?RTO3BDqKIoh/wNmb6p5sf9Gby4N/U+UG5tjCOI3JWl95kmhOtNyx8qvlmktI?=
 =?us-ascii?Q?WWuWBOFjAmTrEmvzqV9WvUZbbjN22B3+3HPz0ZiVIKr7R/U8423Artcgchau?=
 =?us-ascii?Q?lA0Bz8f1dhCWG3J5MQ+aXfII+d65g34CBk1F8UMzGCVGEu28ndNBdiCqC2CZ?=
 =?us-ascii?Q?a+NJY0MuS+UCMDRrPvFF20tQYLwBF+rGyaomsraxbgYnVTKz5ClXPr4WRePg?=
 =?us-ascii?Q?vFcSQDgjmEZI6SZU/PN24jbk4zk87YoTKSsPRa/wq8DXWFbqYXsuT3O71Fap?=
 =?us-ascii?Q?bpDyw56cTfg9fB8B3lQEpd6l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b870ec-8e58-4846-54c5-08d8edc01ee1
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 05:54:28.1902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpgL/T1I2G3++2hsbXLh7MyehKc+0MCZaSjKomUWm+k7nz1rjfpNChgGpvU5i84wqMLtmZpg//h/XvlVhBhBiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6619
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=h+qruNUy;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.57 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

After linux moved to use linux,pci-domain, we update to
correct pci domain here to use a domain not used by pci hardware.

i.MX8MQ: 2
i.MX8MM: 1
i.MX8MN: 0
i.MX8MP: 2

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 configs/arm64/imx8mm-linux-demo.c  |  4 ++--
 configs/arm64/imx8mm.c             |  6 +++---
 configs/arm64/imx8mp-inmate-demo.c |  2 +-
 configs/arm64/imx8mp-linux-demo.c  |  8 ++++----
 configs/arm64/imx8mp.c             | 10 +++++-----
 configs/arm64/imx8mq-linux-demo.c  |  4 ++--
 configs/arm64/imx8mq.c             |  5 +++--
 7 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
index 196740cf..49272607 100644
--- a/configs/arm64/imx8mm-linux-demo.c
+++ b/configs/arm64/imx8mm-linux-demo.c
@@ -145,7 +145,7 @@ struct {
 	.pci_devices = {
 		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -155,7 +155,7 @@ struct {
 		},
 		{ /* IVSHMEM 00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 5,
diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
index ebc2d294..acb9fd5e 100644
--- a/configs/arm64/imx8mm.c
+++ b/configs/arm64/imx8mm.c
@@ -47,7 +47,7 @@ struct {
 			.pci_mmconfig_base = 0xbb800000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
-			.pci_domain = 0,
+			.pci_domain = 1,
 
 			.arm = {
 				.gic_version = 3,
@@ -181,7 +181,7 @@ struct {
 	.pci_devices = {
 		{ /* IVSHMEM 0000:00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -191,7 +191,7 @@ struct {
 		},
 		{ /* IVSHMEM 0000:00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 5,
diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
index 795c616f..127392df 100644
--- a/configs/arm64/imx8mp-inmate-demo.c
+++ b/configs/arm64/imx8mp-inmate-demo.c
@@ -114,7 +114,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
index 1e0a9f1c..22793c2a 100644
--- a/configs/arm64/imx8mp-linux-demo.c
+++ b/configs/arm64/imx8mp-linux-demo.c
@@ -178,7 +178,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -189,7 +189,7 @@ struct {
 		},
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 3 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
@@ -200,7 +200,7 @@ struct {
 		},
 		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 8,
@@ -210,7 +210,7 @@ struct {
 		},
 		{ /* IVSHMEM 00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 13,
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index 3f758980..9654a764 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -42,7 +42,7 @@ struct {
 			.pci_mmconfig_base = 0xfd700000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
-			.pci_domain = 1,
+			.pci_domain = 2,
 
 			.arm = {
 				.gic_version = 3,
@@ -199,7 +199,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -210,7 +210,7 @@ struct {
 		},
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 3 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
@@ -221,7 +221,7 @@ struct {
 		},
 		{ /* IVSHMEM 0000:00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 8,
@@ -231,7 +231,7 @@ struct {
 		},
 		{ /* IVSHMEM 0000:00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 13,
diff --git a/configs/arm64/imx8mq-linux-demo.c b/configs/arm64/imx8mq-linux-demo.c
index 1177f596..03e67a94 100644
--- a/configs/arm64/imx8mq-linux-demo.c
+++ b/configs/arm64/imx8mq-linux-demo.c
@@ -136,7 +136,7 @@ struct {
 	.pci_devices = {
 		{ /* IVSHMEM 00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 1,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -146,7 +146,7 @@ struct {
 		},
 		{ /* IVSHMEM 00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 2,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 5,
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index 9f9c6071..145a36e4 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -42,6 +42,7 @@ struct {
 			.pci_mmconfig_base = 0xbfb00000,
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
+			.pci_domain = 2,
 
 			.arm = {
 				.gic_version = 3,
@@ -161,7 +162,7 @@ struct {
 	.pci_devices = {
 		{ /* IVSHMEM 0000:00:00.0 (demo) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 2,
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
@@ -171,7 +172,7 @@ struct {
 		},
 		{ /* IVSHMEM 0000:00:01.0 (networking) */
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 0,
+			.domain = 2,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 5,
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210323062536.3888-5-peng.fan%40nxp.com.
