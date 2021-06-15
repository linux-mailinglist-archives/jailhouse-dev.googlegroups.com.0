Return-Path: <jailhouse-dev+bncBC44VTVY2UERBN7HUGDAMGQEGQNPTRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE8B3A7AAC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 11:32:40 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id c12-20020aa7d60c0000b029038fccdf4390sf21817800edr.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 02:32:40 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623749560; cv=pass;
        d=google.com; s=arc-20160816;
        b=BYPRHdMRDt4XDxr+aVBa7AraZY1vRk6AGze77KTVlhdRJXlyiAxZhuZijf2tsu0G8P
         pP4LB915bXS8V0ME2DRPfq3PPTHLBzuWTrE2FaHrNKBvmGPQ6bfpKPzRLDWjusS7LVff
         oG6Os+tnAESFDw6c3XW+HqHgmNa0xDs0B3eDaRuokFaMkB8gzTWf41nUcRGn2aMs+PlR
         3VaLdZCd6rjT5vGWe+eVYlfef6lzbb94LZ1m4qL+9acz2kAwVZu+x44mDm1vxzfkliIn
         /uM4+5GJ3DZmEONoR7fSTSsUVpl1gqMMkYMJbQ2TO6B+ITA26K8xo9xjb6NzG/mhTTM6
         Uyuw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=WjuG73nKN6McTpiwK2TdDAP5XWN2GQN44CcDnd3SJwo=;
        b=GV47c5v9cMBhhEjSo3Lizq4+H1cnjcCnHeg1QsfUJQL6Hf76Z10ih96pGQcC7t56dz
         Xqv8lbpkjm07j0K7weKrP/xNrDLGcDsXF0iGneqDdTOAt/UO+4YthOF4t8RWP2I8lpZE
         GSu4IyLyJTDBMAL1xH5IxiTgoyZfQvMpi7iN3Kl3Zyr39Wou/Z2Osv3IKT+mQjW5Qjgd
         8SK4ZQazOTB4/HI0kX084HtYVXL8eBdHaT9EVwqpDHMf1dcKWfqIPyNujxeC0vunXKB5
         LPPOgvdnbND+in8Ci02Vlilv6bmDnB1ObTS2waD88dfq/qXF2B91RRddbSUTM0oGMa1/
         t+Lw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=Ha69Qwaf;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WjuG73nKN6McTpiwK2TdDAP5XWN2GQN44CcDnd3SJwo=;
        b=UJ3xULvirjuXTPzfep2qELj08D/WUlKcNgKO0UWGPALgDB/kZdEEYWDwTdY2sesvww
         EgdqdB5GHHNmdXQWjZDlzhhn4hNgEdE7WWuSWA8RiK+9EUQTMkLhr8OtndhorK6wU+Vn
         Po51z7cdgOZrXyA24FDyvt256nDKGcT461qinVcR07/4kESRnXI9InalwFTWaN8boL/A
         +eR72q62F19SyzTjqeyKP1eZf0QNdnDP1l9mackEJM89GIX5cIf7bVcnDpbOcQ5em0G8
         G8JdzQnW/Y8eNqaOK3KCEOijsPd8P23pGicjYJOAm+fLMs9+INxW2sQDCd3cNdgcl12w
         BTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WjuG73nKN6McTpiwK2TdDAP5XWN2GQN44CcDnd3SJwo=;
        b=WYn0ufRFubzJ3xOopaIau78yLtMD2r0RH33WacyYKMa3TbBO7JiKuv87CPf3uPi0NI
         mxTO0KKncjHsNSLjrdIV2ws7rZeuapw1/Ue4SnNjKDnV+cMhFLzrqPmVqNEZOhh4Og8I
         ZDg6/gf/d4KQhJlS843CHtJXT53oZMLNySyDSuLaPm7h+iCn0Z9M2f279YgMMU/Gknsa
         NOYQV1/J3bNspavZVjFfizHbCyWsY296tSCJye9be2jhMMm2ABOZhi8V0c+jU7XujhQU
         fDesTzLuGagzwJIimXAFuTNo1uzBU8sxmiz0n+Qc+v2O5mYhtiBHh9cEKQxk6T33ksVj
         tEmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532bT6wD3NKE1uijueSE9LuOMvJH7QEj8ZU3GGKS6Nuu4EmrfrOV
	HlOyvnui6sUV6iYoIDWZQGE=
