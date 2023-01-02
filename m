Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUEOZKOQMGQETKMXMYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A40065ADB5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:27:14 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id i7-20020a05600c354700b003d62131fe46sf18098749wmq.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:27:14 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672644434; cv=pass;
        d=google.com; s=arc-20160816;
        b=QiVmUKI46P6SZ8+cFOsEiDAQiKb26am1h4sf7j31lcfTnhb1ohjHjhQ9jL03+V3Y9d
         e48VTERH6dc+BQmXrMM+fOx9p/wHEC9+6prRVd4b1KFV1mFjV32KQS6RcgUkXVxM/TfO
         t0cxUxVvREAB3l06sHwE0jNGG6Yep/6zR+PouTRWtC+MdoGs7Elld0MWLRCUcJSpDgJ8
         UJoOlgFnlpMHCXhVahvDpz1EIo4/I7HEcaDzGakxbi/GuiQV/CxolN+tCFjTQ20M3iB+
         fSYIt63eJs25ViN/lEm3NRF8NQTVM+zQU11OKr8FMd5YyehmpPFRq4liZE1JHchdvIS6
         ALpg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=EgluzEYjQrliyuZbBjB04pABzb1wE4kDhY8cbjK4bS0=;
        b=oKUTYlimAvSWBBkKKq393Ssln1jB1t7z34p4s27a4HvA9C+FEDKWOYACzcI9r/qtHW
         1ad6f439bUn6Sd2O2426QfKYk/3DYUJ8DkIRJS/3cHgtXPwFtdqxQzfNaysB51WYNx3m
         8C+lGYaTz7zGKs/eQlxDCJtkBQZujvs78t+XuwX4TX/aeBWUOZDE5oYbrzm9f7CzMwTZ
         FiIRRjE/xyy5T/QkXvE0MMHBXIH7QiHmC3dzOkVCXATTrolYfwTzbiIp5OBgsXHGJ9Kt
         RmxpDmyUwqXW4gLCvMk+t0d73DUbjBkQn86IQ4RP7JQrxxJ0LiHAwt3mG+1FfthZI89m
         LBvw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=lMrUXvXQ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.46 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EgluzEYjQrliyuZbBjB04pABzb1wE4kDhY8cbjK4bS0=;
        b=dLZHop3Y/tLspvISDsFaz7/cPSKfTh+9i7PJUU51LZ1SQaaTphACAfTwkvI5pNweT8
         EJNwm+FIb43rwhrQvJI4l8yiFO/IX22E0tTG+EWx57qtyBIOouFKZmeosVajQnj5Wh+6
         xARN+16cWv9pwHmUa0Aen6eaqy9GoQ1Js+kC8pNEHRm4FYaivgtO483N+Oao7ozHaRWm
         +qBhZEYwPIZcgqqw4chKTp+vfu2ePHCJLc38JHa2eWdBch6dPmjnjt0+iMDH48XxDVfm
         gaI2ESI0A+yEtUQxYdqCkw/sfqeXnJIjrX+Z0j3nhlzsFnVQ3/jkmX3G3dKgaGqSp/D1
         hocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgluzEYjQrliyuZbBjB04pABzb1wE4kDhY8cbjK4bS0=;
        b=mi/6FJ2KtoXLt5EPeqXRmMaj1Ml6mE2nyVvyyLzd7uL3vprZTIFky5JeRQig3qhZSz
         xrZnO4zS/KBit1nTBUYj5GFQI7QJZ5LQ1lCci6huuS5n/oEIyJbrfssQJ4HZexTd3527
         Yzu/zstDVaxMg7LnsSHNChEbPeHhm/4TiFLla2K3b779JSMLFpYnjIs0R6e0xnvQEtg7
         ceE84ZhRU9tgDrPs+rimYIRcLgXFfQuq+F1Nwdk88VduPr3IvOnR0cANJHxaE44Tbi9w
         sLELgMZ7HNNtXzF4A3bB6FGUAVgbR6awWFMAVLhWWdsCIisAfM3mQ2NkGkNvJyRkFbJT
         nC7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqi+bFa2J0Av3UZTouN8DSxADHDMV7+dFnaFstg429b5Nsh3B4z
	pO0nEH/NIEfoFQ65Ycksi9E=
