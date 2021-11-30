Return-Path: <jailhouse-dev+bncBAABBAXETKGQMGQEZ6PHOQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E10464233
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Dec 2021 00:21:39 +0100 (CET)
Received: by mail-lf1-x137.google.com with SMTP id i6-20020a0565123e0600b00417d29eede4sf4269347lfv.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Nov 2021 15:21:39 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1638314498; cv=pass;
        d=google.com; s=arc-20160816;
        b=HPuDGmKvpd8s/APBfb16sW5eZpAhQkNgBJedi4BDz45799KQ74QiM4ZaBpYebqJJiL
         mDxFS6A9cs+AJUGYM3caZ+Nv5kb/wy5rO3W/vZNo/L6D7jjmXuzeEpQ23e540BBoJOnL
         xQW82JkSrBbhuZCBTrOdoLMMD0GIJa8cX7MRotTX42EGprZ+uuaXMd9aKtAK5wxFAb0L
         rWGLje9R+hs7ZkA1q2YYToAJTGwzd/C6R3fY04yJM7tk4Dl6S8tErNSuUMc91ImEJ1+a
         yMHb7l2fLvxf7B4B6IloWn4GTi7dYpED1pYJRrCFLY+UvleHOl8IKfjZQ0xJOcIt6nyM
         j8EQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=HM/o0HjDTZV+N77ouL4+8jclGuZ5Uls8FMXPu7iiFi8=;
        b=VcVrvtY1YhsMB5YQXMvGnn6e5wd/Vwq58DZzLWyzQ2Y5MvcIqvfZFL18qm3GYqumQu
         gsipYudcY/oEYdZ6dRlU06oH8oKskHqTfhqHIDrFwXz43oh4gZclyL4BHy9AG6Q5wDiA
         J8eXgHEkqSJ2ycS2PfSH9Wh1MVpK/X1U7kdJfkQvwr+KD8eObHR7rnHOvYvWRr4Qx5m/
         kg6lJfhGoJ7AwAycQX65kqxo8DWQu9B4c4zI32yo/XkJVf4XCSPFFd2kIGmbBvXuP9TK
         p5ef9ft14wfVlzMALFJFk4X+jbBhlMhhF6n5wi32zfHealegcZvC3PFJ/nUPYyhmW43w
         VpAQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=I3AV6yfW;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe08::623 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HM/o0HjDTZV+N77ouL4+8jclGuZ5Uls8FMXPu7iiFi8=;
        b=sVo+GR2veuKVrbHaI3p1vc7BuvrpRTWzuIA/ZF7tSuyr0fu8G+/vTZ0amWfW7id3d+
         pI4b5bhKVFKS+sBGtHgvWsa/6IH7nCOACrT3mijN47HvsG+YMPUzCjlYboqBFy7LfQJm
         fZ7yjK7IZo2eznH8gmRs/F/djbQfuhpzhdVQX3eHjUVzkN3VJqbxnTizkiIOKy5wwZPO
         MqGJCxTwD4T1kGLef++KEu8EtdkCj97DOl5aFPT6pLEfmmehaN93KL+jUQI6RJoKGEmi
         D7oFud53sU7EY8YUAWASzR54YnAexgfgqhoeGUMYGpQ0rfzIFx5UP7btU1IW3a+J0SOm
         Bb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HM/o0HjDTZV+N77ouL4+8jclGuZ5Uls8FMXPu7iiFi8=;
        b=6vNAc55g9uzVDofYBBXlZUW9J4edsR8llgrGWeOrUsxDFIZ/D35kJMMcrCZNOkSwHM
         bz3qqAQFnSZKrQmRmAfWdu6hlVuzelJXDgAdoqfU6aK6lnct5CVIzPqcT7EVhCwLJ84v
         nNvD6mO8j00nb4+IftVzWRLElwvy2b/aYQPd4MpShMtOu+dZIIyANJxyiljd6mfzswX7
         q2+/sct6xWN3d9FEyb5huNwpsdnAdfP0HwK63QxDDQ0TzplnSsVVh6sDc4AQtxIfaNIm
         tp6c1D7DWrTtvT2l9pPwSEEFov/2cDGZEhigA/W+sxFKkRR7J7XouQ1wberdPg+42OCg
         HcbQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530dFd98uSUwt3YAOv1a5jSHd5EnrOP6mCP3fho9Fkrv26GzGAtG
	pjekXmS9sx+gIJH/eYP1K64=
