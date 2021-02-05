Return-Path: <jailhouse-dev+bncBAABBKEO6SAAMGQEJHS5YCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE9310708
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Feb 2021 09:51:53 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id 137sf3883996lfj.11
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Feb 2021 00:51:53 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612515113; cv=pass;
        d=google.com; s=arc-20160816;
        b=QMcDY4oZruCvsr2XpbbVSyQiT7eYd57z+zRa306Z9ng8sGiP+ZBRFE9f8nXifJQIce
         ft321KHtXonbWesD5QifJzFZaO7a5ziYEYdTnxazo+nfI9NabEow107SD9LDerSg6gZd
         fOPewbHDGLgKNdfge/lq5TI6Qa9Rlc0HWkTa9LsSlxLb5bne5GuT8sRh1zwYzshjwwcA
         qDJ+CTlZXURs+aLFigv1o5FXDvt1PuGDnfhrt2Pruq7D7oYKVaQtDd4it5Ncco3vS8t+
         eErMQq+9Kj5kd4WqmzV6PJWr3IkHP2VSqx9vJOwQjLJnTTIY9QhuTjhcfD9VA1yFLM6/
         apRg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=SpYYt8M4AS32+kiCPlLVmkeW1PWiM44PJxmZAzVDVSM=;
        b=FDlaJiG/Cjdhje5wTMSOYs+yd3YCfBSkq7/iDLXDIf6+qP+3DxvPHcXS7jdIYLrqjR
         ys6nmDeX/14dTNBMwivo7KvRAxRy0D3kcmyU+6/x8P1lJk+JxP+mVWC+/kHq8xEWflkr
         +FdzB0nYba5wBz5FT8Lde4fmKnLr7gihRWkpgsrQp6Jdxy1J93rEBrurxn9+8FSx3b0d
         /IbtCbdgeFZTL+uxNoq34JfX7A/5zLzcZlzeBfZAmJrIpiGDXVk5y0HXMY5kikMZu4rf
         JML5ADdr09URqmDXVVTXpN7fEXIeF1usg00XjgqwII4smSbPBTaezMH9IctCNoUo1aY3
         efIg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=shvuWjf2;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.73 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SpYYt8M4AS32+kiCPlLVmkeW1PWiM44PJxmZAzVDVSM=;
        b=gZX+LDCo556uYAPPRQRbYD5DMut/GKWDoAZtGc1OhAakFgRVS8a5oBAjerr/5ZJC7w
         TicfENWjYIXxVedNwgQBUXZGBdOWrCcMb2DUMU9nFDUp3fcdyOYK6P5Pjd9QI59xeQvu
         nQHSR3b/k1Sj683WD4GnFFs9lVHjtDYoc7WywNs1SAboxD3YDWfCLamAQyPue/NqkelF
         s33c4veppHDRJAjADA7Gitq535RraoB3Sk7scJejPPulfVSecWGet+a+ulhnUMTiCR9f
         /c+Bq4sRQCdYGljVrGJM+rRKCLCEHxtTReixU75QpzQAFuUIQHLkkIGpDVDMGdEiu/K6
         aq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SpYYt8M4AS32+kiCPlLVmkeW1PWiM44PJxmZAzVDVSM=;
        b=s7zioAe/jA7Ug69Bc5JRi7Ddn9lFhZy5YakX/atxavwJdzdMw5fzW2hc5YIFY4wmyw
         ttbEtDJOA6Lij4BgS7kWfJsYTFckKAqo+zK5QRBnQE0evXZy6t9VarVc6SPnxeeII4kF
         Ib/NzShweKGcjF0lia/1P38Vn7lHiBKxwsPkfApakWgPEXT01bpbZVHQGYll4R9L2v95
         AYy83oNuAbXw/wVmW8FF5OiMNPfk9Ym1YPW9Zft5hu0GsLKejPW8BXq+l2XCwZ6SQqFJ
         q038bPliG1xMFTYhzjUHKvyFu/V0HLGvXYCrTwZFWhaTEbMwVAXZRP+fz9v1OTGNgVVL
         08WA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532fjgyebnUKtFVB9wvGyy1N+9B+yqNpj9qLGVlW7vjm7JxZqO4i
	bOUXkBLDZeEjxTzIIQwMFOE=
