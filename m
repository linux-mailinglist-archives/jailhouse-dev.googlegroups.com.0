Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQPF5WRAMGQETMUCJTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A60EB6FDBBC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 May 2023 12:32:35 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id 2adb3069b0e04-4f13ecb8f01sf3719149e87.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 May 2023 03:32:35 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1683714755; cv=pass;
        d=google.com; s=arc-20160816;
        b=mQsu1IJebKMIzaNEupCKYrbiyfMttog7M52MNimbBwgfm+3+Qudbs0xe4drFrczDkE
         D0yDEJUrNyCwpDU6/zI0bt96HnSmTGP7Kq+jX1yziGvUzwZ1e9bCPW7e81NHeg11Icjo
         3MQAFBQxIhiS1mQAxTQnuH8t7EoOoMkuRz6uhqdxpceMyygTUbcaqemSr/yxjFij3/r3
         gYPrYLJG7FYknbhEEnT0sscS+jqodNgZMIYpJbJnBZTzUzIQR0MoxLIF1QYEmzc6Qifc
         Luzazmyac4aYfig7A43DKZ93xOLx1wfTw0Vdkqke2vOvBn3r0GuiUwfDYniv7LILACrm
         HErA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:dkim-signature;
        bh=KB3htop3UBGbYQiZUEVbHolO19KflEHpFeUgy5QQcGw=;
        b=p09Yi52v0njNHIknxPQuvtwH51GWRPeAi2ZDd/Gjcop7OhNn71VzpKY+kW3sT0gQL5
         8g6EmQMAdbViC0IYtjYAWebQonGETOO7WPQhbdL4e2bGqYEBLPTdIFy46hCDbTtQtweg
         IduCw02FB/2freOwaLsluGyRkHfsBQ2FPcm5IY8+K6QP34tdmJIrpL6IzxSBdURCSFI+
         xlIhu7P7THrKq2IJInyzmlTk9TaKauVpoEUSaIZIDZcY2XMRSqijB7wfUw12DQBJC7Y2
         ZQBLkwyu9pbzRRNggSO2Lt60zd8C85UF5jOErym8SdtGnd1crQMZliDWvk1RyIhMsMSJ
         uUQQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ijGMk+Wg;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::626 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1683714755; x=1686306755;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KB3htop3UBGbYQiZUEVbHolO19KflEHpFeUgy5QQcGw=;
        b=NuOCs00MVENMliMQQvE5onjpYVy8tkyjjaXlwZDJmwQxZyOqM7oCvysQS7PRynw5+P
         cF+XdZb4WRsh7/XoaI56rLquW555svjze/6nGURB5OdCzRJsXysLXHHkS3wrNs1DxLLX
         wXmKis9Ljcb5Ye70po+AYg5dvsGk8qpHb0r155loZGhe8p25D7rHoM/s7FQYwCC0r1xH
         x6aC/XkkYFD4ix8vs+1Jw5Ae52GOnWW4xSWcSGyw1WrUYPr+41T0+GTa9Rk+UBYmqH4r
         x99ZWu47Ajtgt7qUUB5DAEt9ZLaMMd/Sltkh2kbuhggeQY7DZDxcCwboQEqA/Qp/TM0B
         zxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683714755; x=1686306755;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KB3htop3UBGbYQiZUEVbHolO19KflEHpFeUgy5QQcGw=;
        b=JEdnfgze+DMM8kRVJd/gnZYB6T7zW9mX2htyVKihO7w43F5Fa3P8BWlspNmRInzri5
         1ycLKv5YdV1DnuSgxa/QUrAlqZHSjItwtTqrgMcb7zHvuvfQxvit0ikxJct5H3cAjL4+
         kY1+TaiwFqegQ0siX+FiZxcvg7NIea5bAUaKt5t5uZ/90JeGbwViOOiwRqjHiayppBP2
         1nw3dtWDHxgGClIIHJO/CtDuHWXbTVSEhJxsPTP/50fXUNmb/mBjBbdgNFBTv2ldUdyO
         TSRMr3Hg7kHADsabwygfmgpnbBnYeb5TtCTci2gmvAOE+Gi3Tmysp7NoWexb1YfeO77w
         Mhvg==
