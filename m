Return-Path: <jailhouse-dev+bncBDV3L7XXLYIIT4EVRMDBUBE4657ZS@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id C98FC42A3B2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Oct 2021 13:56:57 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id 10-20020a5d47aa000000b001610cbda93dsf4339766wrb.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Oct 2021 04:56:57 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1634039817; cv=pass;
        d=google.com; s=arc-20160816;
        b=lyUPP9wLNPjz6H1neiSBxEKgQb3dQIh5cQTSAFCIe9cbpt1Fy7BfZ+I6IUYrCfBzaW
         zckzMdyMvAugKe5Ab+J3Y69ubbviI9mBPrQoxuQAkv7kAVCxZB6qlIy4jZh0RsMB5AoN
         beYxaZC79f5t8kvs41652MIVfkUgGK9uoxQMiBiPxAbDA2BCn4BqSZ4aVHgkaf5JS4d6
         bJqnQXWHzyCwArTL4iuTsQm1jLoVTvTz6z0zB763PcjSG2CMAFjYP3WSGUmfAZkbiqIt
         E1GBmh2DalyZzd1zdoTE8Ce9DCtcsNo+Pvx02jAjZS1P1jbm4Va7XYyiJD64qQQ9/xAN
         H/vQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=GB0cY/4Tolcqma8Wa1z1/iySNebD4n8he8+qm5p89TA=;
        b=QI1v1+IZzWWXxfS64EZyA9JqPRemN2fGfe07gSdhaQn3FjkQ7QvFR+iRSSRmueN9uz
         23kcYqRU581yngSvhYdPiSh65CUOQTVy82ZMd+9JM04XamP1amDu5ZK/zmeoPsGC5Q7c
         Twdtc2BeJlpgm3jpGu/iu4htI7t76eJTwGUTrHvpF7CPOPvQVs9V58J4Oi+4KJwgZx2e
         Wio8LE/SDDTQv4QP79y0MKVefQc9Ou2synPqtbr25YI3bVIUd9yNAUb/uesHq4nvOiA7
         uWhDpfK3/qAWGDx6vUbJNuoqkoj0+5++H++gyqcstXhq825mP0Vdwhc1Ew1IaBoEI47Z
         mQ1g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=f+SiD7B3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.64 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GB0cY/4Tolcqma8Wa1z1/iySNebD4n8he8+qm5p89TA=;
        b=H/5zd4ouU6OZaZbthMK/Tc848ZD3KUnE7vXnkhdNXHGaT0Ix2g+tXWDhiOh9RLKFkC
         p59NvbqvpUvvmPSCT2InyvbAHVtym5ZQqlGMKZWzFVf7JwsbqHy9IvTXmWnYNwWr9oW0
         DCCPjg+lGmMLEzAZAI6kcvGvgfKoQm/2iuEkM9dHPZq9PXxMD6qBxh6Ug7lttsxPlkgW
         ZzndTYzuO/rsv94ju/whH41iOK6SkHB91d9V3O0TFaGdIpfkMUHVGEie0M3hWy8mw7n7
         0tK9KaCz1RsAonsj2J1yFrVXSTIZpFakMPfYp0CbdJK5TXdod/JCHgEE2cMrTIy674Kz
         3ctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GB0cY/4Tolcqma8Wa1z1/iySNebD4n8he8+qm5p89TA=;
        b=U+lIhaQdfONKsMV9RSoYUcYdIj5XLzivEnaiBZW/R4jl7cUOGdOo3YpUR1gYBmAVrW
         kDeeuarj9Ieo5BC05TlvzOuKS94kYSd9mbwIIiOXVWG+qmYhNbcb7cTKDeQPbopeu6bS
         HvGYIN9dbgA/IxZQNoASvTA2ZxT43BKqiWkl9TvzFIKiIFwLPWrblBgSyYzkALjqviMg
         ex+UA1FhoRVOxbKz4ufkSlggd6JzoTaqSAIssf7X/uIQbt6yUE9G1iZf9dBJlLW+cIn/
         dVCf5drJl4FzEZrgvzgIf8tmxew0tNUAwJMJlf/fTTYYmV3mQsnp4DusNPXjJ3HMnDhc
         RyEw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532I0bXyjvaooAbsbjCt2RkzXW4RaVWKi8nKqOLltf4tuf8c+5s8
	7kxBrlg/PVXnnUA6VBL66A0=
