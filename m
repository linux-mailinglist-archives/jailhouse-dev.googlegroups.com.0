Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJXU52RAMGQEBF4J5NY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FC36FE1A3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 May 2023 17:37:12 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id 5b1f17b1804b1-3f42b226871sf9577395e9.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 May 2023 08:37:12 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1683733031; cv=pass;
        d=google.com; s=arc-20160816;
        b=MbLtRV22aV/IFOPKPUb1RLLJu2A6LGVqOzW9dASWr9G9HSYUsIQ5Niz1oQUEIyFCo1
         JVLUcKsq39KXH97NaFpTt84bxs7BBvn2W83syBrrtVfaJeNRsktRqaK5XIylwX0kds7F
         TkqsK+HYEYhgr/TCUDR4geI25uM5sHC7acjsMOjHokEkvQ9e7KyFigPkXwJ7FIvrotv+
         q2QjVQYfpI3gea9vY3kme5spoBBa0g1twnVNTQ8oMTWDI2w2NZb9IpQ8s/cvUolyiC0S
         a9sJq16BQNGBBuspz3kxz7ofu05ey3zJ9x/nIaHT29fIBsRC9jfPbW+wqhjSK7moqzTQ
         WqHQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:dkim-signature;
        bh=+/Onv0gw0eu8Nge1st/oTWkYG9kBwFBFrCOx3SYgjzc=;
        b=EfY39v31pGlySS4DUCZxHsZ4tzm1gXc1BBBgtmYhPzh6yQ4LgEkJjOF+JFtMWBhslP
         oMQh036NshvfjAiJe1mOWoZsJKq3JwVAFShkWstDmNR64gei7GnmytP6+La8RC/wApdO
         dAVU+t8O0M7Jyk83gWe3lgZvg6h+B4yCQmDz0TE2qW25xgRJYtlu2an+zQqAvPnYC95o
         tWMIa5F+qpSE1cXZK7Jrd+1MXXuWTx8qLVLDQRJIYoY/h2mYzmdKMB+D257e084l/k51
         rrLOIyaGMZly27Lf3EBTbkAfWrIunvZz85S0S8gJeKnPq15fBvozQ0D5SzYvrsn4qbFK
         1ltA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=qfKNDZsV;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::617 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1683733031; x=1686325031;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/Onv0gw0eu8Nge1st/oTWkYG9kBwFBFrCOx3SYgjzc=;
        b=R2faNkRLwKBkiBLZ+RADKcKW59SdoPXcQ8qTzqUu8Enr7otsLpbTgILZmWD/b7V/HV
         cfe2/VYz9hTyRpbRvRnOM8b3MTo8F3pg3IzQv+1fwvg0/kvX3z+Trnfo7NMoZQ+7xplo
         Vyii+FH/UbBnfNXL8URYf1C8+FZgmI4RingkLMMntTibFggN6Y7zyg3/g9rzYQHLaJj/
         8jbHYrdmDvXDL3JTwGaqkd93dQBw465hyYYJFdkD+DLw9BFNSfuzl5wxsIdJmNdeJNT6
         Uy0AHmWDfEeFtF8VogygPDw8jKnudZXfmlmpUfkgAs6Tu56+E6yy7W0EAoFdWG/yk90u
         xtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683733031; x=1686325031;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/Onv0gw0eu8Nge1st/oTWkYG9kBwFBFrCOx3SYgjzc=;
        b=hyINVHIp2W022pcqvEGcafXg21cMvpYBb+bcZiydfnfEBysZpv9xEH6rQKFH5SSsSx
         4YAhdIup3bQe7XcXQQbHxlHHUnH23I8ukuW2kM9lM0w7cjyAwdCcaucArCtbow29Km/C
         /+33iffvsiVVh4D7aaHLTVMOTZfZ3lRrnXfiWSY5hOieYwUT/BbupuKIRVZZOqBtDac8
         xJo2Yzf7k4oLeFteGtQYQqJRFAhQVbXvG7Kqo5gy2X26DcuBpfVJXO6wrrQaEw0gd001
         e7RnFTBAc73LZZjYfRVCMb8dvetlCtVBBL2M9/Vm7jjJJ47WdZJZYJ0JER3KS416UcnB
         JvYA==