X-Google-Smtp-Source: AMrXdXvpy4Sh38MyKCp1/AH8SqUzqQcB7t9NlJZompbxWM0o6WvDHtmECiq//W57wfjCk6p2JbB8yw==
X-Received: by 2002:a1c:7c0b:0:b0:3cf:729b:d4b4 with SMTP id x11-20020a1c7c0b000000b003cf729bd4b4mr2405837wmc.48.1672644433817;
        Sun, 01 Jan 2023 23:27:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:237:b0:269:604b:a0dd with SMTP id
 l23-20020a056000023700b00269604ba0ddls11905177wrz.0.-pod-prod-gmail; Sun, 01
 Jan 2023 23:27:11 -0800 (PST)
X-Received: by 2002:a5d:4a48:0:b0:250:b68f:8b8b with SMTP id v8-20020a5d4a48000000b00250b68f8b8bmr24134740wrs.25.1672644431297;
        Sun, 01 Jan 2023 23:27:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672644431; cv=pass;
        d=google.com; s=arc-20160816;
        b=CIbRF8s2lboS2ViG/IfMIrSPU0Y79/OcHt+dB3rgbo4o4Y4i8rL5Bmk0JFR/gw8p63
         8SsTEAxMGdHbfVo5xE0C0krVW2twTudIfxdaAGSN/7oq+QXvftsiddw3X5CAewROHLeQ
         TfVA36Zbtg6S2Rky9upQrQDVyjn0ZwHcro6o4U81FNumI5IY7r0U1PRlGNc91EpEuDV6
         kLMuYZCbz9wsgvtvo6uNMr7GoD5G3KKKWPLSlpWfkNOO04llFqXwKJnf3l++o5g2c9Tt
         9IR+2hqtO4O7rPVT4B6DXIqauPO6NrzKoyltAHQi4Lmf7uovql4Y4kRPv+D11hIUFSCS
         SXTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=CBX/QSIDxOdcrnLPfB0FAvuzHNTRME3sAszEQY2s9Wc=;
        b=ZHCXIUgPZtXGHmeQHiw3nl/n1pRLQTFUEjE/wzZF64mkPrv5AskOcw8gWtHXDstgoO
         J5Jrz/Y+bbD1SST1hC5dG5zXHSYJQqCWJvH/1/sNFS1Jgq5VWVOE8VSmkEtiLk5tehwx
         hpxMEdhvs4MMawkZK0BDkN68MM626i8mVoMde7REkdidxdBKp1NxPpS8rJlVa52HPLkj
         K9BD9YUr9YvYk8Sf1oRdaM5uNIAYyjgAWGHTAVNpE7VhCfI1zWlfZQD4WfnBj23aJCHG
         S9H+oJ/Du9UYcCZ+VRPE+M3MzBUeA5cYODJpqWHZxoNbHDBNIw6qu9qiHPLCDtMafnCF
         1xDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=lMrUXvXQ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.46 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com. [40.107.20.46])
        by gmr-mx.google.com with ESMTPS id v15-20020adfebcf000000b002367b2e748esi967278wrn.5.2023.01.01.23.27.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:27:11 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.46 as permitted sender) client-ip=40.107.20.46;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LymsfqjISQA5IoPlCayjIXF7F9b7DR2YSQp8/QKHPsL4rPENj3bd20f2C5qLHwqad4IH2rDlPLLsXooFD7KXMbErrhUML9/5bKJvyn6ZpHe5+zY1u+QUjfLekhYknsQmuCZ+D3DO2xrvDv/Z0XvYs+iH46LqBJmts2pJaw33Xd7OGT0jNg/aT3m+RL/9+eaDkA04JCDe6Zab3ld3nytJoUKntrFv9ExAtemVO9SC9Wy3HfI3xAM12ylPchl/+bgfAwvsjsnDjWh3g1VCtAa6/9KYASt5WSCCl8d0vXQFvxfevMpZLpALVCwlOLwQb8ywrRK1POXBbsVzrEv1E0O3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBX/QSIDxOdcrnLPfB0FAvuzHNTRME3sAszEQY2s9Wc=;
 b=XzY1SGKc3g81+8exPeUN8oODBLB5wRna/ntAybliKMZ8lYw0sE0KdsU+VvVo5h2VepR9EbHZeaB+vOkz69oup2AbcGK9L/LXQODIJHi+b6ZIaMzEwU3r4II7YVf1xKQMsj6oQvXZh6nfa3Sx2DMLiUEiZp1VKja6lczFdrOFgo4aiIJqUOmjWzJ5XqJ6jqlkS4sbjn0YyfogtR/Coxo4Og+d9NZmnkc8/s1fMy9NA3tMBzwmBRrS0kEG70Li9TWsQfRYh2vSoGIAac5n0RRMq5RJJ4vPmjRDuEhHMyWzP6uyaMlIfDZH8dmT1EB0GVH+o2zOfPCSL68ZwVdL7rhIQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS2PR10MB7154.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 07:27:10 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 07:27:10 +0000