X-Gm-Message-State: AC+VfDy0nX3BqrJunEasFerep/0ILQf9W9oGs7aRLmnOUpSk4gMzgm95
	kc5uhp+2TEbftb4dQD7eWLc=
X-Google-Smtp-Source: ACHHUZ4ax6w6p6TgR1jDm2uyIQzXXJD1o8WM1CFtdj1w+AGNKznm4tLhGoKegLqPDu0GJ5fmP9DhRA==
X-Received: by 2002:a19:7018:0:b0:4f1:4ccb:889d with SMTP id h24-20020a197018000000b004f14ccb889dmr1383340lfc.1.1683714754683;
        Wed, 10 May 2023 03:32:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:545:b0:2ac:831f:b82f with SMTP id
 q5-20020a05651c054500b002ac831fb82fls897013ljp.0.-pod-prod-09-eu; Wed, 10 May
 2023 03:32:32 -0700 (PDT)
X-Received: by 2002:ac2:5632:0:b0:4f2:5f5f:e5c3 with SMTP id b18-20020ac25632000000b004f25f5fe5c3mr966756lff.37.1683714752478;
        Wed, 10 May 2023 03:32:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1683714752; cv=pass;
        d=google.com; s=arc-20160816;
        b=Saf0GSusCTTWs4iiAsDIWqMrsBGKOqlvF2gvZBENYBqo3OAOGf0ztvdzCi8SX/idW1
         L1An+D4CTy7ndaUdJQWVQ3g6lZAILMn8faXhQxXDUHCmdSczbz2nND24I+VFxK8SbU6x
         /i7c0oMX372lOoWD1oVrbADb0tPnY37CdMPjSBwI8Cuyw1zH9O3AzMvD75f2njgzXd3i
         vh4avv0bbBPZSK0kZh6R+/deJ39QK+UDOKhiNHg8vN0blToOVmR2fXSOGCWTaDg672or
         V2lYGNjk4K59XyM3Pk+Lr9RJE3OCAz/s3wR9kAUTCPbOMUyhMXHD7WXCe6EY0Ap29hEz
         jDhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=oKbgR7mpAJeZSFfzQy7LGVYhNwl6JvpE4EAjntkaQQM=;
        b=IcE34bW4SRUr37pAsxh5O/JdOilUEF70YZ5hk2e10qM0Q9EcpowPOwSxd3BH5U1dTM
         qmLPIfct4kFpnqHLr+9GT52syfrqegLPMAWRCVUEjG3igpi+maeRcoKw20RvKqnZ6Qg6
         Iww0c28qFbVMZgneDz3HADoF3LAMT8MCzzAk5B1pDJXp1ufFeMTdMT1WY5wCSv3GB/rt
         5Mm8epzepWTSkiB8ryFRcWAeBqrKbmlT5fuM7fp6lY+QI4dqKo3/W3E3dX4ZpWQR/G9I
         C17g78JAnjgP/3pdtjfp8EkfySaALE4VeDlyrTs+euC3qBvWj1sigR2zk5h9fpvUJIdw
         rj3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ijGMk+Wg;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::626 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=siemens.com
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20626.outbound.protection.outlook.com. [2a01:111:f400:7d00::626])
        by gmr-mx.google.com with ESMTPS id o12-20020ac24bcc000000b004edc2bbd25bsi331791lfq.3.2023.05.10.03.32.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 May 2023 03:32:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7d00::626 as permitted sender) client-ip=2a01:111:f400:7d00::626;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/wwebjlcBQm01jKq8tPTGpWq9MzBUt1AQB5e/m3QevYwytJufDgoUZWyTkhkzok0SXpeR0NRTj5UqdO2YgGzZy5NyYMaNlz6HjeKXBfx/Zf6p92LVfY/ILYBIXaCpDl+WMx36P3+waUwwFDZ6jsI3uG/6tOdFJy2t+ber8sL63cI2pgRMJ+iEFATeO/yZDHAbVL6ZX5QAxb1tuOcpDhm5gURVzm/zBgFEKVTMl+06Hsv15iII5f2YJCZhKQA77fEGMN9XlYhtWwHwIi5jz/+usKFVZsm97dQH+PtCjWcsT1hXt1bfFZlyC7SJ0nclHeTGZrPE93MazIxcVRcqWt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKbgR7mpAJeZSFfzQy7LGVYhNwl6JvpE4EAjntkaQQM=;
 b=YhoJ7t0wmYrYqr03K0ESgOmGmnaJOtSJ5GVxCaRq97HCEtkQVwj/qpLltnmfHQuRO5wx9cHze7+MfYy7xfyrisqEEFH3I8HeGdKV9yAJyHERgdfJm15Dqu6YVYVAlfgdymB79qTLLU1zjhiYavwhv3tcAV/MOVCuThRWBZWg6X240BHCyMjl0MlPZtjyUDsSAOsAhzNJXNxs2kSnSyZ6tPjKAu3hbKR2BJy+xRT13eQSvBd6PYm5nISbthXvTPu8q0DYYsz223uNzBiC8mL76aBj5DfXBCo2cZ3c5l2s2wLMj9TOwlvWDZcCr55LHg84TfcqG1EDXhLNQJoVzUs7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DU0PR10MB5583.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:31b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Wed, 10 May
 2023 10:32:31 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b50a:c627:3d12:6f04]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b50a:c627:3d12:6f04%5]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 10:32:30 +0000
