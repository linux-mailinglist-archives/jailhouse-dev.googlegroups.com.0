Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBY4VZKOQMGQE7QAJD3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD2C65ADBD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 08:42:28 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id b16-20020a056402279000b0046fb99731e6sf17321372ede.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Jan 2023 23:42:28 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1672645348; cv=pass;
        d=google.com; s=arc-20160816;
        b=RUas8jIElZWeOF0VV+CZyNjNx02Vo0CQpNh+Ls3eTx5YxBj8dwNkbh86r41tFl7UyJ
         o1Xw+R0bJgz/5PmX2pUp1EJYRZ1JQb0PCW7c1GMF91dceUi91D4gVL+WrwC0cU8t3pai
         oa+yNJKBu59F8T5ScSTb7hkXMl8toO+dOslIVjlWGekLveAwNhA/HNNby76D4oiaF2Dt
         mEU/2qsXoyLhcco3zVs67RKjYoJI6MMzvMxpOXQbn3bDLHCgjeIElfN8a0udQIc9a5fx
         z0QHx2k8kugWLWH/6X3VV3vs9tqYMfix9zly7nkvBgtmbrW4S6Jb387SizN7c9HZ/cmN
         1R4Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:from
         :references:to:content-language:subject:user-agent:date:message-id
         :sender:dkim-signature;
        bh=9nV/Gl8176mHAoXj6YM+t68gAcREDJrQoL2IZ1VeQ8c=;
        b=sJv7hHGwC6+MPLipxVXuA1fPuvIT+wDIfMEuA0JxbqkbDu5CcV9B71CZjCFC5Fq6NL
         vnehpfahE+PwLtPatibxxY+/89S3mHKiOLBnGBSBnh9t7FmpShrc1pabZpPfBW8t3wEl
         WPmgB8vhpVuorVf+D31oK1TkF76FX+Py953C3KSxftcbQ37mqGLYE7bU5588Y0MIFhWQ
         P2Y1Pl43NSZwfbYmc+It8e5hgWrGYYfkMLT+oIn/wkXhfvP6E5j4bLvs9PXxyIU5/yL3
         Hw6bAWkQxymd3pDKsd2v3x5NnaVB7fwyj56b/Fx8T3SgGqQWChwNbB4ybAcocY1Y1RqC
         yOzQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=WNvDUuwq;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.6.55 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9nV/Gl8176mHAoXj6YM+t68gAcREDJrQoL2IZ1VeQ8c=;
        b=Pi1xTTgogu0pbVS2x6bJvPHxBHgmFZEsVkH1K2VVxhqi0XNHZ8ZsJq+7YkK3PAz9m5
         z4JKFbd2rX9zNQbejLWHvYQumiPCBBrS/BdfDGw98h1fofEHsjdMQ78VnIhrWlQFAv+L
         yju/WDNipyTZEiOjtJW8lzNuVaekCEKcu4xA47dfFmjFq2d19av1YVE6rQw+JtE6oaAc
         +v8d7nQl56jjrjRluj2Q/Irxb2dGOPSeuQ9Wh5Bsbq94jxbawNK+cH+EAnOElp5O+jMl
         K71feG4umnhtMOi1a17Ub1Ez2xGWyGl6wusgdh+lRkAtoVG/I/ie8k4A237spiMpervo
         LVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nV/Gl8176mHAoXj6YM+t68gAcREDJrQoL2IZ1VeQ8c=;
        b=e9Kli954V5n3AG98PKj3vNhdkVYY+/dlH1kfBgkmrQUPcOXKDSVqyorgFELFcQe2Wx
         amw47XDz4ec6NuDvYFgg/z9H/dB0yY5iBFdcFPzp58szWPSFvXmWfckmz+fMDrVeuT4D
         VbPbpDAl6qaZmktf9ggILZYVDoBVToBz/yZJQ1EfuhP4DV7ICpCmeO6TXLKOwBPgyKlT
         vbca/81hkQIqUH7RGoJUdIWeb11OwKim5F4NpSFfSm/aYQS8wtNr9FT+UqMDVy/Q6eNL
         b1UbRaHfnTWXmzHgafZ3TpAqvswvUMtYRpS1+iK6zz2rj+kiNkCgSc7zUawLgcci0/87
         o2oQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpVAsfyzEZcsm5slOjuDhP12wsRAZRETZ0syNxb77Z5qvvvKTdD
	Dl5FHoK9F/R/op1JBlPH+4A=
