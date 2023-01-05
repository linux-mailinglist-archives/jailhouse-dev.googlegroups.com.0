Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB54B3SOQMGQEK2MWNUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id E16AA65F17F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Jan 2023 17:55:20 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id e3-20020adfa443000000b00296b280432dsf2306028wra.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Jan 2023 08:55:20 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672937720; cv=pass;
        d=google.com; s=arc-20160816;
        b=F1sMSWIUm39bOENIPG0jiRhIqgX7qKwKL+6WCEGPHx1wWbwXfjm0BbPHTmKL8a3x3o
         EoPt9xIYnR2wVTDw6CTTsFaH7BcvYJJIi1ELhMwNRCcqjVun8nG964b11mFVrf2g7olN
         uxi1tSNgYaMdobwu+GoQxNWjDNrICY9lwRk85itFsXDeRL/vjesoW4ZtC1W1dgZpYRxx
         Uc8knsW3c/zv+dX2oReV2mmA4PMQTbbpLYbkwSdwipMjXp/2qgHaIRWaN6dN6bqQVc32
         SooE2lYXM/wQGwpmZXB3IRWLzolZjBqz/3PQk4/dZu5ikfcKbp99gS+c7z/gW3Nrn6Kw
         fOWw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=v+oO+wkO7Tz47568BWiElryxjPveMwM7zsT1nFTaOTc=;
        b=uofoVt5dA3Y448sR72h/KHAjLmtDinspjrhbm/ewBSuD0MDx7vZQD26ZRmt0sEqEVz
         mQtyVEE9GRZq9VTvYpNvDy3yLJRgP/gtUPLWkrn5N6Mev2PQaOCRbgh5zDX/03j5PSyn
         JaJW521Yb9B9+cMpmmr88S7EmLU50kJ6pCmHEGaa7ox1WE6EgYljXoW47geTX97hqdnG
         YJrukPlWc8+Xg8NdwU94VZNgPfdiu1R9E8E+LenDE3S+Jt/OioyCEEG0zZA/xo/7o7YR
         vvwytds0yslxl/CxZLdR0lh9MegY0ycZgSdQRnxWTtGmUdwFzX1/bTfnTrNKh5fqf+3J
         idPA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=NSlDdP4R;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.13.41 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+oO+wkO7Tz47568BWiElryxjPveMwM7zsT1nFTaOTc=;
        b=iULgURydBwKD/0vmOSaukpjGXT2wqxVEPY81n5jHawcc01M4UM0itnCfFZGtw0YDGy
         bDQlynwAkkBsY1+HytQynJQi5AbC86YWPTbXXL9w+5SWcbDdKFnccUh8nftdP8rp4vrh
         fRugxVAAMNU/dh65dJtXE14DnLF482o3CDGigwA+/0CHbfCrEuHtvysTs9DuGjezZA46
         b90GAoQ3HDfhfH0hsTd+rcHPVwZFnXVMW5u/llO3dpA2QWHwNeyXt6UcsPsQuF9YTVq7
         vJ4nxmoFu6QDSYMJ5PckcmifPJ3Cs+8pCT3Y3F7cWE4rPuLa5EP6VMP3txdwWK/cwfNg
         w+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+oO+wkO7Tz47568BWiElryxjPveMwM7zsT1nFTaOTc=;
        b=yE8OFV0Tyc2eqd6+F/4hxA3xWBgEuCi9mIRzxNd2fzm+yhskaFBwSbIsjxr91plJSp
         2kMAk6JiL3occLraioSHDzgqHdVHD3i12VLuHAY+C/Vxra6Ju7qMWA6du6FI0bfI4iGB
         hMaLM/uU/O+t3y0ohVR2Vs9O2bgDo9J/j+Vus/TWc0HiqfjHrdkgUEDioYkVMJCShPPf
         9tJv3UyxfgRIxC1y8CvZ1ZrlSdIULNZRpAVOtyQbEpNPvvOYei2zYdeaR3pPGmIOTLEl
         tTDz4rtfdNENHJ8AUyXXPLhUWoX6aZWxGfeiUkx2AWMxyng7PgnNEdwWKuExeNJGqhLm
         fVIw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpD18MBdyrwGoen/ygSl3UAb2or92e5ehpIaj25sjLwUWXZDUdh
	74gRlbqFTXVejCpXMsvRa98=