X-Google-Smtp-Source: ABdhPJzKb2uksmFMhM84VypHcCGpE7WI5otkRGuZmIGVFyYCV4cVhBvLuBpi9L/Zs5hhkU9jo7ddUA==
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr2387641wme.141.1634039817515;
        Tue, 12 Oct 2021 04:56:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8b92:: with SMTP id o18ls1752561wra.0.gmail; Tue, 12 Oct
 2021 04:56:56 -0700 (PDT)
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr31337799wrg.61.1634039816397;
        Tue, 12 Oct 2021 04:56:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634039816; cv=pass;
        d=google.com; s=arc-20160816;
        b=OqdasV0IGkJ6LckinjAccl5JPIGiOFHOReE31l2UeYTt/CxJPHNyIZ4QdipdLyZHZb
         mX3HAMCX6Ok0kjpySXCGw7qmtHUE55IEvziPLw6RIC7Ic/ih5DPoq26GcIhBltaIsvgp
         8vy9M2jb3XwqqODL+/xa29EdTYcdEitcmmlvc6I7uaEHYri9PWTBH7HntTmV9Bz9L4oD
         V5B5/jaWNllXm8QGxIbdHg2fmtV3d6NDEEYxhYrGQoKoGwTY0ccekkWCEk0DacUvMand
         sjt1UHLFHk18tlOl3JlqINncg8JVCoasrsNb82wTPKEpmZG0gE5ixo4IENkfrccqdWww
         8RHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HXTvRnN+HHCDXvUqL+asUo9Ere5Oq5FaUPkmWeItpMo=;
        b=Ni6cpWl6biXEZL6B9//jGpBx9c9G/Ft+OLy+bqtBP6vB7WDt9OSgpa9nXlFjE5/qop
         zvHfqETNDUlYwPrSwJDDdqajc616vsgQ9rQsQhsNcyud6cz64w3wzR15NF8WGFV68Eop
         rohihpG1OPdrt8v88XY4PdynqGNX2KbFWT23yBX3vQ494FqbhTDGtL6YudRhQRQP+jyS
         mGLBvhe5EHFChDU+ARc6OPwceeVBDPKpySOYxHtx2oX4r1Cmzo9wIqqMgep4zD1MLurC
         BYdj3wfKumfiijVAvNPKSzJSLIQg1qwzhy26T/w2f/9xPyQEAy027wIiqaSdz7WoXj5p
         9WRw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=f+SiD7B3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.64 as permitted sender) smtp.mailfrom=anda-alexandra.dorneanu@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com. [40.107.21.64])
        by gmr-mx.google.com with ESMTPS id b72si137559wmd.1.2021.10.12.04.56.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Oct 2021 04:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of anda-alexandra.dorneanu@nxp.com designates 40.107.21.64 as permitted sender) client-ip=40.107.21.64;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GA8cz0njRIAAJtSTjGT8W4Yg+Q1lc6Z2TU4pGob6CYmAtRvHxer41Y0fh1gS6znzCe1Zpfgq+NmriBJfnjWCqYtrytX3DR5smrXVUNJvX4eZbgN1EG5K4/NMIUwfwvCg0N3z2NUfRH1zqWVJFJ8YIM24YBwJPNWPeDVBwcJUS5z14wabGRQJ3NyVY6MI5mMhXu585+iSbzhxmlLO7tdvZyCTxdV7A0dMklzUC8tsqabMR1T0JWIHE+LKM/eI5GeSYNmyh9T8tVYAkh7VTahQgMDylIXNq6JA0fgJWboDBXdbL8/7pmRYgQiwGb4+cCDQgwJWbecOM8YbCedtv+leaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXTvRnN+HHCDXvUqL+asUo9Ere5Oq5FaUPkmWeItpMo=;
 b=nrobhabYtGrdOx0H16gku5i1udHrhnV+zyjM3+ChmdrDug8yvL2C23OJDEp3Wa6HxlRaafjhWLA/4/jRo+OSRC1dEd0ykhwLhqAvnLHCGJuqhFJXvrjbaWN+lox44YtICeIogdK23prvd8DLYNlSuKun9P9br86vWXeTi/FM5CQAHt+r53iC04UFYAKSYgWOIZ24CCacLkjXIxRal3zdi8fDUq1iSF9eXlVcSCgDSyi9CzIr3fKKzIFQKJv6nGfuq3AZ+3nGQ+7ec78n42zY5WX7QlevSrG38laGLzeBmUzNeVwbo/ySYWf5Pu4Z4xufj8/D6Z+8WBdbs63jy9Ty9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 by VI1PR04MB5581.eurprd04.prod.outlook.com (2603:10a6:803:d2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 11:56:55 +0000
Received: from VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc]) by VI1PR04MB4719.eurprd04.prod.outlook.com
 ([fe80::10ba:7d8:8af8:2fc%3]) with mapi id 15.20.4566.027; Tue, 12 Oct 2021
 11:56:55 +0000
