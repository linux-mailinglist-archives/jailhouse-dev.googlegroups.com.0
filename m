Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBEUF42BAMGQECTCBU2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDDF34578C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:54:26 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id h5sf582501wrr.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 22:54:26 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1616478866; cv=pass;
        d=google.com; s=arc-20160816;
        b=oyxxmhO1dZuXqTZ4YEOibw+pIiRCc8rsW6yEdTNIHON+ARAzXwSNE22lDUf3B8hy/S
         8PaQHmzPtIwifkySSslJsge8UQJaMGEkZbNn9T+XsPhkrj830SHrOKt/zu53BHcXUFUY
         4PB2yoD0oBrm2khqQN123ogyLYiJ9VURmlbsf9547yYbiZGESBDVa2yxXg2b7RzvqlcR
         8J/hWIVBdZoSxbHhkFPbQKs4NB20N1J7tvRpvYp1J5c+waiw7TmoDvbiVbPjVzDz9Y8A
         mRk2iuTf2Nr5EO1s+COw43+K5p7QDfzPxV1CC0xIxn/ZnMy4Skul60QYHeIgTE0n26nA
         sKhQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=XJhDbKalmO2TOHRbZ4XUtqHf8bXWcyUZdIuDifvVRLY=;
        b=bAr0vbQMenBqfLUGcxWy3BWKiw7ffft/1lrcNi7SeeoRvsYJMsxxhFGIhUPfJgCCGj
         J+kIsMAT3IfLGK/10gQNPoExSFa6GuIZFEP9pGgh+2CetuThTPXnyxs08cKkMBN1/wtu
         j2Amy2ycKpQeiWDGoF0rb5fxLIdm4nIsKOqSVzp1pmdLwOQ2RSlSNUef8YZfSj5+QTuR
         ifM5D1fIDfYCdQgRKy3eD52EYfEDhMx0QhmoB0pwAn052lr5ztRVKV0+eLrR6uj33dGz
         ++nBep2mIRfHM7lfQO8VFrG3J48PEQ8GSYKad6zsy4flNN/bB4YPvNVWfaorckniX5h9
         nFlA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=PIcB56Iw;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XJhDbKalmO2TOHRbZ4XUtqHf8bXWcyUZdIuDifvVRLY=;
        b=FV/9eLxtVewpOZn+J55p5/1Dk+BnsugfFD7z7rHzWV8cuqkz8ev8rAnXzSVc4Adbh0
         YeIYJFLkJH/KTh1ljCHXQAULaB8l0quM0htcFWKVw2Ti5O/R/32UtMM8LsorJHLT16Wa
         wyvKkBPglbA33d/FuGgb2Dwm2f4kBZl8E+FKBE1d83YfOdIAtyFXOTvRyk/rAonjZHci
         GutgfpeioZDs05vxcmHcCil/uKMI6KThI8U6I62q4F9k+tjSUh5BFm/b9if/lFNR3i9e
         ClmATv8LBgRcFa6eYLQ0DbDSLYLHDiyIfuUYGgcJAXp05+wOsUOXjyyD8DjWEA6dqeMn
         HDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XJhDbKalmO2TOHRbZ4XUtqHf8bXWcyUZdIuDifvVRLY=;
        b=Kp+JI9Cc84cM/R/4RvmMtcEQSTik3fpiBwrATw7Bkv7Ua9QafENkX5U5kUSzLT8zSo
         YmSUDzciB+ZtiSWpDVDefaiRFe03L0JL39RH4BZBmp3k1vW6NCV0uCYIMcbGtejdQ7e2
         DJctb9+QQ5UWd3kINe9DEzzHGwBW4PVtSOjvllBTg8UCKtXvXrV6Vm4FZU+TVcWS83Gv
         +7KHlO4IRDy1lASGee2FTz8Eegy+Np+FNfwFxpnxPhm66J3yPHjPoKs6lK7afRWTQn8b
         crMUGGrEK3JCyvxS7+R9PKt7RVesIP16QTLreYEm3c0qDmhkxFE4ABjnJmrzIdtEWDn8
         ENOQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Z0SB0Krrr/mgT4OfHVvl0Xbw4uwH7zzKWzBu30feU2x/CTXjZ
	tmpBT0EB2dnCPDSUmxyb2Wc=
