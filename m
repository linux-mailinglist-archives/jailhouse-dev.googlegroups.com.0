Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPFX62OQMGQEL3HVQTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E966470C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 18:09:16 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id h24-20020adfa4d8000000b002b4d24b7006sf2184973wrb.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 09:09:16 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1673370556; cv=pass;
        d=google.com; s=arc-20160816;
        b=b1lwwiPQhXbkxagS/dLA1AyYHBmBO6CIzi8TzOhg7j3LtinZenjUJNoOWL1Q0ZltX9
         5QjSa5z5mnhSpMJtMf8p7vmxI1nDAqw1LXBZcuLUDTNlP0Rqgol4epe8oeBPLEL/Uf79
         UGJCMampXaaUG5pq8YWNRBaOK/ieqW3R1x/p7lYz/wq8jieMwTxzKNFqUqPJcjTutyOM
         Z8NBCPMVn4/3iedoqh3UNbM+YpSkavxhOmIGcoOlI0IYdP8xVqXLPhMtkspYmQaIcRF4
         f96yNbC8Vq3+F2Rsmd9F45uRckpR+d2ODu9VKLCY81a+QkDT7STj2pi1myhdQIa1F3sv
         EKeA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:date
         :message-id:sender:dkim-signature;
        bh=rx9EpNCsXWV9kMEXUdeHIA7VNGGnZEER1qqO4bCkdCs=;
        b=sQIbTCdZLMSHzIryqBgVgZR9QdUglMptszCiq6zjaH7MvykskEphjCWzjqAXqnEqpr
         iSSc+avFRF04hXlWB7p5liIMBZM2WNquYlKotlTjbh98LXP90UM1E+nHZGa0VHvDpJe0
         +Wahgp/5TKAplsEB2cmf4dhdG6aV//IkXYgxJLfOb5ZPpBDaMvFgv6CtDjlvlH4MBlLd
         4vIIWlXVVTlbJ612e8kfhYHoFW8fhJ0dCBBTAWlGmIDAsQD6cUXux+rdzU774adhVcaC
         J9gnOn2ePGtq7z2XOgbO0mGKUIdiaLErLEPK+cJw3jh0tjjijBGAjKNJLXwivUkFQ51y
         PUrQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=gqj1oNYV;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.48 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rx9EpNCsXWV9kMEXUdeHIA7VNGGnZEER1qqO4bCkdCs=;
        b=buDA/t9Ve29nHJDadtiC/EdTLl6Il3hWJCRsi1cLogVZC0zngP4j+R3qK7AkKb8u6K
         n7K+EKhxsYODM6+tvoewt6HE5j0AzWCWP2FpeO4kFhCL26HeR6lM4mvvQKYZ7xco5Jue
         XIbPOy6TqoFBC60QnF50014JzgMXQDg1zJxCp8F+FP3vl3D/bsU8QGkQzELBglf9KEc+
         CnFy5fHec7ysjIWxnXqMI5bRDTEBdT34dL/pnGpGJBIPiJoy/ROhtv86EQdD5ob1OJwi
         xwlfQWQHnk5cq3gcipAQowLcSAUlQ3yEGabhL2RxZPqP6XSF+r61EINIOUqxCRxgi4eX
         pv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx9EpNCsXWV9kMEXUdeHIA7VNGGnZEER1qqO4bCkdCs=;
        b=adR4f+kpJJKDT1ORNk6rI2ESiun9lBSU/1m/TUXRf7n/BYsuW5eroF3qkyuxS3IiCY
         tIjkJ0cLbWkHspnUqX9L5UE/OUz58yRVa6LL2BobiOvYkcElZJrOGplD8rRYPweS9HJm
         /5DHey4m3JaQDedEaItrzUkdLUEL8DwYdhzRFidNwr74AhUtXCSz8fY3k1WObLlE6uY8
         XrX3WR3m0t0vNDgN1oHvV8oHZz7DnRoQM8ZJyBw/TD4aHZ4QDly7sQn2buk2nkjkborO
         +saoc/rdDEQi85k/csQjLojLabCsJPsWSAWzkkswgBwiAYvhOU8Oz0B9DSN0drDQsNsk
         7TfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpvCvR9IFedAqjXSQ/gCIeDkw5eXoU1Xlme5kJwfCcon4ArVwHu
	H9iI+dvXfP3BfMTrkN5G1us=