From: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Subject: [PATCH 2/2] configs: arm64: Add Linux inmate DTS demo for NXP LS2088ARDB platform
Date: Tue, 12 Oct 2021 14:56:44 +0300
Message-Id: <20211012115644.31005-2-anda-alexandra.dorneanu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211012115644.31005-1-anda-alexandra.dorneanu@nxp.com>
References: <20211012115644.31005-1-anda-alexandra.dorneanu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM8P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::11) To VI1PR04MB4719.eurprd04.prod.outlook.com
 (2603:10a6:803:61::13)
MIME-Version: 1.0
Received: from fsr-ub1864-119.am.freescale.net (92.120.5.1) by AM8P189CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 11:56:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a33905e-cc0e-491b-742d-08d98d77630f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5581:
X-Microsoft-Antispam-PRVS: <VI1PR04MB55817F923133016B651CD34CBAB69@VI1PR04MB5581.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ek9HVRq2Cu68P6VK7EkYDlB2giNi/6mzGV63ns7/ZJvSm6oYcpX8azzrcmT62u7Sj4ZPvHO57ok+rwKvu6p4neNmrt46dfmovg244gX45Tv1szf7z5o1yCX7s2D1mn4Q4DMJrH0ek5FFMQTVdFQdgKpe7nyQiRyFBQJqaXDUR5jClUOmhjbvm8SLROYqXY01KSD9eflMq5RV+jCCf02VAceJWoOZnk54lreIGeYeDwuM753Eb+2nYB5J9gNu/oSd+RxbHP/xS3dWX9mJSHlVPZoeavXIPz38DdB8cPV6SGyIY9T1+fJmtgyoIbhTCzuv+U1QRFlmH/W4GqdA8bEr+dU8N+RvC4sm/uR4P8GjS4z8YbsDZO5vN/4X+77X50eGqeZ86lwHFrx2wqoJ972WDWbbRlReIluSH9mlDjTvvMkx5EFqIguEBvi/zQAN6tyviyCsjWMDJS6ba9CsQd31i11Eo+L4zME1ISovL213hA/XRfX3U9195JJ/ulou9WDIXFcvg4V/6ClrEyq9CT+1K7XkCL05PK/3nJcG54s62+wWK44lzGs22FgtXZ5a24L6nTqbQZqAIajQ9Z8OQOxu0rOHuOkQkT1ihp8ZzIfwkZtoEbmcCJQ7zUCVurloNpO085bX7OY4YUSq7Gpxm0FaTJNiDo7o1QIBMD/ffoL1U2e4eETtcdPGvvx0BlIWfsgN5uVgOhou8FB6Qb0FsRYF5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4719.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(6486002)(8936002)(52116002)(83380400001)(6506007)(508600001)(2906002)(36756003)(5660300002)(8676002)(186003)(66946007)(6666004)(316002)(66556008)(66476007)(38100700002)(956004)(86362001)(2616005)(26005)(38350700002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fu6zeAexgonJkOyPfmmu5znscDnIiUiDPdWHPye+5kd3JCgfPD15KuTB/Luz?=
 =?us-ascii?Q?oG3u9wSEXXr29ad5kRiHYQiKyCrFwEs2pE9/2ik/jbvCHZpv/pVQtVka4LED?=
 =?us-ascii?Q?xGvXL+xik02WmGFtVxwLldnH0yl+FM0TYVwUevgGUEvEcEf9HQUujiuHzbEi?=
 =?us-ascii?Q?/Bj6SeJKRkVD4Y7v5DRFGsmd+3tc7Pf+XtjcvFBqwdThGv43RX14D3yQABCs?=
 =?us-ascii?Q?2Oxx0ULLzYj8I8W5OkSUwpZTknQAUguDKeVeQmF0xHk0uY6y4bzMZbmhZvDC?=
 =?us-ascii?Q?cVyp3ZOq89tvQYZK7bgAH7IEyJdIVeiD3MNwkdwsT/ZZRTRCFzQd6TtXSLyQ?=
 =?us-ascii?Q?lMdXbfcbdVXvDFzMjdbKgr9s7y5AX/D7jiqkfY56x1Eu8agvfeZx7vBkOkPN?=
 =?us-ascii?Q?s4B+yVBXhHF1r+VfwlaDQsejRSL1I0VenVXoUJIB1LHZuulFKPIxernlhG/y?=
 =?us-ascii?Q?/GDA0fINakf5mCKb2UP/GN/6p3ok7hCenMVrZnBjZrSMKv8fMkCsriLf1Gx4?=
 =?us-ascii?Q?6L8QgM3BUYXbWUWzU+wgOqpkjt3bNGtuOssUTHpO8vOEv4tB+l2cJyTsE655?=
 =?us-ascii?Q?BLPsxMMSkWj8VIXo1CoqavGK584v5hnySULkphSfpIzR0sXvsTedmqMs95yx?=
 =?us-ascii?Q?oAhZ3VhdhjJWCwbPl8zvMpzsoev0MjkibMYCV9yv20Lq9aD6LoyP3pM2cR4q?=
 =?us-ascii?Q?joNsL7QHQ5Od2CRohMn+EBx2ORYPvf1K97utSixdit5IhFJu3/pYct0sNpa3?=
 =?us-ascii?Q?BN2hDybxOxsLvaMISTjQyYeCme5Rs0QGg+Gq4u60Dp0M1xQUZX5SXdneYkWn?=
 =?us-ascii?Q?TrEOK7sP4kAYZ5yjEz/XYzL1Rrhv/hpb9UAyhnxpY9Pg+KooyEAHb49+hV55?=
 =?us-ascii?Q?23npp+Wx7dtsV3gdsLox2Jc5hTzVY7TGtmsGGBefcgrW81XbYmt67PNJ1txz?=
 =?us-ascii?Q?DG7fUmhFeJ5l+4iNbLTcRQmycOoi+rpFuriBwFxtfS5wJoa2RtMG9MNIbZSm?=
 =?us-ascii?Q?DN5yY2kfn/yiFJV4+0O6U1DD3EtPK2RUQmm3JUgVxY1jmSSdeq5VeFghvV83?=
 =?us-ascii?Q?2TfM7i+mRGC1FvWlXY7NROAVXKRGMgAarXzXdu2Wf2DOWQZ6tWzXSXGRnJ8d?=
 =?us-ascii?Q?p5VLfjDCIHIa7deMb5oDKWpL9aDoQp9XLmiRUFitIhFszzA0Wp45c1DKhxe9?=
 =?us-ascii?Q?DyPvWMmpsm0/wxbeS1zdpOOyc/2mf2D6xgYI4ZLsBkrE6XaA1W+2ZqMamfGf?=
 =?us-ascii?Q?S0mobbgLhVCioPl+NkRKwriAKR55XNK8yDQUMD8EdmwXGhm8+nzTYqmigrb0?=
 =?us-ascii?Q?kfE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a33905e-cc0e-491b-742d-08d98d77630f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4719.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 11:56:55.3736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAkqF9cP1mhgfp92APzKaqIHHafu072Pkv745kS8YXQ09tLWete+46mkwXZQv83sCgPVkhZmf4UsYCuAEQ4pb1N63vykuR98GRz702JC//c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5581
X-Original-Sender: anda-alexandra.dorneanu@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=f+SiD7B3;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 anda-alexandra.dorneanu@nxp.com designates 40.107.21.64 as permitted sender)
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

