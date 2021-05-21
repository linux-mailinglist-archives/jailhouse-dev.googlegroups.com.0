Return-Path: <jailhouse-dev+bncBC44VTVY2UERBIOUTWCQMGQERNGHWPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2738C158
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:06:57 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id x3-20020a50ba830000b029038caed0dd2esf10970109ede.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:06:57 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1621584417; cv=pass;
        d=google.com; s=arc-20160816;
        b=WwOXdivQPy0FAGHajXhvtAivj2iTBW5qxD1fN0uYbT1avSCJkq7pvACKHigig6Wpv2
         DN+lKJ7wA1o6dQ+oGECMk7so5ZH91z+O5v0l7NCODlee8K3sAji/NHQ784ySKTkVYvLc
         Gxc6KRZ1lds8LClQknQC9cD3JqrqHtgZob5IYa70R0wykdWHs5V4CmGf1TmpL1JbcMQS
         sbEoT59kPD4OdwB/+pX5ctq0LdPt861LCH0b+OLy23lGFr5Bk2amkULJMp3hg5NeAux5
         rfe8x0XVLP/DTcspOGNt33frwJN976CM8uGvJrE6PIeyH/liBe3l76xutYwcyR3BHw9M
         GmKA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=pegZqH/ci87++/lvGFFNAEJ1K6EGltSnfM7dL1pco2A=;
        b=JS3wnV5eqseoyR/RVOFYtRLbhPtMvRr4aGHrGVIPEhIlR3kEywdmw8C2p5aZ6xMsqV
         /fK2iywfLG//BW0oJqB2w7Dc2Xi15qTGPZx/yk2gKv3XDuYLc4LhEqtVhSQf0V3aVP6d
         ArdXrJjwy7uqqDRrASXJ0asWMFSJn4O8711WnO66RCyhm8w6z6FpDPvhj/NQOXMlUOVf
         mPxs6+2FrUItrMo2Fh86oKARNZup+ym6fufbd5fVhw2L0Sq3xjTH+NO9wPUjfgkTylge
         bXSzbDK1U6zxhKjyKkIL/bNWBci5tClkgsrsF75NpGnDpRB2cY1ZPq9I2C91lluXW1MS
         ZQiw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=jAZUUrWi;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.41 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pegZqH/ci87++/lvGFFNAEJ1K6EGltSnfM7dL1pco2A=;
        b=kGOeFQPeT3wOikMMppN7ngT78FjPnP0oY/qBtzJjyfVG2nNo7If1fG3fHCffJdYVTf
         eFsYpoecB07eK0nXL1p/xrsNPRzJK/G4KlDTg7M9Dt64f6xvdyxP8wVvOKzZY4gK6dBO
         dkZUtL2H0DePkJNgfrDEjUzp9Yr5tuGzxGTdl5w8GjlgafJVI4dSF1PkJe7Lr02fqmYE
         DniYhkEFSjVMyAJNMoOtQJW1Ntwr3V2dIjfu0wQVBhCVCcksUmVj3UuPNLxT4eqZWu4b
         Jz8eW8ZL2Fsok60xnDBc1uDhNiBWV6i3cDfxai+ACFEQu1VrTBTSwE8YXObTwJ4noiUO
         FyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pegZqH/ci87++/lvGFFNAEJ1K6EGltSnfM7dL1pco2A=;
        b=S3u+elBztdA40e+SXvqAecesj0g0MqR32h2EBIniq7sNPqAfPvhP8jeo/PJk123NI4
         QGhQDVFPom7gqjoYDDe1G3Ts3U23j3UiCRdPuvA+x9qN77khsssRcb/xDKHDxGWHt8Be
         4W1mOS1x+5krARBe62WN+fmu1JnxN5mlEOv5B4xZjBWV2uMURIK34EM9xTJjiOQpcI+R
         OBw6PHjorhJtEPPpW7BIOcGBZrqaug7OjYfwHT1hTAJSeyvURvJXuJj0lvEISlxmwV9/
         fiZU7fk7EaC2/yzf8vj13AslSw54E9Kuu40qSgwASLecbLZzGG6xl7uTJ6fAu0O2Jiwm
         3kkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ED2TWk/BM8PDhPE+Mc59e+7+sT1yHHV1A6wn+aa2gKZBSKxrN
	wGZ69iBKbMWocOL+H6Mcuwo=
X-Google-Smtp-Source: ABdhPJznJfezaRWhzOx8VP68waqfrwfbN2bAnz+CPDK8tA1OtLX2ynAxYvcKbx3JyZ6oOo3aj7mW8w==
X-Received: by 2002:a17:906:c1ca:: with SMTP id bw10mr9194680ejb.512.1621584417462;
        Fri, 21 May 2021 01:06:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:318b:: with SMTP id 11ls2638219ejy.2.gmail; Fri, 21
 May 2021 01:06:56 -0700 (PDT)