X-Google-Smtp-Source: ABdhPJwxadYvkl09ggOZ4IpEDy8Y381sNgoQkU2Ih/Fjhmj+vHNXN4u5DD2C54pT/b/hHYajwlMqGQ==
X-Received: by 2002:a05:6512:3f0a:: with SMTP id y10mr2242546lfa.204.1638314498692;
        Tue, 30 Nov 2021 15:21:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1251:: with SMTP id h17ls35507ljh.6.gmail; Tue, 30
 Nov 2021 15:21:37 -0800 (PST)
X-Received: by 2002:a05:651c:2011:: with SMTP id s17mr1910240ljo.397.1638314497906;
        Tue, 30 Nov 2021 15:21:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638314497; cv=pass;
        d=google.com; s=arc-20160816;
        b=eWOMFGU7sR9cEhE59As5zU+q+RmliqTLb6s06oTZCyB47BEKHp+lKpwxhol5m+wl9j
         fUcYBGi4Zv79spSiBwR0tu9n7StdW77NndODyleHTGoX44zRBrbVTm7WXHODR+e9bUE+
         ncaSpOu61L82lPnzKd8kWQqDtp3aMnauRV3TakK+LUFZ49MiO8AVgOgeESIZa2YxIauG
         N9Tno6EXkG+/ZV65SmCXFVNyC6ijKcZO8/3sSdGCoM//I0R3S4/R0P8Y2YYPQI708OOw
         kNUu1dFF0A4P/lnZmPkSbgmR4ulPHnIwCI4rDwcAZ9O59e4efnfhm1pBzLJthDDPjt4u
         8G1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DrxAHDCtkKClEj5vsWrwbb9TNw9MpacsEbpwGMQykzQ=;
        b=jzSFKmxeofVDOyxhphFhESzQszA+VLXvOXD78LTM0JoebHwA3q27+eAu0z9Ay8furL
         b0GqTUR1+Yaa8QErnZgD6ID4JhGsQGysdKuvlcPoHLbuWi33Fq+XHcagLrciH7887BjZ
         akrwBFYpIfZ3HpK+eZ8xWmt3mQ3cYdZbhPECUobuJJs/Ut+I+frUNL5ksHodmMG7mKPC
         Vc5UGh4AtD9/OlsyMi9RggFHMMRg3d41C8+jHHV7F2I3ycWohMf7CzIf5fgmMsimLUf4
         kAOSmFqtVZUD+hz771wTlbd0ewLB0v4wAeFEURKc5oX8KmJSWPjAHfUfD6WMt9djqoyd
         h/Ig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=I3AV6yfW;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe08::623 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03on0623.outbound.protection.outlook.com. [2a01:111:f400:fe08::623])
        by gmr-mx.google.com with ESMTPS id c12si1498822ljf.4.2021.11.30.15.21.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Nov 2021 15:21:37 -0800 (PST)