X-Google-Smtp-Source: ABdhPJzXFwY/Ka+LIEZpOH5wZ2E045/LDwmEyLx8+Al2UC4lcSpVni2HjRQT5i5kHL1n24rKxZINww==
X-Received: by 2002:a05:6402:6d1:: with SMTP id n17mr22320428edy.116.1623749560080;
        Tue, 15 Jun 2021 02:32:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4757:: with SMTP id j23ls7800343ejs.8.gmail; Tue, 15
 Jun 2021 02:32:39 -0700 (PDT)
X-Received: by 2002:a17:906:5648:: with SMTP id v8mr2519685ejr.421.1623749559163;
        Tue, 15 Jun 2021 02:32:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623749559; cv=pass;
        d=google.com; s=arc-20160816;
        b=jVpfhKe2P+zOR9go+wNUMm/1HLGigZa811w5PCnU6WJBSAlsiGB+TXPHunmayqzJEs
         yBKcK/ds5S8xH4Ii+D2GvkevBQIdEiam9F73pCTY8YmxcK4HLdN4t5pH3+Np2pcT65yc
         bL1msyvwWgf1Dv5LbWIt1BuUz2dZuq6tiWLv9SaA0HTQpWm4e8mWxREsBsmC9jR0s2Zh
         EEQGuaxKTf+Ej3XocEWABGbEm1fUHlyMDACmwiTWh7rD1AtCbRugML8UW5KZhkvU+hPB
         q6xnpijj7kmD49L17WV1Z9wNjaF4bXQaCSBdjaJTEa7OWxxi6oTNPyLMc9zjwMTsvCIu
         Y36Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vhbgkQCUaTBblNPIk6BBBaYZVlVb4ugglwgIqxAVsNo=;
        b=uI9ROZRKNEYADD3FQ2ZjJsPAGas9HjypJrJCp60k923BZgM72+GjEywYW5IrTYIdhu
         7Mo3GP6htJoxKYK4dd3P4ULsQVz4UctElyiRETG52tyqwdfqeWeSftWjqqO02zPTXpG1
         bt5jP3FrRd9bAsC3ewObssIuys2iWjNesJkh2KYeZecpCEpJ1qd9DJNHZH1fD+ZE92qz
         CHx46kKKUzZ31dswjXrOVPRKOfRlypoLQKcnk/GnbxZsQctwSDBMxLY4gd3pSE3mJTvz
         sS68+WdPFCwNTQ5P3IsnXWjnWRk8o4IkXfS6Y4vR6vJIwx6lEhfoKQVJQP8Qsdx+NZ/O
         3blA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=Ha69Qwaf;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80083.outbound.protection.outlook.com. [40.107.8.83])
        by gmr-mx.google.com with ESMTPS id e6si59393edz.1.2021.06.15.02.32.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 02:32:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.83 as permitted sender) client-ip=40.107.8.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9wad9t1i8nv2KTpl1dqAAziVpN7l6heKVHyUcMacdKl4l2Lgq0B2XulRPaQoxjyvn8f59AHDIIHqZykPFQANdTKCfuJ0bWARP7wric/ywq6xmDiaK+80ka2KK1fSMnuIeuAfjzNpd8MjUZv2io1Q354DoFvaRNifNtJGI+EH4cnyIbbVp61UF/lbIBQHGuxcoNRyK4xKr0EM8RGzWdldHKSPZn7gSccIQki5pHvd1420Fkaj1WfKoFvtcROWmzi7TxiET975BuY0Y/O9TxU5Ypc/hcAk2y0nPp9QM2A7/Y27t8WebhpDicU61hRvYdHQGporx4ZHrRd+OcdFQRQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhbgkQCUaTBblNPIk6BBBaYZVlVb4ugglwgIqxAVsNo=;
 b=SIjkitvfOqHoP5QYKnGjk/DMyRy9QcPbjkpo6j1gwaRKWFROVzPs0uma/S8A+wsQcyoAXed7xkxOBTGC16cwjCx+o63piEoy2dQRAiEAe9QAm1rSAkda/1vVaVHOGoR/GVO4tmwK9w6KsXkh/BlouIi5qV+vr7IZwgjAI0odbFiMhYQhXTIZfEe8SUdqu4ksA74+ztuyNVallxl/swV6hv442KBysdLb9KKu3xnjIXjOUsLZnf6+vxlXKTUoR2WWFUVs8Ex5QHHjbda7EdUyRuQecLrX2soW3n1kGqJkHP53qQmXkoewWc+8WPngk4xKLyDlKTQo8DK+avgUzEE/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM4PR1001MB1235.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:90::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 09:32:30 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 09:32:30 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v2 1/4] Makefile: Update build dependency from python to python3