Message-ID: <25321d20-a68b-89af-af05-31ef40579ebf@siemens.com>
Date: Mon, 2 Jan 2023 08:27:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Jailhouse on TI AM5728 and 5.10 kernel
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jussi Pajala <jussi.pajala@iki.fi>, jailhouse-dev@googlegroups.com
References: <CAGN5k0hC7btZk2kwQhLd_VQEy3ZvdincJUphyNgeRKeyieT6eQ@mail.gmail.com>
 <03cd0b25-efbc-accc-5366-23b48cfa7021@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <03cd0b25-efbc-accc-5366-23b48cfa7021@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::17) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS2PR10MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 0356819c-8ccb-4976-e78b-08daec92c2af
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I9SGzWQeyQQO9NUyO5HVi6bk1LSEdBKRcivLVeP9M/DOuhq9cqgcIkuMttlyv3ddjeSa6xbynO4XM614U6vSz4jleGcxIp8pZiGPg2oF0ZZXyF/i1jm+O/C6C8I8HUsbu04ZzSBH7Fo0I6waRMJDTGSJ2yfMmw86grtpD8Z0ICkKbX+BmGnizIWmUrSG28v9izxYMLgJS0NdBhrH0WXluTEEIZvIqwFynAR/iOSOHfnf0rFjs7/kBuII45Eh3wpW0YZN3/vtFP8xN+FDCu6Vwk6Yr4dixmcyYSpIBEnZ4dsNk7DEWBSdR4Thr5UbKL8Q/PDK8PIx9U1SULBqefY8nH0tplSKtMrGBXJL7dMZQtZ0khFOebWeKxNHukcMyxq/RWmChvNbOVlz/nQLdcYq+quhdKJvNGxXaSKMv5Ym2qiIgaE84UOYp9LPi2/Ydc7EWW7fNmDMxmOtVy0zUpfsZ0KOCZvm5JsXzcb6r8d7AD6MbQS6LSZfLnR1ETToBfJb30zxlmrKFuxoJxVSIEi9z/yDY83MMdO10S3mlkfq97aBcnWeQdsfwP+JwHpfDxrscX4QTeJ6fnlTuZ/r0VoZar7FwInoxnzxTmY4p6eviDLLAJtpcpRv26V5nSJmMlC7RVoW1Q8C9UILcnYWvSvcjSmPt/WzGWEZ6YBDQhBCVB5zkulwxs1/LEznt2mIsfQMbmBWuL/12trCxwdIYddkMe2y4ik262O7U76XbGgvuXynsE2GTdzZrW8PcTUIjKS7Uql3ednIs5mEBwto5LBeQ2V5Yh3+LQsWuNvPXLM8ILI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199015)(41300700001)(8676002)(66476007)(66946007)(66556008)(5660300002)(2906002)(31686004)(110136005)(44832011)(8936002)(6506007)(478600001)(966005)(6486002)(6512007)(186003)(53546011)(26005)(6666004)(86362001)(31696002)(83380400001)(2616005)(82960400001)(38100700002)(36756003)(316002)(22166006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHNic3BkYW5ySkw1UTlxRTRDeGZiMS9rWkpndllLZlBpTWozNnpnUzJMOHdv?=
 =?utf-8?B?UGxFc2M3SXBDd0gyQlVkSXU3djE0WmUyRVpkUk5IR3p4M2FVT0c0Wi94SVQz?=
 =?utf-8?B?ekh0ZTAwM0ZQaTM3ZnovNGNBM1Rvd2Z3b3NHLzNFbVU1WnZJK29oUnJDMjFY?=
 =?utf-8?B?OFZDTnMwUkNhNk8renhHU3pDSVk1ZFpKRHV4ckJzZVhOaVhVck4vQmxJSGlI?=
 =?utf-8?B?ZC9OYW43VWZUa1JVV093dWFKMXJNNi9hUGgzQk9jczRncUxmb3g4aW1KV1dX?=
 =?utf-8?B?OFB4T1RzdS9XbGNxK3pDVnd1ek1nU2NoaFhLanhCa2E3QzN3bGdYbGUrQS9w?=
 =?utf-8?B?NCtGM0F2MFZVamlTY1N5dzNzS0R5aXRkNVNmSm5sZlI0OWVqR0Q1WFQ5b3Z1?=
 =?utf-8?B?QWlFeGlkR0hlVklLSkF1cjZFWmhDTlFsWWQvY08wWkZialhNZkJWRTh3czNj?=
 =?utf-8?B?L0RWR1FQUFB5T3h4NkppSU9lUi9JZ3IyVUNTMG95M2x0WHluNGJNTGtoYzcx?=
 =?utf-8?B?RFZMcy84UHJUeng2OXYyQkZEaFNJcC9VOW8xZWJhcE0vaUpwV1gxb25SYks5?=
 =?utf-8?B?dTlUSkNxL2MrRkU4NU14U1U3R0Y3Z3RYQ1QzbnFxRWVMMGxrYWhzdjhJMzRw?=
 =?utf-8?B?eU9hTmM1Q3Z4amkrQ3dRRGl4MS9iOXBsRUF3bkRFeHR0ZnJ1azVWdU1Sb0hE?=
 =?utf-8?B?Z005UmpNRGxocE9yNVVwcG44TmdSWTdWKzY3MzlSVDZNcTY2dWV1aGlPbFNl?=
 =?utf-8?B?MGo2b1JsVWN4QURyREhOUS9Iem5tbzlWTHVpNTNwNWUrcXNMZkkwcHZwZGw3?=
 =?utf-8?B?TTJyalRtTFRWQXpQTENyUllmMHplQ0xhbHFFNGVETW43L3JBUVF5K3BCKzM4?=
 =?utf-8?B?cmV5cnNpYnNvcjhCOXNDU3ljRnRYcnVCY3o2Q2JJOW9BTi93YjFZWUdjcFhZ?=
 =?utf-8?B?aCtsTFNQZ2V1TEE4bjZsS2JqT3dPb2NKL3NyWThZS2t4N20xK3FFYllnSjNo?=
 =?utf-8?B?bU0vc25VS3RrQ2NUMWFlWDVFdTZxSjhIejVzNTBETktEYWRmQlRrS2xpbnNO?=
 =?utf-8?B?MXdOYVh1ZFFCRlBuays3bG1jek1McmVoaGRDc2dtVWFWNUhTRUFSVzlBSnBZ?=
 =?utf-8?B?eEdZenR3QzFGSFJQMXVwTHh2QWZ4OXpSL3FRNWF3S3pRN2lrU1MwZkhJdUJ2?=
 =?utf-8?B?QkxsMHhyWFppWTA1N2lLNmN6RW10NXpZaWNDWXRDL24xeVY3dzRrSzhpUG1z?=
 =?utf-8?B?a1pZbEZLMW5iRnpGM1ZQVjkyN09rOUFGT0plNjhwZDVpMi9WOGNoV1l5N2RM?=
 =?utf-8?B?UjN2YURKVUZ4Ty9Hbm02bGhLeFFUT0R3WVY1TlNxQlQzaVdOSE5lbXFqZ3Iv?=
 =?utf-8?B?NHlEc2h3MXNCV1JMNSs4OEdybXpHKy9VVmVkS3VmRkVlQ0RPY1Y1NW1rMkll?=
 =?utf-8?B?NFpYS2VUczdiK2NKSTdYRXIxQVNabDhqYU5ZQ1F4VXh0RkpJL0RoRHYybFBJ?=
 =?utf-8?B?SlVEOWk3RjNIM3h5aCs5dTRRUzNvTU9yUUhWdjFRZ2NTd3F6OFlUREgzTjJB?=
 =?utf-8?B?cG8rZXRJRnZ4alkrM2RCZnE1ZDRqU2RGMUtDR1lKRWJjeFlSRXZ2ZWR4YjhO?=
 =?utf-8?B?dS9aMnFQSUhibnVvUHJZNnNuMzNmWlJDN3IrSEZOdmwvakNLM2RCVElBZWJz?=
 =?utf-8?B?d1l3OU1CSlE0ekJzRzhHdkZDc0dsdmV6RC9xSDJuQnpYQ2tGb1Y4endaMHRv?=
 =?utf-8?B?b3FrRHIyeEhLYkMwRU1TZG94MHpQRkNReE8rVjJIbVkyN1h4Q2VwaGY1eUpN?=
 =?utf-8?B?SGF3bmxtTW16d2ZON3BQLzlSaHBxNWpXUTE5RDlJZWRTQkpQZXJjRWx6UG9s?=
 =?utf-8?B?b21HeVpZTEF6SkIvcGQwTFVmK25lUzZ0OXoxOUJHc2xERUtEZkZyeFNwd1l2?=
 =?utf-8?B?dzJLOFVSMVRqdjVGeDNIcTNTdEpPWGtjQ25lcW42YXVCNGxhbFFhbUprcFJp?=
 =?utf-8?B?YkRpMDlTTGZ2Mk5YNWhLNWhtRmozRHVaTnFZNUl6TUxzMjUyY0pkMC9GY1dE?=
 =?utf-8?B?Si96Ti8xUjcvbkJQTnovMnlLVTBFay9XeXNWciswT3VWWHgxa0o2djVxanZ1?=
 =?utf-8?B?WkJGK2xRTFpGUDZaa1ArbjRBQ1JFcEVqQkpMWWlzQVBuZVZadkxtT3IyQWJi?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0356819c-8ccb-4976-e78b-08daec92c2af
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 07:27:10.3440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dc7zzrRQM/K14WhznSJ+ElAhmAmk9ql9DIa/9naYfQvnV+z2ELP46dV17oFf6EYfPdBEE4tkbSkqZSCgl5Qj7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7154
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=lMrUXvXQ;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.20.46 as permitted sender)
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