X-Google-Smtp-Source: ABdhPJzJpHM51uJ3CR15PgYrHeyJJ6RCmWc5uxXi6vcbn8g/NZTRkioy+C8tNluH5Zf69KeoqJghnw==
X-Received: by 2002:a19:5e52:: with SMTP id z18mr1926410lfi.234.1612515113150;
        Fri, 05 Feb 2021 00:51:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8e77:: with SMTP id t23ls1531362ljk.0.gmail; Fri, 05 Feb
 2021 00:51:52 -0800 (PST)
X-Received: by 2002:a2e:3209:: with SMTP id y9mr2024018ljy.446.1612515112286;
        Fri, 05 Feb 2021 00:51:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612515112; cv=pass;
        d=google.com; s=arc-20160816;
        b=eT0rq2jYPawJe38our/aYwJb+K0zi93y9oHiHlclZPV61xvLVTfTQm9PCtlx0YHi23
         bHWI8l21thcluhrIug+1LURqzsD+lcjpS2AkuXt5J5xQvA1g3MO0pQyswrFRYRDMmWRA
         ndsjQSqU/U78LYdl52ycwOtaKkWFYs/aDsv2CHPmJvbshGkVBxlxVbTWhkY1hMaDZzR+
         DhFrPtK1PYV9neJVKT+xz9H1ZPZuFiqUpcdtfsJzSyC55Scg4kVPg7N63SrzxTXC10LU
         EOuzljX+zHYTUKBesC+Bu21LiGUUSiin1vlSrpnZcCaAcH48lZc5mW4RTkY1J4INopXU
         YNxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qRFTeQQORXZwOjgyiowRQ0CyDU0WhPzis6jUruBrVK4=;
        b=sq4daFPM4bxUJkaBqBGyGquG48upcbLCiQBQaA/EoBTTR8oFFxoqJctNpYnvxNzRjO
         BJRyNEXE9pL01j5HVhoauRSl6VwVG7z7FjKdnPuiwtRIxBcgo4e8awkaWw34rvitTfZm
         vlgL+lkMu7LhccJ4+EILFk5D9r9pYnY32iEl4mJjrG6c8TU1mG2qw5K5Cb9k/27sdR4l
         1UNqbE4XJLKJ3twbupKljp7cI8yKMlgpoG6YlATWdlC72SXQI0jkyl8kJ6pyWrtlxaBg
         O94m2jgRwLB9ys73ltc6ydf3RsO0QbvMKWDJnSClItpMuuascRVr1ZmwX1kJVX0GGnQD
         KgZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=shvuWjf2;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.73 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com. [40.107.22.73])
        by gmr-mx.google.com with ESMTPS id c20si351925lff.11.2021.02.05.00.51.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2021 00:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.73 as permitted sender) client-ip=40.107.22.73;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZxcaaASqN2lVT7c8IxOT+WJmKfDA5W1WpryUD6IB6ETHKpLQqba3g5AWdu24iJFvF2AZACqv4FwudVja9rtTRHqyMdyTNRLzYgcqvx7mh3gBqOjGTAoHb7FE3fEoYCf3ZIlwxZXcWxE3QasCW4qao9O7BHxXCFt5GP2KZmr2vIJzcdYohEZp7S4SkGnkq5DC+p/t9hZ0XpnXMMIG60c6N4TFoTzjwZmTX4/Co/VchodzRr7UZVH/JdTjAXqM/57gpCutyrfTtXuniR4POqEO28id7srmh5x3+s0xnPo0WLmoaMHDlSe5YXqaWdhiADCwLEguIpZ5/kNFqzTVeetkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRFTeQQORXZwOjgyiowRQ0CyDU0WhPzis6jUruBrVK4=;
 b=kuIai1+GFa2Q/wuZJOK1Wf9n5Dj4Ck2XY0o4MbY/vzGa3Y8Ilp16oAGvoBWdDQYcGhFGYktjePu1XF4ri1PUzkzN976k7XKwhaK5DZ/f3Kq8xhEaBHyyuQYz0fMUv9upyBeX8BEG46NkCltpvfZtOhWayvdmshbBao2qMvigdYWD8jr1Y9b85MwC6ewnLfxLW1EsCsM40fiLq0yoEZK/EXOKFL1aO7qrDMFpZ1f/lujMkf+pjYsqAsKz6FtMC5gznD/6biZkU9X5Olt3wI6vqRuqr06iT6ypjALZ1Ll6dulh3ZRUaII5ALYJtC+KB5uwq3EnDkXhbPzT1yAs74eFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR0402MB3824.eurprd04.prod.outlook.com (2603:10a6:803:22::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.25; Fri, 5 Feb
 2021 08:51:50 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3825.024; Fri, 5 Feb 2021
 08:51:49 +0000
From: hongbo.wang@nxp.com
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	mingkai.hu@nxp.com,
	xiaobo.xie@nxp.com,
	jiafei.pan@nxp.com,
	hongbo.wang@nxp.com
Subject: [PATCH v2 0/3] Jailhouse: Add DPAA support for NXP ls1043ardb platform
Date: Fri,  5 Feb 2021 16:55:06 +0800
Message-Id: <20210205085509.21595-1-hongbo.wang@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [119.31.174.73]
X-ClientProxiedBy: SG2PR01CA0161.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::17) To VI1PR04MB5677.eurprd04.prod.outlook.com
 (2603:10a6:803:ed::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from whb-OptiPlex-790.ap.freescale.net (119.31.174.73) by SG2PR01CA0161.apcprd01.prod.exchangelabs.com (2603:1096:4:28::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 08:51:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 421f91a0-1afa-474d-ee76-08d8c9b34690
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3824D4CF6E90491E204C602AE1B29@VI1PR0402MB3824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nWfFuJVpLNQVHMCKOxIOPJg+h9gIPrdw4bX3YB8zVjU+HW8IihreAiSQFx2AnIePQfePyXx7vCYywtAV4u0KNgz9r9xncQ5L/+9pYnAf/breId57FucGCBWLZ3tzeeK2GiCRcwTanwOzsju+Yava73bOEN2lpbRf/cCVRt8V3UG9MTdfLUhXoGrXx3Ls8h0QMgC2aQ4vRrRIvERKWepcaAN0e0FK5hXG9ZTpmT4fI8GfCvE2y14tBLKhbUavRUllm8WJILTF36oF7M5pz1A+TkIMw1kOqbEWIbnI8DuBzfaPaaqJqxG8DjDWcNh+qioUvYyG8clczjG6+CWO32X661qKEo8kjWT1XPw3OgucFcMWLFWHixqg3KqSDD7lYt9h9DF3VcpqepMyMFf1ELlGq9Ydi2CHmgVwraJUqSuWy3Yeb9sghATltsHd26GFaNZvFZwV9HT5Au5c2tspB+1LJB4uh3oMayH1mcjtp9fWxFUPm9yWCGvRii9gsEOD4m2YywRaQACEjt1i0SsEia+BRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(1076003)(9686003)(5660300002)(8936002)(36756003)(2906002)(316002)(52116002)(6512007)(6666004)(66556008)(66476007)(66946007)(26005)(6506007)(16526019)(8676002)(956004)(2616005)(6486002)(86362001)(478600001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8MMOHwQ6W9UdXYb6y7i8KBMCDrWP4rKuxt7u0ACPGLnJSlLawNlOis3LLgv6?=
 =?us-ascii?Q?PKcs1rl4QZy3ne4dBBvAWbBeZ/0G5vNYa4oE/uvp9MvSlySn1LSCFXNUASIV?=
 =?us-ascii?Q?puT66j8BrrQehPeJ0tHCY7kYqRK4LiX+orAWT9siWTyGT9jm4N/4SXdR/XQf?=
 =?us-ascii?Q?2dmHqu27KXvJZP8dGocGseDoEbNmfHryPDmnyh02WSbMcEe0EUf2l1mH/qD0?=
 =?us-ascii?Q?YQjoFewdlGJOWvS6cPWbVL5Mni8cXQiVmLkDAfE7a1Vflg1QoI5ecXeaTqRe?=
 =?us-ascii?Q?SA+mUnYLE/JIeFq2jjKyTt2Jt45I90KA35QlGsvn8mYFXaHsBbjTGMMV+BNH?=
 =?us-ascii?Q?9LDxb6pGV8k06D1yAAhd+cAUH+DJLQm3Ifpbr3PVSbuQc5cJcLIqF+6w3rJb?=
 =?us-ascii?Q?VSjkkUQB3hbdRUsX/+Nnf5JS5/LjvKL0CszsBh5nT8GqwooUxuutmjeswnr1?=
 =?us-ascii?Q?T+Iag3xtcov+jjTc9KdtRXxm4Fu8PO9h7G6Okq3TlGg3uWwOCJP+cTPAl8Yg?=
 =?us-ascii?Q?T/7CehHuzQcuFOpRElYmdRNHiiunY/r68eGWX4BAlaLrFse6JnI1n4AZ17RG?=
 =?us-ascii?Q?b86sKQC+dK3EEg6XOiWxZa2KDrcVjrYiv3HX3uwp4ySQLIXf6IBjzGrBrUN1?=
 =?us-ascii?Q?gD8qLXugC1GgwjpNp9cGAl3MpzLx5gU41oFBL4Y6B6kUHUWYcWiX9TeucIZ2?=
 =?us-ascii?Q?jPepYLCYjF0pJ3yKzrDacB9VQXhUIsIhydaZqZ8lVBfMF2oVeuStQ5lfBxuF?=
 =?us-ascii?Q?JT58yYTbdkCxflYnfTp6qKBMOyxESByTXqtop+Kf6cooGM3WBxkEE1MVhs4X?=
 =?us-ascii?Q?90GlRAIbx7oVe1TakQjS4/rSAsQSeNLZ3lRyuPlaWsRXpVNPa3sRS3WKfmxE?=
 =?us-ascii?Q?/4dqGyh6fCY8OjJAWIPmGf9jcoBSc1ec2/ZK6FJcEB4e6ZKqrv1mRQw+EWrJ?=
 =?us-ascii?Q?f78uh2BxG9Bsg6F5n57LCYqPYZ3k8eLuxycKlwPrF7Wu9PL0PIVxgMum9qxb?=
 =?us-ascii?Q?EJXzM6sKb/kuXHaAMs7aTvlcPo1ycAfrcHOj1ToVuC675uGFSUKRmVuCgnEn?=
 =?us-ascii?Q?xc/viPAd8kIAAADzeqfeg3J2ifOcP/CVSgV6OKMCFHJeNUISAMVBCL1mevl2?=
 =?us-ascii?Q?1RXqT8ARaKNu49RbBKLL4GRH1xrZGow955/nXWyFU+p62C0COABU0cBcIt1F?=
 =?us-ascii?Q?GpPtbPlcsUGI7EAQJWGQcwKk8xfwMlBz99tMRcGggHKjLOE90tKpFwYJYj8A?=
 =?us-ascii?Q?hjk4JDqpsqcB6TILXu2+OssWK+kxiwy6bChUCGOZ61R+0yFtUxiTBGv8EcG3?=
 =?us-ascii?Q?m74IWBc03pQn+7jB6dXsQwQr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421f91a0-1afa-474d-ee76-08d8c9b34690
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 08:51:49.7734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qS8A8Jq2EmRix6UHop6qinXQJv7HoMwbO9V6W4cJRGcWCns2ELNQ5AVj2mJM5bz5BBIP9uSxIdypj/EfjVb3UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3824
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=shvuWjf2;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.22.73 as permitted sender)
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

  this patch-set is used for the case that non-root linux cell own
all DPAA1 ports, root cell don't connect ethernet via DPAA ports.

  if user want to non-root linux can connect ethernet or cloud
via DPAA ports, and need high performance, can choose this.

  inmate-ls1043a-rdb-fman-ucode.dtsi is fman ucode, it will be included
in inmate-ls1043a-rdb-dpaa.dts. 

v2:
  add separate config file and dts for non-root DPAA case

hongbo.wang (3):
  configs: ls1043a-rdb: add DPAA support in cell configure file
  configs: ls1043a-rdb: add DPAA support in linux inmate dts demo
  configs: ls1043a-rdb: add DPAA fman-ucode dtsi file

 configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts |  930 +++++++++++++++
 .../dts/inmate-ls1043a-rdb-fman-ucode.dtsi    | 1030 +++++++++++++++++
 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c   |  212 ++++
 3 files changed, 2172 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts
 create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi
 create mode 100644 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210205085509.21595-1-hongbo.wang%40nxp.com.