Message-ID: <09045e94-f35b-53a6-93e4-8a1edd8e099e@siemens.com>
Date: Wed, 10 May 2023 12:32:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: ARM: ivshmem virtual PCI device doesn't show up
Content-Language: en-US
To: Kurt Zou <kurtzou@gmail.com>, jailhouse-dev@googlegroups.com
References: <CAC5TEnFx_TOr7ktks4qNSqL_bhv2P7r+fMOpbuz9B217jZNn5g@mail.gmail.com>
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
In-Reply-To: <CAC5TEnFx_TOr7ktks4qNSqL_bhv2P7r+fMOpbuz9B217jZNn5g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::20) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DU0PR10MB5583:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbda695-d119-4ec8-64c6-08db5141dbbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cJ5TcJLpzsk+fbq3L8HXettPdNnZsc7nALlosSoDKM49gHtVM6PeUahp+rUG8aA3aSLIqTmmGVXGfwq1L/y8Iz6CnqhJcsLvsFu6xjThoKCIQpPn0lBLOgu4UQMqbL6E09QsLbc9MvEA8RcFrPbFP+++X+2WyUeklB/ZSBoQtEK4g1lsBP7ddkYlmx1p4mICZ1MXNu6VgbD7mhtvjrnXlI5QzsL5CGCAWQcfHwv6khRmkj1PIjSliK8dk6yy861tM+XmDuIFKCRWgnQSraqbXCyFjqTdLU+Tp6imuPCDKG6AADjedrLuqX/8sSRuqyy1Bc7ZtyIJHUHmmOqzUcNJ2AbowJQ8ETkTDOB2ypSlcDqoTgCom2P3GfdmP9jpqwDXRVX0YMSTdsmTfYZ76+kfqTPD+5J4I4NvAfmRDsDvTrIJymzsaZRBdTLcQCgvjTqp14pGBMkN44GhkMv7qoHaHaY5pOKL+F2QTaj2dvGPJwcBA2m432B+R6wHojNdShZUjMtPvivYuUfnwy/JQpIDjUIwRMkEQugrgpu/Qqmotq9BhhfHINnqnmrBBSe5CsTRznX7wJ1nn+2GLQA0Xi4vtBPdfwA/XoSVjTPjBSTGr2eaSb/2T50uFmWyZ79FXxNh7lm4cbmRnL90PtORBCvb2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199021)(8936002)(5660300002)(8676002)(44832011)(31686004)(41300700001)(2906002)(66946007)(66556008)(316002)(66476007)(478600001)(6486002)(186003)(26005)(36756003)(53546011)(2616005)(6506007)(6512007)(83380400001)(38100700002)(82960400001)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjdWaFVtY2FIaG9wRjB2RUFSaUMzOVJGNGZ6YnpYUzk3aTNNTzBIVmVSbVpN?=
 =?utf-8?B?SSt4NzJNNUhqYllHNGJ4cUFSbDcwQzcvNVR3RkNxcjZlYlZUbnlEYkZWSjdq?=
 =?utf-8?B?RzZDeTZITzdpSnIyVlB1bEh4a3ZOT1F5Y3hhUS9PS1NwMUNVZEpmRHl2anpo?=
 =?utf-8?B?aUlnQVVBL0s0ME94aFhKZW9ZbTF4dTZnOWl6QzRlYk1OZ3lqa1Bta2xYcUU5?=
 =?utf-8?B?cUovS1VoUmI3Z0h6UGRrMWdWaEhtT25rY2J0L1k0dlBvV3dScEwzRjRMbEFC?=
 =?utf-8?B?OE1pUFpmbUlzWWpKbFJGYkpqeldYL1YvYVVMa0RPRkh2SEFGckdQZnN4QXNE?=
 =?utf-8?B?UzRUekk1UWtFMy9ScXBWQlBHdHgyVGxSU2t5Z044RzRVd3lEZ1Urd3JqWnd4?=
 =?utf-8?B?WXk5U0lZQ0lOMXIwaTRXeXdoZUxCRGY2bjYwQUJBbkFtY2ZubElncWFVeW1C?=
 =?utf-8?B?U1NjS0l1Y3VEandwcEs4SC9QVWtYanFLRzBaSGdPYkpRRlZaN1M4SFJOTitj?=
 =?utf-8?B?Ri85RFpZbEF0ZkRyRGZNb0k4c2h0TUI2bWc4R29BOU45S1BPdlZnbzNsc0Zr?=
 =?utf-8?B?Yk00THRNb1NkM0Jka2lGMTJRQkZhOXlrSFFCZVV4RjBZa2JJdDVUYmJjSTdI?=
 =?utf-8?B?RUlpL3E1anJ0VXRwbzlYRklKa1d3UFYrSnFvNm4xVUdrN2xhKy9JbjJJcytN?=
 =?utf-8?B?Sm1qVW03SVB4dlVwVjhXSkVVTkNjSjNEWm1UVzZLczNCbENveEFWRVdvbm9j?=
 =?utf-8?B?Ukd2Z05PeVIzSk9kZXZXM3d3TWtCMmRlS2R1akpFSGMxWXdldjFnUXBLNW9k?=
 =?utf-8?B?U3BLbjBsVVB1R0dsZjEwRERLejQzdG5UdzQ4R0Q4SlREU1NRQk1pbFNnUllP?=
 =?utf-8?B?aWxjbXpFTkFOK2hKVWYzTzVtVnh6eDhreEpUV29yaXdtaGdzS09aSXdaMmtY?=
 =?utf-8?B?QnQyVThvVzdETFBXb3hsNTFRWURQQlJRRFZYbnF0THJ0OXJXM1Z3VWUySGpN?=
 =?utf-8?B?S2FjdTJieG1tLzBNQm1xSThScmtUS2VudW5QeVBuOEpoOXdMa21Ed09Td1JC?=
 =?utf-8?B?Wmh1Q2ZIR3FJalUyeVc5Z0JxNzZLbEJnMXpldHJzT24rYjgzWFliazhEL0NX?=
 =?utf-8?B?TGJjL0xGRmcwMFJ1c2I2Rnc1MW0yOW1YSE8zeGdNc1N2bkQxdWlwQkJuckgv?=
 =?utf-8?B?R0wrYXA4WVRickg1ajM2VWo5WTNYcGEwMWNYWFI4RWpZbFBmY2lYSjByNFdv?=
 =?utf-8?B?V0gwY21mTGtuNHJ2UzJWRUZ3RXcra2kxNzBmeWc5NklFU0lha2JRU0lzWnNh?=
 =?utf-8?B?NzJNejFOOFJLWWVCRVhxSktMMmdEU0NPNm02Y3hsNHpKWHFVcDErRVJwOENp?=
 =?utf-8?B?cFN5akNmUHhob2tFVGJtOTd3b1NMQVNvWnhkM3krZ3QxdTZ2blpHU24vUzNp?=
 =?utf-8?B?d2RRVHMwUEZ6L0JpK2s5blZOclJ6MnRNa1Rzb3hCVXgvd0hwNW1WblZ3SCs1?=
 =?utf-8?B?OURRTjY5cFR0YnI3eFRHeFhQNWxuSytVRkEvM1RPSjBJUnpiQ0JNWTk1ZGpy?=
 =?utf-8?B?UEpEK0RhMlAvNjVVd2V5TkwrYUJvVUFraE1GTkN5UmpubEcrK2tzb0trejA5?=
 =?utf-8?B?VDI0SjcrOE5ISWNNcWwyN3pLU1gzcDRud1BSMHBXZnpTdnF0b1R5OWxGUTR0?=
 =?utf-8?B?Uy9pVHZUUVdNazRNc0JQMVBPWjVoRVZSVUpOYWVDZTZnb0xzWVkwVHFyNGVy?=
 =?utf-8?B?dXE2dndCaEE3dStkTnA4VS8xcm5yRVAzUEpUQlU3d3ZuTDd0WitMQ1gyODJ3?=
 =?utf-8?B?NzJzTzRVcWJPRmt3WWZjOGJIS2RycE9PZVBDV0xwZCtFSlBWK29VZ1NtY2Jr?=
 =?utf-8?B?bTBxUFQzM25BRVRxUjQxU2h2TE9oN1owL0lIeXU5a08rTmd5anE2cEUzLzNw?=
 =?utf-8?B?RzgvK0Q1YzVSU3RsMlJ3TkhQVzF1TjF4T1BNRVJpLzVjek1jQTZRaFE5dVZn?=
 =?utf-8?B?ZTZmMWlCVjdETm5PbzRQZmZVYkYzWUFlT0JpTDFISFJkYXpCaS84QVhzbzBV?=
 =?utf-8?B?d1lKc3BYWGRRUXU4eURXcDVjbWxrK0h2MmcxMTlUWXVpT1B6L0FBUVJBVU5T?=
 =?utf-8?B?TkRWOGI0Z01iaTh4ekNoRzRONlNKN3lORnQ1VGRoZ213YzlKWkZ0elZpV3NM?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbda695-d119-4ec8-64c6-08db5141dbbe
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 10:32:30.6693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKfTMJ6/9fOB/tNZ7RXJ7pI++wwX39DU9ukt+U/2xd+t8I5Ge4yI65VNhlbquJldlR/13XfpHMmFUppAGA3M7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5583
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=ijGMk+Wg;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 2a01:111:f400:7d00::626 as permitted
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