X-Google-Smtp-Source: AMrXdXt2mt67Mu48f9mWZxQLl54mvDJ3Diz5hmm+JRC3DchZ5cpSrdPRIYk1kYiQBwMUQGvBwlZvjg==
X-Received: by 2002:a05:600c:5d5:b0:3cf:6a4c:af8b with SMTP id p21-20020a05600c05d500b003cf6a4caf8bmr5166153wmd.115.1673370556471;
        Tue, 10 Jan 2023 09:09:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d206:0:b0:2b6:8e51:dcb with SMTP id j6-20020adfd206000000b002b68e510dcbls2534897wrh.3.-pod-prod-gmail;
 Tue, 10 Jan 2023 09:09:15 -0800 (PST)
X-Received: by 2002:a5d:4911:0:b0:242:4bbe:2d20 with SMTP id x17-20020a5d4911000000b002424bbe2d20mr43004193wrq.42.1673370555057;
        Tue, 10 Jan 2023 09:09:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673370555; cv=pass;
        d=google.com; s=arc-20160816;
        b=HxKjraXPLMuTzK7KCTPV8niLPv2yBzTC5t6VDSJlhhHO5BDKg4RitgKnNHxGahcjm4
         Lz31dESLUklj0zO8DOzxkrbieK/wqz9p+HgwGgVjmYJEJA7K2qskCnZ6XLo9SahFd6EQ
         CYe9AWpRONuufpksZ7KskEazM4Exb5EDHp4brMgLu586gV8WJQ0qrk5hKkWcbyJmepDX
         tT9sNffkoWGlTB/R+6V1/U78tPIrx9fq9DCxI22R8fZYq1mquziGsKCLSqqwsKvWmGgD
         ffHu+9lrJA9/oqcK4cSeXDckl0z/zNPV2Pmh5FQaJSORmyrflUNHeCpU16e12ZjmrRXd
         s0WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=ouoNvhvt6sQTtr2Te1wtH4ZwwEyHCLEm8PZ/CbJbsXI=;
        b=mTNKqcFYHWIx7f1ewEgHRhWw/wuDgs/ftl34SGn6JdSIu/gBdU683AfOKsPpP3Dd1n
         QpdltyeK4MS7dTejVjBFFgmqA6TwuE4HC/uyPbi3lSKJ0c5peijIhEk8wJR8hWMGoEHe
         Qp/ccIAfCPzbWGcnkO+VJh6EGPaad86kE2tifrXOvA0JOIjWSzyPgrSA1PJs7J6DT/Hx
         yBxS+pDk8ynA+vAM/ffL6VHvjoGfcROtIqpOlHxwjkcfzKKMkz98pq6MhBfjn2/VPUEi
         OaDo7HK34rAwJfl4TDicFGqMNhNHNl6dgygKlL9HHnXFmENxJw14Ocy83Fxc2D+j5rXr
         VYig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=gqj1oNYV;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.48 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2048.outbound.protection.outlook.com. [40.107.8.48])
        by gmr-mx.google.com with ESMTPS id az7-20020adfe187000000b002416691399csi495994wrb.4.2023.01.10.09.09.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Jan 2023 09:09:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.48 as permitted sender) client-ip=40.107.8.48;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myk4LWdbZ6K5iUt/IYSuztrjerduoLXYAP4vChApjXAxOQ4soYYdexXRaqmU5nXO1Ml01/+EDZ0bZBUZX/v/Qr3PIQCikhEV8fvmp1XSPDkvMtSJL/yi0RvDhkVLNyFo4GDdRJXdjcGE9Uq2bWWZ4b3hXc41uVKtz9LDZ62+jZj9BFeXP0irfnemC4S0igr9KBn3OVBQ4WSLBVBBl8MhQlDBIN0EGqQ1kYBATA5e89y2/B5dt2ZYxcWfqzUnSl/F58cbnUwhTxs1KJYfd/qnmJT5X9SyKBoq6Hv5kI+jrtzSm+RFAMl/hUndmeQYVKlEG5+KHqp085EqkVV23HfkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouoNvhvt6sQTtr2Te1wtH4ZwwEyHCLEm8PZ/CbJbsXI=;
 b=MoF0t9ldJ40p9aT/MkFpivV1h9MPL2s5egHmmOHX2O9YAp7MaO4sIgQxFrBx2aJr+hXdc0qHBEIybjwCp+q0fJQSNot6WH/4BQTYGQygTTUQI9/b7XFCl2PLeB0uFOPbFMcN4O+3SGxuPWFgJHxm9oZn7D4gUYRt0ox02dMME2aeYs8vbkO/x8qcrcE/4livoOGeLDjFtcVXDq0/Gw66V7JXr5ZMnfx5oWJhaqdtunQQwYQ2t8L/G2f2gfMwhwuHFQJ/6ErGl5blCsFgQRMllyAKWX0WlT/gaW4mVQ9LWafPPTOdUl2EO4gZzUDt2GBm/yX16qWbbJyxPvT4A3AwLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AM7PR10MB3672.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:134::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 17:09:14 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5%6]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 17:09:13 +0000