X-Google-Smtp-Source: AMrXdXukP8g64IK+WFJ8aMt+7eu2BOL2q7kTD0UzfQ5n5DdqFBcwECsWEpR49/IKr0MgVGWVQFN7uQ==
X-Received: by 2002:a05:6402:8cf:b0:488:5810:f01a with SMTP id d15-20020a05640208cf00b004885810f01amr1507220edz.328.1672645348292;
        Sun, 01 Jan 2023 23:42:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:40d5:b0:479:6c1:ef04 with SMTP id
 z21-20020a05640240d500b0047906c1ef04ls3834574edb.0.-pod-prod-gmail; Sun, 01
 Jan 2023 23:42:26 -0800 (PST)
X-Received: by 2002:a05:6402:916:b0:461:7d2:c9fc with SMTP id g22-20020a056402091600b0046107d2c9fcmr35661631edz.26.1672645346775;
        Sun, 01 Jan 2023 23:42:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672645346; cv=pass;
        d=google.com; s=arc-20160816;
        b=RkvUE+a0c6VVdLuwMa23pPTwMYGAtXCqjyVwrqFLhNjf7VQK/uyi5Z0xYSjgLVa6C7
         hE1mqn31OXuEE6CzK6AkbQJzkrfsmtZ8chNrJjeIdroJvb+1+0LSf0vsyyB3+HKzVcSG
         NELWgUArAUQIVwgX+j4Djw2k2y/2tKavW0thMaQYaaD3wZBJgw186Z05YOd7DQ5BcMpP
         QPXlnZZL8g0YhEomvLkWIuMQiNtpGYn8wuvAMPdGBwK6MUWmMgp7HIy+BsXLZ28uvk2T
         JyH+R/WcqGLACGpuR4XHv6wAmKlka/uycy8R0K1477FIGrJwwh1jXQN24dd2eHEyBKIy
         OkiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=QQVakUVE8qKKWv8FGCOOBwxONW3y36Bvstmiy+C0j48=;
        b=FIvt7Fcjjydj9S329sbhVo6QMWzV/utbxzZ7IGqewFopYDU4Jesm4NBsCL67gXEbG7
         /K8B2tBC8izhaO8HtbuNn58rZBo4H+nnnGZTUmkTSAVCiVBtPy/+pj/9rwEKK19Rd+0s
         zsuIgTtqQs6qYJI6+Up2CWb1I/9/aQeUPQuYJDnAR/5ZAEtM5eOz6NqkbggWz/G9Ili5
         TKU3TlsFCnqmxY4Lt3NllDGFj/Tjxlw35zr4LG2I24XJ8/Sr2l0BHbPVvFvF+mj4sJS3
         MCaINYzaniq0FVfdcMM3InwFlsHA8BztBxs70qEah4MP9KnqDN6QPTtPjiz2DbYgB7dH
         0OiA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=WNvDUuwq;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.6.55 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2055.outbound.protection.outlook.com. [40.107.6.55])
        by gmr-mx.google.com with ESMTPS id l23-20020aa7c3d7000000b0047014e8771fsi996116edr.3.2023.01.01.23.42.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Jan 2023 23:42:26 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.6.55 as permitted sender) client-ip=40.107.6.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRKLcsv5THREN+CF6HKr5RQE1fTMZzwEWLuln05XznyYqzsB7Na8gFUXaB3IT062q08ZKO/NtJ3naxV+fBRzY/lwmRvC8PSFK8ndAkJJlmJ7zEOO1COzVz5kMMgsKiqpamCWPyLFhdp/qvluCisI5kvguhLGoAC/wbAMiU3tUNN5ZtQHkoxVeiDnGBRw/xlKtyEONxDGtb2mQH2D4ncf9oPh27Wz1dD+kJBCFeKB8sqX+EAFxJ5joa8hZx0RKjvzN9JP2S1Nd0XoDYM5igOOp9P2RWnh9/d9pPrDYXnUpH4vTjEuFatQY5BsTj+a8JP3iHG5nQcMbUCodTpsl4r1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQVakUVE8qKKWv8FGCOOBwxONW3y36Bvstmiy+C0j48=;
 b=l9onGu5N+KUPhsHieQ8qfz1bxHj0olrNDRA6yzIPf3Ed720HPnc0VrGcVOF4Z1+AlEyPcULaB/HZ/RdmMGv5YL/vp22xi2H3wM1Cv3jMj7oPSPWz/HlNwchowEcatfX77+plRlV8JUMtjAUJQA8i63cTAHnfPfJfKZV13dWUkz4dvqgz0ZLYgXXCx0gHRVpeKj3f3pzYeU8QfRu09GSQ0keSJ1s2qt6n52P3QIQQz+y+EscqxDgas7rw9XjkMij5K4fM7ZeFmfs+0iXmLACyuA/ci/NUm3JNRLT8wJtfs5fpeQ/Q9zeicj2cIsMLnhr2AEDAftaIcJE7DfSLGUuxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by DB8PR10MB3594.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 07:42:25 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2957:50e8:8ce6:124a%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 07:42:25 +0000