On 08.05.23 03:53, Kurt Zou wrote:
> Hi All,
> I'm trying to bring up a ivshmem net device on a cortex-A7 platform.
>=20
> After enabling jailhouse, virtual PCI devices seem to be added
> successfully, but with "lspci" or "/sys/bus/pci/devices", I didn't see
> anything there. Am I missing something? I assume that pci devices (even
> virtual) should be able to show up in system.
>=20
> Here's the debug information:
>=20
> root@demo:~# jailhouse enable /etc/jailhouse/demo.cell
>=20
> Initializing Jailhouse hypervisor v0.12 on CPU 0
> Code location: 0xf0000040
> Page pool usage after early setup: mem 37/1770, remap 0/131072
> Initializing processors:
> =C2=A0CPU 0... OK
> =C2=A0CPU 1... OK
> =C2=A0CPU 2... OK
> =C2=A0CPU 3... OK
> Initializing unit: irqchip
> Initializing unit: PCI
> Adding virtual PCI device 00:00.0 to cell "demo"
> Adding virtual PCI device 00:01.0 to cell "demo"
> Page pool usage after late setup: mem 57/1770, remap 5/131072
> Activating hypervisor
> root@demo:~# lspci
> root@demo:~# ifconfig
> lo: flags=3D73<UP,LOOPBACK,RUNNING> =C2=A0mtu 65536
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet 127.0.0.1 =C2=A0netmask 255.0.0.0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 loop =C2=A0txqueuelen 1000 =C2=A0(Local Loopb=
ack)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets 0 =C2=A0bytes 0 (0.0 B)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX errors 0 =C2=A0dropped 0 =C2=A0overruns 0 =
=C2=A0frame 0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets 0 =C2=A0bytes 0 (0.0 B)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX errors 0 =C2=A0dropped 0 overruns 0 =C2=A0=
carrier 0 =C2=A0collisions 0
>=20

Is the virtual PCI host controller visible in the root cell's device
tree (/sys/firmware/devicetree/...)? Does the root Linux kernel support
it (CONFIG_PCI_HOST_GENERIC=3Dy, IIRC)? Do you have any error reporting on
the kernel log of the root cell?

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
jailhouse-dev/09045e94-f35b-53a6-93e4-8a1edd8e099e%40siemens.com.