Message-ID: <b6c9508d-a6a3-7cf5-1cc6-a194cb181451@siemens.com>
Date: Tue, 10 Jan 2023 18:09:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] configs: enrich configs with architecture information
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
Cc: Stefan Huber <stefan.huber@oth-regensburg.de>,
 Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <20230110164851.88918-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20230110164851.88918-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AM7PR10MB3672:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd03a3a-2917-4e54-51e5-08daf32d6610
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VI9KpNXaNII7505UYCNAZ79mliyOjyGZwcmZ6DqFdlKK/L6Zf+cJKjghMWgNk/thFUXkbNpDhvlQraOxtkgSRhU1U9hd0bAcj/zVT9Djmjp6zeMZgxdvi7URFkrivOFX2EHg09cWmig563ikTlKxux/UjOCGweR/IsoyJxiKb4cTjWNuGdYXQNHlUWELJlq20QA0XfLTWuf3BvsMdNXlX9m+ZAfteu0iSZQbHfMbWevNZQd5dgUcOfgGjjxOE9yADqJo9ArzIjvus6Mb05G1F/c45gj76g6AI1+36c1FG05SBJpDY/agl0oxJxM4O3yIQ+5ENyRU8UIq8/k6eF0mPLLpoIWyTSdNq/ergAeuSle+As8qKx1MPw4JSpMC8f+Zx/Ludt+ynuhZh9pJVZcNn6elIgMHyAMPS5DYvQZzaCpPQrYL11Xq27bnbU8RuGeSzJ5ywkZZ+DmlPwgTeZj6d2X10TPVzWDxWhQ5Q7E9IwHRP9CMDyJl+P1CQ0PRIpI0P0Kj4F1+Aflnawai+kMFtEh3EI0pizSGrNUCiZN0cP2ixIp9XDyhXMb/zQuPIdaJXP95OhKOtxUrxGRj6ETHkwFOPhr09wu29i60bqdL/AYFI6H5j9yGQ9yVHPWawxykKUNZSE1L/E7IpsXde5WvXCRovoLQPgnSAysjxMNEvnZCRA3BnXEMAisW52HYpzSbltBC1srzF6Do6KQzWm5XiZck4TWqeqQ3f3LH9tuBNuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199015)(8676002)(66476007)(66946007)(66556008)(316002)(4326008)(54906003)(44832011)(5660300002)(2906002)(8936002)(41300700001)(36756003)(31696002)(83380400001)(6486002)(478600001)(82960400001)(53546011)(6506007)(2616005)(38100700002)(6512007)(26005)(86362001)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmhrQy90aUc4L2w3UmlpOHFxaURPZ0hvSXR0d0ZEN0laVU5VSlNWMmwrRzNX?=
 =?utf-8?B?cXBIaFlCQTNVV3VaM2d3VzZzSDZMVW94K2R1MVZDSm8xU3pPMmtxRjV2R1NK?=
 =?utf-8?B?Q1FMeURLdzVsSWdac0x3aFRHUkhPMFdFK2RsclduQWVTcnJDT3pNd0YxNHV5?=
 =?utf-8?B?QUxRL1ZpcTE0S1FWMmRCWEp0cUN2b1NtNFJxQk5LYXRIY2pnZURGMFFzam9U?=
 =?utf-8?B?aTRFL000c1lkK2Uyc25vYjdXTTgvdFpaeTladG1CTnpHNWUxL1VhRkFkVkRx?=
 =?utf-8?B?b3BMdS9LUlprQW1hdlhsK0ZZNHF1SXNHZ0JZeWFXclVybjF0Ujg4MkxGTXEy?=
 =?utf-8?B?OU1GN3RiTE02R2ptTzVqTTZFSlAwQmw2M0Y3QUdmTXQ3RnloT2RuWjNVOTJZ?=
 =?utf-8?B?bWgvZmJ4Qzc1Y21GSGxpYnhlUXkzQWxIU1NKTjBUdG45cWI0S0hHWGtKNVo5?=
 =?utf-8?B?V2lEM3NlOFdWRzdKc2toNVVCQkwwZU5EdGs0NjlyUSt4Y2lwbXVjZk9LTk9W?=
 =?utf-8?B?UWFwNGt1eXE1TThXYXRLTnFKdzNEMHNuRFFFdTJzUEVhVDlLb1V1VnQrakZy?=
 =?utf-8?B?Q0dkelgyQjVWZVc1UUJ4dzAyQlE5bzRkSWFnaEd6MzlZdVFPa3Z3V0h1Z1lP?=
 =?utf-8?B?M2czZm9XdDVFSW1SU0RTeDVxam5qU0ZmTkFBSTNDRFNSR1V3Y2p0RVcxMnVz?=
 =?utf-8?B?ZGcxZEhGWjNkby9GcXdObzBBVlEraGMzMEFnMENHbHFNcHNwNlR2VlAxYUlM?=
 =?utf-8?B?dlZDMEZiOU0rbzY2aWJFMW51aWlkT0xIK2ZJSXNIclJCT1FUbnY5YTREV1NR?=
 =?utf-8?B?dzRQTzlVaGdndDIwWjVDanJta3lKUE9xMWF4NmtDWmlTMVpNeHhyMHhRU2pC?=
 =?utf-8?B?UFBhTEF2SWErc01GMEVIdVNwMEwwd09XUnBhWm1sQzZQVUZaUk02eFRBSlFQ?=
 =?utf-8?B?MHBJUFZYWlFXdWMxSWlEcnZvNjhKY1ZSSnpydCtoaHRDUzhuRzFvL0YrMDlG?=
 =?utf-8?B?cnJvK3Y4SzB2MDR3bG03UVJTZy9XZ1VJN1daWndGODNvVTZIZzBGMmMrSzZ6?=
 =?utf-8?B?REZrakpOQitPV0pHQm41SitiKzZIWlkwVHpFT3Bwd2U1d3R4WU9LcEpaSEpy?=
 =?utf-8?B?cUlHSDRnMFEyWFdsbzRORHVaakJsQ2tLbXlBcWV3c0E3ajg3VU9UeTkvRDN0?=
 =?utf-8?B?citGRGNsWWxjYmRiSHdhMkpDZUg5N1dGN3ZBUklGc1RtV2gxQVMwVGpEa20x?=
 =?utf-8?B?MHFMMVRtM2QzNkhRQzdBWTErMzAzbjA1c3VpU0xveXZ0VlE2K1hkblJsZyta?=
 =?utf-8?B?N1dCNFo5K0hMOTRUOXFvS3dEamltSmNCNkcyK25VaW1lczkxTStVREhUQ21E?=
 =?utf-8?B?VnA3eFVHMWFzVENiV2c4QklIVk9WTGhybzM0eUg0SnBxa2c1T0k1OTZSS3ZN?=
 =?utf-8?B?SWJ6VCthRU53OWRScnpENzhiQ3gzVlo3NVhDNEJzV0g1c2N2OWtjWHVtenBp?=
 =?utf-8?B?bWNFSXFZZThjemc2aUhDRWozaGRCdmNkQm5iL2p1b3hkTjZEQ2JxQS9USHJx?=
 =?utf-8?B?OWhtbzRHbnhDYThFM2NnYUdsUVRCOWp0bEwxTHdrekIwQ2lWQnkzQnQ2N2la?=
 =?utf-8?B?R2VvTXhTajZPbEVvd3VsZEo0ek1nRnNuUGxSbnpvYThWbTFiUlZ4c2JqczRT?=
 =?utf-8?B?citkS29zUWRsd1llVlkvcEZoQmJpOXlldjVNemxocmdYUkpPMXFZN01ZZmdY?=
 =?utf-8?B?bFkyckRPTFJ3V2t0UDM0ZEdSRnhKTDJkSkhFd1Jid1Y3RnlVUm9xckhpazEx?=
 =?utf-8?B?Tm9ETDFtdER1bHdYeTZSeG1yU0RZVnVxZmQ4bmZPSDBJK1dVQUlRMVhEbys5?=
 =?utf-8?B?Y3dvZ0lER2pPQk5oOGdwWVlkRXdnY0VzRjZZV1FlTU5QZStDV3RzeCtMWEQx?=
 =?utf-8?B?TS92SUJQL24vMjQ5ZVZjamExL3ZPdmgxU1NaRktGNE9oR0ZIRTNoOUJvWVFl?=
 =?utf-8?B?OHBLQ2dmWU4zT1VsMUE3T1JsQllGQWpPSjVmQUxGbWZFNUFYWG1sdkQwUHJY?=
 =?utf-8?B?Q295eTJLWUxlOTFkSDlyVnFBU0lPK0FxMUdkbzk1T2VFSG1oSVZsQ0hIZnNJ?=
 =?utf-8?B?OUlhMWR6cTBud29VcnN3OGhZZ0ZKR1BIYzJNcTRZZGNzZldaNkhyNExNZ0Uz?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd03a3a-2917-4e54-51e5-08daf32d6610
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 17:09:13.9034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8DR6gjQsFsplgP1PZu8S3aHo36gGXSXobuNTFxaYrjEuAotDBHvoKivCAhEGGbguNVNh864NAofLU1TPEaU9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3672
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=gqj1oNYV;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.8.48 as permitted sender)
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