X-Received: by 2002:a17:906:594f:: with SMTP id g15mr8947116ejr.103.1621584416572;
        Fri, 21 May 2021 01:06:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621584416; cv=pass;
        d=google.com; s=arc-20160816;
        b=yFGHDMKJHIEI9PuQagsWdAgPEEa2JyfVZ1bDtpKb3OLhqrKMudZRc3MAnV6OwHm6vW
         MfWy+ipOfaEYFfONxbFO/OqHGdcLlsTpU7o1I4sevM8NK2B7JE16I/Vn3NihaZdxyQIs
         YghV6ZCu8J5JqKINJJDiHNtzuDovzdYA3968ZZ7+knrbHAednovPaFmEblvWytdMTAq+
         zh7lZa2tlvY/WBtz/2HeMBD/12BJUpEjiRzFC7CLa/uP5/bi8v+Vjc44JWMblGJhI8IG
         +AncGkV0+M8OSho4/SEHjHiFZm4kY0bi9UvTiLs5QUMU9n7L2YM5B8HEt/i0mzdC1Pjr
         oB9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PXkNpoWl0b/QokoSAJDpFCHw/DWuqCFsLiIvR3Gwtdo=;
        b=YL0tbGtDmRiE6Wg+pU2v4zAwJU9O0YvxgIyR+dX2FFg2JaqLnX1MRxgTU0YiIHXYyE
         VT4gF9Z/KTwBBQDArZ5UZtUfpEqNOFUpQrQjB+Mx6CSFSRf/9v+XPY588wo34074SJPD
         jbqimMHO/01J5Jqwo/xoLxip05Vg5Q5XFUFnYDTfJSZsRIyniOiAqBIikT2xAZorBpcc
         sWeEUPi8ZjxVl0N7qHQvdzQJJBx8QEm9Cd8BzGjyHC42p0ei1XRJGPz7K0JNWcodb56M
         /l7DqRJ77KBxXvDfU88ZWOAfg3oYGccajRZXIAJTfU3y4CXIijlt0JsgtrhPwOxXUwRv
         hquw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=jAZUUrWi;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.41 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2041.outbound.protection.outlook.com. [40.107.20.41])
        by gmr-mx.google.com with ESMTPS id cc21si222805edb.2.2021.05.21.01.06.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of florian.bezdeka@siemens.com designates 40.107.20.41 as permitted sender) client-ip=40.107.20.41;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfewKvvDgv4LGaFId6TH5gJNHgtBZ84mV6mPrjpg/hFST5jL4Fzq+MMM0+UYhmd73q7fZY86U8LPNQGka8JTxFWn6AqJ9MdzmgXRLXdkhk0lNEcJbhe/7fIMCB5JQ5dOvBlv4Z3xSuHOPXBnzSiBObVfDZn5WJia9vnwnA3bfSAHfEf42acTmeOwNcjXDsQhQ3uYD69+xbVEmBxojxsa488tAE69g4sOIoyfOl6qxW07Hi80Jfg1qRB+hY3Uoo45SSeLni8Tyjc/ijON4wYy1H0gZ8ud+BeSY7wKcLCuJzyYlkorYGnkr50W5Jrfvwo6WKaX4PvucQbiUCqmpIqd0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXkNpoWl0b/QokoSAJDpFCHw/DWuqCFsLiIvR3Gwtdo=;
 b=Hxu//HPTSQ81qYNVqjplCdrHXDXpGZzVzVZEKEUd+8cEah4v7V5eUkoV6Ce702my7eW9VB+7ydS+Bq+mHPSWDXgRaJO6+Q1RHyG9EfZSDkXZLvbkg4x0gnzDN1wHSbAzI8jPf7gqYt5Rv3hJcLbeKOPL+ZfuoXCfgmYnk9NfTG9MFiyHBBEQwsHR6uNXSF8Yu3EKNmJ1P1HF4W5643cxJKlSSp0NFWxa0kFHZ9QNrUXBxoqMHCz5COTNlGSQ1Psih35a993DKX/6v+jdUyLe50Ic6FPswWOxTItpuVPYBKVOQmU6pVnKCikPc3GyXkWg1lzsYh5g1L+rTwEknJ+LMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:49::10)
 by AM9PR10MB4870.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:419::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 08:06:55 +0000
