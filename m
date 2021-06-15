Return-Path: <jailhouse-dev+bncBC44VTVY2UERBBENUODAMGQETFJNPNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B13A83E6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 17:25:56 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id f186-20020a1c1fc30000b02901aaa08ad8f4sf639480wmf.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 08:25:56 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1623770756; cv=pass;
        d=google.com; s=arc-20160816;
        b=I6Nf7yv8ag2pfPj6Ky7hGWYVdHXUz2UTk2XsWuqJCa0L7MXpbFmEcPvLAOABM0IuDH
         Wot4fnCHxayvu8ev8Gux0G6bkQMvsIFRCg+tnRR8rw/doCZ7+mjEGm+mNb5lOkOfdDRo
         5ezJ4jsh07jJvEeI5fAaDcZgmcO2KQzTwmZl5EgxauMJ9Vk9t03jL2SskdnnK4AasOCd
         mXmGijdlcACiau2tvwMUWbFliLSoTWWrH5Q1AGe8fBz7MGdQ9UDjRWHeCDAGssyNzqBA
         aocjm3vJRHJ4Esy15GF1AN50IIZ6LLTord2voCs3tRM2r/lS7XUZo0LQMXvNUcN+Kw3p
         f+MA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=PfK4jYcmILp346CqP6egEcSUTixfw1jVPHSq14gsfL8=;
        b=ctoJRq22XO8KDRm0k7NbU8BLF+nEABeKfiMaBGJZOF8fVTK9jb60Tgj/0cxZl+Dabe
         yMlE7XNoHuDZyrm7I8pUDWIk+oI5N0m0tSarj+reuZqVVjOw9tP8HMnCvoafkfFG+PQ5
         oHUxlghdT1ViMksbOO0mAq5z73ZBlU/YxPPTAnZKPXir97oMkp697mjwdtGuvpdKF2QR
         6MIPUML/31r3LpnhNNI7/szeZwQO3JoU39EwIl16XSKmtVWGbGKT3wSObyKtGh5iRixB
         mf8gDBJHV2f0Y3IHin7rKlcGdYg6ETcqUraYKj+YDprpJvVZGpFhu7GvIcwi5ixHGOtp
         BjiA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=VhFlFxT2;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.59 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PfK4jYcmILp346CqP6egEcSUTixfw1jVPHSq14gsfL8=;
        b=LqGYz5RdkZ9HuDXYV0FiPPFwuugS+z+X0x418tW81/Xl2S8bgAlmxU7GZFFklH7cue
         cFrBlNgGIh/rkskBeUZCaR3xS+kv8dYlelARsrtasBXJVkknTcIvb0Y1MiyB+NYCvlDA
         oBfb7TiqBog/eGmnoDS/zg3eOm7X1Gl4pR967dWgA9M7BZxnTjIcGh29DLfpeG5IVKe6
         tqpAKDns1K7AgC+52VB3ZVbA1jmdEi826By9Vp+NTego/aDijWSqpACThczjYjswuGrk
         30dr9FydWU5LkxO6pP9/CuFFRywX95hGztWdQqZ6wyPOlUvJNL0CZYXRxLUWCaw+phlx
         5ARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PfK4jYcmILp346CqP6egEcSUTixfw1jVPHSq14gsfL8=;
        b=O8uBLRf92lO6UxwPXRyFBmTG3EU9FGGSCJkUMBv63sXbiN5mKlCWnZQkrYyneZ6GIW
         ORwtKVPtL4KcU7CpxmO6wf67Baf8HMWv5QGeo5VoPMeVoVCECyIMtA/Tlk/xCr6nI7/8
         c1zn75zI4uVx3M2KtBeR6EDeV/ljanug9Z7xD3WBs4uHB7mWMK6b7DDK6qc9c6+QHynh
         eBvFQIzmNhw7pxyWvj+k/kWQc7BuUJySZ4zkDsOvPoIupiPdIOhNOmAQqfCB/M104p/S
         DmLtYgjNGAii/jltpALgZ0oavG7tzicE5r6J/6zUVia0/7pDJ6hJ+E6PPPjr0oJ4A3Dx
         zIog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Od6As8A2WTwycdATBQ5SvnQo/YdLKbSixkZ6ouwTKgm2zCDbG
	zwOkliKtXLPbVYPQppVW2GQ=