Received-SPF: pass (google.com: domain of stephane.viau@oss.nxp.com designates 2a01:111:f400:fe08::623 as permitted sender) client-ip=2a01:111:f400:fe08::623;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROZqWrUTb8c6fZrCffT8LTmtwGFbhNfb6sTdtuB64yOInlfXmn1T0xA2rTOarCSSEwre2BF3xmM7vsqGj4CTuLhvEL4pXwAfbkz2Ud6MHbmM4QX4hKGDPXfBcYmPlXAYxMAXEeaVGCTV6jCGEzlvhJ76nR5IzzVJPhs85d5VROtLY0OedO7h6BM6IT1TkzBZZGQ1Le/8BcFumDTd+8e1+9XckzB1RBFJU1vxEN6yBzKVQ8z+o5Z918BEJYGwgLYBH9HZyL+zQIhC9U8ra5I4wUykLfWYsGvgMa44kjJ5+x+e378BXGlJWa0KO462aeriMDgcnEBlV/KXyLiSbLBEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrxAHDCtkKClEj5vsWrwbb9TNw9MpacsEbpwGMQykzQ=;
 b=jjjUm648Ikz8NYedIH50OedVYaXUh/cytDrMv/yoYwdfS2Kmb8KT5d3CdSkZ7IXNBYRyg0hDH6HirO1hVssPMHjmXq2TlBiiJM9n9BscV/0ulnPeOG1NGU9+m3LpJN8tUj/USppb/VBXSEgJOw49SXurBITqNZhVYYyGCiQ9KJQzsNLcHM8y8PbnLJ2Nrdmi02KqyoZYj2A8T/d++FhZH6f+/64xv1uM2UGiR6/v0WX59RSvV6g83JL8uvk8B8a7qTfva1cAiBobcq287TrpCVYi9kKIH9qETcZ5AfS186DX0vBENbHJjSwMlMZjdY09FqrNTFdQsY6R7QffyawkXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21)
 by AM9PR04MB8634.eurprd04.prod.outlook.com (2603:10a6:20b:43d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 23:21:36 +0000
Received: from AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370]) by AM9PR04MB8652.eurprd04.prod.outlook.com
 ([fe80::6989:73a2:f15b:2370%9]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 23:21:36 +0000
From: Stephane Viau <stephane.viau@oss.nxp.com>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com,
	ralf.ramsauer@oth-regensburg.de
Cc: Stephane Viau <stephane.viau@oss.nxp.com>,
	Stephane Viau <stephane.viau@nxp.com>
Subject: [PATCH v2 2/2] [RFC] configs: imx8mp: Convert a cell using helper files
Date: Wed,  1 Dec 2021 00:20:13 +0100
Message-Id: <20211130232013.395-3-stephane.viau@oss.nxp.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211130232013.395-1-stephane.viau@oss.nxp.com>
References: <20211130232013.395-1-stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: AM9P250CA0014.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::19) To AM9PR04MB8652.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b57362-l-11.ea.freescale.net (81.1.10.98) by AM9P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 23:21:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c741964a-f369-49c1-9e60-08d9b45827a1
X-MS-TrafficTypeDiagnostic: AM9PR04MB8634:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM9PR04MB8634A63BCA7B5740855DDCCEA7679@AM9PR04MB8634.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ATMtXAxvh4BRh0tUGwloUN7Vt9p4NJFA8xn0/35VCon05FIuK7kOzs79gzYsNtG9ATcfgAqE8kRnjZ4zZSaJ8PsKDLGbHJMOTKLaRMVQxGPMy91FhEEAYom6GJpTIzULfsqDgnxEls6rEE7ACmERLQi+8hubQTRPb/EgUMBJZNTVRkV/pH/xtbor2lKN9HSlTKAVtfRMAaMRnMKGudVa7z5fZDBhU0ZgbyaPF6Ym42179l+FGKPEI5JWdVwvJubSfPC5Vgb3SJZ/aWUy1GmUHDwcuT1NW+T2HjBGFHt0XKPXzgLybv3IUxnmZEst5n/l7vJpL2XfGzI7nfICl1u5PffoaeDzugxNLbAAeqPmwEoHCpgelDTLlrSmPfFgWNxBuOT0mk5d7ZzvsK09mDu/Vo8J09WXCGv91js2GSad9dnDIdIi+F31oudy4/GbwV4E6jM5bG26ZEE+N4jx/PvNQvUPskmM3YOBu8YbFZGfFVBG1wW2IKkw587+FDtHV3oGlYKdNsWVOLY+tmch82RH1phrxjxP58W69IFz7HMAYetadtwZ8T9xHprQZCpBf8N05MzoohmT/J+6PRPaNgtjzMzkyBELsp+i1UdoPmh/LIHeC7nbo2tSx5St/I2FnRivZV+VOExvyUX6uDoF1Ca3WqG0w8+yeHlexlDk3IhJYdQbx37BlelHPl0FJxtK0nfGUa3ZYCRoEo2E6vNEV5ynHOiXC7LktsH61CWwq592AUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8652.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(26005)(38350700002)(508600001)(1076003)(316002)(6486002)(4326008)(956004)(44832011)(2906002)(6666004)(6506007)(6512007)(8936002)(2616005)(66476007)(66556008)(83380400001)(66946007)(8676002)(5660300002)(86362001)(186003)(52116002)(54906003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?31axE574ttjNd+KFWIP5lqgkd+lODJ7dnSbKp4/uYwmfPDoAcGLVwPVkMK1M?=
 =?us-ascii?Q?snPp0w/nu37KGupPsmI1lrCUnO6ZfDC82rLDmnksLr5MoNlRWya8rgctn4ka?=
 =?us-ascii?Q?vd9QMKTYEB4DJoBmX0XU9ATMhAu0eIKXWSQcWmpYOBjgKrvJHX/vGFCHat6K?=
 =?us-ascii?Q?z6+e1MB46eNLXozwIkBHIO1Z3E9ESrb1mBzyVgfbXzmxbpBqYobQ9+NDviMh?=
 =?us-ascii?Q?dgIQOWPic7qbQq3y+b79zp9l2QH5Q4v9zBDnPB6NzYaSFe5lMkuHnzF3QjCH?=
 =?us-ascii?Q?Ta96Jmh7RSCJ0uYBNFgzngcRA08/zCUxaEXq6BlZIBR5BH3Ki0jpW8tVRVNQ?=
 =?us-ascii?Q?/j6t6bfCBKodY1XYQBHJ8QAnCpUR30ZMBavk4YgO3tAzyqPV5M++1QfJz9W6?=
 =?us-ascii?Q?Xp3PJ9uF0fXun/KjW5W19wEk5W4UfNHAwhGk1FWBusZ9h1jMzyIYVxIA7CFA?=
 =?us-ascii?Q?yK83Sdwv4m909kalsum0Fm4rO5XVWSu5ce6vhDSgWXbjo7ya8asxNWPgoBSP?=
 =?us-ascii?Q?yN7dS4AEgbOlWnmwais2ZwCtwgFRFuj0qC1zEk5P2yy5R7nKw+ag2lEodyGK?=
 =?us-ascii?Q?1Y1gndmr9bGRqE6ufjY63tpSbRNXt+K5H7dlRvS8PZ7xGeT0u/TZmF63RbDc?=
 =?us-ascii?Q?4cwCEj/ie140YEe9KNtYbuiPW4k8pLUDNufvKRLOGZ+ppCcwg8Q+PsS9H5LY?=
 =?us-ascii?Q?Yr5KpklcUsvd31mvMLBfVdJrSJ5nTlyEfvoaHpgEyxc8FIuR5q8cTh0lrans?=
 =?us-ascii?Q?dgMvqHEIoXRiT81NmT3yPJdgBm6RruEYYFlgovRQ5x5eI9EhPOyzi/Y8E3Yx?=
 =?us-ascii?Q?aEZPr3uA6F6rsJ2GjjYHc8BDiH40hAKiOMGw1X6h79tQ3Il7DkZB3eAsrUp1?=
 =?us-ascii?Q?W18RCvzwmRKpzxS7Civok90lWci3KdKMRpPqkHuGpiRVahPCTeXBkasvELlW?=
 =?us-ascii?Q?N5xoXcUAV2++6pspdDB/nmo2Kq6U9y0h+D7J3ihiWSZJ/WpGvkWXCUVvUy4N?=
 =?us-ascii?Q?A0um2hAH6w6UhKQvug2khAb2geyFCzhhJPGezrtYIEKEitzYDFMvc4Zu/V43?=
 =?us-ascii?Q?CkvI3iYfdof2oy62vDrDbTzWHkVZi+x6J88tIdzhwpBCrj24bp+gxH1Vpx3T?=
 =?us-ascii?Q?CZQbfxjHnJ5APpVFi8mpkATqSo9UJfjMs1/w+dwcs/mtZ8X25gD0XQ1GH61j?=
 =?us-ascii?Q?UX1rhopqQfCg4/kBmmm3nslpLCPQhC46C0YEuCOAJFaVFbw/U5LdX0JjTaY5?=
 =?us-ascii?Q?1NWbzknf04fxKpX7HLtspR+VaRWc6P4IMDfAGo82GVou3hgve0U6Osm13u3B?=
 =?us-ascii?Q?ZJLxwtO0Un1sMP/Y2YVRnIx28Vcz90hMwY1J8/DS6Z7LN5fialAviMsOnziA?=
 =?us-ascii?Q?+TsHYHtGUriPb+YQm39LiAhUJc9dcWHXTMK6svus4SWB4UsDAIFaUqWNosdL?=
 =?us-ascii?Q?gBvDJP3P0kRQSqxAKfuDntY3Cmux2rl1S7nz+F80oTMbs8/k8o8cBDJO+bV7?=
 =?us-ascii?Q?dTqHvCE8ZQuy0MlNTNeeBxBTfvqS5Ipf1IbAhnmPHNbGenrXdGjbkbm/sp7x?=
 =?us-ascii?Q?7p3IeqbS0gg5hQgBzhU/YGtcmm+oLnV2W+VPj0mA7LLX3TzVvVA0KgFr9A91?=
 =?us-ascii?Q?wGq75av1G+eJnlSywztq0r8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c741964a-f369-49c1-9e60-08d9b45827a1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8652.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 23:21:36.8215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dL0nUZqXhGIST7t4NVNJZ3uNCupUjwTB2bRhDpd0RwLqnD5t36PJ1wpo2W6VV2PxZETVbZIVSrthJwtVfj4NtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8634
X-Original-Sender: stephane.viau@oss.nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com
 header.b=I3AV6yfW;       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com
 dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of stephane.viau@oss.nxp.com designates
 2a01:111:f400:fe08::623 as permitted sender) smtp.mailfrom=stephane.viau@oss.nxp.com;
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

