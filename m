Return-Path: <jailhouse-dev+bncBAABBAHETKGQMGQE36QJKQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B2E464231
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Dec 2021 00:21:36 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id u4-20020a5d4684000000b0017c8c1de97dsf3888953wrq.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Nov 2021 15:21:36 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638314496; cv=pass;
        d=google.com; s=arc-20160816;
        b=Gg4utXsI+D1iH9E1T/RpO5szT8OLKIKvg35nQcrKKt3FRgSQz8h7XMQuRaNiZgafD0
         bWSeIQTJXUH0oW7tPVlutOwfK3d9uDJ2t3lfhqPERgpKH7RIb4Kn5vnP33ZlatrFh9Us
         qEoHnfijtW+iah2h+deLnLoT7G0S2yEn4NzQntTPelMQBOLb1mmoxSb3iQUr9e7Q8WqN
         1LnqH9hBKoakH6uVYdlKpizZyJflxT5ONS5o4n6G8z8aImYYGiEfalUowV/VvFw3TOGR
         8eRSy009tyiJ0tePaZJf9ySAlO4puVVILtPsW257ttn8/KvWzSvWS3mqXfFzrZ/nkWep
         loQQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=qtKkrbrFjSlNr9iHgfWAIopFmJOdwBkLmmMq8KJ3Nmo=;
        b=jVw/mkpVJszaH+nvTd5HePwezwyh5loh3zwiAPmq5fR1k5vW0bzMLcN7xXW1FJrGIu
         /qhY5xqs4yOjzz6HSFSUYS3xFkyxMzMzSBXnHMW+DDg4FUx1MwJCRXRBJmURjEh/HxRX
         bX2xF87XMPmymkwUxFk/lw83I4mc4urlEuyTl0DVhHh8ij0GMTzz4LxdaYG7DdgYHD3e
         aa6DcOTIoJfQz+BOSPqdttUQHY+vcgv8xHsowGCBVW3QOfUSE8NUdfvuMye//xuxwdSu
         LtY6myq/rrsWxo7DcEPEoqlGGLgZSxrxpD9LKWKos/RxZn1vf3Si8TpcHXJqdaod8bj2
         hwAg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=A4d50UZt;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe08::629 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qtKkrbrFjSlNr9iHgfWAIopFmJOdwBkLmmMq8KJ3Nmo=;
        b=rZKNCJTtfoJzbqodqfIx8mXBH3nB09zm12agg3CmB5OPolrlEH5N6LELkapfpdw9qW
         V9jTcOmsTJgG+JYqpxK0+nZCt3p1zzdR3DC9vbT/A3DqDboNq4LBrUnn7o8HtS4CYGkT
         mNYvbtu3VvuZ9bGohnUZHMZwfEP3wpOU+C303cvkeKDIoF4bYejP7w1T2Ed0JlaPxl+G
         Lu7jL+qhUC5CaTa2Q6N3uPS9GJxLQ1gn5fKCS/pkqVddPP9UTeCm9v9LwRdrxQv76UIx
         dNqshC8HwQ2cHKln4DEXNuroSJXsnf3Uwgw/xUoRiUOIlWzWuO0UlRxW3385lhpXj2do
         7mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qtKkrbrFjSlNr9iHgfWAIopFmJOdwBkLmmMq8KJ3Nmo=;
        b=B95nE+5WUCklOhxUk3l5vFUXw/z8NeniCRJsAeJmyQCOP6DnMl5JHv556Y3a+kYTEI
         4aD3nHgyJ+TtMnndDkcbxW72glaIdWgDNYw81kzYJEDQqkwFcvRRoNuIsA2OKgetCFl9
         Bk/LJyLkKPEbtIlsjwLCWHDanL5UGyl5cUuOhgOBR++CxLmI9Rq1O73KZy0u2mCXdF5t
         0JzDB5JSPKHUkaxs30pYP5eECMUzJEGwgi3Z6nz1z5TW5Wj2eT3vdXdq0/P+l8v/TPSr
         GB4jVBqiglaB0WAW/UBpcoOth2ASiGP6nAt80PovNBP6HoEyiIWDGF1fgziqxwKWaQgt
         faQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532rCJujdhat4gEUIQkbk38NgBl2yLSTaBhvYFjYkDLU4FuEB5XH
	+gZ+CmdJAoCGRBb9VTinf4w=