Date: Tue, 15 Jun 2021 11:32:22 +0200
Message-Id: <20210615093225.162909-2-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615093225.162909-1-florian.bezdeka@siemens.com>
References: <20210615093225.162909-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [178.27.125.62]
X-ClientProxiedBy: VI1PR0102CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::25) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (178.27.125.62) by VI1PR0102CA0048.eurprd01.prod.exchangelabs.com (2603:10a6:803::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 09:32:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eac5ea10-5fdd-4593-c552-08d92fe07f72
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1235:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR1001MB123528489E61B4AA1738B8DCF6309@AM4PR1001MB1235.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CnI8Y04vjR/ZrzfpF38GWREKrjGCwXPHC8G0U4uhhbddDLeLbCAC5QDg9uhbEz556WS33672Em30ncnHQOU4KRIo/ceXV0WcTe6s8lx23zVY81Q+8dZFyRBw9zNRXsrj96Y+E5oJcpNfDe3OuQd6mH7QM2Y+r3WiKYtxnG4c2aXiqoD+yPc0nXqsfLOjVWyeEAl7uUfOfjaxKmc3xg5kNosmw92ZRiuJ0zS+1qFf7XXoTmJ/NeXKkP3yOoWXCDyBljkgwojV/HNIwz3X28LG6qYiM7w5JsroTyNP+IQe453yT6F/yODKFMYJH5ZBC8n8Zo41cKXipkZLJNajYs38e+Hn3BA1kX8ldP83zdkftPR1xl+7wlj6HbuoZSxWgPrkzIFYINd3u0WYZWwr7bpcqs0O/+hEWzJGVhUtFO9vYOdmkkxlgaRaK+faMKBceCx6zU3CVWJlK9HA+uX2VLwlbE7InhDDRGI345krGqB20xAdzISaaXD4k/2SwMlxpSVM65BQiDRZzdKVgTLFLthHRq/YC+6dtfVCtS9SJKq9VBX/NOdf1j5u1NvpRAtpfGZ32PVQmVbUtA6Zdc2KCKNRrnlQRE79HYUlxQldZeu35Kw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(44832011)(8676002)(2616005)(86362001)(6666004)(107886003)(26005)(956004)(478600001)(16526019)(186003)(66556008)(1076003)(6486002)(54906003)(6496006)(5660300002)(83380400001)(66946007)(66476007)(6916009)(36756003)(4326008)(2906002)(38100700002)(8936002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?niCZ4OqpogXYryX7dxAOx3LvMQgfnfEst1+GsivFVmmRUmko6lvVeD3uY8Bn?=
 =?us-ascii?Q?PSMKei5y/fLKVjAt2lNUL9lp68S+pZ1sRppK4IbZuqu8iiAcTDjgDAgrS9Z/?=
 =?us-ascii?Q?rFRWZwKpho8Ll7ccLOQpalTHn9XPRIrTa5XKbzVLOCYATC+llx/WM7bESQ6b?=
 =?us-ascii?Q?AjNYa9TUBM1aJHvs07LQCdR/VO6D2h3TDcBVtP8m0UK91N4JP332cFTDKSMs?=
 =?us-ascii?Q?m8p58Y54TK8lY9ZTor014cHtUTG+ehLEl+OT6BXsvWeBxGeik9Mt6UJnXGLU?=
 =?us-ascii?Q?SEMqnSWlWFfzdrcOd0mRCiKArv3OgGh9Br/Nl6Ehg3Civc1cILKFOrJ3ZjMl?=
 =?us-ascii?Q?E/ILn9mJM2Y8hTtHWdpWve44J3K0hGtOIfyX8wuneqdAPEyGeVqqPi9o9LUm?=
 =?us-ascii?Q?DHp/8BrHyeN+oO25/UZmTS6nis+SkEYJuevqITSrvShe3alUegs1TJThR1J8?=
 =?us-ascii?Q?hdHUEwZQ2XYCYSKHWmUNGn9bAm4aSlIpABbsiTfyyCag3VJpGPuajgN5kT0i?=
 =?us-ascii?Q?dfbP2Ito0EHqPbcIZXgNK50Zq9m5jv+SEaJNf0QKsrbNp3odFa2YR9d10BjS?=
 =?us-ascii?Q?f7O5GlbQsvIovR95Zwx0nLirIHMp/FeSWlJsLtIjtJiiPCoMCbWkz7ljdaLw?=
 =?us-ascii?Q?CXsamGoUNRQnHOSuvhgpFj4eH7CEwA8pwaS1R9aRgLFvONImMOD2WiWDZHhJ?=
 =?us-ascii?Q?gfd310whscUtez3CzE7kfRDNuG483FVqqGu1tv8aT4rR/gV7N1temBCaMP3T?=
 =?us-ascii?Q?lMU6vw3g5XSKiy0yW/lPy4iJjnXRVVuesBPbmYZrGPVncLOB6H2nON+FVXr6?=
 =?us-ascii?Q?jqui4rWndhLNgDvEQZDexl+BrwYEgsQiNFt78lnVBdCwSPvfjUDcJmS/pGXM?=
 =?us-ascii?Q?0lW0Cd3RS+7Smqk3zWDtNt9qm25MjVxCoolFUGGbhgZ0kWjnVMac8WK8kMqE?=
 =?us-ascii?Q?iXmkUXZZ5u6Uwe3hGIEBSDFsX5mJ6YFlYLKKngK7whaefV5Lm+Fipoyy/yIH?=
 =?us-ascii?Q?qxcCEtrIolXrffFdr9h/uShes9iM+1Bd/UkwLpcy7IEME+zGcQlP+cIUOesH?=
 =?us-ascii?Q?jg1khrcuVXe8ZL241WxWGHVpravJX/5ZI66LrjPEWYa1NZi8bMKy4yp+mcM7?=
 =?us-ascii?Q?WZaln/NYVt6tbXDl2y9DxRBKdJI1LBaJJDR6QEF1qWN6Yk78FrukSHOqPTjg?=
 =?us-ascii?Q?Dd9KHHtvus0nDwX8SyGkseAjlGW0iTSVybHSu65wnj7rkol16drCcsnsd1O1?=
 =?us-ascii?Q?AYRXBGD/rbikMmVcR1auwcQCBfiYeybY7ODNcsrCzuZTqGp6MWamk384sbNW?=
 =?us-ascii?Q?asVg5WttnVq1Yt/RSj+SvCxp?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac5ea10-5fdd-4593-c552-08d92fe07f72
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 09:32:30.7863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7kLbNJ468Bd4fyiiwg4xJEVx4o6TLr7PRVZsqOh/YNoj5D5a1n6czl9GeZlw+3otepBukLRbiqk/9XYRnnBngh1JRVjkLIZKQ0BPYGxw1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1235
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=Ha69Qwaf;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.8.83 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Some distributions are about to switch to Python 3 support only.
This means that /usr/bin/python, which is Python 2, is not available
anymore. Hence, switch scripts to use Python 3 explicitly.

Not that the PYTHON3 variable might be defined by the Makefile in
KDIR already, so depending on which make target is being called it
might be defined already.

Upstream kernel has the PYTHON3 variable for some time and is now
going to move away from pyhton2 as well.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 scripts/include.mk | 4 ++--
 tools/Makefile     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/include.mk b/scripts/include.mk
index 028f0ab0..d0139d8e 100644
--- a/scripts/include.mk
+++ b/scripts/include.mk
@@ -42,8 +42,8 @@ INSTALL_PROGRAM ?= $(INSTALL)
 INSTALL_DATA    ?= $(INSTALL) -m 644
 INSTALL_DIR     ?= $(INSTALL) -d -m 755
 
-PYTHON ?= python
-PIP := $(PYTHON) -m pip
+PYTHON3 ?= python3
+PIP := $(PYTHON3) -m pip
 
 ifeq ($(strip $(shell $(PIP) > /dev/null 2> /dev/null && echo "y")), y)
 PYTHON_PIP_USABLE := yes
diff --git a/tools/Makefile b/tools/Makefile
index 62585369..4faf9430 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -45,7 +45,7 @@ endif # $(ARCH),x86
 always-y := $(BINARIES)
 
 HAS_PYTHON_MAKO := \
-	$(shell $(PYTHON) -c "from mako.template import Template" 2>/dev/null \
+	$(shell $(PYTHON3) -c "from mako.template import Template" 2>/dev/null \
 	&& echo yes)
 
 ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615093225.162909-2-florian.bezdeka%40siemens.com.