X-Google-Smtp-Source: ABdhPJxs8haoRZXD/+tZutemXQsYGH/8tKi20HM3NO1JCQsUED4ashwt3dFbFqCPqSIMxxE9RAqvuA==
X-Received: by 2002:adf:a1d8:: with SMTP id v24mr1960399wrv.378.1616478866341;
        Mon, 22 Mar 2021 22:54:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f8f:: with SMTP id n15ls633439wmq.2.gmail; Mon, 22
 Mar 2021 22:54:25 -0700 (PDT)
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr1586832wmb.115.1616478865498;
        Mon, 22 Mar 2021 22:54:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616478865; cv=pass;
        d=google.com; s=arc-20160816;
        b=wxQ/8vsUT6HgevVbfbCITqrVccWgyRSfoZUjoaD2qXVXBXXB++3apMTecIJOn4KwN6
         Auw3yuhPrifdNw7RcwyvVA8Nw2t5qqQ8cK8pPHlg/srqcZtltjhlbw3nGtJPhKt2hxcx
         6hFiOaaYhMZX9OU6bPbwHUGqUsKtjfdCWcGetD435Y/OunrPnqK7kKAds+PA6gDM2wsG
         Jv7klOgzo/GaB3a4hQn9Q1Bxhk8KBce1w5KpAQg3PrKnQQygHKAq444y0MKz692xKVxz
         oT6nu0BQonIXrdIt94HJwFJopI86tKxx6+3MBEUnjNi9V3Dtk2bsshL7Tm2VCM7EEmaa
         KPhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nnCYxc8oAiUPdKM8m5i/Q7qrQz+bMxFxSfCcEavO6jE=;
        b=yCeRVp7l0mg2DA60LTnASVfilSdfsqIcdQB4EtvuHHhy5FD84zYXAXR2SDJOGIdGBY
         vy+6ztBhJ4Mgur6vXLNVQE3AeIyVmBg7EhXSH4JdvEFvJrCuD2tCbVGF/WY3Ca3gMwQO
         mbFaq9Dyyon/W4UtkPy3+HkuPcCGfWD65Wicj7R58w9IltMvmXB0opvKU1ZauW9IioQq
         N7guDIzOchwnLENB/QpF+r4vzRGZPHp8y43LULaagwFyO7jZMFa6Lnzka9ukIqriWUzG
         xuCsNhzo0h8pWfqQyg7MGYvwMGd3bwTmFK8aYsQhcI1rlpy2NYW0tivVEIObeIes1/jU
         P6Pg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=PIcB56Iw;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40077.outbound.protection.outlook.com. [40.107.4.77])
        by gmr-mx.google.com with ESMTPS id p65si104425wmp.0.2021.03.22.22.54.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 22:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.77 as permitted sender) client-ip=40.107.4.77;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSE7Cx9sWBsxRqEImQdHiKbNvA32wwTJ/VVQrdCs2udr5Wfs8YYMOAJXKaFga7dCQJ0T8CKpz7mD12fgV7fXQwjgAAudTd8Aaq51yGRXIEi/JSg3MLYDD6kITrUqxXxY53na4ngnv29sGG80f2oRJNeMv+xR7mhmcbu/sWdWgMYeuqshxTflggoCkcv7rWyjR0qaYpyvnFCwRkeN3EN/2HtZCLtpfG4ASGbCjDqpk6GLsHpfc15v3w8ZtKtNn04+jemJb8pYCXShHC3IhgYVBDhnDnweJa1WrSfDJNNZA/xo8pRRUfPAITthI0ml4MlAWJMX9EC4812RntWPX33p1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnCYxc8oAiUPdKM8m5i/Q7qrQz+bMxFxSfCcEavO6jE=;
 b=JJdHVK5A/Z1pmS5E35NHk8wagfNJxDNIO28VFMB5vy/cMfREeKbE/cwD/Mib5P9nPw1l2g1rfgVKctnjo9YzuARcDQ86yKdoe/bSF9BTGzIot7P3mpwu5KP6yZ6/B0yOygjICy46x2INoNBczXfkNYo5jQA1938QEZckBNl/WF7v+sFj3eywE6wdvx8M2PHkeTpWPZ7dz9miG9uH3zS1o37ZIvznCiGZjWhDUxpECnoDQBL8zuZzOLJ0wLpVGOJloycJUl/SkgMMpFcYF25nkzCOVH965k0OZmx4Ga50UIaxAUlA+8Q5CR+tjVjJmrgg2NQMPEmpdCiJZHN8VLD+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6619.eurprd04.prod.outlook.com (2603:10a6:10:108::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 05:54:24 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 05:54:24 +0000
From: peng.fan@nxp.com
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/5] arm: gic-v3: not overwrite interrupt settings needed by EL2
Date: Tue, 23 Mar 2021 14:25:34 +0800
Message-Id: <20210323062536.3888-3-peng.fan@nxp.com>
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
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 05:54:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 396264f0-a2b9-43e4-9d5a-08d8edc01cda
X-MS-TrafficTypeDiagnostic: DB8PR04MB6619:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB6619C6283E3D138A1D548D7488649@DB8PR04MB6619.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJI95vuuIyN5oBHva152dik4PIkvi/Ukx0V/YAJ4whKpurz1p5svKyzERGIgK+YxQDtWu/18YKSyWIM6HGDTqV8qoB2GOb92bZQi7p0VSdEV+3QuQjw68dHrSAxT7KB+lBuWyBm5rC7EleVa7jYvEq3ssF3jthK6vPj853tzwvZI1Iw7fp9VIslCimiNs01b/5Phxc+xLRcUGcCMjLtndrRsFPEuyVD7oDyh232OUtNA35jYUqRX5tSe4/2RLbcEIwkwTFcVKDBwWI0H4XSR/xZZ735X1nljEO4ArjV5muRyTbeVNoEzBncXct3cZeMgLEeEDwkf6vEE41wLn4r43IrmzRvTjbN0+Oqckq5iwcf/L1guuOO0nJ1bPkZFn2MGcr16fO0boahgaPnz1N4CjdqygbnFM+TpNlf34EviO1hu5KTFh98hGyDG+TMXMoYbWZY6iUsFJei6aQFcVgt91nH31o7q0s/8Ti4x/RAcMkept7rUSbi3WD4XOu2v1e0t3+ODTKSxSd5SHoLM2JsgZD3GKHpMvYgD8Btp4hVm1RGJ7ay220Uqpa5l3srzcw91T3EV5c5FeCjtKpqGvPgt4TV5vmTCOo/2vPh3xuQlwzM34SfkfPR76FK5WNgY1CaRhJtAfLS36XQQEAxOudx4MxkepKlncaMpJh6Grag+9Rw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(6666004)(478600001)(6486002)(6506007)(38100700001)(9686003)(316002)(956004)(2616005)(6512007)(6916009)(5660300002)(2906002)(4326008)(8936002)(186003)(52116002)(66946007)(83380400001)(26005)(66476007)(66556008)(86362001)(8676002)(16526019)(1076003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SImbvUhuAE7basJt6fS+bwwt8zozKO9haZAoqUg1YT+4flzLJHsqtCgJqtDW?=
 =?us-ascii?Q?V188JrOr1HIEz8ZUaT4f2hN6HL8D7tdUgDBQX0lrPH83+OEpGGOIZLsiFAvd?=
 =?us-ascii?Q?1Ct/SrXAz1SCHSvdBPE1MhbVkIDF0pWirMG5wVsHDhSXDO7htP9tWHuiJWLl?=
 =?us-ascii?Q?nyNkKe9k7NjAh9AyshJPtFM1ABFm8ozYuYqi7kF8jYCmBK3LR4aW7Tc8e5PZ?=
 =?us-ascii?Q?rEwIzHCFkmsDzIrFXYyDf0S2GXZScgNPOSx/5DkfFDW76+mPedTf1Y94Q0VH?=
 =?us-ascii?Q?yHyelceN53LSFIzl/efgpPgWb3/G3sTE/WPOr9/5Fx5RKXGf0PZnzPqFOXJQ?=
 =?us-ascii?Q?SrD2jt3HkKZuUfwjkKU+OmSrkJkL+Q85H9diAz412Nh3rCoGW/LhbqrDZrvz?=
 =?us-ascii?Q?zD4rA+UmMIcsWO1OCiXHszxg59PCK7C/8Eb6FIkInRCUdhB5j8sn1dE2JfKP?=
 =?us-ascii?Q?d0Vgt52CGL5Z6msbsFuI4Xkf8+GFnqs+xCbM57JAmV6L7fzvYAQnYDYilJfu?=
 =?us-ascii?Q?3evfDVoSVmK7rTEVpvgbXp92GS9rF3QXJG249RdNsy8w2RKuo65WqeL/VOYy?=
 =?us-ascii?Q?KMCS9ASX7f15nlZBHEPWG8RMZxHuLDfHiYwbtAq/lNjdbPa0zBXJJcU9VYLA?=
 =?us-ascii?Q?LUl1ggw4HtDhvwdj2udOJM5Op3njK1v8Io0bjjB+Ly14qIE3PpnmXqOxAe8a?=
 =?us-ascii?Q?2Y1X/pCtLBArtqanTOfFAWN8opbwSU2CCzGJPruAVpuky9h322uaO1SlKVlF?=
 =?us-ascii?Q?0bwG7ZeZbBGulVdpIM4TFryjC1PRrskdXIbglPuF97dj/wCu1gt6gliddg2f?=
 =?us-ascii?Q?ihnej9yGYrNBfLwxtIuSAibMnXRG6vI9+fbHLbC7u87inq/v6+fTg9f36JsA?=
 =?us-ascii?Q?z7FyMS2I/J6ZmHOWLivzYBFVb2rvMZD9/nXkgyalMvgicdUR51Hg6xBLTeKq?=
 =?us-ascii?Q?3yM9FXkcscj9tCqHabuYTnVxeNeaqg8yetLsgJUq5LDlVAiXA2NI9he1DA1q?=
 =?us-ascii?Q?yAxzqy3SLj3RkjPFKlXUpZb2tuYRltfQy2Hi5zMxm15AHIbbu+ORb1+8ZQ9u?=
 =?us-ascii?Q?NipSaMAW3TpvlfsXzPhYhasrws4tAV+XcPC1EjUTHkWFrPOi2vsxRcOIK2BU?=
 =?us-ascii?Q?wJDiQxmw+u4OE3a5dtWEB3ZdhDuwaRJkxZtNtRioVVUWxw73Ibek3BEefl/I?=
 =?us-ascii?Q?rbwCRMHvMvBjizXE9syWbBHaBjeSDgF4KMEX0ilQ1YRDn4aZ5S+90BJbYe5s?=
 =?us-ascii?Q?QKAhBuG4oTgXaNA/ityrj3dLYzaUI0JpgUMTL97jZpOH32TNqMRijCoXzI1v?=
 =?us-ascii?Q?t6n99XBgW2htEMC06LD5HJpt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396264f0-a2b9-43e4-9d5a-08d8edc01cda
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 05:54:24.7897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUatZvb9UCXXjaakMjDf2aG6cBmgabsEkajyPISwOJAuj1431EQBBkq3Z8gyos1v+EbIIt8IrtKAzkFLbt1aPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6619
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=PIcB56Iw;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.77 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

SGI_INJECT, SGI_EVENT, and maint interrupt are needed by Jailhouse,
should not allow cells to overwrite the settings, otherwise inmate
cells might not respond to root cell command 'jailhouse cell destroy [x]'.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 hypervisor/arch/arm-common/gic-v3.c              | 13 ++++++++++---
 hypervisor/arch/arm-common/include/asm/control.h |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 2293f844..8778f919 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -348,6 +348,7 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
 						   struct mmio_access *mmio)
 {
 	struct public_per_cpu *cpu_public = arg;
+	unsigned int mnt_irq = system_config->platform_info.arm.maintenance_irq;
 
 	switch (mmio->address) {
 	case GICR_TYPER:
@@ -368,15 +369,21 @@ static enum mmio_result gicv3_handle_redist_access(void *arg,
 	case GICR_SYNCR:
 		mmio->value = 0;
 		return MMIO_HANDLED;
-	case GICR_CTLR:
-	case GICR_STATUSR:
-	case GICR_WAKER:
 	case GICR_SGI_BASE + GICR_ISENABLER:
 	case GICR_SGI_BASE + GICR_ICENABLER:
 	case GICR_SGI_BASE + GICR_ISPENDR:
 	case GICR_SGI_BASE + GICR_ICPENDR:
 	case GICR_SGI_BASE + GICR_ISACTIVER:
 	case GICR_SGI_BASE + GICR_ICACTIVER:
+		if (this_cell() != cpu_public->cell) {
+			/* ignore access to foreign redistributors */
+			return MMIO_HANDLED;
+		}
+		mmio->value &= ~(SGI_MASK | (1 << mnt_irq));
+		break;
+	case GICR_CTLR:
+	case GICR_STATUSR:
+	case GICR_WAKER:
 	case REG_RANGE(GICR_SGI_BASE + GICR_IPRIORITYR, 8, 4):
 	case REG_RANGE(GICR_SGI_BASE + GICR_ICFGR, 2, 4):
 		if (this_cell() != cpu_public->cell) {
diff --git a/hypervisor/arch/arm-common/include/asm/control.h b/hypervisor/arch/arm-common/include/asm/control.h
index acebef32..e48269d1 100644
--- a/hypervisor/arch/arm-common/include/asm/control.h
+++ b/hypervisor/arch/arm-common/include/asm/control.h
@@ -15,6 +15,7 @@
 
 #define SGI_INJECT	0
 #define SGI_EVENT	1
+#define SGI_MASK	((1 << SGI_EVENT) | (1 << SGI_INJECT))
 
 #ifndef __ASSEMBLY__
 
-- 
2.30.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210323062536.3888-3-peng.fan%40nxp.com.