X-Google-Smtp-Source: ABdhPJwtL6OI03/Q3iH38HlRLo3xiC4rn26wnWortxUhwyjTVKpyTCNxDk2fT4HeM77ord0F1bpqtg==
X-Received: by 2002:a05:600c:6d2:: with SMTP id b18mr2293519wmn.98.1638314496597;
        Tue, 30 Nov 2021 15:21:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:ad6:: with SMTP id c22ls2202687wmr.1.canary-gmail;
 Tue, 30 Nov 2021 15:21:36 -0800 (PST)
X-Received: by 2002:a05:600c:4982:: with SMTP id h2mr2234148wmp.4.1638314495978;
        Tue, 30 Nov 2021 15:21:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638314495; cv=pass;
        d=google.com; s=arc-20160816;
        b=OZ2Q52nFVbS6JL13kjy0RWFywJjAJntnMU6vgiT/wRHKt++s89t/eWGy9gJ9ofGeMn
         SJGDAc/kfTcmDnqrwVQv7+90UwluZx5/Miul6lNH3LlwBzLHTY7l+aQ6xp8M8++hjMqE
         b7J/gibmtxpVuYx3LHkA4KsBS51LLlm4LfHhzuLZ0wWdF4rSQ+6Gehi3u17g2AcVFMl/
         1bRIChecFhbKNodNqVIlpRqRgs3Wr0HEcJTe1XIT0aVw0paCWzti8BzVd8Yr4ES3uroh
         WEgGH3MLPjnDez6Go1BHkTR349fJd7Jj1sFGfVM9Fr8v35XgBV67yuUJcP+CuQ5g3O3J
         CXFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=RvPfcOklG5IIzNGejFfPhW/talBp0B9xM23IvuA6TG8=;
        b=s3BM30bzkrHFfbSWSIwGk21SoWOVLk3O99x62x2qivjPmWT3AL1hdtQSeX86gB2uGx
         ObV4HCz41X3zL+5RkC/99rOrGalG1KwydvtcRjk4aFVGJohMdDzejtAsMXaze3V9FLSY
         zmryGlVOMAQdH2doB8F0sRrSlhtXHRAXkbPdeusFOskxqqmzL6yBw2yXX5BE687QnDBp
         Xy7bT2x2dixZYNJTIKgV23HMqAYa7WTB+BCGiiGs51EYwcGucEH8giOik2YewxcjxGlR
         lHBdY8WKU9ys9/spHxSpQBVV2GOYLWzZoYcoeJ211sso7V/AjO84O8+MTaF10BDl1M9+
         3eJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=A4d50UZt;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe08::629 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03on0629.outbound.protection.outlook.com. [2a01:111:f400:fe08::629])
        by gmr-mx.google.com with ESMTPS id o29si854631wms.1.2021.11.30.15.21.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Nov 2021 15:21:35 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe08::629 as permitted sender) client-ip=2a01:111:f400:fe08::629;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYFkG5iND76/dYO1SpybvVusb6bXb4HkxPvMQR/3w8n8kkTBVos0m9oVP4nLq/E/TkhL0nknK7Cx5WNn8kmO1aw8ApDqWkBTKohSs9VUiRqcBZtOwyA+A+rmAtLje2Xy4N3rfXb/95rs0QKTLkoKn43flne4zBkKVMADuvHorG2ld3/YOrLmaLqUMwUiYk3L4wFzbOyPlAGH7KXq3yRAqhPvITGWIfHhOQjLS/uKqJegtuby3SCz3f6lEwvxrEIgjNVNPnBjDDwhro8mMH8Fpj8uhTioJX5Zd750Bb/yNJiHp7BAQ/tfKF67tNruNTdFXIwapu2AF01Ki+TvPKyQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvPfcOklG5IIzNGejFfPhW/talBp0B9xM23IvuA6TG8=;
 b=eusTQNu8WiHpbhAtqEYs4MUS31KMmL/1FoikCqogZayh8ALFPKUylfBr0iV18hjfMDFcN83a43oboQHgzcnShJfWVM5WL84bA8LrqyZ7CzvqqpQxUB5wYpxx7f9W0vMMsPXApizmslaVVMuXkcb3sRcjRBb1TT2kaqlpwGwf4J4BlW3nGPOkz9nNF/TmwVHwsvs5F+J+400iVwP1YORn9+M7kcT9Hk3JOCiJSU2bmJJp6sz+J5kphvVXbahMzCBAINmlqwgbntTQr1eyHjQx1B1WB7ZI9kAqqaDYxG1IfGVYXYiLajXS7ylN7MsKhNEfSw2G5gpqOBYAzwHkksVQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21)
 by AM9PR04MB8634.eurprd04.prod.outlook.com (2603:10a6:20b:43d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 23:21:34 +0000
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370]) by AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370%9]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 23:21:34 +0000
From: Stephane Viau <stephane.viau@oss.nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	ralf.ramsauer@oth-regensburg.de
Cc: Stephane Viau <stephane.viau@oss.nxp.com>
Subject: [PATCH v2 0/2] [RFC] configs: Introduce helper files to create inmate cell configs
Date: Wed,  1 Dec 2021 00:20:11 +0100
Message-Id: <20211130232013.395-1-stephane.viau@oss.nxp.com>
X-Mailer: git-send-email 2.34.0
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM9P250CA0014.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::19) To AM9PR04MB8652.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b57362-l-11.ea.freescale.net (81.1.10.98) by AM9P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 23:21:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c3564d1-efcc-4ac9-62d9-08d9b4582666
X-MS-TrafficTypeDiagnostic: AM9PR04MB8634:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB8634AEA28F871517A0BB0A23A7679@AM9PR04MB8634.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oOm51DwK7SVStgt0fhc29FdeBt7rCiFMJce0m0FH2G7I80V3C3DcffQIxubvfGDNNeetP+PKIQYvwaOo9qSkNmx/HW6WNw0Pp65wCNsxMo+DtsrJBbRKlxgIE27icNa1qOa68886bNsoJl63MVSaXJTGax2cZ+oDGEUtHgvAtAQxRrJ+zYJRC9tJBuTP+XnvE687i1Wg59LhnbGz714cZgIaP/p6mCVF6eguYDm5HSP1rc/u7ygfyd058IDsnKbk+HM3qoIOAFTUQzRQ8ByP8UZncAkR37WC6/BjIDdAFhITNT1T/CG3ImHyjltCNKjNuW4ApsqzCarQE3FdHxg6Gf9C1Z+IN504OH4rgt2cGmoZkh7IR2pPKFgI76wtWPtT2Pm/PcO0IE6ULEOoJKVAC0tdaCMUCkDCJ+h0D3jQQJYqaPMq+Ijko9GndGg2bumD7yeDG7fEoKSmuSNhJmB4nPFJRgenmyDifGcWQtWz96SH21wQbJmyyWm2UHU4/N24GN8WuFXUkixq2h3QmPqJc8jatriILRQx3fbViPk8hz+yVrRxpUmbpOEWTjrgw/1e37xrATYbUUVjtWxfMzmPbheU9kg60X7xYAeWSvO5OosWJKkJ5hle0jYM7AXFhw+drZueuuntvzkIEkPnKR1wyVagKrcLU5Rhp3R/SDsRuFsePeQmBZJElMXaRlq5FxU/gzRTxRkerPeBxKfPsSzvkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8652.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(26005)(38350700002)(508600001)(1076003)(316002)(6486002)(4326008)(956004)(44832011)(4744005)(2906002)(6666004)(6506007)(6512007)(8936002)(2616005)(66476007)(66556008)(83380400001)(66946007)(8676002)(5660300002)(86362001)(186003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WVhXk5kApZsH20NZqkatLsmr5EKUa1qK/ycJMJ+qDxZO0IffecfA/DzS7Vrk?=
 =?us-ascii?Q?O0WdXdfd5GKBlTeBAfBf1ZVmQO6tHVEnwbfSB8tdmhfwVOX5nwgpZ3OKcBun?=
 =?us-ascii?Q?BPMtxhDYNF9vm5uvTdpE3IUaGeHiEfsba3Z0znTivNCILX2XEiD+E5I1yN3n?=
 =?us-ascii?Q?x4yj4yWjKJ5gLPtgRkUBEc9ePZGdPrkk9eigil0oTRL98yIqmZ3NZFTMfSXY?=
 =?us-ascii?Q?HFnvZ1IjmPbYRMlDauP8pf16sWBDD+H+zhsU34de2UK+n+wFhIOlWJR+4Acq?=
 =?us-ascii?Q?/6ub9Jvx9EwiqGWexVPkvCtCJ9sgnHrpJYzTHDgufClNnKFgXjAbLJQTsUke?=
 =?us-ascii?Q?wp1VKZQywQcqcV8IrO+gxbkWg7J+CDyJ/4GspxBNpz4Er+47Ji2QGsfQD0TB?=
 =?us-ascii?Q?6V2LW5KvsJMeZ6qkQbcIvKOwzJNywljQEiPxArwUhvWvbNfyK/pAbO+4Kg4I?=
 =?us-ascii?Q?IYc9nztBjAwUmb92hZ1tkNZsP390lFZ2euJp/aJ8g8wXtG2afkg4rGF+MLc8?=
 =?us-ascii?Q?m4PRGm0i3hmdV0tMGMcK0/2HHtGcXJWyO03RT//Q6ymNbZC9voUsUUCLSFYL?=
 =?us-ascii?Q?8Ou6lgq54wRvCF9RAUdyzHbYQN6qL8G5ErMJut0nAM3KFVkMGbk2e/ZVWBN2?=
 =?us-ascii?Q?UV7sWrL/ZX6DcxQdxHWTZe+bQhfS2xIenHefQ4uzqpW3xDPFvZWcQ+cP3sxO?=
 =?us-ascii?Q?z74Wx8RQ/Vi5+1R1w02dYz7AQ7iGn1WcsIufjDk/hwIL4wST42R7eZDRn3Wb?=
 =?us-ascii?Q?C5Vb0pFmrVLBRLFlW9R0mJyqzUBsKM2lRdqXdb5wtxIlwe4Xl8E7RakmIDtH?=
 =?us-ascii?Q?aPoKl2syKLEq2CdlIkhqu7lAJzHKDWvsKoPRJhTVh3dBivC3w9N10JMjPw+8?=
 =?us-ascii?Q?yFUCovGkvDdal95YE+KeTARGbioO+3VFNwqqQjpPkOU+dnvzBVVxAda1g1Cl?=
 =?us-ascii?Q?IJFNmNz37Sof38rwgwj0jEjpZMR0TEk9ib82pPjvpmQiTHxRUtoHUjFEOz8z?=
 =?us-ascii?Q?PfCYZUFCfzdxsM0eAt/BRQ+SJa9UMYuCiHYUQQIBztiYa6BDJYvlrsh/ePLb?=
 =?us-ascii?Q?O8Ta3hwyBMLzOME+nAFfXjMwB/R935dnOJJFgVN6pZmb2PmTpbwDSJ61kEey?=
 =?us-ascii?Q?S1/STzon6MxkypakmE8XNkXt9qVKt5ydhcNTecU82dTOTtXZs2WoIEt/hnr8?=
 =?us-ascii?Q?cJXNi/LtvTcY1eE4662uizQYOV7HBWx+J4Ttn2r7Gswe/9RbU6Z+UMbog0FX?=
 =?us-ascii?Q?B9da9XjBUSmuA7kEDy4N75nwAECH4cuAZp0U7CDgLtRum/Tndd+JgVvqjCtI?=
 =?us-ascii?Q?e+VelUbpqv0UmwK2TFZ0ya8eDWb5EGHv5PYgJk+5rlX1PWRumlgvlRNeVRvv?=
 =?us-ascii?Q?LsvE88MPWJSAOetOlUlUHDdELzidd2wu0h6vMV7dTCNXLgAyLXYPFgteoqME?=
 =?us-ascii?Q?aPbVTG0Ao8G11M3/47M0iqsxq99nk4edoANZd9ATkoVJisA5wDdyZOFn3xye?=
 =?us-ascii?Q?xvf4JKckrYvPTlKuSir8ETIxB6kPA0j8JtDnhIR9E0py35GEh0EMH/sgPwP3?=
 =?us-ascii?Q?I5Sv37bDuB4qCtwZrz8+WpXKptCKHVsLSO6hxQFgaQ+zRng4nPf9yL5j+7Ek?=
 =?us-ascii?Q?lPj4uzlhd0ns/+9s88QmYpY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3564d1-efcc-4ac9-62d9-08d9b4582666
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8652.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 23:21:34.6112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sd9r671/nSioXgj6Esk7vGj8NysaaBxYTSq0nCfkz2ScR1GcfrbJREccVlopN6Qiq3BuDjLT5lO9QTfhQOUHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8634
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=A4d50UZt;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 2a01:111:f400:fe08::629 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
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

Following up with my intial RFC, here is an updated version that adds
support for PCI devices as well as an (optional) console.
It also embeds an example (not tested though) that shows the differences
with and without the usage of these helper functions, as suggested by Jan.

Stephane Viau (2):
  [RFC] configs: Introduce helper files to create inmate cell config
  [RFC] configs: imx8mp: Convert a cell using helper files

 configs/arm64/cell-create.h        |  67 ++++++++++++
 configs/arm64/cell-helper.h        | 108 +++++++++++++++++++
 configs/arm64/cell-template.c      |  51 +++++++++
 configs/arm64/imx8mp-inmate-demo.c | 163 +++++++++--------------------
 4 files changed, 273 insertions(+), 116 deletions(-)
 create mode 100644 configs/arm64/cell-create.h
 create mode 100644 configs/arm64/cell-helper.h
 create mode 100644 configs/arm64/cell-template.c

-- 
2.34.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211130232013.395-1-stephane.viau%40oss.nxp.com.