Received: from AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6]) by AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bda0:21a9:36c7:c9f6%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:06:55 +0000
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	henning.schild@siemens.com,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [jailhouse-images][PATCH 4/4] jailhouse: Make jailhouse.inc reusable for external recipes
Date: Fri, 21 May 2021 10:06:46 +0200
Message-Id: <20210521080646.488836-5-florian.bezdeka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210521080646.488836-1-florian.bezdeka@siemens.com>
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2a02:810d:82c0:38fc:e180:2248:7590:2b4d]
X-ClientProxiedBy: VE1PR08CA0003.eurprd08.prod.outlook.com
 (2603:10a6:803:104::16) To AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:49::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2a02:810d:82c0:38fc:e180:2248:7590:2b4d) by VE1PR08CA0003.eurprd08.prod.outlook.com (2603:10a6:803:104::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 08:06:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc17315b-ba9f-49a2-1f6e-08d91c2f666c
X-MS-TrafficTypeDiagnostic: AM9PR10MB4870:
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR10MB487007E49BCC1E0FA904DED6F6299@AM9PR10MB4870.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QM4Ti9n505I7AY1Fmu1+BDJP61CAAwSaVD9+5x6pJ4vsCZC3eftwLKDpjPt3WhhvqsHPjwNcQ/VPkTvLgVPf4/MDL05FCuMKUgfnqL8yriO+RruuWx8oxj8CdI8Bdj3MmNaiFIhi51l2DdhIFFOO1zJwTtU93VMW4Da2+baL+UG3d9ubpm+v5bybzjjuXA+YZWuytIuqEmUPTBe5YyzXtwFrFpceooZjl9B8G1tCWXNDtol9HLizuJOqXki23BI+1p+BdIALw6eBsYJV5mps56A3xLqys976Axdnf/kLtUajzmXNAO9cquqRtFaZ5JdBO1whlycs3M7Di4/ZgpJkmJ54RPaXVo9q8W1+70w6p10u6rd7gj0oldtPnssKPUi5Z29xrHc84vZejfxyvqPWn4ErSt3Gvkrtj7Z4V8H8dwDu1AzhrjUmogjg3x0uJYmF0o0RS0fRrH9vBVWpc6KLHaeQfLj8aApUaWknS6q8JJjKcJgWVs7ZhDo9pqLAuS2fv6Ptqjs7ceFOzWo8q1trz9YHDsabyfw84ihpgz+fhBTF6UzK3D7sFXesszYpIQzQwrXZob1i960AP43BwR5imRmQGy11gsFJdyG3GEbvXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(16526019)(1076003)(478600001)(8676002)(2906002)(6486002)(107886003)(66946007)(36756003)(186003)(2616005)(44832011)(86362001)(66556008)(6916009)(38100700002)(66476007)(6666004)(6496006)(316002)(83380400001)(4326008)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U0u+GGU7jbot8IgwU2+S69dxFBMlJOq2ynL+gj6SUllv5ta/0nzGPS80sFTY?=
 =?us-ascii?Q?u/mfb8AMcR2OV2QWp/zPxBTIiKju5h91o7Xr0y8bE8XXNU4q7ctiw6JCBDgi?=
 =?us-ascii?Q?JCDaYn7CRy5mbnulAP4nvkyX3ps67PRw3MrAUCL5YLwzr+70DPk8xorq3dhP?=
 =?us-ascii?Q?Iat9f1gqExgKnIC7aMSc/4Cn3eErJ3p+nTq9U2HEKDmr884+uq8qhylYQcbF?=
 =?us-ascii?Q?q5W+fJEfY36Md7250SGKzdSgHEjFkIqvPpqvuox+MtzVRIhW3sdnwAMno/GM?=
 =?us-ascii?Q?48kKHh5kS+4V7VURzD7GG8XfQWoULKo71Sf6xWhN+/WJgtWYg7gR8KAl5sjI?=
 =?us-ascii?Q?NTRzxs8yHsEjsP29qqwy6oUjihxCg3Jdb6ljXzTAO9J99PgUQuM6CUUJ1R4W?=
 =?us-ascii?Q?1nOLywEXqpbT6giQlU74u/qidTmKdqzwkHip21fWWQABKivlrsAW7UPRaWtC?=
 =?us-ascii?Q?u3DNRzx6Cyeo31lpXG1lFR7nvQD/FwHm58CRUJURpqt3klOQNiKA8PUciqVL?=
 =?us-ascii?Q?ZJNF6xQJFoV0cyNe9jYe/5hHsfRSYPx6TcqHDalPhvHNpJwleKHjRdaKSzBP?=
 =?us-ascii?Q?q8IG7WIArZAJqNxcvAN6EBMKRuuBuTGTjT279WNw8APu5KYjxLU6fsXGDz0Z?=
 =?us-ascii?Q?CMf9oO5xrEc0QMTu3YotguibXdAKN+2krdfcR6mXrIkwjxXg/4zL6JtNNfdC?=
 =?us-ascii?Q?9jFAGZnV3BC26zwO/5s6WzVHtDfvXnMjNhO5Suxhd7XLbMoSHUbvMQ0Dp0lX?=
 =?us-ascii?Q?MyJkFomW0TM5BHM/lRJtaJyi57hkssK+xeP9WdAm6w+VlXMh+jFc27CFcx6Z?=
 =?us-ascii?Q?9kXXyA/zhvJfiCnWhW9LLAMTaL+i5Nt7cZRJidjS71fybcB4irNvvcDd5R/i?=
 =?us-ascii?Q?ZQZU5aWEkLNz5xrufPDLXy3FPd67Ckjly3ltBZelhrXY8tTu5RD3Kcgw8S3c?=
 =?us-ascii?Q?qzCSZudtzU6+fol2a8axrjBTEiE0ggA19JLap8hBAytoK4JEaMihsg6vPLzl?=
 =?us-ascii?Q?rtkgwLE4IDxfZHXjNnP5MhXyY6XznGYJUDRD2ToseLUDqNH7I1k1sIufaKbb?=
 =?us-ascii?Q?GFf2ycGf73SP2nKLWOtdH92j0bTXgQuiLMu4Elb+i+Kfq1Bm99jr61HPkT5C?=
 =?us-ascii?Q?zCnL0jB9zyc3i0tvZ9NKv3eV3dKJ2pntFTGfl/a4qHJ4zQxxE7ReOFE9VfRo?=
 =?us-ascii?Q?zzE297qbWzVNLaZ405IGIP0I0Q1bFi9fEnXR2cJKnPolQ9M3mLC2mJ0vIy0o?=
 =?us-ascii?Q?WtqwxnKrNAiOy/eMN0dQNLKM6okQ7UT6TdfkmEaAE0gLbHS/2IZp3OgBqEuu?=
 =?us-ascii?Q?2T18snxOdkz6jqb8BkUQJOws7XwtDFXVbrM6vcepBI1nh6Om17AjW3+SS9gP?=
 =?us-ascii?Q?NAIG8GjqGR8dbnyxyxMgzd6J0nnU?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc17315b-ba9f-49a2-1f6e-08d91c2f666c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1906.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:06:55.8077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mhuyyUOKrXBkui8wHvqyJP2Ll8Q68lbXrF7DzK38uKLR8oUqJBHxNk3Tm45qiGToUVY6CxdZYY3SNcuyGGmjtdWfNIxX6v/AxcHc878rVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4870
X-Original-Sender: florian.bezdeka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com
 header.b=jAZUUrWi;       arc=pass (i=1 spf=pass spfdomain=siemens.com
 dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of florian.bezdeka@siemens.com designates
 40.107.20.41 as permitted sender) smtp.mailfrom=florian.bezdeka@siemens.com;
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

- Adding the directory holding the jailhouse cell configuration files
  to the search paths used for SRC_URI

- Copying the jailhouse.install file to ${PN}.install during build
  preparation.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 recipes-jailhouse/jailhouse/jailhouse.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-jailhouse/jailhouse/jailhouse.inc b/recipes-jailhouse/jailhouse/jailhouse.inc
index 5f99915..9275366 100644
--- a/recipes-jailhouse/jailhouse/jailhouse.inc
+++ b/recipes-jailhouse/jailhouse/jailhouse.inc
@@ -22,6 +22,7 @@ EXTRA_JAILHOUSE_CONFIGS_amd64 = " \
     ipc127e.c linux-ipc127e-demo.c apic-ipc127e-demo.c \
     "
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 SRC_URI = " \
     git://github.com/siemens/jailhouse;branch=next \
     file://debian/ \
@@ -44,7 +45,7 @@ do_prepare_build() {
         # Install device trees only on non-x86 archs as they only exist there
         echo "configs{,/*}/dts/*.dtb etc/jailhouse/dts" >> ${S}/debian/jailhouse.install
     fi
-    mv ${S}/debian/jailhouse.install ${S}/debian/jailhouse-${KERNEL_NAME}.install
+    mv ${S}/debian/jailhouse.install ${S}/debian/${PN}.install
 
     for cfg in ${EXTRA_JAILHOUSE_CONFIGS}; do
         cp ${WORKDIR}/$cfg ${S}/configs/x86/
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210521080646.488836-5-florian.bezdeka%40siemens.com.