On 10.01.23 17:48, Ralf Ramsauer wrote:
> This has two advantages:
>   - Automatic architecture detection in python tooling
>   - Sledgehammer sanity check when enabling jailhouse / creating cells
> 
> This commit just adds the field in the cell/sysconfig, adds the fields
> to the configs and aligns the config checker that it will not break for
> the moment.
> 
> Logic is added later, config revision got increased.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

...

> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 6b54e34b..9fd03ff8 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -46,11 +46,20 @@
>  #define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
>  #endif
>  
> +/*
> + * Supported architectures of Jailhouse. Used in the header of system and cell
> + * configurations, as well as in python tooling for automatic architecture
> + * detection.
> + */
> +#define JAILHOUSE_X86		0
> +#define JAILHOUSE_ARM		1
> +#define JAILHOUSE_ARM64		2
> +
>  /*
>   * Incremented on any layout or semantic change of system or cell config.
>   * Also update formats and HEADER_REVISION in pyjailhouse/config_parser.py.
>   */
> -#define JAILHOUSE_CONFIG_REVISION	13
> +#define JAILHOUSE_CONFIG_REVISION	14
>  
>  #define JAILHOUSE_CELL_NAME_MAXLEN	31
>  
> @@ -84,6 +93,8 @@
>  struct jailhouse_cell_desc {
>  	char signature[6];
>  	__u16 revision;
> +	__u8 architecture;
> +	__u8 __res[3];
>  

It's not really that we have to save space on this file, but still: Why
not reducing the signature to 5 bytes ("JHCLL", "JHSYS") and putting the
architecture byte right behind it? The architecture conceptually belongs
closer to the signature. ;)

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b6c9508d-a6a3-7cf5-1cc6-a194cb181451%40siemens.com.