X-Google-Smtp-Source: AMrXdXu8jF8OVhAbBSFr8D6gsQmKyp1BpkqJgS00sEm3QSrWZphWfRS0QUS7qF0KDAadQv2v2j7dyQ==
X-Received: by 2002:a05:600c:1f0f:b0:3cf:a7a8:b712 with SMTP id bd15-20020a05600c1f0f00b003cfa7a8b712mr2976091wmb.124.1672937720292;
        Thu, 05 Jan 2023 08:55:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:ce11:0:b0:3cf:afd2:ab84 with SMTP id m17-20020a7bce11000000b003cfafd2ab84ls17841317wmc.2.-pod-control-gmail;
 Thu, 05 Jan 2023 08:55:18 -0800 (PST)
X-Received: by 2002:a05:600c:3d11:b0:3cf:8b22:76b3 with SMTP id bh17-20020a05600c3d1100b003cf8b2276b3mr37364361wmb.0.1672937718836;
        Thu, 05 Jan 2023 08:55:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672937718; cv=pass;
        d=google.com; s=arc-20160816;
        b=YLEQvgt60mRlu/fQsP425o6PbOxpqM7L9cxvBQqVv6JR4lKgsxwfKblup4BjLvySKo
         t1EAhAt8Lgm8SzCwpoQJm458JKoyAfyJhJ1msenRMgRddRSPI7aiAiettYaFHsb7t+pl
         bh9Q6/+keVq/+DrSnVhH3oupLvrRJ8nHky3i17Eahu0ci3XTiZ97NG9esWZhFuAsRbeK
         twF3p2fbm6HfxtCr2T1oFS69j5wJQ1CK7qQUVMsyxBLQW3pNFh9xfel2tISMnqpy4a2F
         nHiwW23QM8EqKOQCEzwRsUwjeGkBnDUpyBSpufXKd7ODG/52q/UzkTKM9cYQ6Ow+fJXC
         WFaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=cx3OdGJ8IKdiicKoCOBvscXxsPHv3ssmmmAzvRCqDiw=;
        b=e4wMIAC32mZVMEPxOKgviEQN6ixFdkdgYIIVhbl40IgeHJYP5bkU0A1XtIZEFfnAjx
         F16Nu8All9yaUEBP3UL4Et23Syx6Lm4apyhOaK+7zIGfCqQMDlps9wPtFZGJ/ovEWzxn
         td9KcZoO75j1qnBbn7i2yYU9JkA0+uxPdCfwMzPoIzFajrk6FZKRFoeMSY+l0ykBoJgQ
         BveFgXkTlxsYHH2n/8AYWEB8dcEQjEFmzeodjC7+qmDKGTXAkiL8Y1lKcwRIFSaK7vzP
         BqsaHJ9Ov66fwrdIrm7x0bKn3EDnmwOjiL/BMw4osaYqlIg0n9/XPAHzaTyJgiyt6h+6
         b7Yg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=NSlDdP4R;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.13.41 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2041.outbound.protection.outlook.com. [40.107.13.41])
        by gmr-mx.google.com with ESMTPS id z5-20020a1c4c05000000b003cf1536d24dsi132520wmf.0.2023.01.05.08.55.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jan 2023 08:55:18 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.13.41 as permitted sender) client-ip=40.107.13.41;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vb506L1mIpEKOF0xbA9wrRya5hKdmWJjL9J1KvQraRj1HFZ4L/DjpxirX3drQmYD0EhHVPe1sRUtAnLIw5qZnoYsrH24fHLNffsHEYSo0N9IExNiE7Zf7lhDAdatUAUqZMg0Zw3ftt0Lbqgpmjo0AyT7wtUonc/t3SUT2hfReBkqGzeYfuA5iXog+E+bA8ar+6CPZy9HA8Z85wrFF3ZB0bM5wgVBhS8Chy4Wp2ICO5VNcQPA0OTJln3Ys2j7UJOSd5Rn9K4o+eBTJrgwpu681EbHnILzCkWjWvk0QtddJOAKJeXP4ALUUym1mkY1fHYddRCh3nK0Ge7RP/gDWnP4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cx3OdGJ8IKdiicKoCOBvscXxsPHv3ssmmmAzvRCqDiw=;
 b=TEqQPMiqetvXv2W2KjGPOrFerbJ67Q2HwDT0z1Ctm1mM8hGD+DWOFby4tLaIIQT/zeULro/mTrBbGbra4jPJtx5IFejrgsgZwonMUlPfR6rQ0R7F0aJJW7ovGpzVK/iiHBHuspoDnaFVMJKWu15j3/G+D1vWnCQw3fAmCCdIDrZ05PjAR0byAGTsjrKRBXKr7BKFcF/5QTzths2K5rv9ZzLlBK3/eh+bGdhLsAyYJx7et8phHrIwEoqCbwTuERwa/h2L4W3z/lNA8GcGpNqfIqgqv/djqkUjNhbPuuCeKvnGFc0RVd/mamzXiCYtVVqTlzvbKtXuam9LOAYQjxECsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by PAWPR10MB6805.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:335::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:55:17 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:55:17 +0000