X-Gm-Message-State: AC+VfDyRCT2w5nOhB0pdCNf1XgnYl4OWARgKjyJMSdzNw1EWKfy9olGk
	do3qWlTrlXmf2rePP6Z+DtY=
X-Google-Smtp-Source: ACHHUZ7ZJUfSh67YwdrkeroosYMzcpucez3U53UEYyPCOonXBanwXf8Sgf8dYzfxuzFlaK/EWChCWQ==
X-Received: by 2002:a05:600c:364c:b0:3f1:6980:2d31 with SMTP id y12-20020a05600c364c00b003f169802d31mr3254183wmq.4.1683733031200;
        Wed, 10 May 2023 08:37:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5e93:0:b0:2f4:1b04:ed8f with SMTP id ck19-20020a5d5e93000000b002f41b04ed8fls774613wrb.1.-pod-prod-gmail;
 Wed, 10 May 2023 08:37:07 -0700 (PDT)
X-Received: by 2002:a5d:4485:0:b0:2fe:c0ea:18b4 with SMTP id j5-20020a5d4485000000b002fec0ea18b4mr12150206wrq.24.1683733027745;
        Wed, 10 May 2023 08:37:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1683733027; cv=pass;
        d=google.com; s=arc-20160816;
        b=lu4LZk3L6qhTAx/fEZDIYIJi1qIwmodayy+stYp/gDX3pG6m5FTfCwxGtIxmUd2T3M
         V9PyeGZCaQTu8VzekTbJje/U6yWFmw6xHErFZ5N6g3iv8IPQXxHPA6Ay+IeNplPliGBh
         F7UFSqOjlRGKAV/i/omkIeGRwQiXXBCqWoFFQfga4y6x/p80cEPMCAJhwtpAd+PlOyhM
         cN5YM2L1AQJvpue1IODN8eB5lilL5jmvhujkcooAIHUiFiyFIiEhOPfk/6s54MyKXkxr
         /D8F0IveWQTLBQ2BEz3JbLxFGSUb3ZsvXBpro6ROUbM6uWIbGWZJ3xSzG2S1mjJBHADW
         fjlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=xXKOR13qseAY6WECyv4/1ixUNB7BUdqu9DHb4j7CJdM=;
        b=Metbi017DOo4OcB6yMuq2BUb+V7/xZbnIcf5UDwBdxXBsAA3QS0PbZbejtkYClwTPx
         cTRIVOD8bUY6Pd2eg6f7oMKCdqJsAKGTkYVRn7FJAFmyMw+ZqZyar1PsM9iFNU23GL27
         +SfRnV0IjYeW0Kf10LYCeBoyOJIOX5SoZe7jSgxlTAKmk+k/7yR3f/V/IDC21Jw0MU+Z
         /rUZ/JzD5bQPzzaN7ZAt/o8Jz2tU9UppO9wSzP9D7KTodPkDco9lkA8Z8JfZQHlRBGPH
         FNLV2Pvc85Un89hizDrj/fEPseecKHegW7IDVnMVWW5+HKoNf+KsStShgfs7thRtRh0v
         v4gA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=qfKNDZsV;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::617 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0617.outbound.protection.outlook.com. [2a01:111:f400:fe0c::617])
        by gmr-mx.google.com with ESMTPS id az26-20020adfe19a000000b003063a286483si940747wrb.0.2023.05.10.08.37.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 May 2023 08:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::617 as permitted sender) client-ip=2a01:111:f400:fe0c::617;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnx0OfR2eOoCsXI2zGML6tBZRfGAh1vL8jKyIfUD/BFtskqToToLQQ2Q7hKJ8OcoHxkYpPHTj3s1f/zFzhIpNlfksXq9DImNXQX0cBIAcprKU0gYPvQP6Q2xoBawO2Wq7t8HJitPihIkmi+HQ5loqDsLA9s6JVDnypeMPFlrw+fItoi9ludLjQqVDOlyjrxjyeSjTwAJt/lz+QAy//5EPw8LRMSNTCDckCGB+bhSvJjrJMW/fS8a68pLFTCbC0yAXyTSkRRknR3gYpuvCXMN5OE5ijHXXDDz3wX6NkesUeOvHVHPXknecsJHYKh7O/iXZGCGczC8CD/XGWpXAmjpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXKOR13qseAY6WECyv4/1ixUNB7BUdqu9DHb4j7CJdM=;
 b=id022voeA4607mX2gTQDGCJQYGCSKCTi17/6ZwtB5OrilBoxP90pr3fMYqB2AzThRbAsNb9bORob6X6wN44dStE2hgaT4Pu+3ny60tyiQAmAwA1pS9NEl+E/4hj9z0uM4UZoBb+l9Eh99RzUI5Okox6aEAGWO/SJ0Q48xWeFr8k0tDGhSXgODdMGS7+ZzyBJF6nbh4L2nJBJar5FG85CpdrtVq1o3vX0Hea6dEDmcJEHUT0O71865xlMgI1MO52u/I7ST+JHtlW2bNk+xSQ6JxToywUYg2bQisHsXkFdPV5tbeay3xv9oWsto+cottQBhhyN2L51JEwayg2vjqZ89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB9PR10MB7289.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 15:37:06 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b50a:c627:3d12:6f04]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b50a:c627:3d12:6f04%5]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 15:37:06 +0000