From: Stephane Viau <stephane.viau@nxp.com>

Pick a cell and convert it to show the influence of these helper files.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Stephane Viau <stephane.viau@nxp.com>
---
 configs/arm64/imx8mp-inmate-demo.c | 163 +++++++++--------------------
 1 file changed, 47 insertions(+), 116 deletions(-)

diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
index 127392df..d85d3a0c 100644
--- a/configs/arm64/imx8mp-inmate-demo.c
+++ b/configs/arm64/imx8mp-inmate-demo.c
@@ -1,7 +1,7 @@
 /*
- * iMX8MM target - inmate-demo
+ * iMX8MP target - inmate-demo
  *
- * Copyright 2020 NXP
+ * Copyright 2020-2021 NXP
  *
  * Authors:
  *  Peng Fan <peng.fan@nxp.com>
@@ -10,117 +10,48 @@
  * the COPYING file in the top-level directory.
  */
 
-#include <jailhouse/types.h>
-#include <jailhouse/cell-config.h>
-
-struct {
-	struct jailhouse_cell_desc cell;
-	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[8];
-	struct jailhouse_irqchip irqchips[1];
-	struct jailhouse_pci_device pci_devices[1];
-} __attribute__((packed)) config = {
-	.cell = {
-		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
-		.revision = JAILHOUSE_CONFIG_REVISION,
-		.name = "inmate-demo",
-		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
-
-		.cpu_set_size = sizeof(config.cpus),
-		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
-		.num_irqchips = ARRAY_SIZE(config.irqchips),
-		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
-		/* IVSHMEM_IRQ - 32 */
-		.vpci_irq_base = 76, /* Not include 32 base */
-
-		.console = {
-			.address = 0x30890000,
-			.type = JAILHOUSE_CON_TYPE_IMX,
-			.flags = JAILHOUSE_CON_ACCESS_MMIO |
-				 JAILHOUSE_CON_REGDIST_4,
-		},
-	},
-
-	.cpus = {
-		0x8,
-	},
-
-	.mem_regions = {
-		/* IVSHMEM shared memory regions (demo) */
-		{
-			.phys_start = 0xfd900000,
-			.virt_start = 0xfd900000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
-		},
-		{
-			.phys_start = 0xfd901000,
-			.virt_start = 0xfd901000,
-			.size = 0x9000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
-		{
-			.phys_start = 0xfd90a000,
-			.virt_start = 0xfd90a000,
-			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
-		},
-		{
-			.phys_start = 0xfd90c000,
-			.virt_start = 0xfd90c000,
-			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_ROOTSHARED,
-		},
-		{
-			.phys_start = 0xfd90e000,
-			.virt_start = 0xfd90e000,
-			.size = 0x2000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
-		},
-		/* UART2 */ {
-			.phys_start = 0x30890000,
-			.virt_start = 0x30890000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
-		},
-		/* RAM: start from the bottom of inmate memory */ {
-			.phys_start = 0xc0000000,
-			.virt_start = 0,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
-		},
-		/* communication region */ {
-			.virt_start = 0x80000000,
-			.size = 0x00001000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_COMM_REGION,
-		},
-	},
-
-	.irqchips = {
-		/* GIC */ {
-			.address = 0x38800000,
-			.pin_base = 96,
-			.pin_bitmap = {
-				0x1 << (76 + 32 - 96) /* SPI 76 */
-			},
-		},
-	},
-
-	.pci_devices = {
-		{
-			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.domain = 2,
-			.bdf = 0 << 3,
-			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 0,
-			.shmem_dev_id = 1,
-			.shmem_peers = 1,
-			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
-		},
-	},
-};
+#include "cell-helper.h"
+
+/* Name, cores, entry point */
+#define CONFIG_INMATE_NAME		"inmate-demo"
+#define CONFIG_INMATE_CORE_BITMAP	(0b1000)
+#define CONFIG_INMATE_BASE		(0x00000000)
+
+/* Memory & peripherals */
+#define CONFIG_INMATE_REGIONS_NUM	(7)
+#define CONFIG_INMATE_REGIONS		\
+	MEM_REGION_RWXL(0xc0000000, CONFIG_INMATE_BASE, MB(16)), /* RAM */ \
+	\
+	MEM_REGION_ROS( 0xfd900000, 0xfd900000, KB(4)),    /* IVSHMEM */ \
+	MEM_REGION_RWS( 0xfd901000, 0xfd901000, KB(36)),   /* IVSHMEM */ \
+	MEM_REGION_ROS( 0xfd90a000, 0xfd90a000, KB(8)),    /* IVSHMEM */ \
+	MEM_REGION_RWS( 0xfd90c000, 0xfd90c000, KB(8)),    /* IVSHMEM */ \
+	MEM_REGION_ROS( 0xfd90e000, 0xfd90e000, KB(8)),    /* IVSHMEM */ \
+	\
+	MMIO_REGION_RW( 0x30890000, 0x30890000, KB(4)),    /* UART2 */   \
+
+/* GIC */
+#define CONFIG_INMATE_IRQCHIPS_NUM	(1)
+#define CONFIG_INMATE_IRQCHIPS_ADDR	(0x30890000)
+#define CONFIG_INMATE_IRQCHIPS_BASE	(32)
+#define CONFIG_INMATE_IRQCHIPS_BITMAP	\
+	/* interrupts 32..63 */         \
+	0,                              \
+	/* interrupts 64..95 */         \
+	0,                              \
+	/* interrupts 96..127 */        \
+	1 << (76 + 32 - 96), /* SPI */  \
+	/* interrupts 128..159 */       \
+	0
+
+#define CONFIG_INMATE_VPCI_IRQ_BASE	(76) /* IVSHMEM_IRQ */
+
+#define CONFIG_INMATE_PCI_DEVICES_NUM	(1)
+#define CONFIG_INMATE_PCI_DEVICES	\
+	PCI_DEVICE_IVSHMEM(2, 0, 0, 1, 1)
+
+#define CONFIG_INMATE_CONSOLE \
+	CONSOLE(0x30890000, JAILHOUSE_CON_TYPE_IMX, \
+		JAILHOUSE_CON_ACCESS_MMIO | JAILHOUSE_CON_REGDIST_4)
+
+#include "cell-create.h"
-- 
2.34.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211130232013.395-3-stephane.viau%40oss.nxp.com.