Message-ID: <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com>
Date: Thu, 5 Jan 2023 17:55:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: STM32MP1 hangs on when entering hypervisor
Content-Language: en-US
To: Tommi Parkkila <tommi.parkkila@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com>
 <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com>
 <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|PAWPR10MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6c5430-4369-4b68-2c61-08daef3d9f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVS6hgjrvImzd43PQcvli9kKjkW0RyZDBX5Ce+ciA5mBV8Oe7GS4OsK9n6P9VkP38fCiWH1j7IBInC1lMvy6xl42QokwuJSpOskk7Zt/I2H8vQEw3GhFJi9rl6IN3EOacO2l8Q4D+AGH3o+ayskTZF+vFqGWOD8vn5Wml3yIxOS/N2IXb2rILZFLB3T4Tgh/qHbNIBxtwzg3X8u3meNF27rrL7ftvNm+EWtUqrRQAs0Y7nlXR+40/ulgnzXy7EwZwz7g0Ctl6t6bmqw57/LTX7EIjH4pRLs/PQjXqAUJgnt/sP28/F75C89BkwmtJV6lUiz0zejXYW1MmAuzK4y+THsiC/y5/LLaLFpa7PD3tWAGMqF7tt7KiGwKKPHRev05QKdAH1ZLXliEk1TJCUUriNnajvDIzzURsxGqTBAyyZdt95fNespHv8ljaEFASkOHLh32I2IbsNAmgDNtNQYYDesN3DGoeq1VdE0rM2XuNkfKZsoXucMM/PVXQUEQlh7UJFXmJKD3NhpWipaaQe6rY65XZ3I0wGzHHS+Kysx0I6e7sKcvC1FzzM0XkS17HI1kSWqgeLr4dhUcyEYiTbi9Uuy/px0Vo7zXS/2EAjEehcHDqJ/OL7MXOhasvQPg1bCJypqkr3znw6OmBCTri05lVtsREfrzCFDEkuHlmTC0kiUISTfmBlBlmdSDAjFJ2oFbqHzAgtP50/Eein7GS+HseAx1zP01eNn1gWk5JrtEI4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(36756003)(31696002)(86362001)(316002)(186003)(6506007)(6916009)(44832011)(6666004)(6486002)(66476007)(2906002)(5660300002)(4326008)(66946007)(8676002)(8936002)(41300700001)(66556008)(53546011)(82960400001)(38100700002)(478600001)(6512007)(26005)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTBQQ29nR2ZNMEdBUVBVTlgwcHJQT2VtZXUrVyttNXRhMzFjK2RDdkRuLzNl?=
 =?utf-8?B?SHpoZHl1V0tRWDdGTUNjZzYyMmVmZXhKQVlmY1p1YkN3SjBZeWxzKzNYK1dq?=
 =?utf-8?B?YW4wRC83NDljekt0QmRZSzUrN0grSGJPM20wMUhpNXZwYjc3bFcwUXpid2NR?=
 =?utf-8?B?ZzdndWN1U0M5cXBSSVJuSnZiM1dSTlNTbjJLeW9WTjB3MXJTQ3lGanFaN1V4?=
 =?utf-8?B?UzhnM3IwV2ppRnA3a0cvSGRrZm9zb24zTHFwQkNKV2piaTdJTUtyaDlqOGN1?=
 =?utf-8?B?b040anU3MFFLTUpQQk51QkVtY0swRkN0VzJzTkNzWVpUZ1d4N1pManIyQ1F2?=
 =?utf-8?B?aHlSR0pFS1I1SUQ5VjZEekVzNlRvbmZldnlvdklDOTMrS2NkYlcxejFWeU1r?=
 =?utf-8?B?aXlKK3VKbnI5OFdMZU1hYnFtOUF1dkRsUEpCWk1UK0lxR3MzTGxRMHJmRDRQ?=
 =?utf-8?B?TjJjNWJYMlB2VDZ0T3lUYkhpM0xUbG9aQVNjYnBJeXUzMjNuSkVreVJFTWcr?=
 =?utf-8?B?eU1lbXUxUEpnVmt4TGVLckFSSHpGdVF1c3FGamtrVkpVQ2RmSkJ1UFM5Ym1Q?=
 =?utf-8?B?L2E0WCtLSDRNQSs0SzY1QjFnRGN0WjV1SDNYZGdjSFZ0eXJuNWIxY0ZtSEpi?=
 =?utf-8?B?eE1BMkxFV0UyY0FuaTRtYTVScWNsSnptNDNXMnVuSjZtZWFiaVRTRmVPVTJV?=
 =?utf-8?B?alhDUlcxODJTYncvMUs5Tm5nQ0hSMmw2RlNmaGZlU20xWjRZYmZWUnFKZmNw?=
 =?utf-8?B?aE43M1ZjRG9uRWFnNlFHWHpBZ0ViKzZNempqb2phL0t0RVZoblUwbmNnamxB?=
 =?utf-8?B?bXVQNk4yd3MvL0dTRnRkMjNPRXlIMkl2MHNCZDZobFA0aFZCeXQwZ3JnbHZo?=
 =?utf-8?B?a2F4OWpidEErenk0MzdORGh2OGxpaDIxc3Jaa2JvWXYyTTdSSDNYNFJCb0FZ?=
 =?utf-8?B?bHlJVDBxZHJ2OUI4aVJSdWtXdjdXcldkbmhuMlQzRDNWM1FYSEVIWlJEK2NP?=
 =?utf-8?B?TFJmWVZYSnVaQ3Rwa0pWbUh4ZWIyWDB5TnRxTzhGalFwWDF1RU5Bd0ozeHIx?=
 =?utf-8?B?bTVST01qemt1bzdSUml1N2MrSW15Q3V4SmJMNStDeEZZbWhhbnlJUlV6a2Q4?=
 =?utf-8?B?NmRucENBN3U2dnpLbzRYMlVSSmpGUHgrZER4WWF2L2NiS093cHZqSHhkejhZ?=
 =?utf-8?B?Zk9pMnp1am1hV0FVczR0c2VTM25TL2ZJVk5va0pJbjF6bU00dVNXbEV5WXR2?=
 =?utf-8?B?QThNYkJEazhUUGVvYXRBRU93Y2htL1AvdEEvT2hWMUEzWmRiMVpVcHoyVVU3?=
 =?utf-8?B?ZDRXVHFhTHdvNTE1ZktsTEdneFM0Z1JhdEtDaklObWFRcXh4UG1yM1Z1NWhz?=
 =?utf-8?B?eFM0dGpZekxmbjc1Qi9XMHJocnpVOXByTWJ2cVFIOFMvOENEU0t2bjNXZFlJ?=
 =?utf-8?B?RDI0VVBWY21YZkt1WjZEbk9NZHR5dDM2ZGsyOUdHbXBCSlBweGJ2Y29YdG9X?=
 =?utf-8?B?bkV0L3I4NjB3R0cvbWYxSDNpeTNIMjdzVjZ1d09OQ0RwellVeTM2emM4ZXRq?=
 =?utf-8?B?QkJkUTlwdmhLS01Fd0wydDNOQXNhQnQ3L3AzQU1KLzB5VklobFFiU0VJME5H?=
 =?utf-8?B?R3prRVd6ZFlTdzhidVdJaUFTRWVBcjBZWWR6aUZlQkQ1L0FzTFVZaXd3RSsz?=
 =?utf-8?B?ck9qdWFReFlnK09IeDRhK0EwY0pFdWxmeGpMUEZ3anRlU2cxSHZjaml0Wmsx?=
 =?utf-8?B?UnZIUjNocXNkc0ZnYVpKZlU0K0R2WjZKTldVdzFYVHo1dG1zWDE1dEVvRlhG?=
 =?utf-8?B?d0JPTEltQ3pONGFDS3dNVE5DRUJ3ZjN4YjlyUzRhWEZGdk5vMGo3YjRPSTFp?=
 =?utf-8?B?SlMrcXpNOHpxMnVRVmRhTms0K3Nrd3JudTBKdmZTTmdNV3VmRTFJTlBtQU9x?=
 =?utf-8?B?bzdDL0hLRzVjSDlGWGs3ajlidVc1dWV1OGljZC9wU1lZenhROUJhWlBaSXJy?=
 =?utf-8?B?TjFXVmppd3JPSklZQkEzMGVSRE1ITzR1WUJ4NHpQVWtxa1d6WEgvb0Q2dXJ2?=
 =?utf-8?B?TnkyN3RJWkFoYnJKNHgyellUSXpjc21KTTFnM1QyT0NLb1haNkgvR0dEUlVq?=
 =?utf-8?B?QXZpMUp5cDJ2UjVDK2NGT1Nhejd2SlJ5L0hkZWkrSTFrS3JUTE5zSTFBdnpF?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6c5430-4369-4b68-2c61-08daef3d9f46
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:55:17.3378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5K5oe9lqgIOssmn2i39meJJnYEd4Q1bneHCF1QmvF+FYxv8LRi2U1bN2vPJ4ozzfSTgGdEh761n1VOiZ79rFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6805
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=NSlDdP4R;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.13.41 as permitted sender)
 smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