Add device tree demo for Linux inmate running on NXP LS2088ARDB platform

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
---
 configs/arm64/dts/inmate-ls2088a-rdb.dts | 138 +++++++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls2088a-rdb.dts

diff --git a/configs/arm64/dts/inmate-ls2088a-rdb.dts b/configs/arm64/dts/inmate-ls2088a-rdb.dts
new file mode 100644
index 00000000..8aa36f54
--- /dev/null
+++ b/configs/arm64/dts/inmate-ls2088a-rdb.dts
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree for inmate cell on NXP LS2088ARDB platform
+ *
+ * Copyright 2021 NXP
+ *
+ * Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "fsl,ls2080a";
+	model = "LS2088A RDB Board";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &duart1;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x1>;
+			clocks = <&clockgen 1 0>;
+			cpu-idle-states = <&CPU_PW20>;
+			next-level-cache = <&cluster0_l2>;
+			#cooling-cells = <2>;
+			enable-method = "psci";
+		};
+
+		cluster0_l2: l2-cache0 {
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
+		 CPU_PW20: cpu-pw20 {
+			compatible = "arm,idle-state";
+			idle-state-name = "PW20";
+			arm,psci-suspend-param = <0x0>;
+			entry-latency-us = <2000>;
+			exit-latency-us = <2000>;
+			min-residency-us = <6000>;
+		};
+
+	};
+
+	sysclk: sysclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "sysclk";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 13 4>,
+			     <1 14 4>,
+			     <1 11 4>,
+			     <1 10 4>;
+	};
+
+	gic: interrupt-controller@6000000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x06000000 0 0x10000>, /* GIC Dist */
+			<0x0 0x06100000 0 0x100000>, /* GICR(RD_base+SGI_base)*/
+			<0x0 0x0c0c0000 0 0x2000>, /* GICC */
+			<0x0 0x0c0d0000 0 0x1000>, /* GICH */
+			<0x0 0x0c0e0000 0 0x20000>; /* GICV */
+		interrupts = <1 9 0x4>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ddr1: memory-controller@1080000 {
+			compatible = "fsl,qoriq-memory-controller";
+			reg = <0x0 0x1080000 0x0 0x1000>;
+			interrupts = <0 17 0x4>;
+			little-endian;
+		};
+
+		clockgen: clocking@1300000 {
+			compatible = "fsl,ls2080a-clockgen";
+			reg = <0x0 0x1300000 0x0 0xa0000>;
+			#clock-cells = <2>;
+			clocks = <&sysclk>;
+		};
+
+		duart1: serial@21c0500 {
+			compatible = "fsl,ns16550", "ns16550a";
+			reg = <0x00 0x21c0500 0x0 0x100>;
+			clocks = <&clockgen 4 3>;
+			status = "okay";
+		};
+	};
+
+	pci@13000000 {
+		compatible = "pci-host-ecam-generic";
+		device_type = "pci";
+		bus-range = <0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 53 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 2 &gic GIC_SPI 54 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 3 &gic GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+			<0 0 0 4 &gic GIC_SPI 56 IRQ_TYPE_EDGE_RISING>;
+		reg = <0x0 0x13000000 0x0 0x100000>;
+		ranges = <0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+};
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211012115644.31005-2-anda-alexandra.dorneanu%40nxp.com.