X-Google-Smtp-Source: ABdhPJwbP47koXI9pfma4aSrRkhUH7CFZrn2/ll0Azih7YavLX0OJ2aO9QbtotOjPmC9FJXGAjY+sA==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr6210896wrp.252.1623770756538;
        Tue, 15 Jun 2021 08:25:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:45c9:: with SMTP id b9ls602312wrs.1.gmail; Tue, 15 Jun
 2021 08:25:55 -0700 (PDT)
X-Received: by 2002:adf:e551:: with SMTP id z17mr4137863wrm.320.1623770755736;
        Tue, 15 Jun 2021 08:25:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623770755; cv=pass;
        d=google.com; s=arc-20160816;
        b=sFMZB0m1Ls0PGa3YiT3HXbU8juA/C+hXqhwzTwM3PpxvVrqzskL8G22n1bG5MM4T/8
         nLOhZHeHjfT+lYPVe1qCco9/ThBnoF5wD7WOVcfsOchEC1lsror9GdW0u49svt9sb92t
         kgqDug1qBOJmNIyf3DeUxm/FxxgHErW06KHmY19MszPOjrzGiMSN/ID5Qw/GYNyZX227
         aFZyjPnmCjXG983Ydj/kVcdV+La5//XFz/5saG9XMzHwkWtj8e3FddPFnHH10pnRudZe
         dyj2aUZpDaeoN7lltzwpOIG7pOTSGFGiqRQF3NrwV2j7hJvz5S7CJtkVtv9UoRJX5AdZ
         Dxhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vhbgkQCUaTBblNPIk6BBBaYZVlVb4ugglwgIqxAVsNo=;
        b=sUdZqbBgV+l5D6ZZZidgPZ7K+zRQ0z6/cJsD/5jQ7xIcz/asPOOrRD1ogjfKO47+7X
         sSGffLiFoWrwQVPadMyOPyJHFHXmuszJq29CpCzxRqdpazWN/HDSLfAFhaAZNokr4aGf
         P7yLtME7Hi40kSz9gmaBiGQyTjqMdmlsYu0K9GrzWTHBKgsdNLVRzbBRshMmE81ly1zr
         9XXQntlZt3NDZX8SQL2Bkxa05+iwBwwe4aLjGnwQjXM58Bj0OZMKlbCf58RhfX7O6OzC
         IBJSgNDl8t4Kh+E5mN4eVE/EDTiiBRNpRZSQy8JSEyKYlT7QpxXxi1QPi3Ivu6IkBdlw
         ioTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=VhFlFxT2;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.59 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80059.outbound.protection.outlook.com. [40.107.8.59])
        by gmr-mx.google.com with ESMTPS id z70si105485wmc.0.2021.06.15.08.25.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 08:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.8.59 as permitted sender) client-ip=40.107.8.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1A0LdHTHw2RLJ6lGWRu603eNyUmIzXSVrOWsSR+Xtu0mCLHxkcl7G/JpbySv7/f03Bb96p/XR1Sr/8uuS2JmNnN+qyWLJZag/0m6wZVaZ6NT3BnfG6AttARavU35ovwQnkXRr/wgictMgeo+t9ymbEXeX4iAWZ8+l0fjVnAUc/b+ZTXRknXgUw8KqtUjU6N5aVtId49OGIetD2IVp8bVOAptDo2W+URUxKiHI8jpr9Dj8h5Qcr0Uj3XjysghVeUbIBqgG6cvF/HoYEGIgWbW8I+nseL/J66RmrbJ3Bfe6StqykH/wy877xml/RVQZEcNG7j+heSdQp4LWzCxUiPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhbgkQCUaTBblNPIk6BBBaYZVlVb4ugglwgIqxAVsNo=;
 b=dXlzWeFo69rPkKSXdq14apgpALszd0zPbtarXYaQjMZb26lxXZBb4Fc1gsdHv61AWfO/rWFCpTDX0zT7uf1Y1HuyJB94j+s0tuGVUwOlpHZ16pBaYMVvZI4tQp4ZbqK/gPf8LFpRy+8u3nsoth/XHrVaCP0VHv6ie0pY6bIXy39fDSC/YcZ3R5Lbyo3gx/sAYJ9KCO5dHIsMlwUiX/XCYrovP5qcVH58mVG+P/nHcZ7NdKOzjKbJ5vY/xnXSNFVdvg2TofkVpg4QoTHrLUantYGXYDAaJuurqdvMK6U+hxeRc0UvT9+y6HgK4fIdd6pKmSBfMpXktpOwD/qTGsKKSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 15:25:54 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4219.024; Tue, 15 Jun 2021
 15:25:54 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [PATCH v3 1/4] Makefile: Update build dependency from python to python3