Message-ID: <b8ff927b-a86e-9c92-e834-a8cdd790a679@siemens.com>
Date: Mon, 2 Jan 2023 08:42:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Question: ivshmem-net
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DU0PR04MB9417606E9DA7F4D450E98990880A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <DU0PR04MB9417606E9DA7F4D450E98990880A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR2P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::14) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|DB8PR10MB3594:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf88365-fa27-4531-a3ee-08daec94e45e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFjHfvTNcLtPrOnAveqJzGCuHaQMguswA3XZS6IbI7StAGf2nc2EbCysYBOM2CN4iocqFlHGuwrjikhLu1HbNsFSTiGbTGHsijqa039BMC3U30KbSjjns75M5JIR/8DPOVd3sbH7QoOSGitir1YjV3Gcv2ewZ6O6fYH/v9d793NQfVp8fgpnk19rl71bUsOPdLAg4rNiFH7vo01UFzdvll/FzqacBBw8qHuc3eVVr0Psk0Iy2FqfDf4M7ViNXBZIf+BoMnjpi7wZFlLSFSbfDIBh23REl6pToPpKGvR6dXpByLIxX6vJ6Bk+8h6eqwsbV8yrCXdxVwdD01QUnEd79OnQJRE3Rkn7KIe0GBEJ38QrHCinN5tidf6KjlLH6OR7cekr/Xx0WxfTZyauEWaFkos7gj/y0LizRhIChqmtMi21bOkTldNeN5pm7PELPX85nSTMRZuWTl5zUJVZde9BkMhUmonYtDOw/bALiEKfaddLlwn867bnrz94E54ZYWjZCM4Rt2eZgU7KfCQy07QIdrRJV8jHmfdb7RLMn3UHdiXbegIHRO34OvrqMGBbGCYT79HduPs8UMmiOJbJJbZAfHIP2R+lxhRTYKJGXoNtTxGqvCa468RqQuLNOIQZjoKtICois/6BBZxozz+Xt7jYqftyUYu+jF0VJgP7Gav3ybp5MCsiQmE0ldeqNLVmVAigPGC4ngYxsFSF/AYUBkFZHS5VEUymAMytUJT+CTZ5iP3UsGwiiX3YGAcGWXsXXcqHuGl7ngGK1+kElnEvPuBxzot5WNK+9mqgh+GoD6iWwFc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199015)(8676002)(5660300002)(66476007)(66946007)(66556008)(316002)(8936002)(41300700001)(110136005)(2906002)(478600001)(966005)(6486002)(6506007)(82960400001)(38100700002)(2616005)(26005)(186003)(6512007)(53546011)(86362001)(31686004)(44832011)(36756003)(31696002)(83380400001)(22166006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBGWnNXWjNiSW1IZW8xQTlkSWVZTCtjc3N0emxXVU9WS2hlZmVqTjdmc0hK?=
 =?utf-8?B?Y3YrcUFiWkM0dWowcHBSclhna2VPTjF6RU16b1VnZkNxclVsTmx5bk43YWg3?=
 =?utf-8?B?ZllWbUVkUGJPMkVpR1g4Qkd6RldxQUhaSktNbVBxWmMzck1EdlFlSkFFazBi?=
 =?utf-8?B?N0xPV00vSUZ5a0EzY0MvVGJyTElDODJjVmc0dTErZDM0bjF5MURtMFphV1oz?=
 =?utf-8?B?MFo0bUVKcDVEU3BKM0orc3Rtb1pRblFrekZLV09YcFBadVRIWlRGdjdxS1dD?=
 =?utf-8?B?Q0duV2l4SUNoN21MZktXemVWcEIvOFZGeWtyZUhBR2pPSXBxeWF3cTVqL01C?=
 =?utf-8?B?aFdNbnFRLzBqZDBtTStsZk1iYVBxemc0WmNvQkp0MGllMHQrYjhRVzBYeEJs?=
 =?utf-8?B?akpnUnZCTnBTMGFHM0t4U1dpTllaeFcyek5ueHNwRGJ0S0NmSmhWTHBkbmti?=
 =?utf-8?B?dGFEaHQ3S1dGT1dGandQNU9qWkRjSXV5Nm44dGpSZDRyWVM3aHR1QVlZSzFY?=
 =?utf-8?B?TGhNL09KdGdzL3I5c1VSQkdCQkdqbFJWbVlJQ0xPZ0pnM1FpOERJSy9USjlp?=
 =?utf-8?B?WktPVWJKMXNYRG1PSi9aVEdmUVJoMGFLeWFVS2g0YUFySzFZaS94clBITTUy?=
 =?utf-8?B?QWhzdG9qb0ZWMUljWDFKS0xPMW94U1BLTnBDUko4T3BiSFprRHVWZFpjY3pO?=
 =?utf-8?B?K3BoSW9vU2o2ZHR5aHNFdmZub0ZGY3pQZjRLbE1wUHUzRVNaMlJ4RlQ1WTFX?=
 =?utf-8?B?RzZETy9SWFplM242WlVIZVQ3KzI2RlJJZms2dVhYUXBZQldoYktYcVJGMEZ3?=
 =?utf-8?B?RWVNbWVjN2hYQzFCZDVUN1I0R2RYM2lab0NIRDJTaUZSb1BGN2xySU9sdXRr?=
 =?utf-8?B?ZitlMkdvWHc3OFo3NzVHVjdaankwdGtHbVUyM2FCTWY1SU9obVBXU2hRQTV0?=
 =?utf-8?B?Y3huYS82YXMrSFBNSGZPa2xuWWJ6ck1aL3NSVmdTdVVmTVZmWUNBMjdQR3o4?=
 =?utf-8?B?TWxVTUZZNUpUYVJZakl0SE5Db0pXcFd4MTAyZ3FvNmRDN1BDU29NQlMzMkc1?=
 =?utf-8?B?Mi94K0FmTGptSVRJaUtxS3E3SHp6ZXhMZnROR0JVQlpVUEVpU1lNU2xFZlBR?=
 =?utf-8?B?Q1RyZW5JbUEyOWROY25jWjZVRFRiK1FEYTFaOEkrZGJ5RThoeGpoZm9nWVpH?=
 =?utf-8?B?M3JDQkw4dE1xaVFaQW5RbktCZ0tGQ1dweUFBMlRYc3dESnpTRGFKdVdUQ0k2?=
 =?utf-8?B?UWFWd1dKcHdKWEVjWjcyeXpLSy9Qb1FzL1BIS1FGR0VEalM0Q2laM3BSR0NW?=
 =?utf-8?B?eUhZRGpqQ3lFSDJ4TnA2RWluVytXd0hROW85bytJVDFGY0hieEp1MHI0MXY0?=
 =?utf-8?B?bU94Nk5iSU5IbjloT0Z5ZU56WVg0dkdrUUtLU1Y0ZW11aGRidmZaMDZDSWFY?=
 =?utf-8?B?NnZFU1oxY2JRakowMTVRMzlVRzZDTWhWdkwzdG93cnNjd1J6RUFkY0k5SldE?=
 =?utf-8?B?Z0RXQUZtamx5OVo0ZFRWWDZhVWM4N09XYUx3Qmplem1uVVJaOW0zcGFPYlV5?=
 =?utf-8?B?VWwxUUZNNUtuN2JwVXZ1TkRsSVV3b0o3eVJuSThoazBzUGNvVHdtbnBPVk8v?=
 =?utf-8?B?TkoyQ0tnS2x5VWZZNVRUNHRSb2NKbUJDZ2poRTlzYS9RRmkxVG5nc0s1UVhU?=
 =?utf-8?B?Q0hESkJqTmxyd2hobFNMbUVtU1N5YUFiQzhqbk1IdW1YT3VLNFdWTFZjTWt6?=
 =?utf-8?B?MENZUXh3Mmk4eUZwMkVUemQ4VDZrUXpOOExJVWtjNko1UUlBYkxDQXU1WGdD?=
 =?utf-8?B?MFFNaE5SeStmVXdNQXgxWTZtRFRGTW9sd2dUVHFJZ3crR1lZcTc1Mmd3akJL?=
 =?utf-8?B?ZDlQbkJFNkxxY0JsT1FkNVZLSlc5S1lJSW55T2dnTW9Xa1pCVnJmU053Rkg5?=
 =?utf-8?B?RFVqM3B5eTRsV0s1VUdsRUprTU1paEdXME1ONjAycVpKMk1WdjY0VUxWYWxo?=
 =?utf-8?B?V1dEdkxwbGYybTJQS1hsakdVRXordE1ROUJXYzJnd2JxK1NEUEdJWnk0a0gr?=
 =?utf-8?B?eVQ5WTFra3RTUGZuRUkrVlNiL1hCQnBVT2RZYlc3WjhFWDRWUjduNk1zbDZF?=
 =?utf-8?B?UjhPMEFvb2hGL2h0RG5QZWJydnMvKzhUT3VGVUpJNG9JTFJIZTVKeHJNNy9l?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf88365-fa27-4531-a3ee-08daec94e45e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 07:42:25.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kueE0ADhBWfWdephuNi+oEwB+rVN8boMN9fp08+v08FD05Gwnpz+K6+YHUPZJdfnggA7CR5jcjwiRhJQByykUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3594
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=WNvDUuwq;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.6.55 as permitted sender)
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