On 05.01.23 17:53, Tommi Parkkila wrote:
> Jan - Thanks again. I have not tried the config check yet. Actually, it
> does not work on hw currently, it does not find pyjailhouse module. I'll
> check whats=C2=A0going wrong with it and=C2=A0let you know.

You can also run it offline, even directly from the source folder
(tools/jailhouse-config-check ...).

Jan

> -tommi
>=20
> to 5. tammik. 2023 klo 10.21 Jan Kiszka (jan.kiszka@siemens.com
> <mailto:jan.kiszka@siemens.com>) kirjoitti:
>=20
>     On 05.01.23 15:34, Tommi Parkkila wrote:
>     > Thanks for your reply, Jan. I managed to get forward from the 'hang=
'
>     > condition. There were several misdefinitions on my root-cell
>     > configuration. Now I get the root-cell started sometimes, but more
>     often
>     > I get two types of issues after enable command. Any help or ideas
>     where
>     > to continue my debugging would be greatly appreciated. Please, see =
the
>     > issues explained below.
>=20
>     Already tried "jailhouse config check"?
>=20
>     >
>     > Thanks,
>     > -tommi
>     >
>     > +++++++++++++++++++++++++++++++++
>     >
>     > 1. Terminal hangs
>     > -- After the enable command for the root cell, jailhouse gets start=
ed
>     > but then the terminal goes unresponsive. Below, example log, where =
I
>     > give ls cmd, which then causes terminal to go unresponsive...:
>     >
>=20
>     Missing interrupts could be one reason. Or something is completely
>     broken with memory mapping so that a kernel device driver gets stuck =
on
>     waiting for some register bit to flip, e.g. But most frequent are
>     interrupt issues, specifically around GIC resources being improperly
>     passed through. The config checker may find that.
>=20
>     > /*root@stm32mp1:~# modprobe jailhouse
>     > [ 1315.034414] jailhouse: loading out-of-tree module taints kernel.
>     > root@stm32mp1:~# jailhouse enable
>     > ~/jailhouse/configs/arm/itron_stm32mp157.cell
>     >
>     > Initializing Jailhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CP=
U 0
>     > Code location: 0xf0000040
>     > Page pool usage after early setup: mem 28/1514, remap 0/131072
>     > Initializing processors:
>     > =C2=A0CPU 0... OK
>     > =C2=A0CPU 1... OK
>     > Initializing unit: irqchip
>     > Initializing unit: PCI
>     > Page pool usage after late setup: mem 50/1514, remap 5/131072
>     > [0] Activating hypervisor
>     > [ 1355.352714] The Jailhouse is opening.
>     > root@stm32mp1:~# ls*/
>     >
>     > 2. Issue with setting CPU clock
>     > -- The second issue I see is related to i2c bus and system clock.
>     > Terminal starts printing error statements infinitely after Jailhous=
e
>     > opening. Below, is a snippet of an example logs.=C2=A0
>     >
>     > */[ =C2=A0 85.322027] The Jailhouse is opening.
>     > [ =C2=A0 85.322648] stm32f7-i2c 5c002000.i2c: failed to prepare_ena=
ble
>     clock
>     > root@stm32mp1:~# [ =C2=A0 85.339233] cpu cpu0: _set_opp_voltage: fa=
iled to
>     > set voltage (1350000 1350000 1350000 mV): -22
>     > [ =C2=A0 85.350413] cpufreq: __target_index: Failed to change cpu
>     frequency: -22
>     > [ =C2=A0 85.357706] cpu cpu0: _set_opp_voltage: failed to set volta=
ge
>     > (1350000 1350000 1350000 mV): -22
>     > [ =C2=A0 85.365124] cpufreq: __target_index: Failed to change cpu
>     frequency: -22
>     > [ =C2=A0 85.381985] cpu cpu0: _set_opp_voltage: failed to set volta=
ge
>     > (1350000 1350000 1350000 mV): -22
>     > /*- - -
>     > +++++++++++++++++++++++++++++++++
>=20
>     Same possible reasons as above. Or do you know how clock control happ=
ens
>     on that platform? Is there firmware (TF-A?) involved?
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Technology
>     Competence Center Embedded Linux
>=20

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e9acd20c-b3cb-4887-788a-266534ab5a19%40siemens.com.