Date: Tue, 15 Jun 2021 17:25:47 +0200
Message-Id: <20210615152550.356561-2-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615152550.356561-1-florian.bezdeka@siemens.com>
References: <20210615152550.356561-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5]
X-ClientProxiedBy: VI1PR07CA0129.eurprd07.prod.outlook.com
 (2603:10a6:802:16::16) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:30d6:ec3a:bc18:37f5) by VI1PR07CA0129.eurprd07.prod.outlook.com (2603:10a6:802:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend Transport; Tue, 15 Jun 2021 15:25:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b9a9825-5950-4a03-d191-08d93011ddff
X-MS-TrafficTypeDiagnostic: AM0PR10MB3699:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR10MB3699CCA7786F462F58D01C54F6309@AM0PR10MB3699.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tuiNjSNHoNJTBuwVQXP5tB38GTX6lttdi8U0eveFqCdHl0EmkcV8x7WiST7t5wU/KRTCEpYMqoRL0EChB1FQfgLNK8Cxixaq83xUyiTteqVWS9BkrfOqIqKmP72eXqGGxDbs4rxWNYiFvNv1i2nSioClPiE7ZSm5o72iMgBifHAxK94ssOTHj+6rCxcJv319mmnD8QP3zvIwUffaf+q3C/BZoPoD72kjMRuNQ1CNHg3yRGIrk/sKsg7HegqQDOlNvVUnCR5c/AKdT7auFJHuFrW+HqMB9Vy37Qu4BvFjVd5C6Klg2kzH3tLrUPFEihQVk/yRcDJU3Vz5Xn/96h+9hrheaPs6JDarO5aYdr0zQs6S+rZYKyrTew03QTYsnFyE8lOoXtwY1S13c3/gyW6Y+dZ3qL8jf4tFN/HH3Tfiwv9rguGBOapI0PApydNt2gl+HNszg+pKJehXz4OVmy0cRhIP7e83rbYe6VXQoMOkkvkL0mNJLrmlRp8t3gjq9B7aV2HO9VBv6c/+1vGMXyZ5EeXehYHceWlPy0/qiU8+BLRjwnUY/1IYTxvq5pVChqiuX4fjTrqGeQh69Ufj13kqlQfQvNrQFiDOOkHlDJ3uf2s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(6486002)(6496006)(83380400001)(54906003)(107886003)(6666004)(186003)(5660300002)(8676002)(316002)(44832011)(16526019)(36756003)(66946007)(66556008)(66476007)(2616005)(4326008)(38100700002)(2906002)(478600001)(8936002)(6916009)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XQp2PJn6d+QHlZujg/X+n/CJQu9EFsbk0c5yF40kUoW8Qdxv0VljjZ6mX3GD?=
 =?us-ascii?Q?+37BApRqbPyNrfwlJ2crLrndSDEv2CkQZKWgXmrQ5aq+HKo048jd+Kz1QCTf?=
 =?us-ascii?Q?6gtVvZJZd4XGryiNGo7TC1cpEIXV1Ob/XTpLbp+srqZ4FFyKQfBnLAgtPYhc?=
 =?us-ascii?Q?NyQ4KlbaeOX77I7pyTuv7pD4ECkGV2eneAo95Pmlnqlieg3GGk5l3eqDd0tW?=
 =?us-ascii?Q?wLgTfye5EXSkqQxf1bXrErY0GN+t3AodYkjsB91D80M3tQqhe2153si1OyK4?=
 =?us-ascii?Q?sS/Jd03g3lTAPZV/Cgek8FMTVF8tIETeyPRC+W153vg8wFX3a44ddIsHWnuO?=
 =?us-ascii?Q?dmJ4ADCUtGCa0bRI31tsS2b8/33lDBtNkPWlHF+slp3FNZWyFadoKivRoB7g?=
 =?us-ascii?Q?cIyVbs9ZmZT11mzPVpbkvaNg5m12eU4L+Ag+ynQoGKaClFhEuVbqa1z/MrXm?=
 =?us-ascii?Q?ku94DYjwLL9A5df51j4B6ymzXslQefJRK6ZDmE9g2yrd6YewKiVAL+/G42oy?=
 =?us-ascii?Q?h5SRdtjl2SIy0j7+a5i1jxA9wx0THdbY7yrw3N4ghsJ2kqyOkheoqDoh3Qkj?=
 =?us-ascii?Q?/DIR3VjfqCcUGbUnuyUC9VSZwSgkD60eAcDvArqw1qvJbeNe//laZckQMvc4?=
 =?us-ascii?Q?A+ezjYMnoA7QjzfRMFzjVg8GGztEUdvJRe8wwVm5revnYYCdBn0V/Qua9TDW?=
 =?us-ascii?Q?kvvX3DLDYnsfuJA0E0S6XBqtf5cBdzbFdJG0U4wxscPZPUbyTwreM50nK2Uq?=
 =?us-ascii?Q?9Xb9gQ5eraZmO00z4CpFk7ThFYFMPsF0FdbwMPMoOBmiyvxsmV3Zzo3HXLy3?=
 =?us-ascii?Q?aseBlAo1dP05aljktDm7aWZUNDYW3y10GjcNSkYqyv5XHUTukhlWEAzJFn+H?=
 =?us-ascii?Q?vb16bImQTDlZM3pjCqj9YPPYjdRtkC7sY9Kse8571VSGwqSXu6asAujyZhQA?=
 =?us-ascii?Q?yvx9W8tZYjNyXq/wA5XbYo9986UpXpr+pBXv6kkQ5KXnoziHuADwszs7Vw0i?=
 =?us-ascii?Q?k2oiTAav341ptGUePj6offpHd0mxeIAIUWr06iSA9YDEW3pHER5KBCJ9L7Dw?=
 =?us-ascii?Q?rhk+UsX6CM1WUXH0YbLFcxjQ8LVQh1RlT73aAo00Pn6dXQT9WwcB9GjmxzUY?=
 =?us-ascii?Q?b1elvSoqZ2+6/oShKpY39rUWBNNjupGjsMrP7LXvDNxTF+PVGFcB9oTEJrtT?=
 =?us-ascii?Q?UlhojrYslwy/IwSP1r4Bg0O6Jtb1bYHNcN9VXikudsB+tEEAiET1+mWX8NqA?=
 =?us-ascii?Q?MAK4nN/RLsdTTDlJSvGsQzic8y48FQks6IVWBrCgDqPBzZa0USaHRems4oKe?=
 =?us-ascii?Q?QoxZToLyQBpvqnU+Z4Wnk6uxSwI98URpEqX51u+xqrv6paSPQICTe08d4527?=
 =?us-ascii?Q?NPzUJHsp0SnVg3Gfw5Gdl+9dZgAq?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9a9825-5950-4a03-d191-08d93011ddff
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 15:25:54.7862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qvn8RQJNBHlwksuvIr/2hzffmAsRj3sWC0Q7Oe2XDnrW0J/ecoa11NmX+U9/0i0oXJx6pGdxwujufE1Dmgyd54zUWHP+sQb6nq8/ayBxPT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3699
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=VhFlFxT2;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.8.59 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210615152550.356561-2-florian.bezdeka%40siemens.com.