On 13.12.22 14:40, Ralf Ramsauer wrote:
> Hi Jussi,
>=20
> On 13/12/2022 14:05, Jussi Pajala wrote:
>> Hi,
>>
>> I'm currently running=C2=A0old jailhouse 0.8 on 4.9 kernel - provided by
>> TI's SDK.
>>
>> Now, I need to upgrade to 5.10 kernel but TI has removed=C2=A0Jailhouse
>> support from the=C2=A0newest SDK which contains the 5.10 kernel.
>>
>> The old Jailhouse doesn't compile under the new kernel. Also I saw
>> some posts that the kernel requires some patches=C2=A0for the Jailhouse =
to
>> work.
>>
>> So, what is actually needed? What are the steps to configure the 0.8
>> Jailhouse to compile under 5.10 kernel?
>=20
> I recommend to take the latest git version of Jailhouse. For the kernel,
> you can use the patches on top of:
>=20
> https://github.com/siemens/linux/tree/jailhouse-enabling/5.10
>=20

Problem with the AM5xx was that it never received official Jailhouse
support. By now, that platform is likely out of scope for TI, not
getting feature upstreaming anymore.

I vaguely recall the details of that platform from my initial enabling,
and I think it was specifically its missing PSCI support for CPU
bring-up. That was even more complex than vexpress, a platform we
dropped 4 years ago. So, updating Jailhouse may be tricky if Jailhouse
should no longer support the required abstractions for this legacy SoC.

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
jailhouse-dev/25321d20-a68b-89af-af05-31ef40579ebf%40siemens.com.