Message-ID: <716a8a07-3a7f-f20f-d08a-a9cb4ee607c2@siemens.com>
Date: Wed, 10 May 2023 17:36:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Jailhouse and optee interaction
Content-Language: en-US
To: Vladimir Neyelov <vladimir.neyelov@broadcom.com>,
 jailhouse-dev@googlegroups.com
References: <CAKM86uE4n7wWu2UZYr+hGOBrZ4d5eHsJhOND7pmd4apNZzhLBA@mail.gmail.com>
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
In-Reply-To: <CAKM86uE4n7wWu2UZYr+hGOBrZ4d5eHsJhOND7pmd4apNZzhLBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CH0P223CA0002.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::21) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB9PR10MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: bff4c946-52e7-4cb5-f792-08db516c68fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RUktymobp/S/1qYif9qXXUCWI2v4+hFbCkFDf/ZqmHwtjSumLxn5bYFvjQc0cW32HZkdweXLw3MKsnIEVo0dJFE40svedN8tQ53vRu4W/o8tfAb8SETWL3ff1mRQIRn3gzDU0lYQ1TEWzxRXKYGDKCJLMBwlcSkHI+HwZ4UYASgaoVbMeVi/U3yxnKGB92UYych25LzOqF5OmpCvffAxBzgzBXl97jdwLN2fnxn2uIgoWH5FTn5XoZFKzjABjwRxBnUjNFl0Mr10VM98KZYr2gnRRy7QmloMvu3chQVVEtlVnuxVtgS+5aSozl5Vm1pBYT1aSeitbtNEaehcgHlHccUdfFC+rE/bkPbRrKoY/ZG6iAd+V3kRC+RpIDaP5o2Dhpufp0oSkp+7LwhyKt8xezJPJE9wLa0XmIjFSmGe+gSxaw6P4ua1skdf0+Le3ff3r99ysHt8IAD6CgtKbn9h9r1oU59/hdaQjrBUbwxCkFZmoKE/nMJ8mcXMHGgK1M2QoTHBWjSGWE1fZs48tDTsJQGbDGbz80yO2jxz408OYuZwJ61GfVxC/L6J2kNeQQP5ABJuOC7A5wx3DZR/mpu+9XIOB/39wGIczxuI5yyUtuUdCdQivaxLAGETJsBtd3uTfB2h9YgxXw3TGbKTWMVlTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(186003)(26005)(6512007)(53546011)(3480700007)(6506007)(31686004)(2616005)(478600001)(316002)(83380400001)(41300700001)(82960400001)(6666004)(966005)(66556008)(6486002)(66476007)(66946007)(66899021)(38100700002)(5660300002)(44832011)(2906002)(36756003)(31696002)(86362001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2VmcW1xRlloWWluQmhHaDBlbC9qMFFJc3V6cW1xRUN5OHBKeXZSOU1RRzVs?=
 =?utf-8?B?NmxzQVNXQlJac3BaeTlMaWo5d1Vyby9mdUxBbG1DN0NnN2NTVFRsS1g2VHNY?=
 =?utf-8?B?NVRFdkM5NWN2SDFFK3lMRC8xenU1eGxoc0YyMjJtdEh3UFRzMVhiQTcwVjZ6?=
 =?utf-8?B?ZFN2TS9tNFlHL1pIWExlV3dlR2h2S2NRRkQ5blFpZGRSMHdMS244VSszQnZ6?=
 =?utf-8?B?N3NkN0hOU0VjZXgxMU80Tm1BMHBTanF3YnNveThrcWxUL2xjcWtSWGtyT2NP?=
 =?utf-8?B?SmlOZUg3MlRkV0hVY01FRVhzSWh3YjlvN3dIcmlTWWJZY2FHaHR5dytUYU9z?=
 =?utf-8?B?bk9DZlZNUXBzRjE0QlBiS1FQL3ZiN0s4SmFTV3VFT1FzNElHRW8xVFVhT2xp?=
 =?utf-8?B?VlIwcUtGTmo5QTI2djBlR0dleDBqMkNVdStSRjFtb2twc0hYZXJXMno5TG9I?=
 =?utf-8?B?NEJ3L3BJTGNVNlZBNnY2bFkrcGRXTTJRZ2tFb3NQTXNXOXNZSS91aUw3a0l5?=
 =?utf-8?B?Q0VTb0NsQTZJYzVQQzBOV0VtcFlMZEU2YXVhbVZwbTM0TDJjck5kR2FFMUl5?=
 =?utf-8?B?dExPRVRKRjVTLzZaVjFIUkNuemFMOGdQL1psNXJiekJ5WEFFK1pGY2NKaW5q?=
 =?utf-8?B?bkRDbG9SSktQNTZLbHJ6cm1BSW9jbForSnBtK3UxUUtJRDd0MzA0NE4zRmdn?=
 =?utf-8?B?THhZWFJTUGQreWFVK2todTIrNXZENEN5a3hncnhBQkdLdVBYNnV4S2loeDh5?=
 =?utf-8?B?SkJROHovWjUyYnhrRmNWdlo3eW9JQklER25YRWlhdlhZdG4zUEpZMk5penRO?=
 =?utf-8?B?WHkrM1E1MXhCMzdrSTZJWmkwYTlNUm1SRSsxOVdVOHd2eDJTZmRCY0hDTTR4?=
 =?utf-8?B?emxrWTRGakJKL2VmN3NERi8zS05SbnFMY0xHWkpEM3IvTnM3ZVdZRzlQdklX?=
 =?utf-8?B?RzRobGlRUkZ5NGlSWWcvRU1vQmlxRWZWZDlPQnBzdG5ITGEzSnQ4bGxNYitJ?=
 =?utf-8?B?dytuZXFxeHFDUGlwUEh3NlRCUU9UenorS1RwRWxUcWJqQVUwSjZlajhVQzRG?=
 =?utf-8?B?S0RmQmFPVUZNTE0xdnQycnZrUFo0bnJYTEZqbXRNcU5ncHJGOUQxbU1MOGpC?=
 =?utf-8?B?bk5DT1JmTGpaQTc2cmVaRjJ6eElmK2VVQ0dXZm5BbTZjWWxweEtIYytvRnBk?=
 =?utf-8?B?NFZMbnNIMk81cXllQ0pIWjVObmlrYzZ4QjQ3eHBvVW4xVlZVbWhjM1FSV3Q4?=
 =?utf-8?B?eHhPQmRFajF4TFhmYW8zUnYzRjdPMFUrcndhZUdDblVwdVF1dkljbE9uWDBI?=
 =?utf-8?B?SXN0c1MxNThReUl3OVFBQmZ2dEJEM0NQY3Jrd2x6UGRGVCttVWg4OWl3bEN2?=
 =?utf-8?B?ekpPWm1sQ1d2UzVNYWN2amVzK2RCWE5FZmxNMm5QeUJBY2JYU2krckwzNDky?=
 =?utf-8?B?cXEyL00xaVpqeS9pbDNLaFVZamxodDFpdTR1Smd2MDBYbENsMkhhQnpKNDE3?=
 =?utf-8?B?aUU0allJNk5hM0tDdm1ubzI5cVF5T0hOQTVROEJ5dURHWjQ1NUN4d1p1TDZn?=
 =?utf-8?B?a1pMWGhrTUt2bi94LytzVnRwcVBSSytBRFpNK3V5Q0RhVHZKNXpKU1p2Rkda?=
 =?utf-8?B?ZjE1b0ZlVVhGOTRZM3c4YndBSk9qN1dHU0VMVjh3L2lVbFZFdUs5MmdEalRL?=
 =?utf-8?B?dllFWHIrVHpYbmRyVHNsdFlLLzVZcEVPaC9udEZzU0poVWI4enZEeFlLb0lm?=
 =?utf-8?B?UGMwVnVwODJxTmJMUFIxMUVEejhTVjU5YVFZSWdHVDEwZjR4VCt1cHJuMWdJ?=
 =?utf-8?B?Uy9KLzgySlV1RHd2TjRKODJXZDNidE5ROE9EdXk3dEYxa3M0T0NBK3RrQnVw?=
 =?utf-8?B?SHkzSFNtbkRHN1ZxTFUxN1J6T2JKQ1JKNmhGTm44TmRYYzNMZDJ5SWJ2T0tX?=
 =?utf-8?B?VU14T2pDVWppS1QzczBabldhT2ZCQitKNzhMSjhvS05SS0JQS0czY2xLZnc5?=
 =?utf-8?B?Z0VKT3dVTS9CUDdrMjkyanFxZGwwNXRjTjg1UlUrRGhKdVFyQUJJOTB4RXZo?=
 =?utf-8?B?eDJ2NTBldFdOVGt2ZVZhN2NyTWt6Y2Q4NndndlBHNGowWFpreEtRL3BDdHFl?=
 =?utf-8?B?L3lGZ1dSdVE4YkRLTTIyT0Zsbm5zOHVsbDErVEVCMmw5RWN6SWIrdUg1TUxS?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff4c946-52e7-4cb5-f792-08db516c68fb
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 15:37:06.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gv6bgA3dMb0PjHbbsbYDLamFRI0JsZ87pC0f84PMQtzBPMu4/xd+9QdlNoVDfjcwICb24yTtCcSiRrVskMPD+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7289
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=qfKNDZsV;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 2a01:111:f400:fe0c::617 as permitted
 sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass (p=REJECT
 sp=REJECT dis=NONE) header.from=siemens.com
X-Original-From: Jan Kiszka <jan.kiszka@siemens.com>
Reply-To: Jan Kiszka <jan.kiszka@siemens.com>
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

On 10.05.23 16:21, 'Vladimir Neyelov' via Jailhouse wrote:
> HI all,
> We use jailhouse=C2=A0hypervisor on our platforms. Standard configuration=
 is=C2=A0
> root cell - linux, secondary=C2=A0cell - ThreadX. But now we want to add
> optee os support. How jailhouse can interact with optee os. What is the
> common way to run optee os in jailhouse.=C2=A0 =C2=A0

OP-TEE OS runs in secure word, Jailhouse runs in non-secure EL2. All
what Jailhouse has to deal with are service calls from EL1 and above to
EL3 and, eventually, to the secure world. Jailhouse traps all SMC calls
and only handles or forwards a view of them, see
https://github.com/siemens/jailhouse/blob/e57d1eff6d55aeed5f977fe4e2acfb6cc=
bdd7560/hypervisor/arch/arm-common/smccc.c#L117.

Now, simply allowing all calls to OP-TEE is likely no option as those
may either have side effects on the platform. If they follow a standard
calling convention, maybe a permission list could be created and then
enforced by Jailhouse according to a cell configuration. I vaguely
recall similar thoughts about other EL3-targeting calls. Key issue, also
there, is that you can police access just based on service call IDs or so.

But the situation may be even more complicated when a TEE service or the
OS itself are not aware of partitioning and not keeping requests from
different instances (which could be different cells in Jailhouse) separate.

Obviously: Anything that is harmless by design and across all boards and
TEE implementations could be allowed by default in Jailhouse, but I'm
not expecting to find much of that.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/716a8a07-3a7f-f20f-d08a-a9cb4ee607c2%40siemens.com.