On 21.11.22 07:47, Peng Fan wrote:
> Hi,
> 
> I have a question regarding ivshmem-net, not sure whether we need to use local_bh_disable/enable to guard napi_schedule.
> 
> See below patch:
> https://patches.linaro.org/project/linux-usb/patch/877dk162mo.ffs@nanos.tec.linutronix.de/
> "
> The driver invokes napi_schedule() in several places from task
> context. napi_schedule() raises the NET_RX softirq bit and relies on the
> calling context to ensure that the softirq is handled. That's usually on
> return from interrupt or on the outermost local_bh_enable().
> 
> But that's not the case here which causes the soft interrupt handling to be
> delayed to the next interrupt or local_bh_enable(). If the task in which
> context this is invoked is the last runnable task on a CPU and the CPU goes
> idle before an interrupt arrives or a local_bh_disable/enable() pair
> handles the pending soft interrupt then the NOHZ idle code emits the
> following warning.
> 
>   NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
> 
> Prevent this by wrapping the napi_schedule() invocation from task context
> into a local_bh_disable/enable() pair.
> "
> https://lore.kernel.org/all/87y28b9nyn.ffs@tglx/t/
> 
> I draft one:
> diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
> index 3bcd39b91176e..81e19d80bd0a7 100644
> --- a/drivers/net/ivshmem-net.c
> +++ b/drivers/net/ivshmem-net.c
> @@ -558,7 +558,9 @@ static void ivshm_net_run(struct net_device *ndev)
> 
>         netif_start_queue(ndev);
>         napi_enable(&in->napi);
> +       local_bh_disable();
>         napi_schedule(&in->napi);
> +       local_bh_enable();
>         ivshm_net_set_state(in, IVSHM_NET_STATE_RUN);
>  }
> 
> There are other places calling napi_schedule, but seems no need local_bh_disable/enable to protect.
> 
> Not sure the upper change is valid or not, please help check.
> 

Looks suspicious, indeed. I wonder why there are not runtime checks in
napi_schedule to detect its needs and report a wrong bh state.

Does this issue only trigger with NOHZ enabled?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b8ff927b-a86e-9c92-e834-a8cdd790a679%40siemens.com.
